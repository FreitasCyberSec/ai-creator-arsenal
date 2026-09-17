# Ferramentas principais

Esta pasta contém os componentes mais importantes do stack. Eles estão vinculados como **submódulos Git**, então o código continua vindo do projeto original e pode ser atualizado de forma controlada.

## Ordem recomendada de uso

### 1. `ComfyUI`
Base visual para geração de imagem e vídeo por workflows.

### 2. `ComfyUI-Manager`
Gerencia custom nodes e ajuda a resolver dependências dos workflows do ComfyUI.

### 3. `ComfyUI-GGUF`
Loader para modelos em GGUF. É importante para workflows Flux/Wan otimizados para VRAM.

### 4. `ComfyUI-Workflow-Generator`
Gerador de photosets e vídeos com personagem consistente. Trabalha com identidade fixa, lotes, Flux/SDXL e image-to-video.

### 5. `ComfyUI-PuLID-Flux`
Mantém a identidade visual da personagem em gerações Flux usando uma imagem de referência autorizada.

### 6. `ComfyUI-WanVideoWrapper`
Camada de vídeo para modelos Wan dentro do ComfyUI.

### 7. `ComfyUI-VideoHelperSuite`
Carregamento, montagem, tratamento e exportação de vídeo.

### 8. `ComfyUI-MMAudio`
Geração/sincronização de áudio e efeitos para pipelines de vídeo compatíveis.

### 9. `ComfyUI-Frame-Interpolation`
Interpolação RIFE e outros métodos para aumentar a fluidez/FPS de vídeos gerados.

### 10. `FaceFusion`
Ferramenta separada para transformação de rosto/identidade em imagens e vídeos. Use somente com pessoas adultas que autorizaram a transformação.

### 11. `Postiz`
Publicação e agendamento social. Use como serviço separado para distribuir conteúdo aprovado em redes compatíveis com o conteúdo publicado.

### 12. `Fanvue-Chatbot-Oficial`
Exemplo oficial de OAuth e chat pela API Fanvue. Esta é a referência principal para autenticação e contrato da API.

### 13. `PulseChatAI`
Referência avançada para conversa no Telegram, detecção de intenção, lead scoring, RAG e reengajamento. Revise termos/licença antes de incorporar código ao seu próprio produto.

### 14. `Telegram-Fanvue-Bot`
Implementação mais simples para testar o caminho Telegram -> conversa -> CTA -> Fanvue usando Bot API.

### 15. `Awesome-n8n-Templates`
Biblioteca enorme de workflows n8n. Use como fonte de peças reutilizáveis; os workflows selecionados/adaptados ficam em `../07-n8n/importable/`.

## Caminho recomendado para começar

```text
ComfyUI
  -> ComfyUI Manager
  -> GGUF / nodes necessários
  -> Workflow Generator
  -> PuLID-Flux
  -> gerar lote de teste
  -> aprovação humana
  -> vídeo Wan, se necessário
  -> VideoHelper / RIFE / MMAudio
  -> biblioteca de assets
  -> n8n
  -> Postiz
  -> rede social
  -> Telegram/Fanvue
  -> CRM/memória
```

Não tente configurar tudo no primeiro dia. Primeiro faça um caminho completo funcionar de ponta a ponta.

## Inicializar os submódulos

Clone novo:

```bash
git clone --recurse-submodules https://github.com/FreitasCyberSec/ai-creator-arsenal.git
```

Repositório já clonado:

```bash
git pull
git submodule update --init --recursive
```

## O que NÃO vem dentro do Git

Por tamanho, licença ou escolha de modelo, o arsenal não inclui automaticamente checkpoints/pesos grandes como Flux, Wan, SDXL, PuLID weights, InsightFace models etc. Os guias devem indicar quais modelos cada workflow exige.

## Idioma

Os guias criados no arsenal estão em PT-BR. Os arquivos dentro de cada submódulo permanecem no idioma original do projeto, pois são mantidos pelos autores upstream.
