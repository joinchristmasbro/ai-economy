---
name: iniciar
description: >
  Dashboard visual do workspace. Lê estado real (nicho, ofertas, clientes,
  _brain, git log) e renderiza painel ASCII com workspace status, clientes
  ativos com alertas, sistemas, próximas 3 ações sugeridas com lógica de
  inferência. Use no início de cada sessão, ou quando perguntar "onde estou",
  "o que faço agora", "status", "dashboard".
---

# /iniciar — Dashboard do workspace

Painel visual estado-real do sistema. Renderiza tabelas + alertas + sugestões inteligentes baseadas no que está happening no workspace.

## Pipeline

### 1. Lê estado completo

**Contexto base:**
- `_contexto/empresa.md` — nicho, perfil, métricas declaradas
- `nicho/` — quantos arquivos populados de 12 (% completude)
- `ofertas/` — quantas ofertas estruturadas
- `landing-pages/` — quantas LPs criadas
- `clientes/` — todos clientes + fase ativa de cada

**Atividade:**
- `git log --since=14days --oneline` — commits recentes
- `_brain/` — totais (conceitos, fontes, insights)
- `_brain/insights/weekly-*.md` — último weekly brief (data)
- Pra cada cliente: data do último commit relacionado

**MCPs ativos:**
- `_contexto/mcps-instalados.md`
- `_contexto/mcps-pendentes.md`

### 2. Calcula métricas — DETERMINÍSTICO

- **Workspace completude:** (arquivos populados em `nicho/` + ofertas + clientes) / total esperado
- **% por área** (nicho, ofertas, clientes)
- **Clientes parados** (heurística RIGOROSA — evita falsos positivos):
  ```bash
  # Pra cada cliente em clientes/[slug]/:
  MTIME=$(find clientes/[slug] -type f -newer /tmp/cutoff -mmin -10080 | head -1)
  # OU
  CHANGES=$(git diff HEAD~7 -- clientes/[slug]/ 2>/dev/null | wc -l)
  
  # Cliente "parado" = sem mtime <7d AND zero git diff últimos 7d
  ```
  - Se primeiro check (mtime) detecta atividade → ✓ (cliente ativo)
  - Se git diff detecta 0 mudanças mas mtime <7d → ✓ (mudança não-comitada, considerar ativo)
  - Apenas mark ⚠ "parado >7d" quando AMBOS critérios falharem

- **Brain growth (com baseline):**
  ```
  if days_since_setup < 7:
    mark "Brain: novo ({{N}} dias)"
  else:
    delta = count(arquivos atuais) - count(há 7d via git log)
    mark "Brain: +{{delta}} esta semana"
  ```

- **Última `/atualizar`** — fallback graceful:
  ```
  if existe _contexto/atualizar-log.md:
    timestamp = parse(file)
    se >14d → ⚠
  else:
    mark "última /atualizar: nunca rodou"
    se workspace >14d sem rodar → ⚠
  ```

### 2.5 Status das Camadas — REGISTRY derivado do FILESYSTEM (CALIBRATION-CORE §4)

O status de cada Camada é DERIVADO do disco real — **nunca de flag manual solto no `_constructs.md`**. Todo artefato que existe no disco tem que aparecer no painel com status coerente (CALIBRATION-CORE §4). O registry mapeia cada Camada ao artefato esperado; os marcadores casam com a LEGENDA da tabela `STATUS DA INSTALAÇÃO` do `templates/_constructs-template.md`.

**Marcadores** (idênticos ao template — CORE §4):
- `⬜` artefato AUSENTE (não iniciado)
- `◐` artefato EXISTE mas incompleto — contém `[D.I.]` OU está marcado `STATUS ◐` / "em validação"
- `✅` artefato EXISTE e populado

**Registry (Camada → módulo → artefato que prova instalação):**

| Camada | Módulo | Existe + populado = ✅ |
|---|---|---|
| 0 — Operador | /setup | `marca/voice-dna.json` OU §OPERADOR preenchido |
| 1 — Diagnóstico | /raio-x | `raio-x.md` OU §DIAGNÓSTICO preenchido |
| 1 — Mercado | /mapear-mercado | `nicho/market-map.md` |
| 1 — Concorrência | /escanear-concorrencia | `nicho/concorrencia.md` |
| 2 — Posicionamento | /posicionar | `nicho/posicionamento.md` |
| 2 — Pricing | /precificar | `ofertas/pricing.md` |
| 2 — Oferta | /criar-oferta | `ofertas/[slug]/oferta.md` OU `oferta.html` |
| 3 — Growth Assets | /criar-lp | QUALQUER `landing-pages/[slug]/` com arquivo populado |
| 3 — Mensagens | /banco-mensagens | `ads/banco-mensagens.md` |
| 4 — Validação | /plano-validacao | `ofertas/[slug]/plano-validacao.md` OU §TRAÇÃO preenchido |

