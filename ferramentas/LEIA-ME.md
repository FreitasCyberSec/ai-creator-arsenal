# Ferramentas principais

Esta pasta contém os componentes que considero mais importantes para montar o stack. Eles estão vinculados como **submódulos Git**, portanto o código continua vindo do projeto original e pode ser atualizado de forma controlada.

## Ordem recomendada de uso

### 1. `ComfyUI`
Base visual para geração de imagem e vídeo por workflows.

### 2. `ComfyUI-Manager`
Gerencia custom nodes e ajuda a resolver dependências dos workflows do ComfyUI.

### 3. `ComfyUI-Workflow-Generator`
Gerador de photosets e vídeos com personagem consistente. É uma das peças mais úteis deste arsenal porque já trabalha com identidade fixa, lotes, Flux/SDXL e I2V.

### 4. `ComfyUI-PuLID-Flux`
Mantém a identidade visual da personagem em gerações Flux usando uma imagem de referência autorizada.

### 5. `ComfyUI-WanVideoWrapper`
Camada de vídeo para modelos Wan dentro do ComfyUI.

### 6. `ComfyUI-VideoHelperSuite`
Carregamento, montagem, tratamento e exportação de vídeo dentro do ComfyUI.

### 7. `FaceFusion`
Ferramenta separada para transformação de rosto/identidade em imagens e vídeos. Use somente com pessoas adultas que autorizaram essa transformação.

### 8. `Postiz`
Publicação e agendamento social. Use como serviço separado para distribuir conteúdo aprovado em redes compatíveis com o conteúdo publicado.

### 9. `Fanvue-Chatbot-Oficial`
Exemplo oficial de OAuth e chat pela API Fanvue. Esta deve ser a referência principal para autenticação e contrato da API.

### 10. `PulseChatAI`
Referência avançada para conversa no Telegram, detecção de intenção, lead scoring, RAG e reengajamento. Revise termos/licença antes de incorporar código ao seu próprio produto.

### 11. `Telegram-Fanvue-Bot`
Bot mais simples para entender e testar o caminho Telegram -> conversa -> CTA -> Fanvue.

### 12. `Awesome-n8n-Templates`
Biblioteca enorme de workflows n8n. Use como fonte de peças reutilizáveis; os workflows próprios selecionados ficam em `../07-n8n/importable/`.

## Caminho recomendado para começar

```text
ComfyUI
  -> ComfyUI Manager
  -> Workflow Generator
  -> PuLID-Flux
  -> gerar um lote de teste
  -> aprovação humana
  -> n8n
  -> Postiz
  -> rede social
  -> Telegram/Fanvue
  -> CRM/memória
```

Não tente configurar todas as ferramentas no primeiro dia. Faça primeiro um caminho completo funcionar de ponta a ponta.

## Inicializar os submódulos

Se o repositório já estiver clonado:

```bash
git submodule update --init --recursive
```

Para um clone novo:

```bash
git clone --recurse-submodules https://github.com/FreitasCyberSec/ai-creator-arsenal.git
```

## Idioma

Os guias criados no arsenal estão em PT-BR. Os arquivos dentro de cada submódulo permanecem no idioma original do projeto, pois são mantidos pelos autores upstream.
