---
name: intel-synthesis
description: >
  Gera weekly brief com pattern detection cross-source. Lê _brain/fontes/ dos
  últimos 7 dias + clientes/*/0X-fase.md + git log. Detecta padrões
  emergentes, cross-cliente insights, gaps. Salva em _brain/insights/weekly-{date}.md.
  Use quando rodar /intel-synthesis, sextas/domingos, ou após sessão produtiva.
---

# /intel-synthesis — Weekly Brief

Gera **briefing semanal estruturado** baseado em tudo que rolou no workspace nos últimos 7 dias. Pattern detection cross-source. Output: relatório acionável com sinais, oportunidades, ameaças.

**Princípio:** compound intelligence — sistema fica MAIS inteligente toda semana. Brief consolida, não acumula.

## Inputs lidos

**Atividade da semana (últimos 7 dias):**
- `_brain/fontes/` — todas as fontes capturadas/atualizadas
- `_brain/conceitos/` — conceitos novos ou atualizados
- `_brain/insights/` — insights cross-cliente recentes
- `git log --since=7days` — commits do workspace
- `clientes/*/0X-fase.md` — atividade nos clientes (fase atual + log)

**Contexto:**
- `_contexto/empresa.md` — perfil do aluno
- `nicho/` — cérebro do nicho (referência)

## Pipeline

### 1. Coleta atividades

Lista tudo que mudou nos últimos 7 dias:
- Quantas fontes novas (por tipo: youtube/reddit/ads/artigos)
- Quantos conceitos novos ou promovidos (seedling→budding→evergreen)
- Quantos insights cross-cliente novos
- Quantas sessões em clientes (commits relacionados a `clientes/[slug]/`)
- Quantas LPs criadas (`landing-pages/[slug]/`)
- Quantas ofertas iteradas (`ofertas/[slug]/` modificadas)

### 2. Pattern detection cross-source — ALGORITMO EXPLÍCITO

**Detecção de "padrão emergente" (3+ fontes convergem) é DETERMINÍSTICA**, não LLM-baseada.

Pra cada conceito em `_brain/conceitos/[slug].md`:

**Critério A — Linked-concepts no frontmatter (PRIMARY):**
- Conta fontes que têm `linked-concepts: [slug-do-conceito]` em YAML
- Se ≥ 3 fontes → padrão emergente forte (CONFIRMADO)

**Critério B — Linked-clients overlap (SECUNDARY):**
- Conta clientes que têm `linked-clients: [client-slug]` apontando pro mesmo conceito
- Se ≥ 2 clientes com mesmo conceito linkado → cross-cliente insight

**Critério C — Slug textual em corpo (FALLBACK):**
- Busca por `[[../conceitos/[slug]]]` (wiki-link) OU `[slug]` em corpo de outras notas
- Se ≥ 3 ocorrências em arquivos diferentes → padrão emergente fraco

Pra cada cliente em `clientes/[slug]/`:
- **Mudanças de fase:** ler `_index.md` campo `fase-atual`, comparar com snapshot 7d atrás (via git log)
- **Bloqueios:** se `mtime` de `clientes/[slug]/` > 7d (parado)
- **Outcomes positivos:** detectar commit message com "fase X concluída" no git log

**Cross-cliente — DETERMINÍSTICO:**
- Lê `clientes/*/00-perfil.md` campo `nicho` (string match exato)
- Lê `clientes/*/_contexto/historico.md` campo `gargalo_declarado` (string match exato)
- Se ≥ 2 clientes mesmo nicho + mesmo gargalo → cross-cliente insight

**Threshold rígido:** sempre 3+ pra padrão emergente, 2+ pra cross-cliente. Sem semântica fuzzy.

### 3. Gaps detectados

Identifica o que TÁ FALTANDO:
- Conceitos sem fontes recentes (último update >30d) → sugerir aprofundar
- Clientes sem atividade >7d → sugerir `/playbook-cliente [slug]`
- Hipóteses de pesquisa em `nicho/` não atualizadas há tempos
- Fontes muito antigas no `_brain/` que talvez precisam revisita

### 4. Próximas ações sugeridas

Baseado em padrões e gaps, sugere 3-5 ações concretas pra próxima semana com skill associada.

### 5. Output em `_brain/insights/weekly-{YYYY-MM-DD}.md`

```markdown
---
type: weekly-brief
period: 2026-04-19 → 2026-04-25
generated: 2026-04-25
---

