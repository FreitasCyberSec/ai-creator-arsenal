# Memória e CRM

Esta pasta contém o banco central da operação. A ideia é que Telegram, Fanvue, redes sociais e workflows do n8n compartilhem o mesmo estado de cliente em vez de cada sistema guardar informações isoladas.

## Arquivo principal

`schema.sql`

Ele cria as estruturas para:

- criadores/personas;
- contatos/leads;
- conversas;
- mensagens;
- memórias individuais;
- assets de imagem/vídeo;
- campanhas;
- posts sociais;
- ofertas;
- compras;
- eventos e analytics.

## Fluxo de dados

```text
Instagram / TikTok / X / Reddit
          ↓
      clique/link
          ↓
       contato
          ↓
Telegram / Fanvue
          ↓
 conversa + intenção
          ↓
       memória
          ↓
    compra/evento
          ↓
       CRM
          ↓
retenção / reengajamento / analytics
```

## Estados principais do lead

O campo técnico `lead_state` usa:

- `cold` — frio;
- `warm` — aquecido;
- `hot` — alta intenção;
- `buyer` — comprador;
- `vip` — comprador de alto valor/recorrente;
- `churned` — inativo/churn.

Os nomes permanecem em inglês dentro do banco para manter compatibilidade com workflows e código, mas toda a documentação do projeto explica o significado em português.

## Memória

A tabela `memories` permite guardar fatos úteis por contato, como preferências, contexto de conversa e informações que ajudem a manter continuidade.

Com `pgvector`, essas memórias também podem ser recuperadas semanticamente por similaridade.

## Compras

Quando uma compra com status `paid` é inserida, o trigger do banco atualiza automaticamente:

- `total_spend`;
- `purchase_count`;
- `lead_state` para `buyer`;
- `last_purchase_at`.

## Analytics

A view `creator_funnel_daily` resume diariamente:

- leads;
- cliques em CTA;
- checkouts;
- compras;
- receita.

## Importante

Não coloque informações sensíveis desnecessárias no CRM. Guarde somente dados úteis para a operação e respeite consentimento, privacidade e regras das plataformas utilizadas.
