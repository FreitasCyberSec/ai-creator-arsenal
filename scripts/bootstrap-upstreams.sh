#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EXTERNAL="$ROOT/external"
mkdir -p "$EXTERNAL"

clone_or_update() {
  local url="$1"
  local dir="$2"
  local dest="$EXTERNAL/$dir"

  if [ -d "$dest/.git" ]; then
    echo "Updating $dir..."
    git -C "$dest" pull --ff-only
  elif [ -e "$dest" ]; then
    echo "Skipping $dest (exists but is not a git repo)" >&2
  else
    echo "Cloning $url..."
    git clone --depth 1 "$url" "$dest"
  fi
}

clone_or_update "https://github.com/SciensOne/comfyui-workflow-generator.git" "comfyui-workflow-generator"
clone_or_update "https://github.com/iqgeoai/ComfyUI-vidflows.git" "ComfyUI-vidflows"
clone_or_update "https://github.com/facefusion/facefusion.git" "facefusion"
clone_or_update "https://github.com/yaiol/comfyui-workflows.git" "comfyui-workflows-library"
clone_or_update "https://github.com/yaziradevteam/PulseChatAI.git" "PulseChatAI-reference"
clone_or_update "https://github.com/dnpix/telegram-fanvue-bot.git" "telegram-fanvue-bot-reference"
clone_or_update "https://github.com/fanvue/fanvue-chatbot-example.git" "fanvue-chatbot-official-reference"
clone_or_update "https://github.com/LehaDeev/fanvue_ai_bot.git" "fanvue-ai-bot-reference"
clone_or_update "https://github.com/gitroomhq/postiz-app.git" "postiz"
clone_or_update "https://github.com/enescingoz/awesome-n8n-templates.git" "awesome-n8n-templates"

echo
echo "Arsenal upstreams ready under: $EXTERNAL"
echo "Read 90-upstreams/ARSENAL.md and upstream license files before redistributing source."
