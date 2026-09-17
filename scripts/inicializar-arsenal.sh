#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if ! command -v git >/dev/null 2>&1; then
  echo 'Git não encontrado. Instale o Git antes de continuar.' >&2
  exit 1
fi

echo '[1/3] Sincronizando configuração dos submódulos...'
git submodule sync --recursive

echo '[2/3] Baixando/inicializando ferramentas e complementos...'
git submodule update --init --recursive

echo '[3/3] Preparando configuração local...'
if [ ! -f .env ]; then
  cp .env.example .env
  echo 'Criado .env local a partir de .env.example. Preencha suas credenciais somente nesse arquivo local.'
else
  echo '.env já existe; não foi alterado.'
fi

echo
echo 'Arsenal inicializado.'
echo 'Leia: 00-start-here/START.md'
echo 'Depois: ferramentas/LEIA-ME.md'
echo 'Atenção: modelos/checkpoints de IA NÃO fazem parte do Git e precisam ser instalados separadamente.'
