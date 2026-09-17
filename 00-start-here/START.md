# Comece Aqui

## Objetivo

Transformar este repositório em um stack reutilizável para uma operação de criadores com IA, em vez de virar apenas uma coleção de projetos sem conexão.

## Ordem recomendada de implantação

1. Identidade da personagem e workflow de imagem consistente.
2. Pipeline de vídeo.
3. Camada de aprovação e armazenamento de conteúdo.
4. Serviço de publicação em redes sociais.
5. Camada de aquisição/conversa no Telegram.
6. Integração com a API da Fanvue.
7. Orquestração com n8n.
8. Estado e memória com Supabase/Postgres/pgvector.
9. Analytics e atribuição.
10. Automações de retenção e reengajamento.

## Stack local recomendado

```text
ComfyUI
n8n
Postgres / Supabase
pgvector
Redis (opcional)
Postiz (serviço isolado)
Telegram Bot API
Fanvue API
Provedor de LLM ou endpoint de LLM local
Armazenamento de objetos para mídia aprovada
```

## Primeiro marco prático

Monte primeiro um único caminho ponta a ponta:

```text
referência da personagem
  -> gerar imagem
  -> revisar/aprovar
  -> armazenar asset
  -> criar legenda
  -> aprovação humana
  -> publicar em uma rede social
  -> link rastreado
  -> conversa Telegram/Fanvue
  -> registrar evento no CRM
```

Não tente automatizar todas as redes antes de esse fluxo único estar funcionando de forma confiável.

## Política de ambiente

Use apenas arquivos `.env.example` no Git. Credenciais reais devem ficar no seu servidor, plataforma de deploy ou gerenciador de segredos.

## Política de identidade e mídia

Use apenas rostos, vozes e mídia de adultos que tenham autorizado o uso, transformação e publicação do conteúdo.
