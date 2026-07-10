---
name: conectar
description: >
  Reorganização profunda mensal do _brain/. Detecta menções implícitas
  cross-arquivo (sem wiki-link explícito), cria links bidirecionais,
  promove conceitos com volume suficiente, atualiza MOC com graph metrics.
  Roda 1x/mês idealmente. Mais profunda que /sintetizar (que é semanal).
  Use quando rodar /conectar, ou quando _brain/ ficar grande e bagunçado.
---

# /conectar — Auto-linking profundo do knowledge graph

`/sintetizar` processa **inbox** (capturas novas).
`/conectar` faz **manutenção PROFUNDA** do `_brain/` inteiro: detecta menções implícitas, cria backlinks, promove conceitos, sugere consolidações.

**Cadence recomendada:** mensal (ou quando aluno rodar `/iniciar` e ver alerta "brain com 50+ notas, considere /conectar").

## Pipeline

### 1. Scan completo do `_brain/`

Lê TODOS os arquivos em:
- `_brain/conceitos/`
- `_brain/fontes/{youtube,reddit,ads,artigos}/`
- `_brain/insights/`

Pra cada arquivo, indexa:
- Frontmatter (linked-* atual)
- Conteúdo (busca menções de outros conceitos por nome)
- Tags

### 2. Detecção de menções implícitas — ALGORITMO DETERMINÍSTICO

**NÃO usar LLM nem fuzzy semantic matching.** Algoritmo é exato pra evitar links falsos.

**Vocabulário do índice** (RIGOROSO — não indexar palavras comuns):
- ✅ Slugs de conceitos existentes em `_brain/conceitos/[slug].md` (filename sem extensão)
- ✅ Tags do frontmatter YAML (`tags: [...]`)
- ✅ Títulos de fontes (frontmatter `title:`)
- ❌ Stop words PT/EN: `de, do, da, para, com, mas, ou, e, é, um, uma, the, a, of, to, for, with, but, or, and, is`
- ❌ Palavras genéricas (<4 chars OU em lista de 200 palavras comuns)

**Regras de matching (cumulativas):**

**Regra A — Slug textual em corpo de outra nota:**
- Pra cada conceito C com slug `filtro-inverso`:
- Buscar string EXATA `filtro-inverso` (com hífen) OU `[[../conceitos/filtro-inverso]]` (wiki-link) em outras notas
- ≥1 ocorrência em nota N que NÃO tem C em `linked-concepts` → propor link C↔N

**Regra B — Tag overlap (≥2 tags em comum):**
- Pra cada par (nota A, nota B):
- Se `frontmatter.tags(A) ∩ frontmatter.tags(B) >= 2 tags` → propor relacionar (sugestão fraca)

**Regra C — Conceito ausente (terceiro vértice):**
- Se nota A e nota B mencionam string `[X]` mas X NÃO é slug existente em `_brain/conceitos/`
- E ≥3 notas diferentes têm a mesma string `[X]`
- → propor criar conceito novo `[X]`

**Threshold de propostas:** SEMPRE pergunta antes de criar link. Nunca cria automático.

### 3. Criar links bidirecionais

Quando link sugerido aprovado pelo aluno:
- Atualiza frontmatter da nota A com `linked-concepts: [B]`
- Atualiza frontmatter da nota B com `linked-sources: [A]` (ou similar)
- Adiciona referência no corpo do texto se faz sentido (`[[../[B]]]`)

### 4. Promoção de conceitos

Pra cada conceito em `seedling`:
- Conta `linked-sources` apontando pra ele
- Se ≥3 sources → sugere promover a `budding`
- Conta menções em outras `conceitos/` (cross-conceito)
- Se ≥3 conceitos mencionam → sugere promover a `evergreen`

### 5. Detecção de duplicatas/consolidação — DETERMINÍSTICO

**Critério A — Nomes similares (Levenshtein):**
- Levenshtein distance < 3 entre slugs → candidatos a duplicata
- Ex: `filtro-inverso` vs `filtros-inversos` (distance=2) → flag

