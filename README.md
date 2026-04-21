# N8NmAKINA

Asistente especializado para construir workflows profesionales en n8n usando Claude Code con acceso MCP directo a tu instancia.

## Qué incluye

| Herramienta | Propósito |
|---|---|
| [n8n-mcp](https://github.com/czlonkowski/n8n-mcp) | MCP server — conexión directa a n8n via API |
| [n8n-skills](https://github.com/czlonkowski/n8n-skills) | 7 skills expertos para construir workflows |

## Requisitos

- [Claude Code](https://docs.anthropic.com/claude-code) instalado
- Git
- Node.js 18+
- Una instancia n8n activa con API key

## Instalación

```bash
git clone https://github.com/jonanderabad/N8NmAKINA.git
cd N8NmAKINA
bash setup.sh
```

El script clona los repositorios, instala dependencias y genera los archivos de configuración automáticamente.

## Configuración

Edita `.env` con tus credenciales:

```
N8N_URL=https://tu-instancia-n8n.com
N8N_API_KEY=tu_api_key_aqui
```

Edita `.mcp.json` con las mismas credenciales (el script ya pone la ruta correcta).

Para obtener tu API key: Settings → API → Create API Key en tu instancia n8n.

## Uso

```bash
claude
```

Claude cargará automáticamente el contexto del asistente desde `CLAUDE.md` y conectará con tu instancia n8n.

## Cómo trabaja

Claude sigue una metodología iterativa de 5 pasos:

1. **Entender** — Pregunta hasta tener claro el objetivo
2. **Proponer arquitectura** — Muestra el diagrama de nodos antes de crear nada
3. **Construir nodo por nodo** — Crea y explica cada nodo, espera confirmación
4. **Probar por secciones** — Valida que cada parte funciona antes de continuar
5. **Documentar** — Nombres descriptivos y notas en nodos complejos

## Workflows que puedes construir

- Automatizaciones de negocio (reportes, alertas, procesos internos)
- Integraciones de APIs externas
- Pipelines de datos (ETL, sincronización, transformaciones)
- Workflows con IA/LLMs (agentes, procesamiento de texto, clasificación)
