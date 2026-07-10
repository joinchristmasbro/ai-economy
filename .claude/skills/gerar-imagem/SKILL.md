---
name: gerar-imagem
description: >
  Gera prompts profissionais pra geração de imagens IA com lookup automático
  do modelo certo por tipo de asset (logo / hero / post / thumbnail / ad /
  mockup). Lê design-guide do cliente ou workspace. Framework SUBJECT +
  ENVIRONMENT + LIGHTING + CAMERA + PALETTE + ATMOSPHERE. Suporta MCPs free
  (Nano Banana 500/dia). Use quando rodar /gerar-imagem ou disser "criar
  logo", "fazer thumbnail", "preciso de imagem".
---

# /gerar-imagem — Imagens IA premium

Gera prompt profissional otimizado pro modelo certo + executa via MCP se instalado. Anti-pattern: "subject + style" genérico que vira IA-look. Framework completo de 8 camadas.

**Princípio:** brand consistency através de anchor prompts + style references. Volume via free tier (Nano Banana 500/dia), premium via fal.ai pay-per-use.

## Pré-requisitos

- Idealmente: `marca/design-guide.md` (workspace) OU `clientes/[slug]/marca/brand-tokens.json`
- MCPs opcionais (qualidade > sem MCP):
  - `shinpr/mcp-image` (Nano Banana free 500/dia) — recomendado
  - `raveenb/fal-mcp-server` (600+ modelos pay-per-image) — pra premium

Se nenhum MCP instalado:
```
Sem MCP de geração detectado. Vou só gerar o PROMPT — você cola em Midjourney/Flux/Ideogram externamente.

Quer instalar shinpr/mcp-image (Nano Banana free 500/dia) pra gerar inline? [s/n]
```

## Wizard mínimo (3P)

**P1) Tipo de asset**
> "Que tipo de imagem? (escolha 1)
>
> 1) Logo (SVG production)
> 2) Hero image LP (photorealismo)
> 3) Post Instagram (volume)
> 4) Thumbnail YouTube (com texto)
> 5) Ad creative Meta/Google (variações)
> 6) Mockup proposta comercial
> 7) Avatar agente IA (consistente cross-image)
> 8) Stories/Reels cover
> 9) Outro: descreva"

**P2) Marca**
> "Pra qual marca?
>
> 1) Sua marca (workspace)
> 2) Cliente: [lista de clientes/[slug]/]"

→ Lê `marca/design-guide.md` ou `clientes/[slug]/marca/brand-tokens.json`.

**P3) Conteúdo específico**
> "O que precisa ter na imagem?
>
> Ex: 'Hero LP de clínica odontológica — paciente sorrindo após procedimento, ambiente clean, luz natural, foco em confiança'"

## Lookup — modelo certo por tipo de asset

| Asset | Modelo principal | Backup | Razão |
|-------|------------------|--------|-------|
| **Logo SVG production** | Recraft V4 | Ideogram V3 | SVG real anchor points, scalable |
| **Logo de cliente (nicho)** | Recraft V4 | Ideogram V3 | Mesmo + edge typography |
| **Posts Instagram volume** | Nano Banana (free 500/dia) | Flux Schnell | Volume alto, free resolve |
| **Stories/Reels covers** | Nano Banana ou Ideogram V3 (se headline) | Flux | 9:16 |
| **Thumbnails YouTube** | Ideogram V3 (texto legível) | Midjourney V7 | 16:9 + texto |
| **Hero images LP** | Flux 1.1 Pro | Nano Banana Pro 4K | Photorealism premium |
| **Ad creatives variações** | Flux 1.1 Pro + Ideogram V3 | – | Performance > artistry |
| **Mockups proposta** | Flux Pro | Adobe Firefly (IP-safe cliente pagante) | Realismo |
| **Avatars consistentes** | Midjourney V7 + --cref | Flux LoRA treinado | Mesmo personagem em N posts |

## Framework de prompt — 8 camadas (30-75 palavras sweet spot)

