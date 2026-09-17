# Arsenal de Imagem e Vídeo

## Caminho principal de produção

```text
referência de identidade aprovada
  -> workflow de consistência em imagem
  -> geração em lote
  -> revisão de qualidade
  -> escolha dos melhores frames
  -> workflow image-to-video
  -> revisão de consistência temporal
  -> voz/lip-sync opcional
  -> exportar asset aprovado
```

## Projetos externos puxados pelo bootstrap

### ComfyUI Workflow Generator
`external/comfyui-workflow-generator/`

Use para workflows repetíveis de personagem e geração parametrizada. O upstream inclui exemplos para geração de rosto, imagens com FLUX/SDXL e workflows de vídeo.

### ComfyUI Vidflows
`external/ComfyUI-vidflows/`

Use como referência de produção para image-to-video e pipelines com múltiplas cenas mantendo a personagem consistente.

### Biblioteca de workflows ComfyUI
`external/comfyui-workflows-library/`

Grande biblioteca de pesquisa. É útil para descobrir padrões de grafo e técnicas, mas não assuma que todo workflow possui a mesma qualidade de dependências/licenças.

### FaceFusion
`external/facefusion/`

Ferramenta dedicada de processamento de rosto. Mantenha separada do orquestrador principal e use somente com identidades/assets que você tenha autorização para transformar.

## Boas práticas de produção

- Salve o JSON do workflow usado em cada lote gerado.
- Registre versões de modelo/checkpoint, seed e versão do prompt.
- Não sobrescreva a referência canônica da personagem; versione como `v1`, `v2`, etc.
- Tenha presets separados para retrato, corpo inteiro, lifestyle e frames de vídeo.
- Aprove a consistência das imagens antes de gastar GPU com vídeo.
- Armazene mídia gerada fora do Git; no repositório ficam metadados, configurações e workflows.