**Regras de derivação (duras):**
- **Nome de arquivo diferente ainda conta se está na pasta certa.** Qualquer `*.md` populado em `landing-pages/[slug]/` = Camada 3; qualquer `oferta.*` em `ofertas/[slug]/` = Camada 2 Oferta. NUNCA mostrar "vazio" quando o arquivo existe no diretório esperado.
- **Vazio ≠ ausente ≠ instalado.** Arquivo com só template/frontmatter (0 conteúdo real) → `⬜`; com conteúdo mas com `[D.I.]` ou `STATUS ◐` → `◐`; populado → `✅`.
- **Fallback pra §seção do DNA:** onde a Camada não tem arquivo próprio (Operador, Diagnóstico, Validação), a seção correspondente do `_constructs.md` preenchida vale como prova.

**Faixa "Assets executados" (executores — CORE §4):** pitch/proposta/post/carrossel NÃO têm linha de Camada, mas **NUNCA somem do painel**. Escaneia e CONTA:
- **Pitches** — `clientes/_pitches/*.md`
- **Propostas** — `clientes/_propostas/*/` (uma por pasta de prospect)
- **Posts** — `ads/posts/*.md`
- **Carrosséis** — `ads/carrosseis/*/` (pastas de carrossel geradas)
- **LPs** — `landing-pages/*/` (pastas de LP populadas — contagem de execução, distinta do status da Camada 3)

**Resolução do bug (CORE §4):** "Mensagens" na tabela de Camadas = SÓ o `/banco-mensagens` (`ads/banco-mensagens.md`). Um pitch é EXECUTOR → conta na faixa "Assets executados > Pitches", nunca na Camada 3 Mensagens. Assim um pitch criado APARECE (na faixa executados) e "Mensagens" reflete honestamente se o `/banco-mensagens` rodou — nunca mais um pitch gravado em `clientes/_pitches/` deixa o painel mostrar "Mensagens ⬜" como se nada tivesse acontecido.

### 3. Inferência de próximas ações

**Lógica:**
- `nicho/*` < 50% completo → sugere `/mapear-mercado`
- `ofertas/` vazio → sugere `/criar-oferta`
- Cliente parado >7d → sugere `/playbook-cliente [slug]`
- LP ainda não criada com oferta existente → sugere `/criar-lp`
- 5+ fontes em `_brain/fontes/` mas 0 conceitos → sugere `/sintetizar`
- Última `/atualizar` >14d → sugere `/atualizar`
- Sexta-feira sem weekly brief → sugere `/intel-synthesis`
- Inbox `_brain/inbox/` com 5+ notas → sugere `/sintetizar`

Ranqueia por urgência + impacto:
1. Bloqueios críticos (cliente parado bloqueando entrega)
2. Gaps de inteligência (nicho mal mapeado)
3. Operacional rotineiro (atualizar, sincar)

### 4. Renderiza painel ASCII

