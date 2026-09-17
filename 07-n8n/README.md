# Arsenal n8n

## Importe estes primeiro

### 1. `importable/crm/event-ingest-supabase.json`
Use como endpoint universal de eventos para Telegram, Fanvue, redes sociais e seus próprios serviços.

### 2. `importable/social/one-video-multiplatform-postwire.json`
Um vídeo aprovado -> legendas específicas por plataforma -> publicação nas contas conectadas.

## Workflows úteis disponíveis após rodar o bootstrap

Dentro de `external/awesome-n8n-templates/`:

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

## Orquestração mestre recomendada

```text
CONTEÚDO PRONTO
   -> aprovação
   -> criar variações por plataforma
   -> publicar
   -> salvar IDs dos posts
   -> coletar métricas/eventos

NOVA MENSAGEM NO TELEGRAM
   -> identificar contato
   -> buscar memória
   -> IA analisa intenção e responde
   -> atualizar lead score
   -> enviar resposta
   -> registrar mensagem/evento

EVENTO DE COMPRA
   -> ingestão de evento
   -> registrar compra
   -> mudar estado do contato para buyer
   -> iniciar retenção pós-compra

TEMPORIZADOR DE INATIVIDADE
   -> selecionar contatos elegíveis
   -> checar política/consentimento
   -> decidir reengajamento
   -> enviar mensagem permitida
   -> registrar evento
```

## Regra importante

Credenciais devem ficar dentro do sistema de Credentials do n8n ou em um gerenciador de segredos. Os arquivos JSON importáveis não devem conter chaves de API reais.