```
SUBJECT + ENVIRONMENT + COMPOSITION + LIGHTING + STYLE + CAMERA + QUALITY + NEGATIVES
```

### 1. Subject específico
- Bom: "young woman with curly red hair wearing vintage leather jacket"
- Ruim: "a woman"

### 2. Environment
- Bom: "minimalist Scandinavian living room with white walls, oak floors, single brass lamp"
- Ruim: "in a room"

### 3. Composition
- Aspect ratio explícito: `--ar 16:9` / `--ar 9:16` / `--ar 1:1` / `--ar 4:5`
- Framing: "rule of thirds, subject offset right" / "centered symmetric"

### 4. Lighting (FATOR Nº1 DE REALISMO)
- "golden hour backlighting"
- "pre-dawn blue ambient transitioning to soft pink first light"
- "single warm key light from brass lamp, cool blue-grey ambient fill"
- "studio softbox 45° + rim light"

### 5. Style
- Aesthetic anchor: "minimalist editorial" / "swiss design" / "brutalist" / "70s film stock"
- Brand archetype: alinhar com `voice-guide.md` (Ruler = elegant minimal, Hero = bold dramatic, etc.)

### 6. Camera/Lens
- "shot on 85mm f/1.4, shallow depth of field, Canon EOS R5"
- "anamorphic 2.0x lens with horizontal flare"
- "24mm wide-angle, low angle"

### 7. Color palette anchors
- Puxa de `marca/brand-tokens.json` (OKLCH/HEX) → traduz pra nomes:
- "deep amber, burnished gold, twilight indigo, warm cream"

### 8. Negative prompts (model-aware)
- **Flux 2/Pro:** NÃO usa negative — quality direction vai NO positive
- **SDXL:** "blurry, oversaturated, distorted proportions, watermark, low quality"
- **Midjourney:** `--no` flag pra elementos a evitar

## Aspect ratios padrão

| Plataforma | Ratio | Pixels |
|------------|-------|--------|
| Instagram feed (4:5) | `--ar 4:5` | 1080×1350 |
| Instagram quadrado | `--ar 1:1` | 1080×1080 |
| Stories/Reels/TikTok | `--ar 9:16` | 1080×1920 |
| YouTube thumbnail | `--ar 16:9` | 1280×720 |
| Hero LP | `--ar 16:9` ou `--ar 2:1` | 1920×1080+ |

## Brand consistency — anchor prompt + style references

**Anchor prompt** = prompt fixo da marca que entra em TODOS os generations:
```
[brand archetype] aesthetic, palette: [3-5 cores nomeadas], typography: [estilo], composition: [pattern recorrente]
```

**Style references** (quando suportado):
- Midjourney `--sref [code]` — copia colors/medium/textures de referência
- Midjourney `--cref` — character reference (consistência pessoa/avatar)
- Flux Redux — equivalente pra Flux
- Ideogram V3 — até 3 reference images

**LoRA training (avançado):**
- Flux LoRA treinado em ~30min via fal.ai com 10-20 imagens da marca → modelo customizado

## Output — path condicional pelo escopo (P2)

**Decisão de path baseada em P2:**

```
SE P2 = 1 (workspace global):
  output_dir = "marca/prompts/"
  brand_tokens_source = "marca/design-guide.md"

SE P2 = 2+ (cliente específico):
  output_dir = "clientes/[slug]/marca/prompts/"
  brand_tokens_source = "clientes/[slug]/marca/brand-tokens.json"
```

Estrutura final:

```
# Workspace
marca/prompts/[asset]-[YYYY-MM-DD].md
marca/assets/[asset]-[YYYY-MM-DD].png  (se gerou via MCP)

# Cliente
clientes/[slug]/marca/prompts/[asset]-[YYYY-MM-DD].md
clientes/[slug]/marca/assets/[asset]-[YYYY-MM-DD].png  (se gerou via MCP)
```

