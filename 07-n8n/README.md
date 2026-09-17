# n8n Arsenal

## Import these first

### 1. `importable/crm/event-ingest-supabase.json`
Use as the universal event endpoint for Telegram, Fanvue, social and your own services.

### 2. `importable/social/one-video-multiplatform-postwire.json`
One approved video -> platform-specific captions -> publish to connected social accounts.

## High-value workflows available after running the upstream bootstrap

Inside `external/awesome-n8n-templates/`:

### Telegram
- `Telegram/Agentic Telegram AI bot with with LangChain nodes and new tools.json`
- `Telegram/Telegram AI bot assistant_ ready-made template for voice & text messages.json`
- `Telegram/Telegram AI bot with LangChain nodes.json`
- `Telegram/Telegram AI Chatbot.json`
- `Telegram/Telegram Bot with Supabase memory and OpenAI assistant integration.json`
- `Telegram/🤖 Telegram Messaging Agent for Text_Audio_Images.json`

### Social
- `Instagram_Twitter_Social_Media/Publish one video natively to TikTok Instagram and YouTube with PostWire.json`
- `Google_Drive_and_Google_Sheets/Upload to Instagram and Tiktok from Google Drive.json`

## Recommended master orchestration

```text
CONTENT READY
   -> approval gate
   -> create platform variants
   -> publish
   -> write post IDs
   -> ingest performance events

NEW TELEGRAM MESSAGE
   -> identify contact
   -> retrieve memory
   -> AI intent/response
   -> update lead score
   -> send reply
   -> append message/event

PLATFORM PURCHASE EVENT
   -> event ingest
   -> write purchase
   -> change contact state to buyer
   -> start buyer retention path

INACTIVITY TIMER
   -> select eligible contacts
   -> policy/consent check
   -> re-engagement decision
   -> send allowed message
   -> log event
```

## Rule

Keep credentials inside n8n Credentials or a secret manager. Imported JSON files should contain no live API keys.
