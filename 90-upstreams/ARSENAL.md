# Arsenal de Projetos Externos

Este arquivo registra **o que já está ligado ao repositório**, o que é núcleo e o que é complemento. A intenção não é colecionar projetos: cada componente precisa preencher uma função concreta da arquitetura.

## Como as ferramentas entram no arsenal

Existem três formas:

1. **Submódulo principal** — aparece em `ferramentas/` e faz parte do stack recomendado.
2. **Submódulo complementar** — aparece em `complementos/` e serve como alternativa, biblioteca ou referência.
3. **Workflow incorporado** — JSON/SQL/documentação selecionada que fica diretamente neste repo, com licença/crédito quando necessário.

Clone completo:

```bash
git clone --recurse-submodules https://github.com/FreitasCyberSec/ai-creator-arsenal.git
```

Clone já existente:

```bash
git pull
git submodule update --init --recursive
```

---

# Tier S — ferramentas principais

## Núcleo ComfyUI

### `ferramentas/ComfyUI`
Motor visual principal para geração de imagem e vídeo.

### `ferramentas/ComfyUI-Manager`
Gerenciamento de custom nodes e dependências.

### `ferramentas/ComfyUI-GGUF`
Loader para modelos GGUF. Importante para Flux/Wan em setups que usam modelos quantizados.

### `ferramentas/ComfyUI-Workflow-Generator`
- Projeto: `SciensOne/comfyui-workflow-generator`
- Função: photosets consistentes, personagem fixa, Flux/SDXL, lotes e image-to-video.
- Motivo da escolha: arquitetura muito próxima do objetivo do arsenal e licença MIT.

### `ferramentas/ComfyUI-PuLID-Flux`
Identity lock para Flux usando uma imagem de referência autorizada.

## Vídeo

### `ferramentas/ComfyUI-WanVideoWrapper`
Integração de modelos Wan para geração de vídeo.

### `ferramentas/ComfyUI-VideoHelperSuite`
Carregamento, montagem, processamento e exportação de vídeo.

### `ferramentas/ComfyUI-MMAudio`
Geração/sincronização de áudio e efeitos em pipelines compatíveis.

### `ferramentas/ComfyUI-Frame-Interpolation`
Interpolação de frames, incluindo RIFE, para suavizar movimento e aumentar FPS.

### `ferramentas/FaceFusion`
Transformação de face/identidade em imagens e vídeos autorizados. Usar apenas com adultos e assets cujo uso/transformação esteja autorizado.

## Distribuição social

### `ferramentas/Postiz`
Publicação e agendamento em múltiplas redes. Deve funcionar como serviço separado do núcleo do arsenal.

## Telegram / Fanvue / conversa

### `ferramentas/Fanvue-Chatbot-Oficial`
Exemplo oficial da Fanvue com OAuth 2.0 e chat API. É a referência principal para autenticação e endpoints.

### `ferramentas/PulseChatAI`
Conversa no Telegram, intent detection, lead scoring, RAG, CTA e reengajamento. Usar como referência/serviço e revisar licença antes de incorporar código.

### `ferramentas/Telegram-Fanvue-Bot`
Implementação mais simples para testar Telegram -> conversa -> CTA -> Fanvue usando Bot API.

## n8n

### `ferramentas/Awesome-n8n-Templates`
Grande biblioteca de workflows n8n, sob CC BY 4.0. As peças selecionadas/adaptadas ficam em `07-n8n/importable/`.

---

# Complementos

## `complementos/ComfyUI-MultiGPU`
Offload/distribuição de modelos entre GPUs/memória. Útil apenas em setups específicos e workflows pesados.

## `complementos/ComfyUI-Essentials-Legado`
Projeto em modo de manutenção. Fica para compatibilidade com workflows antigos.

## `complementos/ComfyUI-InstantID-Legado`
InstantID para ComfyUI, também em manutenção. Fallback para workflows que exijam especificamente InstantID.

## `complementos/ComfyUI-Vidflows`
Workflows completos de vídeo, narrativa e sequências. Banco de arquiteturas para estudar e reaproveitar.

## `complementos/ComfyUI-LivePortrait`
Animação de retratos/expressões; útil para talking head e movimento facial.

## `complementos/Biblioteca-ComfyUI-Workflows`
Biblioteca gigante de workflows para Flux, ControlNet, img2img, vídeo e outros padrões.

## `complementos/Fanvue-AI-Bot-RAG`
Projeto de referência com webhook Fanvue, RAG, pgvector, memória por usuário, LLM e administração por Telegram.

---

# Workflows e infraestrutura próprios do arsenal

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
[ComfyUI + GGUF + PuLID-Flux]
        |
        +----> [imagem]
        |
        +----> [Wan / vídeo]
                    |
                    +--> VideoHelper
                    +--> RIFE
                    +--> MMAudio
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

Os submódulos ficam presos a commits específicos para o arsenal continuar reproduzível. Não atualize todos automaticamente em produção: teste novas versões antes de alterar o commit apontado.

## Idioma

Toda documentação criada **neste arsenal** deve ficar em PT-BR. Os arquivos internos dos submódulos permanecem como os autores originais publicaram.
