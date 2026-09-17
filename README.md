# AI Creator Arsenal

Private-first toolkit for building a compliant AI creator operation with reusable components for consistent character generation, image/video pipelines, social publishing, Telegram/Fanvue automation, n8n orchestration, memory/CRM, analytics and infrastructure.

> **Repository status:** this repository is currently visible as **public** through the connected GitHub API. Keep secrets, credentials, private model assets, customer data and proprietary prompts OUT of this repository until visibility is changed to Private in GitHub Settings.

## Architecture

```text
Character Bible / Identity
        ↓
ComfyUI / image + video generation
        ↓
Human approval / content library
        ↓
n8n orchestration
        ↓
Postiz / platform APIs
   ├─ Instagram
   ├─ TikTok
   ├─ X
   ├─ Reddit
   └─ Telegram
        ↓
Telegram / Fanvue acquisition
        ↓
AI conversation + memory + intent scoring
        ↓
Offer / subscription / PPV
        ↓
CRM + analytics
        ↓
Retention / re-engagement
```

## Repository map

- `00-start-here/` — setup and operating notes
- `01-character-engine/` — consistent-character workflows and identity tools
- `02-image-video/` — image/video generation and transformation pipelines
- `03-content-factory/` — approval and asset-processing workflows
- `04-social-automation/` — Instagram/TikTok/X/Reddit publishing stack
- `05-telegram/` — Telegram acquisition, conversation and re-engagement
- `06-fanvue/` — Fanvue API/chat integrations
- `07-n8n/` — importable n8n workflows and orchestration notes
- `08-memory-crm/` — Supabase/Postgres/pgvector/RAG patterns
- `09-analytics/` — attribution, events and KPI definitions
- `10-infrastructure/` — deployment and environment examples
- `90-upstreams/` — upstream catalog and bootstrap scripts
- `99-licenses/` — license and attribution records

## Initial priority stack

1. **SciensOne/comfyui-workflow-generator** — consistent-character photosets + image-to-video workflows; permissive MIT license.
2. **Postiz** — multi-platform social publishing; run as an isolated external AGPL service.
3. **Fanvue official chatbot example** — API/OAuth reference; reference-only until redistribution terms are clear.
4. **PulseChatAI** — Telegram conversational funnel/lead scoring reference; reference-only because the repository currently exposes no license.
5. **n8n workflow libraries** — source pool for reusable orchestration after license review.
6. **Supabase/Postgres/pgvector** — memory, state, attribution and CRM layer.

## Rules

- Never commit `.env`, API keys, session cookies, auth tokens, user/customer data or private media.
- Only copy third-party code when its license permits redistribution and attribution requirements are preserved.
- Keep AGPL/copy-left applications isolated as services unless you deliberately accept their licensing obligations.
- Repositories without an explicit license are **reference-only**.
- Use face/identity transformation only for consenting adults and assets you are authorized to use.
- Use official platform APIs/approved automation where available; do not build account-evasion or unsolicited-spam tooling.

See `00-start-here/START.md` and `90-upstreams/ARSENAL.md` next.
