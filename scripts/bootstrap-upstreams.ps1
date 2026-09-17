$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$external = Join-Path $root 'external'
New-Item -ItemType Directory -Force -Path $external | Out-Null

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  throw 'Git não encontrado. Instale o Git antes de executar este script.'
}

$repos = @(
  # Núcleo ComfyUI
  @{ Url = 'https://github.com/Comfy-Org/ComfyUI.git'; Dir = 'ComfyUI' },
  @{ Url = 'https://github.com/Comfy-Org/ComfyUI-Manager.git'; Dir = 'ComfyUI-Manager' },
  @{ Url = 'https://github.com/city96/ComfyUI-GGUF.git'; Dir = 'ComfyUI-GGUF' },

  # Identidade / consistência facial
  @{ Url = 'https://github.com/balazik/ComfyUI-PuLID-Flux.git'; Dir = 'ComfyUI-PuLID-Flux' },
  @{ Url = 'https://github.com/facefusion/facefusion.git'; Dir = 'facefusion' },

  # Imagem / vídeo
  @{ Url = 'https://github.com/SciensOne/comfyui-workflow-generator.git'; Dir = 'comfyui-workflow-generator' },
  @{ Url = 'https://github.com/kijai/ComfyUI-WanVideoWrapper.git'; Dir = 'ComfyUI-WanVideoWrapper' },
  @{ Url = 'https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git'; Dir = 'ComfyUI-VideoHelperSuite' },
  @{ Url = 'https://github.com/kijai/ComfyUI-MMAudio.git'; Dir = 'ComfyUI-MMAudio' },
  @{ Url = 'https://github.com/Fannovel16/ComfyUI-Frame-Interpolation.git'; Dir = 'ComfyUI-Frame-Interpolation' },
  @{ Url = 'https://github.com/iqgeoai/ComfyUI-vidflows.git'; Dir = 'ComfyUI-vidflows' },
  @{ Url = 'https://github.com/kijai/ComfyUI-LivePortraitKJ.git'; Dir = 'ComfyUI-LivePortraitKJ' },
  @{ Url = 'https://github.com/yaiol/comfyui-workflows.git'; Dir = 'comfyui-workflows-library' },
  @{ Url = 'https://github.com/neuratech-ai/ComfyUI-MultiGPU.git'; Dir = 'ComfyUI-MultiGPU-opcional' },

  # Legados úteis como fallback/referência
  @{ Url = 'https://github.com/cubiq/ComfyUI_essentials.git'; Dir = 'ComfyUI_essentials-legado' },
  @{ Url = 'https://github.com/cubiq/ComfyUI_InstantID.git'; Dir = 'ComfyUI_InstantID-legado' },

  # Conversa / Telegram / Fanvue
  @{ Url = 'https://github.com/yaziradevteam/PulseChatAI.git'; Dir = 'PulseChatAI-reference' },
  @{ Url = 'https://github.com/dnpix/telegram-fanvue-bot.git'; Dir = 'telegram-fanvue-bot-reference' },
  @{ Url = 'https://github.com/fanvue/fanvue-chatbot-example.git'; Dir = 'fanvue-chatbot-oficial' },
  @{ Url = 'https://github.com/LehaDeev/fanvue_ai_bot.git'; Dir = 'fanvue-ai-bot-rag-reference' },

  # Publicação / automação
  @{ Url = 'https://github.com/gitroomhq/postiz-app.git'; Dir = 'postiz' },
  @{ Url = 'https://github.com/enescingoz/awesome-n8n-templates.git'; Dir = 'awesome-n8n-templates' }
)

Write-Host "Instalando/atualizando $($repos.Count) componentes do arsenal...`n"

foreach ($repo in $repos) {
  $dest = Join-Path $external $repo.Dir
  if (Test-Path (Join-Path $dest '.git')) {
    Write-Host "[ATUALIZAR] $($repo.Dir)"
    git -C $dest pull --ff-only
  }
  elseif (Test-Path $dest) {
    Write-Warning "$dest existe, mas não é um repositório Git; ignorando."
  }
  else {
    Write-Host "[CLONAR] $($repo.Dir)"
    git clone --depth 1 $repo.Url $dest
  }
}

Write-Host "`nArsenal externo pronto em: $external"
Write-Host 'Preferência: use os submódulos de ferramentas/ e complementos/; este script serve para uma cópia independente dos upstreams.'
Write-Host 'Importante: modelos/checkpoints grandes não são baixados automaticamente.'
