# Pipeline da Fábrica de Conteúdo

Use esta pasta como o contrato entre geração e distribuição.

## Máquina de estados

```text
rascunho
  -> revisão
  -> aprovado
  -> agendado
  -> publicado
  -> arquivado
```

Nada gerado por IA deve sair direto da geração para publicação pública sem passar por revisão/aprovação, a menos que você decida conscientemente remover essa etapa depois.

## Fluxo recomendado dos assets

```text
Referência da personagem
  -> workflow ComfyUI
  -> lote de imagens/vídeos candidatos
  -> filtro de qualidade
  -> aprovação humana
  -> armazenamento do asset aprovado
  -> variações de legenda
  -> adaptação por plataforma
  -> agendador
  -> publicação
  -> coleta de métricas
  -> desempenho volta para orientar o próximo lote
```

## Metadados mínimos por asset

Armazene pelo menos:

- `creator_id`
- `asset_id`
- tipo: imagem/vídeo/áudio
- workflow de origem
- seed e parâmetros de geração
- versão do prompt
- versão da referência facial/identidade
- status de aprovação
- referência de consentimento/direitos
- plataformas-alvo
- campanha
- URLs publicadas
- métricas de desempenho

## Portões de qualidade

Para consistência de personagem, revise:

- geometria facial / identidade
- mãos e anatomia
- cabelo e olhos
- aparência claramente adulta
- artefatos no fundo
- textos/logos/marcas d'água
- consistência temporal no vídeo
- lip-sync quando houver voz
- compatibilidade com as políticas da plataforma

## Separação por plataforma

Mantenha os assets de aquisição em redes mainstream compatíveis com as políticas dessas plataformas. Conteúdo adulto deve ficar apenas nas superfícies que explicitamente permitem esse tipo de conteúdo.
