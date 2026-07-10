---
name: youtube-intel
description: >
  Sistema de inteligência YouTube. 4 modos: video-extract (6 blocos por vídeo)
  · channel-baseline (mediana + engagement) · niche-scan (outliers do nicho)
  · monitor (watchlist YAML). Usa fórmulas públicas Spotter Studio + Viewstats.
  Popula _brain/fontes/youtube/. Cross-video pattern detection promove
  conceitos a evergreens. Use quando rodar /youtube-intel, ver vídeo
  importante, monitorar canais, ou /iniciar sugerir pesquisa.
---

# /youtube-intel — Inteligência YouTube

Sistema de extração + análise estruturada de YouTube. Captura vídeos como **literature notes** (estilo Zettelkasten público) em `_brain/fontes/youtube/`. Detecta outliers via fórmulas públicas (Spotter Studio V7 Index + Viewstats). Cross-video pattern detection promove modelos mentais a evergreens.

## Pré-requisitos

- MCP `youtube-data` instalado (Google API key — free quota)
- MCP `youtube-transcript` instalado (free)

Se faltar:
```
youtube-intel precisa dos MCPs:
- youtube-data (Google API free quota)
- youtube-transcript (free)

Instalar agora? [s/n]
```

## 4 modos via dispatcher

Skill detecta intent pelo que aluno passa:

```
/youtube-intel video-extract [URL]      → modo 1
/youtube-intel channel-baseline [ID]    → modo 2
/youtube-intel niche-scan               → modo 3
/youtube-intel monitor                  → modo 4
```

Se aluno só rodar `/youtube-intel` sem args → menu interativo.

---

## Modo 1 — `video-extract [URL]`

**Objetivo:** transformar vídeo em literature note estruturada com 6 blocos.

### Pipeline

1. **Get metadata** (via `youtube-data`):
   - Título, canal, URL canal, data publicação, duração, views, likes, comments

2. **Get transcript** (via `youtube-transcript`):
   - Transcrição completa com timestamps

3. **Outlier check** (se possível):
   - Buscar mediana últimos 10 vídeos do canal
   - Calcular `views_video / mediana_canal_últimos_10`
   - Marcar como outlier se ≥ 2.5

4. **Extração estruturada — 6 blocos:**

   **Bloco 1 — Hook (primeiros 30s):**
   - Transcrição literal dos primeiros 30s
   - Análise: que padrão usa? (curiosity gap / promise / contradição / authority claim / pain validation)
   - Por que funciona ou não funciona?

   **Bloco 2 — Mental Model identificado:**
   - Que lente/framework o creator usa pra explicar o tópico?
   - Nomeação simples (ex: "Princípio do contraste — ele apresenta primeiro o que NÃO funciona pra depois mostrar o que funciona")
   - NÃO inventar nomes proprietários — descrição funcional

   **Bloco 3 — Quotes literais com timestamp:**
   - 5-10 frases-chave do vídeo com `[mm:ss]`
   - Foco em insights densos, definições, contradições, números

   **Bloco 4 — Estrutura/argumentação:**
   - Outline do raciocínio em 3-5 passos
   - Como ele estabelece premissa → desenvolve → conclui

   **Bloco 5 — Packaging delta:**
   - Title vs. mediana de titles do canal (que padrão usou?)
   - Thumbnail (descrever): texto, cores, expressão facial, contraste
   - Comparação com últimos 5 vídeos do canal

   **Bloco 6 — Aplicabilidade:**
   - Template editável pelo aluno: "Onde isso aplica ao meu nicho/clientes?"
   - Skill NÃO preenche essa parte — fica em branco pra reflexão manual

5. **Salvar** em `_brain/fontes/youtube/[slug]/index.md` (template `_brain/fontes/youtube/_modelo/_video.md`)

### Output exemplo

