# Camada de Integração com a Fanvue

Trate a Fanvue como um adaptador de plataforma, e não como o cérebro da operação. O estado do CRM deve permanecer no seu próprio banco para que a mesma lógica de contatos possa atender outros canais no futuro.

## Entrada de eventos

```text
evento/webhook Fanvue
   -> ingestão no n8n
   -> normalizar evento
   -> identificar creator/contato
   -> registrar evento
   -> atualizar métricas/estado do CRM
   -> disparar próximo passo permitido
```

Eventos úteis para normalizar quando a plataforma disponibilizar:

- novo seguidor
- novo assinante
- nova mensagem
- compra
- gorjeta
- renovação de assinatura
- expiração/cancelamento

## Saída de ações

```text
CRM / decisão da conversa
   -> checagem de política
   -> adaptador da API Fanvue
   -> enviar resposta / ação autorizada
   -> registrar mensagem/evento de saída
```

## Referências prioritárias

### Referência oficial

`fanvue/fanvue-chatbot-example`

Use este projeto como primeira fonte para padrões de OAuth/API porque ele é publicado pela própria Fanvue. Quando este arsenal foi montado, o repositório não apresentava uma licença de software explícita, por isso ele é tratado como referência e não como código incorporado.

### Referência de memória/RAG

`LehaDeev/fanvue_ai_bot`

Padrões úteis:

- estado persistente de conversa
- Postgres/pgvector
- RAG/fatos por contato
- painel/administração via Telegram
- arquitetura de mensagens privadas e broadcast

Revise os termos do upstream antes de reutilizar código-fonte.

## Separação de responsabilidades

Mantenha estes componentes separados:

1. `fanvue-adapter` — transporte de API/OAuth/webhook.
2. `conversation-engine` — modelo/persona/intenção.
3. `crm` — estado, compras, atribuição e memória.
4. `orchestrator` — workflows e agendamentos do n8n.

Essa separação facilita muito migrar ou adicionar plataformas depois.
