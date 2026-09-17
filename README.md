# Arsenal de Criadores com IA

Kit central para montar uma operação de criadores com IA de forma organizada, modular e reutilizável. O repositório reúne componentes para identidade visual consistente, geração de imagens e vídeos, publicação em redes sociais, automação com Telegram/Fanvue, orquestração com n8n, memória/CRM, analytics e infraestrutura.

> **Status do repositório:** neste momento ele aparece como **público** pela API conectada do GitHub. Não coloque segredos, credenciais, mídia privada, dados de clientes ou prompts proprietários aqui enquanto você não mudar a visibilidade para **Private** nas configurações do GitHub.

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
- `90-upstreams/` — catálogo dos projetos externos e scripts de bootstrap
- `99-licenses/` — licenças e créditos dos projetos usados

## Stack inicial prioritário

1. **SciensOne/comfyui-workflow-generator** — geração consistente de personagem e workflows de imagem/vídeo; licença MIT.
2. **Postiz** — publicação em múltiplas redes sociais; deve rodar como serviço externo isolado por causa da licença AGPL.
3. **Exemplo oficial de chatbot da Fanvue** — referência oficial de API/OAuth.
4. **PulseChatAI** — referência de funil conversacional, intenção e lead scoring no Telegram.
5. **Bibliotecas de workflows n8n** — fonte de automações reaproveitáveis.
6. **Supabase/Postgres/pgvector** — memória, estado, atribuição e CRM.

## Regras do arsenal

- Nunca commitar `.env`, chaves de API, cookies de sessão, tokens, dados de clientes ou mídia privada.
- Só copiar código de terceiros quando a licença permitir e mantendo os créditos exigidos.
- Aplicações AGPL/copy-left devem ficar isoladas como serviços, a menos que você decida conscientemente aceitar as obrigações da licença.
- Repositórios sem licença explícita ficam como **referência**, não como código incorporado.
- Transformação de rosto/voz/identidade deve usar apenas pessoas adultas que tenham autorizado o uso e a transformação do conteúdo.
- Preferir APIs oficiais e automações aprovadas pelas plataformas.

Comece por `00-start-here/START.md` e depois veja `90-upstreams/ARSENAL.md`.
