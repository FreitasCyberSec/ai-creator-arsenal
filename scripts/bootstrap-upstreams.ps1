$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$external = Join-Path $root 'external'
New-Item -ItemType Directory -Force -Path $external | Out-Null

$repos = @(
  @{ Url = 'https://github.com/SciensOne/comfyui-workflow-generator.git'; Dir = 'comfyui-workflow-generator' },
  @{ Url = 'https://github.com/iqgeoai/ComfyUI-vidflows.git'; Dir = 'ComfyUI-vidflows' },
  @{ Url = 'https://github.com/facefusion/facefusion.git'; Dir = 'facefusion' },
  @{ Url = 'https://github.com/yaiol/comfyui-workflows.git'; Dir = 'comfyui-workflows-library' },
  @{ Url = 'https://github.com/yaziradevteam/PulseChatAI.git'; Dir = 'PulseChatAI-reference' },
  @{ Url = 'https://github.com/dnpix/telegram-fanvue-bot.git'; Dir = 'telegram-fanvue-bot-reference' },
  @{ Url = 'https://github.com/fanvue/fanvue-chatbot-example.git'; Dir = 'fanvue-chatbot-official-reference' },
  @{ Url = 'https://github.com/LehaDeev/fanvue_ai_bot.git'; Dir = 'fanvue-ai-bot-reference' },
  @{ Url = 'https://github.com/gitroomhq/postiz-app.git'; Dir = 'postiz' },
  @{ Url = 'https://github.com/enescingoz/awesome-n8n-templates.git'; Dir = 'awesome-n8n-templates' }
)

foreach ($repo in $repos) {
  $dest = Join-Path $external $repo.Dir
  if (Test-Path (Join-Path $dest '.git')) {
    Write-Host "Atualizando $($repo.Dir)..."
    git -C $dest pull --ff-only
  }
  elseif (Test-Path $dest) {
    Write-Warning "$dest existe, mas não é um repositório Git; ignorando."
  }
  else {
    Write-Host "Clonando $($repo.Url)..."
    git clone --depth 1 $repo.Url $dest
  }
}

Write-Host "`nProjetos externos prontos em: $external"
Write-Host 'Leia 90-upstreams/ARSENAL.md e as licenças de cada projeto antes de redistribuir ou modificar código.'
