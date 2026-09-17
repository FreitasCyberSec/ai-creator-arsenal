#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EXTERNAL="$ROOT/external"
mkdir -p "$EXTERNAL"

if ! command -v git >/dev/null 2>&1; then
  echo "Git não encontrado. Instale o Git antes de executar este script." >&2
  exit 1
fi

clone_or_update() {
  local url="$1"
  local dir="$2"
  local dest="$EXTERNAL/$dir"

  if [ -d "$dest/.git" ]; then
    echo "[ATUALIZAR] $dir"
    git -C "$dest" pull --ff-only
  elif [ -e "$dest" ]; then
    echo "Ignorando $dest (existe, mas não é um repositório Git)" >&2
  else
    echo "[CLONAR] $dir"
    git clone --depth 1 "$url" "$dest"
  fi
}

# Núcleo ComfyUI
clone_or_update "https://github.com/Comfy-Org/ComfyUI.git" "ComfyUI"
clone_or_update "https://github.com/Comfy-Org/ComfyUI-Manager.git" "ComfyUI-Manager"

# Identidade / consistência facial
clone_or_update "https://github.com/balazik/ComfyUI-PuLID-Flux.git" "ComfyUI-PuLID-Flux"
clone_or_update "https://github.com/facefusion/facefusion.git" "facefusion"

# Imagem / vídeo
clone_or_update "https://github.com/SciensOne/comfyui-workflow-generator.git" "comfyui-workflow-generator"
clone_or_update "https://github.com/kijai/ComfyUI-WanVideoWrapper.git" "ComfyUI-WanVideoWrapper"
clone_or_update "https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git" "ComfyUI-VideoHelperSuite"
clone_or_update "https://github.com/iqgeoai/ComfyUI-vidflows.git" "ComfyUI-vidflows"
clone_or_update "https://github.com/kijai/ComfyUI-LivePortraitKJ.git" "ComfyUI-LivePortraitKJ"
clone_or_update "https://github.com/yaiol/comfyui-workflows.git" "comfyui-workflows-library"

# Legados úteis como fallback/referência
clone_or_update "https://github.com/cubiq/ComfyUI_essentials.git" "ComfyUI_essentials-legado"
clone_or_update "https://github.com/cubiq/ComfyUI_InstantID.git" "ComfyUI_InstantID-legado"

# Conversa / Telegram / Fanvue
clone_or_update "https://github.com/yaziradevteam/PulseChatAI.git" "PulseChatAI-reference"
clone_or_update "https://github.com/dnpix/telegram-fanvue-bot.git" "telegram-fanvue-bot-reference"
clone_or_update "https://github.com/fanvue/fanvue-chatbot-example.git" "fanvue-chatbot-oficial"
clone_or_update "https://github.com/LehaDeev/fanvue_ai_bot.git" "fanvue-ai-bot-rag-reference"

# Publicação / automação
clone_or_update "https://github.com/gitroomhq/postiz-app.git" "postiz"
clone_or_update "https://github.com/enescingoz/awesome-n8n-templates.git" "awesome-n8n-templates"

echo
echo "Arsenal externo pronto em: $EXTERNAL"
echo "Preferência: use os submódulos de ferramentas/ e complementos/; este script serve para uma cópia independente dos upstreams."
echo "Importante: modelos/checkpoints grandes não são baixados automaticamente."
