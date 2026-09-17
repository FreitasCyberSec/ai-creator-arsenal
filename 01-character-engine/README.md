# Motor de Personagem

Objetivo: manter uma criadora/personagem adulta autorizada visualmente consistente entre fotos e vídeos.

## Já incluído

- `workflows/img-sdxl-face.json`
  - Gera candidatos de rosto frontal que podem virar a referência principal de identidade para os workflows seguintes.

## Melhores projetos externos puxados pelo bootstrap

### `external/comfyui-workflow-generator/`
Arquivos principais:
- `workflows/img-sdxl-face.json`
- `workflows/img-flux.json`
- `workflows/img-sdxl-illustrious.json`
- `workflows/longvideo.json`

Use este projeto como principal referência/gerador de workflows porque ele tem licença MIT.

### `external/comfyui-workflows-library/`
Grande biblioteca de padrões do ComfyUI, incluindo preservação de identidade e workflows de imagem/vídeo. Use como biblioteca de pesquisa e revise dependências e licenças antes de colocar algo em produção.

### `external/ComfyUI-vidflows/`
Use como referência para pipelines de vídeo com múltiplas cenas e image-to-video.

### `external/facefusion/`
Use como ferramenta separada de processamento de rosto/identidade quando você tiver autorização para transformar a identidade usada como fonte.

## Bíblia da personagem

Antes de gerar conteúdo em escala, defina um registro estável:

```yaml
nome: CREATOR_01
idade_adulta: 25
versao_rosto_referencia: v1
cabelo:
olhos:
estilo_altura:
estilo_corporal:
regras_roupa:
regras_maquiagem:
estilo_voz:
personalidade:
mudancas_proibidas:
```

O objetivo é conseguir mudar cenário, pose e roupa sem mudar sem querer a identidade da personagem.

## Ordem recomendada do workflow

```text
geração do rosto de referência
   -> escolher referência aprovada
   -> workflow de imagem com trava de identidade
   -> gerar 20-50 imagens de teste
   -> revisar consistência
   -> travar prompt/modelo/configurações
   -> gerar lote de conteúdo
   -> só partir para image-to-video quando a consistência das imagens estiver boa
```

Nunca use rosto ou voz de outra pessoa sem autorização.
