# Unified Event Contract

All channels should emit the same event shape so attribution and customer state are not tied to one platform.

## Canonical payload

```json
{
  "event_name": "purchase",
  "creator_id": "uuid-or-null",
  "contact_id": "uuid-or-null",
  "campaign_id": "uuid-or-null",
  "channel": "telegram",
  "source": "instagram",
  "click_id": "abc123",
  "value": 19.99,
  "currency": "USD",
  "properties": {
    "offer": "vip_monthly",
    "creative": "reel_07",
    "platform_event_id": "evt_123"
  },
  "occurred_at": "2026-09-17T20:00:00Z"
}
```

## Recommended events

### Acquisition
- `visit`
- `lead_created`
- `telegram_started`
- `fanvue_followed`
- `fanvue_subscribed`

### Conversation
- `message_received`
- `message_sent`
- `lead_warmed`
- `lead_hot`
- `cta_shown`
- `cta_clicked`

### Commerce
- `checkout_started`
- `purchase`
- `tip`
- `upsell_purchase`
- `renewal`
- `refund`

### Retention
- `inactive_7d`
- `reengagement_sent`
- `reengaged`
- `churn`
- `winback_purchase`

### Content
- `asset_generated`
- `asset_approved`
- `post_published`
- `post_viewed`
- `profile_visit`
- `link_clicked`

## KPIs derived from the contract

- visitor -> lead conversion
- lead -> CTA rate
- CTA -> checkout rate
- checkout -> purchase rate
- revenue per lead
- CAC (when paid traffic cost exists)
- AOV
- LTV
- repeat purchase rate
- renewal rate
- churn rate
- re-engagement recovery rate
- revenue by source/campaign/creative/creator

## Attribution rule

Persist original `source`, `campaign`, `creative` and `click_id` on the contact when first known. Later events can add session-level attribution without destroying the original acquisition source.