**Critério B — Conteúdo sobreposto (Jaccard similarity):**
- Tokenizar corpo das notas (lowercase, remover stop words, splitar por whitespace)
- Calcular `|tokens(A) ∩ tokens(B)| / |tokens(A) ∪ tokens(B)|`
- Se Jaccard ≥ 0.7 → sugerir consolidação

**Critério C — Mesmas tags + título similar:**
- 100% das tags coincidem E título tem ≥3 palavras em comum → flag

Aluno aprova → cria nota unificada + arquiva duplicata em `_brain/_arquivo/`. Audit em `_brain/insights/_log-conexoes.md`.

### 6. Atualiza `_brain/_index.md` (MOC)

Recalcula:
- Total por categoria + por stage
- **Top 10 conceitos mais conectados** (count de `linked-sources`)
- **Conceitos órfãos** (sem nenhum link)
- **Fontes não-linkadas** (capturadas mas nunca conectadas a conceito)
- Graph density: `(total links) / (total nodes × (total nodes - 1))`

### 7. Output: relatório de mudanças propostas

```
═══════════════════════════════════════════════
  /conectar — análise profunda do _brain/
═══════════════════════════════════════════════

ESTADO ATUAL
  Conceitos:     32 (3 evergreen · 12 budding · 17 seedling)
  Fontes:        78
  Insights:      6
  Links totais:  234
  Graph density: 0.21

LINKS IMPLÍCITOS DETECTADOS
  Novos: 18 (precisam aprovação)
  Bidirecionais: 12 (auto-criar?)

PROMOÇÕES SUGERIDAS
  ⬆ "filtro-inverso" budding → evergreen (5 sources, 3 conceitos referenciam)
  ⬆ "outlier-detection" seedling → budding (4 sources)
  ⬆ "voice-dna-capture" seedling → budding (3 sources)

CONSOLIDAÇÕES SUGERIDAS
  ⚠ "filtro-inverso" + "qualification-gate" — conteúdo similar 70%
     Mergear em "filtro-inverso" (mais antigo)?

ÓRFÃOS DETECTADOS
  6 conceitos sem nenhum link (revisar relevância?)
  4 fontes capturadas há >60d sem conexão (arquivar?)

GRAPH HEALTH
  Top 10 conceitos mais conectados:
    1. filtro-inverso (12 links)
    2. voice-dna-capture (8 links)
    3. ...

  Conceitos isolados (alerta): 6
  Fontes esquecidas (alerta): 4

APROVAÇÃO
  → Aprovar todas as mudanças? [s/n/seletivo]
```

### 8. Modo seletivo

Se aluno responde "seletivo":
- Skill mostra cada mudança individualmente
- Aluno aprova/rejeita uma a uma

### 9. Aplicação atômica

Após aprovação:
- Atualiza frontmatter de todas notas afetadas
- Move/arquiva duplicatas se consolidadas
- Atualiza `_brain/_index.md` MOC com novos números
- Loga em `_brain/insights/_log-conexoes.md` (audit trail)

## Diferença vs `/sintetizar`

| | `/sintetizar` | `/conectar` |
|---|---|---|
| Cadence | Semanal | Mensal |
| Escopo | `_brain/inbox/` apenas | `_brain/` inteiro |
| Ação | Classifica + move | Liga + promove + consolida |
| Output | Notas processadas | Graph health report |
| Custo computacional | Baixo | Alto (scan completo) |

Roda primeiro `/sintetizar` (limpa inbox), depois `/conectar` (organiza grafo).

## Regras

- **Nunca link automático sem aprovação** — sempre pergunta
- **Consolidação requer aprovação dupla** (perde nota original)
- **Promoção é incremental** (seedling → budding → evergreen, nunca pula)
- **Audit trail em `_brain/insights/_log-conexoes.md`**
- **Idempotente** — rodar 2x seguidas não causa side effects
- **Graph density é métrica de saúde** — alta = grafo conectado, baixa = sistema mort