```
═══════════════════════════════════════════════════════
  AIFIRST-OS · DASHBOARD
═══════════════════════════════════════════════════════

WORKSPACE   {{nicho}}                    {{XX}}% completo
PERFIL      {{operation_type}} · R${{revenue}} · {{N}} clientes
HOJE        {{data}} · última atividade: há {{N}}h

─────────────────────────────────────────────────────────
CLIENTES ATIVOS ({{N}})
─────────────────────────────────────────────────────────
  ✓ {{Cliente A}}      Fase {{X}} · {{nome-fase}}
  ⚠ {{Cliente B}}      Fase {{X}} · {{Y}}d sem atividade
  □ {{Cliente C}}      Fase {{X}} · novo (criado {{N}}d atrás)

─────────────────────────────────────────────────────────
STATUS DA INSTALAÇÃO (Camadas 0-4 · derivado do disco)
─────────────────────────────────────────────────────────
  {{✅|◐|⬜}} 0 Operador          /setup
  {{✅|◐|⬜}} 1 Diagnóstico       /raio-x
  {{✅|◐|⬜}} 1 Mercado           /mapear-mercado
  {{✅|◐|⬜}} 1 Concorrência      /escanear-concorrencia
  {{✅|◐|⬜}} 2 Posicionamento    /posicionar
  {{✅|◐|⬜}} 2 Pricing           /precificar
  {{✅|◐|⬜}} 2 Oferta            /criar-oferta
  {{✅|◐|⬜}} 3 Growth Assets     /criar-lp
  {{✅|◐|⬜}} 3 Mensagens         /banco-mensagens
  {{✅|◐|⬜}} 4 Validação         /plano-validacao

─────────────────────────────────────────────────────────
ASSETS EXECUTADOS (executores — nunca somem do painel)
─────────────────────────────────────────────────────────
  Pitches      {{N}}   clientes/_pitches/
  Propostas    {{N}}   clientes/_propostas/
  Posts        {{N}}   ads/posts/
  Carrosséis   {{N}}   ads/carrosseis/
  LPs          {{N}}   landing-pages/

─────────────────────────────────────────────────────────
ESTADO DOS SISTEMAS
─────────────────────────────────────────────────────────
  nicho/           {{X}}/12 arquivos populados ({{XX}}%)
  ofertas/         {{N}} ofertas
  _brain/          {{N}} conceitos · {{N}} fontes · {{N}} insights
  escanear-concorrencia          última: há {{Y}}d
  weekly brief     {{última: Yd atrás OR pendente esta semana}}

─────────────────────────────────────────────────────────
MCPs ATIVOS
─────────────────────────────────────────────────────────
  ✓ {{lista}}
  ⚠ Pendentes: {{lista}} (ver _contexto/mcps-pendentes.md)

─────────────────────────────────────────────────────────
PRÓXIMAS AÇÕES SUGERIDAS
─────────────────────────────────────────────────────────
  1. {{ação inferida}}                              [/skill]
     Por quê: {{razão derivada do estado}}

  2. {{ação inferida}}                              [/skill]
     Por quê: {{razão}}

  3. {{ação inferida}}                              [/skill]
     Por quê: {{razão}}

─────────────────────────────────────────────────────────
ATIVIDADE RECENTE (últimos 5 commits)
─────────────────────────────────────────────────────────
  {{data}} {{commit message}}
  {{data}} {{commit message}}
  ...

> _
```

### 5. Saudação contextual

- Primeira sessão do dia → "Bom dia, [nome]. Aqui está o estado do teu workspace:"
- Sessão de meio do dia → direto pro painel
- Sessão noturna (>20h) → "Sessão tarde — vou ser direto."

## Ações sugeridas — exemplos por contexto

### Contexto: novo workspace (nicho/* < 30%)
1. `/mapear-mercado` — mapear nicho profundamente
2. `/youtube-intel niche-scan` — descobrir outliers do nicho
3. `/criar-oferta` — começar primeira oferta-base

### Contexto: oferta criada mas sem cliente
1. `/escanear-concorrencia` — coletar swipe file de criativos
2. `/criar-lp` — gerar LP pra oferta
3. `/ad-library-scan` — ver ads ativos do nicho

### Contexto: 1+ cliente em fase 4 (lançamento)
1. `/playbook-cliente [slug]` — checar fase atual
2. `/atualizar` — auditar drift de contexto
3. `/intel-synthesis` — weekly brief (se sexta)

### Contexto: workspace maduro (10+ clientes, brain rico)
1. `/intel-synthesis` — weekly brief
2. `/sintetizar` — processar inbox
3. `/atualizar` — drift detection

## Regras

- Painel SEMPRE em ASCII estruturado (não JSON, não markdown puro)
- Métricas calculadas em real-time (não hardcoded)
- Alertas (⚠) destacados — bloqueios primeiro
- Ações ranqueadas por urgência + impacto
- Cada ação tem skill associada + razão (não apenas "faça X")
- Saudação contextual pelo horário (sutil, não exagerado)
- Últimos 5 commits resumidos (audit trail mental rápido)
- Cliente parado >7d sempre destacado com ⚠
- Workspace recém-criado: sugere caminho de start específico
- Workspace maduro: sugere consolidação + síntese
- Status das Camadas SEMPRE derivado do filesystem contra o registry (§2.5), nunca de flag manual solto no `_constructs.md` (CALIBRATION-CORE §4)
- Nome de arquivo diferente na pasta certa CONTA — nunca mostrar "vazio"/⬜ quando o artefato existe no diretório esperado
- Executores (pitch/proposta/post/carrossel) nunca têm linha de Camada, mas NUNCA somem — aparecem na faixa "Assets executados" com contagem
- "Mensagens" = SÓ `/banco-mensagens` (`ads/banco-mensagens.md`); pitch é executor → faixa "Assets executados > Pitches", não Camada 3
