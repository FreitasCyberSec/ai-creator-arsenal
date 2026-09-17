# Arsenal de Criadores com IA

Kit central para montar uma operação de criadores com IA de forma organizada, modular e reutilizável. O repositório reúne ferramentas e workflows para identidade visual consistente, geração de imagens e vídeos, publicação em redes sociais, automação com Telegram/Fanvue, orquestração com n8n, memória/CRM, analytics e infraestrutura.

> **Status do repositório:** neste momento ele aparece como **público** pela API conectada do GitHub. Não coloque segredos, credenciais, mídia privada, dados de clientes ou prompts proprietários aqui enquanto você não mudar a visibilidade para **Private** nas configurações do GitHub.

## Instalação rápida

Clone novo já trazendo as ferramentas:

```bash
git clone --recurse-submodules https://github.com/FreitasCyberSec/ai-creator-arsenal.git
cd ai-creator-arsenal
```

Se o repositório já estiver clonado:

```bash
git pull
git submodule update --init --recursive
```

Ou use o inicializador:

```powershell
# Windows
.\scripts\inicializar-arsenal.ps1
```

```bash
# Linux/macOS
bash scripts/inicializar-arsenal.sh
```

Os submódulos ficam presos a revisões conhecidas para evitar que uma atualização externa quebre seu ambiente sem aviso.

## Arquitetura

```text
Bíblia da Personagem / Identidade
        ↓
ComfyUI + GGUF + PuLID-Flux
        ↓
Imagem / Wan Video / RIFE / MMAudio
        ↓
Aprovação humana / biblioteca de conteúdo
        ↓
Orquestração com n8n
        ↓
Postiz / APIs das plataformas
   ├─ Instagram
   ├─ TikTok
   ├─ X
   ├─ Reddit
   └─ Telegram
        ↓
Aquisição via Telegram / Fanvue
        ↓
Conversa com IA + memória + intenção
        ↓
Oferta / assinatura / PPV
        ↓
CRM + analytics
        ↓
Retenção / reengajamento
```

## Mapa do repositório

- `00-start-here/` — início, instalação, status e modo de usar
- `01-character-engine/` — identidade consistente e workflows de personagem
- `02-image-video/` — geração e transformação de imagens/vídeos
- `03-content-factory/` — aprovação, organização e processamento de conteúdo
- `04-social-automation/` — automação de Instagram/TikTok/X/Reddit
- `05-telegram/` — aquisição, conversa e reengajamento no Telegram
- `06-fanvue/` — integrações de API/chat da Fanvue
- `07-n8n/` — workflows importáveis e orquestração
- `08-memory-crm/` — Supabase/Postgres/pgvector/RAG e memória
- `09-analytics/` — eventos, atribuição e métricas
- `10-infrastructure/` — infraestrutura e exemplos de deploy
- `ferramentas/` — **15 ferramentas principais** como submódulos Git
- `complementos/` — **7 complementos/referências** como submódulos Git
- `90-upstreams/` — catálogo explicando o papel de cada projeto
- `99-licenses/` — licenças e créditos dos materiais incorporados diretamente

## O que já está vinculado

São **22 projetos externos** no total.

O núcleo inclui: ComfyUI, Manager, GGUF, Workflow Generator, PuLID-Flux, WanVideoWrapper, VideoHelperSuite, MMAudio, Frame Interpolation/RIFE, FaceFusion, Postiz, chatbot oficial da Fanvue, PulseChatAI, Telegram-Fanvue-Bot e Awesome n8n Templates.

Os complementos incluem: MultiGPU, InstantID e Essentials como referências/fallback, ComfyUI Vidflows, LivePortrait, uma biblioteca grande de workflows ComfyUI e um bot Fanvue com RAG/pgvector.

Veja a lista consolidada em `00-start-here/STATUS.md`.

> Os documentos criados neste repositório estão em **PT-BR**. O código e os READMEs dentro dos submódulos pertencem aos projetos originais e permanecem no idioma do upstream.

## Stack prioritário

1. **ComfyUI + Manager + GGUF** — base visual e loaders.
2. **Workflow Generator + PuLID-Flux** — consistência de personagem e lotes de conteúdo.
3. **WanVideoWrapper + VideoHelperSuite + RIFE + MMAudio** — vídeo, suavização e áudio.
4. **FaceFusion** — transformação de identidade apenas em assets autorizados.
5. **Postiz** — distribuição e agendamento em múltiplas redes.
6. **Telegram/Fanvue + Fanvue API oficial** — conversa, aquisição e monetização.
7. **n8n + Postgres/pgvector** — orquestração, CRM, memória, eventos e analytics.

## O que não vem automaticamente

Modelos/checkpoints grandes (Flux, Wan, SDXL, PuLID weights, InsightFace etc.) não ficam versionados neste Git. Eles precisam ser instalados separadamente conforme o workflow escolhido. Credenciais também ficam apenas no `.env` local/secret manager.

## Regras do arsenal

- Nunca commitar `.env`, chaves de API, cookies de sessão, tokens, dados de clientes ou mídia privada.
- Só copiar código de terceiros quando a licença permitir e mantendo os créditos exigidos.
- Aplicações AGPL/copy-left devem ficar isoladas como serviços, a menos que você decida conscientemente aceitar as obrigações da licença.
- Repositórios sem licença explícita ficam como referência/submódulo, não como código incorporado ao seu código proprietário.
- Transformação de rosto/voz/identidade deve usar apenas pessoas adultas que tenham autorizado o uso e a transformação do conteúdo.
- Preferir APIs oficiais e automações aprovadas pelas plataformas.

Comece por `00-start-here/STATUS.md`, depois `ferramentas/LEIA-ME.md` e `00-start-here/START.md`.
