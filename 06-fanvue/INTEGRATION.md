# Fanvue Integration Layer

Treat Fanvue as a platform adapter, not as the brain of the operation. CRM state should remain in your own database so the same contact logic can later support other channels.

## Event direction

```text
Fanvue event/webhook
   -> n8n ingestion
   -> normalize event
   -> resolve creator/contact
   -> append event
   -> update CRM rollups
   -> trigger allowed follow-up
```

Typical events to normalize when the platform exposes them:

- new follower
- new subscriber
- new message
- purchase
- tip
- subscription renewal
- subscription expiration/cancellation

## Outbound direction

```text
CRM / conversation decision
   -> policy gate
   -> Fanvue API adapter
   -> send reply / approved action
   -> persist outbound message/event
```

## Priority references

### Official reference

`fanvue/fanvue-chatbot-example`

Use this as the first source for OAuth/API patterns because it is published by Fanvue. The repository did not expose an explicit software license when this arsenal was assembled, so it is treated as reference material rather than copied source.

### Memory/RAG reference

`LehaDeev/fanvue_ai_bot`

Useful patterns:

- persistent conversation state
- Postgres/pgvector
- RAG/facts per contact
- Telegram admin/control surface
- private/broadcast messaging architecture

Review upstream terms before reusing source code.

## Separation of concerns

Keep these independent:

1. `fanvue-adapter` — API/OAuth/webhook transport.
2. `conversation-engine` — model/persona/intent.
3. `crm` — state, purchases, attribution and memory.
4. `orchestrator` — n8n workflows and schedules.

That separation makes platform migration much easier.
