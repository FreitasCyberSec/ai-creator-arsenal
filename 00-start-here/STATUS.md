# Status atual do arsenal

Atualizado em 17/09/2026.

## Já está dentro do repositório

### 15 ferramentas principais como submódulos Git

1. ComfyUI
2. ComfyUI Manager
3. ComfyUI GGUF
4. ComfyUI Workflow Generator
5. PuLID-Flux
6. WanVideoWrapper
7. VideoHelperSuite
8. MMAudio
9. Frame Interpolation / RIFE
10. FaceFusion
11. Postiz
12. Fanvue Chatbot Oficial
13. PulseChatAI
14. Telegram-Fanvue-Bot
15. Awesome n8n Templates

### 7 complementos como submódulos Git

1. ComfyUI MultiGPU
2. ComfyUI Essentials (legado)
3. ComfyUI InstantID (legado)
4. ComfyUI Vidflows
5. ComfyUI LivePortrait
6. Biblioteca ComfyUI Workflows
7. Fanvue AI Bot com RAG/pgvector

**Total: 22 projetos externos vinculados ao arsenal.**

## Workflows/infra já incorporados diretamente

- workflow ComfyUI para gerar rosto-base de referência;
- workflow n8n para publicação de vídeo em múltiplas redes;
- workflow n8n para ingestão de eventos no CRM;
- schema PostgreSQL/pgvector para creators, contatos, mensagens, memórias, assets, campanhas, ofertas, compras e eventos;
- Docker Compose com n8n + PostgreSQL/pgvector + Redis;
- variante específica para EasyPanel;
- `.env.example` central;
- scripts de bootstrap;
- scripts de inicialização dos submódulos;
- documentação operacional em PT-BR.

## EasyPanel

A variante `10-infrastructure/docker-compose.easypanel.yml` força o n8n a escutar em IPv4 com:

```text
N8N_LISTEN_ADDRESS=0.0.0.0
N8N_WORKER_SERVER_ADDRESS=0.0.0.0
```

Isso evita crash em hosts/containers onde IPv6 (`::`) não está disponível.

## O que propositalmente NÃO está dentro do Git

### Modelos/pesos grandes

Exemplos:

- Flux;
- Wan;
- SDXL;
- pesos PuLID;
- modelos InsightFace;
- modelos de áudio;
- outros checkpoints `.safetensors`, `.gguf`, `.ckpt`, `.pt`.

Eles são grandes e/ou têm licenças próprias. Devem ser instalados separadamente conforme o workflow escolhido.

### Credenciais

Nunca colocar no Git:

- tokens Telegram;
- chaves OpenAI/OpenRouter;
- Fanvue secrets/tokens;
- Postiz keys;
- senhas do banco;
- cookies/sessões;
- mídia privada.

Use `.env` local ou um gerenciador de segredos.

## Primeiro comando depois de clonar

Windows:

```powershell
.\scripts\inicializar-arsenal.ps1
```

Linux/macOS:

```bash
bash scripts/inicializar-arsenal.sh
```

Depois leia `ferramentas/LEIA-ME.md`.
