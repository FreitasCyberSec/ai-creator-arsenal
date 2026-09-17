# Contrato Unificado de Eventos

Todos os canais devem emitir eventos no mesmo formato para que atribuição e estado do cliente não fiquem presos a uma única plataforma.

## Payload canônico

```json
{
  "event_name": "purchase",
  "creator_id": "uuid-ou-null",
  "contact_id": "uuid-ou-null",
  "campaign_id": "uuid-ou-null",
  "channel": "telegram",
  "source": "instagram",
  "click_id": "abc123",
  "value": 19.99,
  "currency": "USD",
  "properties": {
    "offer": "vip_monthly",
    "creative": "reel_07",
    "platform_event_id": "evt_123"
  },
  "occurred_at": "2026-09-17T20:00:00Z"
}
```

Os nomes técnicos dos campos permanecem em inglês para evitar quebrar integrações e workflows.

## Eventos recomendados

### Aquisição
- `visit`
- `lead_created`
- `telegram_started`
- `fanvue_followed`
- `fanvue_subscribed`

### Conversa
- `message_received`
- `message_sent`
- `lead_warmed`
- `lead_hot`
- `cta_shown`
- `cta_clicked`

### Comércio
- `checkout_started`
- `purchase`
- `tip`
- `upsell_purchase`
- `renewal`
- `refund`

### Retenção
- `inactive_7d`
- `reengagement_sent`
- `reengaged`
- `churn`
- `winback_purchase`

### Conteúdo
- `asset_generated`
- `asset_approved`
- `post_published`
- `post_viewed`
- `profile_visit`
- `link_clicked`

## KPIs derivados desses eventos

- conversão visitante -> lead
- lead -> CTA
- CTA -> checkout
- checkout -> compra
- receita por lead
- CAC, quando houver custo de tráfego pago
- AOV
- LTV
- taxa de compra recorrente
- taxa de renovação
- churn
- recuperação por reengajamento
- receita por source/campaign/creative/creator

## Regra de atribuição

Preserve `source`, `campaign`, `creative` e `click_id` originais no contato assim que forem conhecidos. Eventos posteriores podem adicionar atribuição de sessão sem destruir a origem inicial de aquisição.
