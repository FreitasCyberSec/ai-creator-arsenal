create extension if not exists vector;
create extension if not exists pgcrypto;

create table if not exists creators (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  display_name text not null,
  disclosure text,
  persona jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists contacts (
  id uuid primary key default gen_random_uuid(),
  creator_id uuid not null references creators(id) on delete cascade,
  external_key text not null,
  telegram_chat_id bigint,
  fanvue_user_id text,
  source text,
  campaign text,
  creative text,
  click_id text,
  geo text,
  language text,
  lead_score numeric(6,2) not null default 0,
  lead_state text not null default 'cold' check (lead_state in ('cold','warm','hot','buyer','vip','churned')),
  total_spend numeric(12,2) not null default 0,
  purchase_count integer not null default 0,
  last_seen_at timestamptz,
  last_offer_at timestamptz,
  last_purchase_at timestamptz,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (creator_id, external_key)
);

create index if not exists idx_contacts_creator_state on contacts(creator_id, lead_state);
create index if not exists idx_contacts_click_id on contacts(click_id);
create index if not exists idx_contacts_telegram_chat_id on contacts(telegram_chat_id);
create index if not exists idx_contacts_fanvue_user_id on contacts(fanvue_user_id);

create table if not exists conversations (
  id uuid primary key default gen_random_uuid(),
  contact_id uuid not null references contacts(id) on delete cascade,
  channel text not null,
  external_thread_id text,
  status text not null default 'active',
  started_at timestamptz not null default now(),
  last_message_at timestamptz,
  metadata jsonb not null default '{}'::jsonb
);

create index if not exists idx_conversations_contact on conversations(contact_id, last_message_at desc);

create table if not exists messages (
  id uuid primary key default gen_random_uuid(),
  conversation_id uuid not null references conversations(id) on delete cascade,
  direction text not null check (direction in ('in','out')),
  role text,
  message_type text not null default 'text',
  body text,
  media_url text,
  intent text,
  sentiment text,
  lead_score_delta numeric(6,2),
  ai_generated boolean not null default false,
  model text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create index if not exists idx_messages_conversation_created on messages(conversation_id, created_at desc);

create table if not exists memories (
  id uuid primary key default gen_random_uuid(),
  contact_id uuid not null references contacts(id) on delete cascade,
  memory_type text not null default 'fact',
  content text not null,
  importance numeric(4,3) not null default 0.5,
  embedding vector,
  source_message_id uuid references messages(id) on delete set null,
  expires_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists idx_memories_contact on memories(contact_id, importance desc);

create table if not exists assets (
  id uuid primary key default gen_random_uuid(),
  creator_id uuid not null references creators(id) on delete cascade,
  asset_type text not null check (asset_type in ('image','video','audio','other')),
  lifecycle_state text not null default 'draft' check (lifecycle_state in ('draft','review','approved','published','archived')),
  storage_url text,
  source text,
  prompt text,
  generation_settings jsonb not null default '{}'::jsonb,
  consent_reference text,
  approved_by text,
  approved_at timestamptz,
  created_at timestamptz not null default now()
);

create index if not exists idx_assets_creator_state on assets(creator_id, lifecycle_state, created_at desc);

create table if not exists campaigns (
  id uuid primary key default gen_random_uuid(),
  creator_id uuid not null references creators(id) on delete cascade,
  name text not null,
  channel text,
  source text,
  medium text,
  status text not null default 'draft',
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists social_posts (
  id uuid primary key default gen_random_uuid(),
  creator_id uuid not null references creators(id) on delete cascade,
  campaign_id uuid references campaigns(id) on delete set null,
  asset_id uuid references assets(id) on delete set null,
  platform text not null,
  external_post_id text,
  caption text,
  scheduled_for timestamptz,
  published_at timestamptz,
  status text not null default 'draft',
  metrics jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create index if not exists idx_social_posts_platform_date on social_posts(platform, published_at desc);

create table if not exists offers (
  id uuid primary key default gen_random_uuid(),
  creator_id uuid not null references creators(id) on delete cascade,
  code text not null,
  offer_type text not null,
  price numeric(12,2),
  currency text default 'USD',
  active boolean not null default true,
  metadata jsonb not null default '{}'::jsonb,
  unique (creator_id, code)
);

create table if not exists purchases (
  id uuid primary key default gen_random_uuid(),
  contact_id uuid not null references contacts(id) on delete cascade,
  offer_id uuid references offers(id) on delete set null,
  external_transaction_id text,
  amount numeric(12,2) not null,
  currency text not null default 'USD',
  platform text,
  status text not null default 'paid',
  purchased_at timestamptz not null default now(),
  metadata jsonb not null default '{}'::jsonb
);

create index if not exists idx_purchases_contact_date on purchases(contact_id, purchased_at desc);

create table if not exists events (
  id bigserial primary key,
  event_name text not null,
  creator_id uuid references creators(id) on delete cascade,
  contact_id uuid references contacts(id) on delete set null,
  campaign_id uuid references campaigns(id) on delete set null,
  channel text,
  source text,
  click_id text,
  value numeric(12,2),
  currency text,
  properties jsonb not null default '{}'::jsonb,
  occurred_at timestamptz not null default now()
);

create index if not exists idx_events_name_date on events(event_name, occurred_at desc);
create index if not exists idx_events_contact_date on events(contact_id, occurred_at desc);
create index if not exists idx_events_campaign_date on events(campaign_id, occurred_at desc);

create or replace function apply_purchase_to_contact()
returns trigger language plpgsql as $$
begin
  if new.status = 'paid' then
    update contacts
      set total_spend = total_spend + new.amount,
          purchase_count = purchase_count + 1,
          lead_state = case when lead_state = 'vip' then 'vip' else 'buyer' end,
          last_purchase_at = new.purchased_at,
          updated_at = now()
    where id = new.contact_id;
  end if;
  return new;
end;
$$;

drop trigger if exists trg_purchase_contact_rollup on purchases;
create trigger trg_purchase_contact_rollup
after insert on purchases
for each row execute function apply_purchase_to_contact();

create or replace view creator_funnel_daily as
select
  date_trunc('day', occurred_at) as day,
  creator_id,
  count(*) filter (where event_name = 'lead_created') as leads,
  count(*) filter (where event_name = 'cta_clicked') as cta_clicks,
  count(*) filter (where event_name = 'checkout_started') as checkouts,
  count(*) filter (where event_name = 'purchase') as purchases,
  coalesce(sum(value) filter (where event_name = 'purchase'), 0) as revenue
from events
group by 1, 2;
