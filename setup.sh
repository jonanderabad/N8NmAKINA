#!/usr/bin/env bash
set -e

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

echo "=== Setup N8NmAKINA ==="
echo ""

# 1. Clonar n8n-mcp
if [ ! -d "n8n-mcp" ]; then
  echo "[1/5] Clonando n8n-mcp..."
  git clone https://github.com/czlonkowski/n8n-mcp.git
else
  echo "[1/5] n8n-mcp ya existe, omitiendo clon."
fi

# 2. Clonar n8n-skills
if [ ! -d "n8n-skills" ]; then
  echo "[2/5] Clonando n8n-skills..."
  git clone https://github.com/czlonkowski/n8n-skills.git
else
  echo "[2/5] n8n-skills ya existe, omitiendo clon."
fi

# 3. Instalar dependencias y compilar n8n-mcp
echo "[3/5] Instalando dependencias y compilando n8n-mcp..."
cd n8n-mcp
npm install --silent
npm run build
cd "$ROOT"
echo "      Build completado."

# 4. Crear .env desde .env.example
if [ ! -f ".env" ]; then
  echo "[4/5] Creando .env desde plantilla..."
  cp .env.example .env
  echo "      IMPORTANTE: Edita .env con tus credenciales reales."
else
  echo "[4/5] .env ya existe, omitiendo."
fi

# 5. Crear .mcp.json desde .mcp.json.example con ruta absoluta
if [ ! -f ".mcp.json" ]; then
  echo "[5/5] Creando .mcp.json con ruta absoluta..."
  MCP_PATH="$ROOT/n8n-mcp/dist/mcp/index.js"
  sed "s|./n8n-mcp/dist/mcp/index.js|$MCP_PATH|g" .mcp.json.example > .mcp.json
  echo "      Ruta MCP: $MCP_PATH"
else
  echo "[5/5] .mcp.json ya existe, omitiendo."
fi

echo ""
echo "=== Setup completado ==="
echo ""
echo "Pasos siguientes:"
echo "  1. Edita .env con tu N8N_URL y N8N_API_KEY"
echo "  2. Actualiza .mcp.json con las mismas credenciales"
echo "  3. Ejecuta: claude"
echo ""