**Compliance auto-aplicado se cliente:**
- Lê `clientes/[slug]/_contexto/compliance.md` antes de gerar
- Bloqueia visuais que violem regulamentação (ex: clínica médica não pode mostrar antes/depois)
- Adiciona disclaimer no metadata se aplicável

## Conteúdo do arquivo (em `[output_dir]/[asset]-[date].md`)

```markdown
---
type: image-prompt
asset: hero-lp-clinica-odonto
brand: cliente-clinica-x
generated: 2026-04-25
model_recommended: flux-1.1-pro
aspect_ratio: 16:9
---

# Hero LP — Clínica Odonto X

## Prompt principal (Flux 1.1 Pro)

```
Professional dental clinic interior, modern Scandinavian design with warm wood accents and white surfaces, soft natural daylight from floor-to-ceiling windows, view of patient relaxed in ergonomic chair, dentist showing tablet with treatment plan, mid-shot composition rule of thirds with patient offset right, shot on 50mm f/2.8 medium format, cinematic depth of field, palette: warm white #F8F5F0, soft sage #B8C8B0, oak brown #8B6F47, --ar 16:9 --style raw
```

## Variações sugeridas (3)

### 1. Mais clean (minimalista)
```
[mesma estrutura mas com whitespace exagerado, menos elementos, foco no paciente sorrindo]
```

### 2. Mais bold (impacto visual)
```
[mesma estrutura mas com lighting mais dramático, contraste alto, perspective wide]
```

### 3. Mais ilustrativo (não-fotorrealista)
```
[mesma estrutura mas como editorial illustration, flat colors, 70s film stock aesthetic]
```

## Ferramenta recomendada

**Flux 1.1 Pro** via fal.ai
- Custo: $0.05/img
- Razão: photorealism premium pra hero LP, 4K resolve display retina
- Backup: Nano Banana Pro 4K

## Negative prompts (se SDXL)
```
blurry, oversaturated, distorted faces, watermark, low quality, generic stock, fake smile
```

## Setup pra gerar

```bash
# Via MCP raveenb/fal-mcp-server
fal generate \
  --model flux-pro/v1.1 \
  --prompt "[prompt acima]" \
  --aspect 16:9 \
  --output marca/assets/hero-lp-clinica-x.png

# Ou via web fal.ai → cola prompt
```

## Brand consistency check

Pra próximas imagens da campanha, usar:
- **Anchor:** "warm Scandinavian editorial, palette warm-white + sage + oak, natural daylight"
- **Style ref code:** `--sref [code]` (gerar uma vez, reutilizar)
```

## Mensagem final

```
═══════════════════════════════════════════════
  PROMPT GERADO: [asset] — [marca]
═══════════════════════════════════════════════

SAVED         [marca/prompts OU clientes/[slug]/marca/prompts]/[asset]-2026-04-25.md
SCOPE         [workspace · OU · cliente: [slug]]
MODELO        [recomendado]
ASPECT        [ratio]
CUSTO         [estimado por img]

VARIAÇÕES     3 (clean / bold / ilustrativo)

EXECUTE
  Via MCP    [comando]
  Via web    [URL]

PRÓXIMO
  Pra brand consistency, anchor: "[anchor extraído]"
  Próximas imagens dessa campanha → reutilizar mesmo --sref
```

## Regras

- Prompt SEMPRE em 8 camadas (subject/env/comp/light/style/cam/quality/neg)
- Aspect ratio EXPLÍCITO (nunca implícito)
- Cores PUXADAS de brand-tokens.json (não inventadas)
- Modelo escolhido por LOOKUP (não default)
- 3 variações sugeridas (clean/bold/ilustrativo)
- Anchor prompt da marca documentado pra reutilização
- Compliance check (se cliente regulado, sem promessas visuais proibidas)
- 30-75 palavras sweet spot (não 200, não 5)
- Path output **condicional**: `marca/prompts/` se workspace · `clientes/[slug]/marca/prompts/` se cliente
- Brand tokens puxados do escopo correto (workspace OU cliente — nunca misturar)
- Compliance check obrigatório antes de gerar (se cliente regulado)
