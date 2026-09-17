# Stack de Automação Social

## Divisão recomendada

Use **n8n** como orquestrador e **Postiz** como serviço de publicação/agendamento. As credenciais das plataformas devem ficar no publisher ou em um gerenciador de segredos, não espalhadas por dezenas de workflows.

```text
Asset aprovado
   -> n8n
   -> gerar variações de legenda/metadados
   -> checagem de política/aprovação
   -> adaptador de publicação
   -> Instagram / TikTok / X / Reddit / etc.
   -> salvar IDs e URLs dos posts
   -> coletar métricas
```

## Publisher principal

`external/postiz/`

O Postiz é puxado pelo script de bootstrap e deve rodar como serviço isolado. Ele usa AGPL-3.0; mantenha a fronteira da licença clara em relação ao seu código proprietário.

## Workflow importável para teste rápido

`07-n8n/importable/social/one-video-multiplatform-postwire.json`

Serve para testar rapidamente a ideia:

```text
URL do vídeo
 -> gerar legenda específica por plataforma
 -> TikTok
 -> Instagram
 -> YouTube
```

O mesmo padrão pode ser estendido para outras redes. Para operação de longo prazo, prefira um adaptador de publicação para conseguir trocar de fornecedor sem reconstruir tudo.

## Regra de conteúdo

Não publique exatamente o mesmo texto em todas as redes. Adapte:

- tamanho do gancho
- tamanho da legenda
- hashtags
- título/descrição
- CTA
- horário de publicação
- formato e proporção da mídia

## Contrato dos adaptadores

Entrada sugerida:

```json
{
  "platform": "instagram",
  "asset_url": "https://...",
  "caption": "...",
  "scheduled_for": null,
  "creator_id": "...",
  "campaign_id": "..."
}
```

Saída esperada:

```json
{
  "ok": true,
  "platform": "instagram",
  "external_post_id": "...",
  "url": "https://..."
}
```

Assim os workflows do n8n não ficam presos a um único serviço de publicação.

## Operação segura

- Prefira APIs oficiais e integrações aprovadas.
- Respeite limites de uso e regras de conteúdo de cada plataforma.
- Mantenha o conteúdo mainstream compatível com a política de cada rede.
- Evite automações de spam por comentários/DMs e mecanismos de evasão de contas.
