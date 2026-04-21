# Setup N8NmAKINA para Windows (PowerShell)
$ErrorActionPreference = "Stop"

$Root = $PSScriptRoot
Set-Location $Root

Write-Host "=== Setup N8NmAKINA ===" -ForegroundColor Cyan
Write-Host ""

# 1. Clonar n8n-mcp
if (-not (Test-Path "n8n-mcp")) {
    Write-Host "[1/5] Clonando n8n-mcp..."
    git clone https://github.com/czlonkowski/n8n-mcp.git
} else {
    Write-Host "[1/5] n8n-mcp ya existe, omitiendo clon."
}

# 2. Clonar n8n-skills
if (-not (Test-Path "n8n-skills")) {
    Write-Host "[2/5] Clonando n8n-skills..."
    git clone https://github.com/czlonkowski/n8n-skills.git
} else {
    Write-Host "[2/5] n8n-skills ya existe, omitiendo clon."
}

# 3. Instalar dependencias y compilar n8n-mcp
Write-Host "[3/5] Instalando dependencias y compilando n8n-mcp..."
Set-Location "$Root\n8n-mcp"
npm install --silent
npm run build
Set-Location $Root
Write-Host "      Build completado."

# 4. Crear .env desde .env.example
if (-not (Test-Path ".env")) {
    Write-Host "[4/5] Creando .env desde plantilla..."
    Copy-Item ".env.example" ".env"
    Write-Host "      IMPORTANTE: Edita .env con tus credenciales reales." -ForegroundColor Yellow
} else {
    Write-Host "[4/5] .env ya existe, omitiendo."
}

# 5. Crear .mcp.json desde .mcp.json.example con ruta absoluta
if (-not (Test-Path ".mcp.json")) {
    Write-Host "[5/5] Creando .mcp.json con ruta absoluta..."
    $McpPath = "$Root\n8n-mcp\dist\mcp\index.js" -replace "\\", "/"
    $content = Get-Content ".mcp.json.example" -Raw
    $content = $content -replace "\./n8n-mcp/dist/mcp/index\.js", $McpPath
    Set-Content ".mcp.json" $content -Encoding utf8
    Write-Host "      Ruta MCP: $McpPath"
} else {
    Write-Host "[5/5] .mcp.json ya existe, omitiendo."
}

Write-Host ""
Write-Host "=== Setup completado ===" -ForegroundColor Green
Write-Host ""
Write-Host "Pasos siguientes:"
Write-Host "  1. Edita .env con tu N8N_URL y N8N_API_KEY"
Write-Host "  2. Actualiza .mcp.json con las mismas credenciales"
Write-Host "  3. Ejecuta: claude"
Write-Host ""
