# Curated Upstream Arsenal

This is the initial high-value set. The goal is not to hoard repositories; each entry fills a specific layer of the operating stack.

## Tier S — core

### Character / image / video

- `SciensOne/comfyui-workflow-generator`
  - Role: consistent-character photosets, face-reference generation, PuLID-style identity lock and image-to-video workflow generation.
  - Why: small, focused and MIT licensed.
  - Clone target: `external/comfyui-workflow-generator`

- `iqgeoai/ComfyUI-vidflows`
  - Role: multi-scene AI video workflows, image-to-video, talking-head/lip-sync style pipelines.
  - Why: useful production reference for turning an identity image into repeatable video pipelines.
  - Clone target: `external/ComfyUI-vidflows`

- `facefusion/facefusion`
  - Role: face/identity transformation pipeline for authorized assets.
  - Why: mature project and useful as a dedicated external tool rather than mixing face processing into every workflow.
  - Clone target: `external/facefusion`

- `yaiol/comfyui-workflows`
  - Role: very large ComfyUI workflow reference library.
  - Why: useful as a research library for InstantID, FaceID, PuLID, image/video and many other graph patterns.
  - Clone target: `external/comfyui-workflows-library`

### Telegram / conversion

- `yaziradevteam/PulseChatAI`
  - Role: Telegram conversational AI with intent detection, lead scoring, escalation and CTA timing.
  - Why: closest public reference to a behavior-aware conversational funnel.
  - License status: no explicit license observed; **reference-only unless upstream grants permission**.
  - Clone target: `external/PulseChatAI-reference`

- `dnpix/telegram-fanvue-bot`
  - Role: Telegram warm-up/conversation bridge toward Fanvue.
  - Why: compact example of acquisition -> conversation -> CTA logic.
  - License status: verify before copying/modifying/distributing.
  - Clone target: `external/telegram-fanvue-bot-reference`

### Fanvue / CRM messaging

- `fanvue/fanvue-chatbot-example`
  - Role: official Fanvue API/OAuth/chat integration reference.
  - Why: use official API patterns as the integration contract.
  - License status: repository currently exposes no explicit license; use as API/reference material.
  - Clone target: `external/fanvue-chatbot-official-reference`

- `LehaDeev/fanvue_ai_bot`
  - Role: Fanvue AI chat, RAG/memory, Postgres/pgvector and Telegram admin patterns.
  - Why: useful architecture reference for persistent customer memory and operator control.
  - Clone target: `external/fanvue-ai-bot-reference`

### Social distribution

- `gitroomhq/postiz-app`
  - Role: multi-platform publishing/scheduling service.
  - Why: mature social distribution layer; keep it isolated as a service.
  - License: AGPL-3.0.
  - Clone target: `external/postiz`

### n8n workflow library

- `enescingoz/awesome-n8n-templates`
  - Role: large workflow library for n8n.
  - Why: broad source pool for content, AI, Telegram, databases and automation patterns.
  - License: CC BY 4.0; preserve attribution.
  - Clone target: `external/awesome-n8n-templates`

## Architecture target

```text
[Character Bible]
      |
      v
[ComfyUI identity + photo/video]
      |
      v
[Content approval/storage]
      |
      v
[n8n orchestrator] ---> [Postiz] ---> IG/TikTok/X/Reddit
      |
      +---> Telegram conversational layer
      |          |
      |          v
      |      intent / lead state
      |          |
      +----------+
      |
      v
[Fanvue API]
      |
      v
[Postgres/Supabase + pgvector]
      |
      v
[retention / re-engagement / analytics]
```

## Do not blindly merge upstream projects

Use the arsenal as modular services and references. Large applications such as Postiz and FaceFusion should remain isolated services. Projects with no explicit license should not have their source copied into proprietary code until permission/terms are clear.