```markdown
---
type: fonte-youtube
title: "Como vender high-ticket sem ser chato"
url: "https://youtube.com/watch?v=xxx"
channel: "Operador X"
published: 2026-04-15
duration: "12:34"
views: 47823
extracted: 2026-04-25
stage: seedling
outlier_score: 3.8       ← 3.8x mediana
linked-concepts: []
linked-clients: []
tags: ["sales", "high-ticket"]
---

# Como vender high-ticket sem ser chato

## Outlier check
- Views: 47.823
- Mediana últimos 10 do canal: 12.500
- **Outlier score: 3.8x** ← significativo (≥ 2.5)

## Hook (primeiros 30s)
"Se você cobra menos de R$5.000 e ainda assim sente que tá empurrando venda, tem um diagnóstico simples: você tá tentando vender pra todo mundo." [00:00-00:28]

→ Padrão: pain validation + contraste premissa-comum.

## Mental Model
"Filtro inverso" — em vez de tentar atrair mais leads, criar barreiras que filtram quem NÃO é fit. Reduz volume mas aumenta qualidade do que entra.

## Quotes
- [00:42] "Quanto mais barato você cobra, mais clientes ruins atrai."
- [03:15] "Application form de 12 campos elimina 70% do volume mas dobra close rate."
- [07:50] "Pricing alto não é status — é filtro."

## Estrutura
1. Estabelece a premissa-comum (cobrar mais barato pra atrair mais)
2. Mostra contradição (volume × qualidade)
3. Apresenta filtro inverso (form longo, pricing visível)
4. Cases (3 em sequência por ticket band)
5. CTA com aplicação real

## Packaging delta
- Title: "Como vender high-ticket sem ser chato" — usa "sem ser chato" pra abrir curiosity gap (canal normalmente usa títulos mais sérios)
- Thumbnail: rosto + expressão de "wait what" + texto "$10K?" em laranja contrastando com fundo escuro
- Comparado com 5 últimos: este é mais provocativo, menos técnico

## Aplicabilidade

[Pra preencher manualmente — onde isso aplica ao meu nicho/clientes?]
```

---

## Modo 2 — `channel-baseline [channel-id]`

**Objetivo:** estabelecer baseline do canal pra outlier detection.

### Pipeline

1. Get últimos 10 vídeos do canal (via `youtube-data`)
2. Calcular:
   - **Mediana de views**
   - **Mediana de views nas primeiras 48h** (proxy via comparação intervalos)
   - **Engagement médio** ((likes + comments) / views)
   - **Frequência de upload** (dias entre vídeos)
   - **Duração mediana**
   - **Padrão de title** (length médio, palavras-chave recorrentes)

3. Salvar em `_brain/fontes/youtube/_canais/[channel-slug].md`:

```markdown
---
type: youtube-channel-baseline
channel_id: UC_xxx
channel_name: "[Nome]"
url: "https://youtube.com/c/..."
last_baseline: 2026-04-25
---

# [Canal] — Baseline

## Métricas baseline (últimos 10 vídeos)
- Mediana views: 12.500
- Mediana views 48h: 3.200
- Engagement médio: 4.2%
- Frequência upload: 3.5 dias
- Duração mediana: 11:30

## Padrões observados
- Title length médio: 47 chars
- Palavras-chave recorrentes: [lista]
- Estilo thumbnail: [descrição]

## Outliers detectados (≥2.5x mediana)
- [link vídeo 1] — 3.8x
- [link vídeo 2] — 2.9x
- ...
```

---

## Modo 3 — `niche-scan`

**Objetivo:** descobrir vídeos outliers do nicho do aluno (sem ele já saber quais canais).

### Pipeline

1. Lê `nicho/00-perfil-cliente-alvo.md` + `nicho/01-dores.md` + `nicho/04-linguagem-tipica.md`
2. Gera 5-10 queries de busca no YouTube usando dores + linguagem do nicho
3. Pega top 30 vídeos recentes (últimos 60 dias) por query
4. Pra cada vídeo:
   - Get metadata
   - Aplicar fórmulas de outlier:

   ```
   Outlier base:        views_video / mediana_canal_últimos_10 ≥ 2.5
   V7 Index (Spotter):  views_first_7d / avg_first_7d_last_6mo
   Velocity 48h:        views_48h / mediana_48h_canal
   Engagement ratio:    (likes + comments) / views > 4%
   Small-channel viral: subs < 50K AND views > 5 × subs
   ```

5. Ranquear por **score combinado** (média ponderada das 5 fórmulas)
6. Listar top 5-10 outliers
7. **Persistir resultado em arquivo** (idempotente — não sobrescrever runs anteriores)

### Persistência obrigatória

```
ARQUIVO: _brain/insights/niche-scan-{YYYY-MM-DD}.md
SE arquivo do dia já existe:
  arquivo = niche-scan-{YYYY-MM-DD}-{HH-MM}.md   (não sobrescrever)
```

Frontmatter YAML:
```yaml
---
type: insight-niche-scan
nicho: [nicho do workspace]
date: 2026-04-26
queries_used: [...]
videos_analyzed: 87
outliers_found: 9
mcps: youtube-data + youtube-transcript
---
```

Conteúdo: replica painel ASCII abaixo + lista completa dos 30 vídeos analisados (não só top 10) com scores brutos pra audit trail futuro.

### Output (terminal + persistência)

