# Telegram Layer

Telegram can be used as an owned conversation/CRM layer between acquisition and the monetization platform.

## Recommended flow

```text
tracked link
   -> /start payload
   -> consent / age gate if required
   -> identify creator + campaign + click_id
   -> create/update contact
   -> conversational AI
   -> intent + lead score
   -> cold / warm / hot state
   -> CTA when appropriate
   -> Fanvue / approved monetization destination
   -> purchase/subscription event
   -> update CRM
   -> retention / re-engagement
```

## State model

- `cold`: new/low intent; conversation first.
- `warm`: engaged, returning, asks questions, reacts to content.
- `hot`: clear purchase/subscription intent; CTA allowed.
- `buyer`: confirmed paid event.
- `vip`: high-value/repeat buyer rule reached.
- `churned`: previously active/buyer, now inactive according to your policy.

## Core data to preserve from the first click

- `creator_id`
- `telegram_chat_id`
- `source`
- `campaign`
- `creative`
- `click_id`
- `geo`
- `language`

Never lose the attribution fields when the conversation moves between systems.

## AI responsibilities

The conversational model should not control billing or source-of-truth customer state. It can propose an action, but n8n/CRM should decide whether the action is allowed.

Example decision contract:

```json
{
  "intent": "curious",
  "lead_state": "warm",
  "score_delta": 8,
  "next_action": "continue_chat",
  "cta_allowed": false,
  "memory_candidates": ["prefers short messages"]
}
```

Later stages can return `next_action: offer`, `wait`, `reengage`, or `handoff`.

## Useful upstream references

- `yaziradevteam/PulseChatAI` — intent/lead scoring/CTA timing architecture.
- `dnpix/telegram-fanvue-bot` — Telegram -> Fanvue bridge flow.
- `enescingoz/awesome-n8n-templates` — Telegram AI workflows, including Supabase memory patterns.

Use only authorized, opt-in messaging. Do not use this layer for unsolicited mass messaging or platform/account evasion.
