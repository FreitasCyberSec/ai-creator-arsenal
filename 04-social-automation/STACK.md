# Social Automation Stack

## Recommended split

Use **n8n** as orchestrator and **Postiz** as the durable publisher/scheduler service. Keep platform credentials in the publisher or secret manager, not spread across dozens of workflows.

```text
Approved asset
   -> n8n
   -> caption/metadata variants
   -> policy/approval check
   -> publisher adapter
   -> Instagram / TikTok / X / Reddit / etc.
   -> save post IDs + URLs
   -> ingest performance metrics
```

## Primary publisher

`external/postiz/`

Postiz is pulled by the bootstrap script and should run as an isolated service. It is AGPL-3.0; keep its source/license boundary clear from your own proprietary code.

## Fast importable workflow

`07-n8n/importable/social/one-video-multiplatform-postwire.json`

Useful for quickly testing the concept:

```text
video URL
 -> per-platform caption generation
 -> TikTok
 -> Instagram
 -> YouTube
```

The same pattern can be extended to other supported networks. For long-term operation, prefer a publisher abstraction so you can swap providers.

## Content strategy rule

Do not send identical text to every network. Adapt:

- hook length
- caption length
- hashtags
- title/description fields
- CTA wording
- posting time
- media aspect ratio

## Platform adapters

Create one adapter contract:

```json
{
  "platform": "instagram",
  "asset_url": "https://...",
  "caption": "...",
  "scheduled_for": null,
  "creator_id": "...",
  "campaign_id": "..."
}
```

Every publisher implementation should return:

```json
{
  "ok": true,
  "platform": "instagram",
  "external_post_id": "...",
  "url": "https://..."
}
```

This keeps n8n flows independent of one publishing vendor.

## Safety/operations

- Use official APIs/approved publisher integrations when possible.
- Respect per-platform rate limits and content rules.
- Keep mainstream social content platform-compliant.
- Avoid unsolicited comment/DM spam and account-evasion automation.