# Weekly Intel Brief — 25 abr 2026

## Sumário (3 linhas)

[1ª frase: principal padrão emergente da semana]
[2ª frase: situação dos clientes ativos]
[3ª frase: gap mais crítico ou oportunidade]

## Atividade da semana

| Categoria | Esta semana | Última semana | Δ |
|-----------|------------:|--------------:|---|
| Fontes capturadas | 12 | 8 | +4 |
| Conceitos atualizados | 3 | 5 | -2 |
| Sessões em clientes | 8 | 6 | +2 |
| LPs criadas | 1 | 0 | +1 |
| Ofertas iteradas | 0 | 1 | -1 |

## Padrões emergentes

### 1. [Nome do padrão] — [N fontes convergem]
- _brain/fontes/youtube/[a]/ — quote da fonte
- _brain/fontes/reddit/[b]/ — quote da fonte
- _brain/fontes/artigos/[c]/ — quote da fonte

→ **Implicação:** [que decisão muda?]
→ **Ação sugerida:** [skill ou tarefa específica]

### 2. ...

## Cross-cliente insights

### 1. [Padrão entre clientes]
- clientes/[a] — [como se manifesta]
- clientes/[b] — [como se manifesta]
- clientes/[c] — [como se manifesta]

→ **Implicação:** [há um problema/oportunidade do nicho]
→ **Ação sugerida:** [investigar / criar feature / atualizar oferta]

## Status dos clientes ativos

| Cliente | Fase | Atividade última | Bloqueio? |
|---------|------|------------------|-----------|
| [a] | 4 | 2 dias | – |
| [b] | 2 | 8 dias | ⚠ parado |
| [c] | 1 | 1 dia | – |
| [d] | 6 | 12 dias | – (em consolidação, ok) |

## Gaps detectados

- ⚠ `nicho/03-objecoes.md` não atualizado há 45 dias — rodar `/mapear-mercado` pra refresh
- ⚠ Cliente [b] parado há 8 dias — rodar `/playbook-cliente [b]`
- ⚠ Conceito "[X]" tem 4 fontes mas stage ainda seedling — promover?

## Próximas 3 ações sugeridas

1. **[ação]** — `/skill` — porquê
2. **[ação]** — `/skill` — porquê
3. **[ação]** — `/skill` — porquê

## Sinais externos (se há)

- [Notícia/tendência relevante ao nicho que apareceu nas fontes]
- [...]

---

*Brief gerado por /intel-synthesis em 2026-04-25.*
*Próximo brief sugerido: 2026-05-02 (sexta).*
```

## Mensagem CLI

```
═══════════════════════════════════════════════
  WEEKLY INTEL BRIEF — 25 abr 2026
═══════════════════════════════════════════════

PERÍODO       19 abr → 25 abr (7 dias)

SAVED         _brain/insights/weekly-2026-04-25.md

DESTAQUES
  ★ 1 padrão emergente forte (3+ fontes)
  ★ 1 insight cross-cliente novo
  ⚠ 1 cliente parado >7d (clientes/[b])
  ⚠ 1 gap em nicho/03-objecoes.md (45d sem update)

PRÓXIMAS AÇÕES
  1. /playbook-cliente [b]
  2. /mapear-mercado (refresh objeções)
  3. /sintetizar (processar inbox)

→ Ver brief completo: cat _brain/insights/weekly-2026-04-25.md
```

## Regras

- Brief é SEMPRE 7 dias (sem opção de período custom — força disciplina)
- Pattern detection requer 3+ evidências cross-source pra ser sinal forte
- Cross-cliente requer 2+ clientes pra ser insight
- Gaps detectados são oportunidades acionáveis, não relatório de problemas
- Próximas ações: SEMPRE sugere 3-5 com skill específica + porquê
- Frontmatter YAML obrigatório
- Brief sobrescreve se rodado mesmo dia (idempotente por dia)
- Recomendação automática de cadence: sextas (semana operacional) OU domingos (review)
