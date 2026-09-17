# Infraestrutura

Esta pasta contém a base para rodar o núcleo da operação localmente ou em uma VPS.

## Arquivo principal

`docker-compose.yml`

Ele sobe:

- **Postgres + pgvector** — CRM, memória, eventos e embeddings;
- **Redis** — fila/cache;
- **n8n** — orquestração dos workflows.

## Como usar

1. Copie o arquivo `.env.example` da raiz para `.env`.
2. Preencha senhas e chaves reais apenas no `.env` local.
3. Entre nesta pasta.
4. Rode:

```bash
docker compose up -d
```

5. Abra o n8n em:

```text
http://localhost:5678
```

## Banco

O `docker-compose.yml` monta automaticamente:

```text
../08-memory-crm/schema.sql
```

como script de inicialização do Postgres.

Na primeira criação do volume do banco, as tabelas do CRM serão criadas automaticamente.

## Em produção

Em VPS/produção, adicione:

- domínio próprio;
- HTTPS/reverse proxy;
- backup do Postgres;
- rotação de segredos;
- armazenamento externo de mídia;
- monitoramento;
- autenticação forte no n8n;
- firewall e restrição das portas internas.

## O que não deve ir para o Git

- `.env` real;
- chaves privadas;
- tokens;
- banco exportado com dados reais;
- mídia privada;
- checkpoints/modelos grandes.
