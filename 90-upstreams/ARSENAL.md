# Arsenal de Projetos Externos Selecionados

Este é o conjunto inicial de maior valor. A ideia não é acumular repositórios, mas usar cada projeto para preencher uma camada específica da operação.

## Tier S — núcleo principal

### Personagem / imagem / vídeo

- `SciensOne/comfyui-workflow-generator`
  - Função: photosets com personagem consistente, geração de rosto de referência, identidade com PuLID e geração de workflows de imagem para vídeo.
  - Por que vale usar: projeto pequeno, focado e com licença MIT.
  - Pasta local após bootstrap: `external/comfyui-workflow-generator`

- `iqgeoai/ComfyUI-vidflows`
  - Função: workflows de vídeo com IA, múltiplas cenas, image-to-video e pipelines tipo talking-head/lip-sync.
  - Por que vale usar: boa referência para transformar uma imagem consistente da personagem em pipelines de vídeo repetíveis.
  - Pasta local: `external/ComfyUI-vidflows`

- `facefusion/facefusion`
  - Função: transformação de rosto/identidade para assets autorizados.
  - Por que vale usar: projeto maduro; é melhor rodá-lo como ferramenta separada do que misturar processamento facial em cada workflow.
  - Pasta local: `external/facefusion`

- `yaiol/comfyui-workflows`
  - Função: biblioteca enorme de workflows do ComfyUI.
  - Por que vale usar: ótima para pesquisar padrões de InstantID, FaceID, PuLID, imagem, vídeo e outras arquiteturas.
  - Pasta local: `external/comfyui-workflows-library`

### Telegram / conversão

- `yaziradevteam/PulseChatAI`
  - Função: IA conversacional no Telegram com detecção de intenção, lead scoring, escalonamento e controle do momento de CTA.
  - Por que vale usar: é uma das referências públicas mais próximas de um funil conversacional orientado por comportamento.
  - Licença: não foi encontrada licença explícita; use como **referência** até haver permissão clara.
  - Pasta local: `external/PulseChatAI-reference`

- `dnpix/telegram-fanvue-bot`
  - Função: ponte de aquecimento/conversa no Telegram até a Fanvue.
  - Por que vale usar: exemplo compacto de `aquisição -> conversa -> CTA`.
  - Licença: revisar antes de copiar, modificar ou redistribuir.
  - Pasta local: `external/telegram-fanvue-bot-reference`

### Fanvue / CRM / mensagens

- `fanvue/fanvue-chatbot-example`
  - Função: referência oficial de integração Fanvue API/OAuth/chat.
  - Por que vale usar: é a melhor base para entender o contrato oficial de integração.
  - Licença: não havia licença explícita visível quando este arsenal foi montado; use como referência de API.
  - Pasta local: `external/fanvue-chatbot-official-reference`

- `LehaDeev/fanvue_ai_bot`
  - Função: chat por IA na Fanvue, RAG/memória, Postgres/pgvector e administração via Telegram.
  - Por que vale usar: excelente referência para memória persistente de cliente e controle operacional.
  - Pasta local: `external/fanvue-ai-bot-reference`

### Distribuição social

- `gitroomhq/postiz-app`
  - Função: serviço de publicação e agendamento em múltiplas plataformas.
  - Por que vale usar: camada madura para distribuição social; deve ficar isolada como serviço.
  - Licença: AGPL-3.0.
  - Pasta local: `external/postiz`

### Biblioteca de workflows n8n

- `enescingoz/awesome-n8n-templates`
  - Função: grande biblioteca de workflows n8n.
  - Por que vale usar: fonte ampla de automações para conteúdo, IA, Telegram, banco de dados e operações.
  - Licença: CC BY 4.0; manter atribuição.
  - Pasta local: `external/awesome-n8n-templates`

## Arquitetura alvo

```text
[Bíblia da Personagem]
      |
      v
[ComfyUI: identidade + foto/vídeo]
      |
      v
[Aprovação / armazenamento de conteúdo]
      |
      v
[Orquestrador n8n] ---> [Postiz] ---> IG/TikTok/X/Reddit
      |
      +---> Camada conversacional Telegram
      |          |
      |          v
      |     intenção / estado do lead
      |          |
      +----------+
      |
      v
[API Fanvue]
      |
      v
[Postgres/Supabase + pgvector]
      |
      v
[retenção / reengajamento / analytics]
```

## Não misture tudo sem critério

Use este arsenal de forma modular. Aplicações grandes como Postiz e FaceFusion devem ficar isoladas como serviços. Projetos sem licença explícita não devem ter o código incorporado diretamente ao seu código proprietário até os termos estarem claros.
