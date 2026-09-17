$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  throw 'Git não encontrado. Instale o Git antes de continuar.'
}

Write-Host '[1/3] Sincronizando configuração dos submódulos...'
git submodule sync --recursive

Write-Host '[2/3] Baixando/inicializando ferramentas e complementos...'
git submodule update --init --recursive

Write-Host '[3/3] Preparando configuração local...'
$envFile = Join-Path $root '.env'
$exampleFile = Join-Path $root '.env.example'
if (-not (Test-Path $envFile)) {
  Copy-Item $exampleFile $envFile
  Write-Host 'Criado .env local a partir de .env.example. Preencha suas credenciais somente nesse arquivo local.'
} else {
  Write-Host '.env já existe; não foi alterado.'
}

Write-Host ''
Write-Host 'Arsenal inicializado.'
Write-Host 'Leia: 00-start-here/START.md'
Write-Host 'Depois: ferramentas/LEIA-ME.md'
Write-Host 'Atenção: modelos/checkpoints de IA NÃO fazem parte do Git e precisam ser instalados separadamente.'
