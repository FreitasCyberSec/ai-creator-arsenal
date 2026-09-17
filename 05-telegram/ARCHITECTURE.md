# Arquitetura do Telegram

O Telegram pode funcionar como uma camada própria de conversa/CRM entre aquisição e monetização.

## Fluxo recomendado

```text
link rastreado
   -> payload no /start
   -> consentimento / verificação 18+ quando necessário
   -> identificar creator + campaign + click_id
   -> criar/atualizar contato
   -> IA conversacional
   -> intenção + lead score
   -> cold / warm / hot
   -> CTA quando fizer sentido
   -> Fanvue / destino de monetização aprovado
   -> evento de compra/assinatura
   -> atualizar CRM
   -> retenção / reengajamento
```

## Modelo de estados

- `cold`: lead novo ou com pouco interesse; priorizar conversa.
- `warm`: engajado, retorna, pergunta e reage ao conteúdo.
- `hot`: demonstra intenção clara de compra/assinatura; CTA permitido.
- `buyer`: compra confirmada.
- `vip`: comprador recorrente ou de alto valor conforme sua regra.
- `churned`: anteriormente ativo/comprador, mas agora inativo segundo sua política.

## Dados que devem ser preservados desde o primeiro clique

- `creator_id`
- `telegram_chat_id`
- `source`
- `campaign`
- `creative`
- `click_id`
- `geo`
- `language`

Não perca os dados de atribuição quando o usuário mudar de sistema ou canal.

## Responsabilidade da IA

O modelo conversacional não deve controlar diretamente cobrança nem ser a fonte de verdade do estado do cliente. A IA pode propor uma ação; o n8n/CRM decide se a ação é permitida.

Exemplo de contrato de decisão:

```json
{
  "intent": "curious",
  "lead_state": "warm",
  "score_delta": 8,
  "next_action": "continue_chat",
  "cta_allowed": false,
  "memory_candidates": ["prefere mensagens curtas"]
}
```

Em etapas posteriores, `next_action` pode virar `offer`, `wait`, `reengage` ou `handoff`.

## Referências úteis

- `yaziradevteam/PulseChatAI` — intenção, lead scoring e momento de CTA.
- `dnpix/telegram-fanvue-bot` — fluxo de ponte Telegram -> Fanvue.
- `enescingoz/awesome-n8n-templates` — workflows de Telegram com IA e memória em Supabase.

Use apenas mensagens autorizadas/opt-in. Não use esta camada para disparo em massa não solicitado nem para evasão de plataforma/conta.
