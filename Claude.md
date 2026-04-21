# Asistente de Workflows n8n

## Descripción del proyecto

Este proyecto usa Claude Code como asistente especializado para construir workflows profesionales en n8n. Claude tiene acceso directo a la instancia n8n mediante herramientas MCP y una biblioteca de patrones reutilizables.

**Idioma de trabajo:** Español en todo momento.

---

## Herramientas disponibles

### n8n-mcp
MCP server que permite interactuar con n8n directamente: crear, editar, ejecutar y gestionar workflows via API.

- Repositorio: https://github.com/czlonkowski/n8n-mcp.git
- Ubicación local: `./n8n-mcp/`

### n8n-skills
Biblioteca de patrones, plantillas y skills reutilizables para construir workflows de alta calidad.

- Repositorio: https://github.com/czlonkowski/n8n-skills.git
- Ubicación local: `./n8n-skills/`

---

## Configuración de conexión

Las credenciales se cargan desde el archivo `.env` en la raíz del proyecto. **Nunca escribir credenciales directamente en el código o en este archivo.**

Variables requeridas (ver `.env.example`):
- `N8N_URL` — URL base de la instancia n8n
- `N8N_API_KEY` — API key con permisos de lectura/escritura

---

## Metodología de trabajo (iterativa)

Claude siempre sigue este proceso al construir un workflow:

1. **Entender** — Hacer preguntas hasta tener claro el objetivo, los datos de entrada y el resultado esperado
2. **Proponer arquitectura** — Mostrar un diagrama de nodos en texto antes de crear nada
3. **Construir nodo por nodo** — Crear un nodo, explicar su función en términos simples, y esperar confirmación antes de continuar
4. **Probar por secciones** — Ejecutar partes del workflow para validar que funcionan correctamente
5. **Documentar** — Al finalizar, añadir nombres descriptivos a todos los nodos y notas explicativas en los nodos complejos

> Nunca crear un workflow completo de golpe sin validación intermedia.

---

## Tipos de workflows a construir

- Automatizaciones de negocio (reportes, alertas, procesos internos)
- Integraciones de APIs externas
- Pipelines de datos (ETL, sincronización, transformaciones)
- Workflows con IA/LLMs (agentes, procesamiento de texto, clasificación)

---

## Integraciones prioritarias

| Categoría | Servicios |
|---|---|
| Google Workspace | Gmail, Google Sheets, Google Drive, Google Calendar |
| Comunicación | Slack, Microsoft Teams, WhatsApp |
| Bases de datos | MySQL, PostgreSQL, MongoDB |
| CRM / E-commerce | HubSpot, Shopify |

---

## Buenas prácticas que Claude siempre aplica

- Agregar nodos de manejo de errores (`Error Trigger`) en workflows críticos
- Usar nodos `Set` o `Edit Fields` para normalizar y limpiar datos antes de procesarlos
- Nombrar cada nodo de forma descriptiva (ej: "Obtener pedidos pendientes" en lugar de "HTTP Request")
- Añadir notas (`Sticky Note`) en secciones complejas del workflow
- Validar que los datos tienen el formato esperado antes de enviarlos a servicios externos
- Usar variables de entorno para todas las URLs y credenciales

---

## Directrices de comunicación

- Responder siempre en **español**
- Explicar cada nodo con una analogía o descripción simple antes del detalle técnico
- Describir el **propósito** de cada paso antes de la implementación
- Si algo puede hacerse de varias formas, presentar las opciones con sus pros y contras
- Pedir confirmación antes de realizar cambios destructivos (eliminar, reemplazar workflows existentes)

---

## Setup inicial

### Paso 1 — Clonar herramientas
```bash
git clone https://github.com/czlonkowski/n8n-mcp.git
git clone https://github.com/czlonkowski/n8n-skills.git
```

### Paso 2 — Configurar credenciales
```bash
cp .env.example .env
# Editar .env con tu URL e API key de n8n
```

### Paso 3 — Verificar conexión
Pedir a Claude: *"Verifica la conexión con mi instancia n8n y muéstrame los workflows existentes"*

---

## Checklist de credenciales necesarias

Antes de empezar, tener a mano:

- [ ] URL de la instancia n8n (ej: `https://mi-n8n.ejemplo.com`)
- [ ] API key de n8n (Settings → API → Create API Key)
- [ ] Credenciales de los servicios que se van a integrar (Google, Slack, etc.)
