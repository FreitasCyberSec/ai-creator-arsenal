# Arsenal de Projetos Externos

Este arquivo registra **o que já está ligado ao repositório**, o que é núcleo e o que é complemento. A intenção não é colecionar projetos: cada componente precisa preencher uma função concreta da arquitetura.

## Como as ferramentas entram no arsenal

Existem três formas:

1. **Submódulo principal** — aparece em `ferramentas/` e faz parte do stack recomendado.
2. **Submódulo complementar** — aparece em `complementos/` e serve como alternativa, biblioteca ou referência.
3. **Workflow incorporado** — JSON/SQL/documentação que foi selecionado e fica diretamente neste repo, com licença/crédito quando necessário.

Para baixar os submódulos em um clone existente:

```bash
git submodule update --init --recursive
```

Para clonar tudo de uma vez:

```bash
git clone --recurse-submodules https://github.com/FreitasCyberSec/ai-creator-arsenal.git
```

---

# Tier S — ferramentas principais

## Geração / personagem

### `ferramentas/ComfyUI`
- Projeto: `Comfy-Org/ComfyUI`
- Função: motor visual principal para workflows de geração.
- Uso no arsenal: base de imagem/vídeo.

### `ferramentas/ComfyUI-Manager`
- Projeto: `Comfy-Org/ComfyUI-Manager`
- Função: instalar/administrar custom nodes e dependências.
- Uso no arsenal: facilitar a montagem dos workflows.

### `ferramentas/ComfyUI-Workflow-Generator`
- Projeto: `SciensOne/comfyui-workflow-generator`
- Função: photosets consistentes, personagem fixa, Flux/SDXL, lotes e image-to-video.
- Motivo da escolha: arquitetura muito próxima do que queremos e licença MIT.

### `ferramentas/ComfyUI-PuLID-Flux`
- Projeto: `balazik/ComfyUI-PuLID-Flux`
- Função: identidade facial consistente em Flux a partir de uma referência autorizada.
- Uso no arsenal: camada de identity lock para personagem.

## Vídeo

### `ferramentas/ComfyUI-WanVideoWrapper`
- Projeto: `kijai/ComfyUI-WanVideoWrapper`
- Função: workflows de modelos Wan para vídeo.

### `ferramentas/ComfyUI-VideoHelperSuite`
- Projeto: `Kosinkadink/ComfyUI-VideoHelperSuite`
- Função: carregar, combinar, processar e exportar vídeo no ComfyUI.

### `ferramentas/FaceFusion`
- Projeto: `facefusion/facefusion`
- Função: transformação de face/identidade para assets autorizados.
- Regra: usar somente com adultos e conteúdo cujo uso/transformação tenha autorização.

## Distribuição social

### `ferramentas/Postiz`
- Projeto: `gitroomhq/postiz-app`
- Função: publicação/agendamento em múltiplas redes sociais.
- Uso no arsenal: camada de distribuição após aprovação humana.
- Observação: por ser aplicação grande com licença própria, deve permanecer isolada como serviço.

## Telegram / Fanvue / conversa

### `ferramentas/Fanvue-Chatbot-Oficial`
- Projeto: `fanvue/fanvue-chatbot-example`
- Função: OAuth 2.0, leitura/escrita de chat e referência oficial da API Fanvue.
- Uso no arsenal: contrato principal para integração com Fanvue.

### `ferramentas/PulseChatAI`
- Projeto: `yaziradevteam/PulseChatAI`
- Função: conversa, intent detection, lead scoring, RAG, CTA e reengajamento.
- Uso: referência avançada de arquitetura conversacional.
- Observação: revisar licença/termos antes de incorporar código ao seu próprio produto.

### `ferramentas/Telegram-Fanvue-Bot`
- Projeto: `dnpix/telegram-fanvue-bot`
- Função: bot oficial do Telegram com conversa, estado, rate limit e encaminhamento para Fanvue.
- Uso: implementação mais simples para testar o caminho aquisição -> conversa -> CTA.

## n8n

### `ferramentas/Awesome-n8n-Templates`
- Projeto: `enescingoz/awesome-n8n-templates`
- Função: biblioteca grande de workflows n8n.
- Licença: CC BY 4.0.
- Uso: fonte de peças; os workflows selecionados/adaptados ficam em `07-n8n/importable/`.

---

# Complementos

## `complementos/ComfyUI-Essentials-Legado`
Projeto em modo de manutenção. Mantenha para compatibilidade com workflows que usem nodes antigos.

## `complementos/ComfyUI-InstantID-Legado`
InstantID nativo para ComfyUI, também em manutenção. Fallback para workflows específicos.

## `complementos/ComfyUI-Vidflows`
Workflows completos de vídeo, narrativa e sequências. Bom banco de arquiteturas para estudar/recortar.

## `complementos/ComfyUI-LivePortrait`
Animação de retratos/expressões. Complemento para talking head e movimento facial.

## `complementos/Biblioteca-ComfyUI-Workflows`
Biblioteca gigante de grafos ComfyUI. Use como laboratório e referência de nodes/padrões.

## `complementos/Fanvue-AI-Bot-RAG`
Projeto com webhook Fanvue, RAG, pgvector, memória por usuário, LLM e administração por Telegram. Excelente referência para nossa camada de CRM/memória.

---

# Workflows e infraestrutura próprios do arsenal

Além dos upstreams, este repositório já tem peças próprias/selecionadas:

- `01-character-engine/workflows/img-sdxl-face.json` — gerar rosto-base de referência;
- `07-n8n/importable/social/one-video-multiplatform-postwire.json` — publicação de um vídeo em múltiplas redes;
- `07-n8n/importable/crm/event-ingest-supabase.json` — ingestão padronizada de eventos no CRM;
- `08-memory-crm/schema.sql` — banco central de creators, contatos, conversas, mensagens, memórias, assets, campanhas, posts, ofertas, compras e eventos;
- `10-infrastructure/docker-compose.yml` — n8n + Postgres/pgvector + Redis;
- `.env.example` — contrato de configuração sem segredos.

---

# Arquitetura alvo

```text
[Bíblia da personagem]
        |
        v
[ComfyUI + PuLID-Flux]
        |
        +----> [imagem]
        |
        +----> [Wan / vídeo]
        |
        v
[Aprovação humana + assets]
        |
        v
[n8n]
  |             |
  |             +------> [Postiz] -> IG / TikTok / X / Reddit
  |
  +------> [Telegram]
  |             |
  |        conversa / intenção
  |             |
  +-------------+
        |
        v
[Fanvue API]
        |
        v
[Postgres + pgvector]
        |
        +---- memória
        +---- eventos
        +---- compras
        +---- atribuição
        |
        v
[retenção / reengajamento / analytics]
```

## Política de atualização

Os submódulos ficam presos a commits específicos para o arsenal continuar reproduzível. Não atualize todos automaticamente em produção. Primeiro teste a nova versão, depois altere o commit apontado pelo submódulo.

## Idioma

Toda documentação criada **neste arsenal** deve ficar em PT-BR. Os arquivos internos dos submódulos permanecem como os autores originais publicaram.