```
═══════════════════════════════════════════════
  NICHE-SCAN: [nicho]
═══════════════════════════════════════════════

SAVED        _brain/insights/niche-scan-2026-04-26.md

TOP 10 OUTLIERS (últimos 60d)

#1  Score 8.2  ★ small-channel viral (3.2K subs, 18K views)
    "[Título]" — [canal]
    https://youtube.com/watch?v=xxx
    → Sugiro /youtube-intel video-extract

#2  Score 6.5  ★ V7 index 4.1
    "[Título]" — [canal]
    ...

QUERIES USADAS (transparência)
- "[query 1]" → 12 vídeos analisados
- "[query 2]" → 18 vídeos analisados
- ...

3 VÍDEOS-CHAVE PARA APROFUNDAR
1. /youtube-intel video-extract https://...
2. /youtube-intel video-extract https://...
3. /youtube-intel video-extract https://...

CANAIS DESCOBERTOS (sugiro adicionar ao watchlist)
- [Canal A] — sub: 42K · vídeos do nicho: 23
- [Canal B] — sub: 18K · vídeos do nicho: 11
- ...

→ Editar _brain/fontes/youtube/_watchlist.yaml pra adicionar
→ Histórico de scans em _brain/insights/niche-scan-*.md
```

### Comparação cross-runs

Quando aluno roda `/youtube-intel niche-scan` 2ª vez:
- Skill lê todos os `_brain/insights/niche-scan-*.md` anteriores
- Detecta vídeos REPETIDOS (apareceram em 2+ scans com score alto) → marca ⚡ "evergreen outlier" (assunto persistente no nicho)
- Detecta vídeos NOVOS → marca 🆕
- Output mostra ambos

---

## Modo 4 — `monitor`

**Objetivo:** verificar canais do `_watchlist.yaml` por novos outliers desde último check.

### Pipeline

1. Lê `_brain/fontes/youtube/_watchlist.yaml`
2. Pra cada canal:
   - Get últimos vídeos desde `last_checked`
   - Aplicar baseline do canal (se existe em `_canais/`)
   - Calcular outlier score
3. Listar novos outliers ≥ 3 (threshold mais alto pra monitor — só sinais fortes)
4. Atualizar `last_checked` no YAML

### Output

```
═══════════════════════════════════════════════
  MONITOR — última checagem: 2026-04-18
═══════════════════════════════════════════════

NOVOS OUTLIERS (≥ 3x baseline)

[Canal A] — verificado · 7 vídeos novos
  ★ "[Título do outlier]" — score 4.2
    https://youtube.com/watch?v=xxx
    → /youtube-intel video-extract

[Canal B] — verificado · 4 vídeos novos
  Sem outliers significativos

[Canal C] — verificado · 2 vídeos novos
  ★ "[Título]" — score 3.5
    ...

PRÓXIMA CHECAGEM
Watchlist atualizado. Próximo /monitor sugerido em 7 dias.
```

---

## Cross-video pattern detection (automático)

Quando aluno tem 3+ video-extracts em `_brain/fontes/youtube/`:

1. Skill analisa Mental Models identificados em cada
2. Se 3+ vídeos invocam o MESMO modelo → promove a `_brain/conceitos/[modelo].md` (evergreen)
3. Linka todas as fontes via `linked-sources` no frontmatter
4. Atualiza `_brain/_index.md` com novo conceito

Exemplo:
```
3 vídeos extraídos mencionam "Filtro inverso" como modelo:
  - youtube/[vídeo A]/
  - youtube/[vídeo B]/
  - youtube/[vídeo C]/

→ Promovendo a evergreen: _brain/conceitos/filtro-inverso.md
→ Stage: budding (3 fontes ainda não suficientes pra evergreen)
→ linked-sources atualizado em todos os 3 vídeos
```

## Watchlist YAML — exemplo de uso

```yaml
channels:
  - channel_id: UC_xxx
    name: Operador X
    niche_relevance: high
    last_checked: 2026-04-25
    baseline_median_views: 12500
    notes: "Operador real do nicho saúde — toca em pain de aquisição"

  - channel_id: UC_yyy
    name: Founder Y
    niche_relevance: medium
    last_checked: 2026-04-25
    baseline_median_views: 8200
    notes: "Founder canal técnico, ocasional viral sobre pricing"
```

## Regras

- **Outlier formulas SÃO públicas** (Spotter Studio + Viewstats Zendesk).
- **6 blocos NÃO é resumo** — é literature note estruturada (estilo Zettelkasten).
- **Aplicabilidade fica em branco** — aluno preenche pra forçar reflexão.
- **Cross-video pattern só promove conceito com 3+ evidências** — evita over-extraction.
- **Watchlist é controlado pelo aluno** (não auto-add — ele decide o que monitorar).
- **Frontmatter YAML em todos arquivos criados.**
- **Wiki-links nos `_index.md`** (Obsidian-friendly).
- **Source marking** em quotes (timestamp obrigatório).
