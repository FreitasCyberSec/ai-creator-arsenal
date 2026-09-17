# Arsenal de Criadores com IA

Kit central para montar uma operação de criadores com IA de forma organizada, modular e reutilizável. O repositório reúne ferramentas e workflows para identidade visual consistente, geração de imagens e vídeos, publicação em redes sociais, automação com Telegram/Fanvue, orquestração com n8n, memória/CRM, analytics e infraestrutura.

> **Status do repositório:** neste momento ele aparece como **público** pela API conectada do GitHub. Não coloque segredos, credenciais, mídia privada, dados de clientes ou prompts proprietários aqui enquanto você não mudar a visibilidade para **Private** nas configurações do GitHub.

## Instalação rápida

Para clonar o arsenal já trazendo as ferramentas vinculadas:

```bash
git clone --recurse-submodules https://github.com/FreitasCyberSec/ai-creator-arsenal.git
cd ai-creator-arsenal
```

Se você já clonou o repositório antes dos submódulos serem adicionados:

```bash
git pull
git submodule update --init --recursive
```

Os submódulos ficam presos a revisões conhecidas para evitar que uma atualização externa quebre seu ambiente sem aviso. Atualize conscientemente depois de testar.

## Arquitetura

```text
Bíblia da Personagem / Identidade
        ↓
ComfyUI / geração de imagem + vídeo
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

- `00-start-here/` — início, instalação e modo de usar
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
- `ferramentas/` — ferramentas principais vinculadas como submódulos Git
- `complementos/` — bibliotecas, alternativas e ferramentas de referência/fallback
- `90-upstreams/` — catálogo explicando o papel de cada projeto
- `99-licenses/` — licenças e créditos dos materiais incorporados diretamente

## Ferramentas principais já vinculadas

O núcleo inclui ComfyUI, ComfyUI Manager, PuLID-Flux, WanVideoWrapper, VideoHelperSuite, FaceFusion, Postiz, chatbot oficial da Fanvue, PulseChatAI, Telegram-Fanvue-Bot, o gerador de workflows ComfyUI e uma grande biblioteca de templates n8n.

Os complementos incluem InstantID e Essentials como referências legadas, ComfyUI Vidflows, LivePortrait, uma grande biblioteca de workflows ComfyUI e um bot Fanvue com RAG/pgvector.

> Os documentos criados neste repositório estão em **PT-BR**. O código e os READMEs que aparecem dentro dos submódulos pertencem aos projetos originais e, por isso, permanecem no idioma do upstream.

## Stack prioritário

1. **ComfyUI + Manager** — base visual para geração.
2. **ComfyUI Workflow Generator + PuLID-Flux** — consistência de personagem e lotes de conteúdo.
3. **WanVideoWrapper + VideoHelperSuite** — geração, montagem e tratamento de vídeo.
4. **FaceFusion** — transformação de identidade apenas em assets autorizados.
5. **Postiz** — distribuição e agendamento em múltiplas redes.
6. **Telegram/Fanvue + Fanvue API oficial** — conversa, aquisição e monetização.
7. **n8n + Postgres/pgvector** — orquestração, CRM, memória, eventos e analytics.

## Regras do arsenal

- Nunca commitar `.env`, chaves de API, cookies de sessão, tokens, dados de clientes ou mídia privada.
- Só copiar código de terceiros quando a licença permitir e mantendo os créditos exigidos.
- Aplicações AGPL/copy-left devem ficar isoladas como serviços, a menos que você decida conscientemente aceitar as obrigações da licença.
- Repositórios sem licença explícita ficam como referência/submódulo, não como código incorporado ao seu código proprietário.
- Transformação de rosto/voz/identidade deve usar apenas pessoas adultas que tenham autorizado o uso e a transformação do conteúdo.
- Preferir APIs oficiais e automações aprovadas pelas plataformas.

Comece por `00-start-here/START.md`, depois `ferramentas/LEIA-ME.md` e `90-upstreams/ARSENAL.md`.
