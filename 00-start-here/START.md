# Start Here

## Goal

Turn this repository into a reusable AI creator operating stack rather than a pile of unrelated projects.

## Recommended deployment order

1. Character identity and consistent image workflow.
2. Video pipeline.
3. Content approval/storage layer.
4. Social publishing service.
5. Telegram acquisition/conversation layer.
6. Fanvue API integration.
7. n8n orchestration.
8. Supabase/Postgres/pgvector state and memory.
9. Analytics and attribution.
10. Retention/re-engagement automations.

## Local stack

Recommended base services:

```text
ComfyUI
n8n
Postgres / Supabase
pgvector
Redis (optional)
Postiz (isolated service)
Telegram Bot API
Fanvue API
LLM provider or local LLM endpoint
Object storage for approved media
```

## First practical milestone

Build one end-to-end path:

```text
character reference
  -> generate approved image
  -> store asset
  -> create caption
  -> human approval
  -> publish to one social channel
  -> tracked link
  -> Telegram/Fanvue conversation
  -> CRM event
```

Do not automate every channel before this single path is reliable.

## Environment policy

Use `.env.example` files only. Real credentials belong in your deployment platform/secret manager, never in Git.

## Identity/media policy

Only use faces, voices and private media belonging to consenting adults whose content you are authorized to transform and publish.
