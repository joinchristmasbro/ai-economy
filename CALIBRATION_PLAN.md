# CALIBRATION_PLAN — Rodada de calibração estrutural do Installer (v1)

> **Origem:** teste real E2E do Bro (nicho fitness maduro) + auditoria manual. Objetivo declarado: **corrigir o comportamento-BASE do installer** (prompts, templates, rubricas, schemas, lógica) pra que os PRÓXIMOS usuários recebam saída melhor por padrão — NÃO só remendar os arquivos gerados no teste.
> **Princípio-mãe:** correção em runtime ≠ correção do installer. Comportamento bom que só apareceu por confronto do usuário → vira regra interna automática.
> **Data:** 2026-07-09 · **Status:** PLANO (fundação em aplicação nesta rodada; surgical edits + wiring = rodada 2)

═══════════════════════════════════════════════════

## 0. O DIAGNÓSTICO ARQUITETURAL (por que 22 remendos não resolvem)

Investigação read-only de 31 skills + templates + schema (3 agentes). Achado central:

1. **NÃO existe `.claude/rules/` no installer.** Regras vivem inline em cada `SKILL.md`. Não há camada compartilhada.
2. **Propagação é frouxa.** O de-facto "arquivo de regras" é `_contexto/modelo-nova-economia.md`, mas só **8 das 31 skills** o leem no Step 0 (`copiloto, criar-oferta, escanear-concorrencia, posicionar, precificar, setup, sistematizar, trocar-nicho`). `mapear-mercado`, `criar-lp`, `carrossel`, `post`, `pitch`, `proposta` **NÃO leem** — só leem o `_constructs.md`.
3. **Nenhuma injeção automática.** O SessionStart hook (`session-start-brain.sh`) hoje só faz `echo` de alertas do `_brain/` (e só com `SHOW=1`). Não injeta regra nenhuma. O único arquivo auto-injetado é o root `CLAUDE.md` — **mas ele é REGENERADO pelo `/setup`** (regra colada nele é sobrescrita).

**Conclusão:** a razão de "só corrigir quando o usuário confronta" é estrutural — não há camada que carregue o comportamento pra todas as skills. A calibração correta = **(A) criar a camada de regras (`CALIBRATION-CORE.md`, codifica as 22 uma vez) + (B) wire de propagação que alcança 100% das sessões + (C) surgical edits nos ~6 pontos que têm mecânica própria.**

═══════════════════════════════════════════════════

## 1. ARQUIVOS ENCONTRADOS (o mapa)

### 1.1 Onde moram os PROMPTS/INSTRUÇÕES dos comandos
- `projetos/aifirst-os/repo/.claude/skills/<skill>/SKILL.md` — 31 skills (29 ativas + `estudar-mercado`/`spy-ads` DEPRECADAS). Cada SKILL.md é o prompt inteiro; o "Passo 0 / Etapa 0" hardcoda quais arquivos ler.
- `.claude/commands/` — 32 espelhos legados dos comandos.

### 1.2 Onde moram os TEMPLATES de saída
| Artefato | Template real? | Path |
|---|---|---|
| DNA / schema | SIM | `templates/_constructs-template.md` |
| Oferta | SIM | `ofertas/_modelo/oferta.md` (7 seções) + legado `_modelo/0{1..4}-*.md` |
| LP | SIM | `landing-pages/_shared/design-tokens.json` + `landing-pages/_modelo/{institucional,obrigado}/` |
| Cliente | SIM | `clientes/_modelo/00-…06-*.md` |
| Perfis / camadas | SIM | `templates/perfis/*` + `templates/ofertas/camada-*.md` |
| market-map / concorrência / posicionamento / pricing / pitch / plano-validação / proposta / banco-mensagens | **NÃO** (skeleton inline no SKILL.md) | out: `nicho/*.md`, `ofertas/*.md`, `clientes/_pitches/*`, `clientes/_propostas/*` |

### 1.3 Onde moram SCHEMA / STATUS / CAMADAS do `_constructs.md`
- `templates/_constructs-template.md` — seções `OPERADOR → DIAGNÓSTICO → NICHO/MERCADO → CONCORRÊNCIA → POSICIONAMENTO → PRICING → OFERTA → TRAÇÃO` + tabela `STATUS DA INSTALAÇÃO` (Camadas 0-4, marcadores só `⬜`/`✅`, **sem `◐`**).
- **GAP:** schema NÃO tem taxonomia epistêmica (fato/hipótese/inferência/dado-de-mercado). Proveniência é texto-livre no campo.
- **Status = 2 sistemas desconexos:** tabela manual no `_constructs.md` (cada dono flipa a própria linha) + scan de filesystem do `/iniciar` (que **não lê o `_constructs.md`** e **não escaneia `clientes/_pitches/`**). É a causa do bug "Mensagens ⬜" (ver §4-bug abaixo).

### 1.4 Onde moram as RUBRICAS
| Rubrica | Local | Estado |
|---|---|---|
| Evidência GOLD/SILVER/BRONZE | inline em `mapear-mercado:134` E `escanear-concorrencia:35` — **duas definições divergentes** | GAP PARCIAL |
| Modelabilidade concorrente (3 sinais) | `escanear-concorrencia:136` | OK (mas confunde Firecrawl com Ad Library, :51-63) |
| Pricing (escada 8 degraus + pisos) | `precificar:88` | OK; **sem escada high-ticket infra nem curva de productização** |
| Oferta promise/garantia (prova×controle) | `criar-oferta:86-206` | **JÁ FORTE** (só faltam SLA/reativação nominais) |
| LP arquitetura | `criar-lp` (só `institucional`/`obrigado`) | GAP quase TOTAL (sem dispatcher) |
| Pitch + Validação | `pitch` + `plano-validacao` | **JÁ FORTE** (quente-first + funil completo) |
| Compliance saúde | `novo-cliente:288` (auto-detect) | GAP PARCIAL (pitch=0, LP-própria=0, CFN/CONFEF ausentes) |

═══════════════════════════════════════════════════

## 2. MÓDULOS QUE SERÃO ALTERADOS

**NOVO (fundação):**
- `.claude/rules/CALIBRATION-CORE.md` — codifica as 22 regras uma vez (a "constituição" do installer).
- `.claude/rules/_index.md` — índice das regras.

**WIRING (propagação):**
- `.claude/hooks/session-start-brain.sh` — emitir a constituição compacta em toda sessão.
- `CLAUDE.md` (root) + o template do `/setup` que o regenera — referenciar `.claude/rules/`.
- `_contexto/modelo-nova-economia.md` — apontar pra CORE + absorver a taxonomia epistêmica.

**SCHEMA:**
- `templates/_constructs-template.md` — legenda epistêmica (FATO/HIPÓTESE/INFERÊNCIA/DADO-MERCADO/CLAIM/SIMULADO/D.I.) + marcador `◐` + convenção de proveniência.

**SURGICAL (rodada 2 — skills com mecânica própria):**
- `escanear-concorrencia` (R7 Firecrawl≠Ad Library) · `precificar` (R10 escada infra + R11 curva) · `criar-lp` (R17 dispatcher + R18 perda-antes-de-pilar + R19 metáfora + auto-open) · `criar-oferta` (R13 reativação escopada + auto-open render + R22 productização) · `iniciar` (R4 status registry) · `pitch`+`criar-lp` (R20 compliance herança) · `mapear-mercado`/`criar-lp`/`post`/`carrossel`/`proposta` (Step 0 passa a ler CORE).

═══════════════════════════════════════════════════

## 3. AS 22 (+2) MUDANÇAS → ONDE ATERRISSAM

| # | Regra | Tipo | Aterrissa em |
|---|---|---|---|
| 1 | Runtime ≠ installer (correção vira regra) | GLOBAL | CORE §1 + hook |
| 2 | Separar fato/hipótese/inferência/dado-mercado/claim/simulado/D.I. | GLOBAL + SCHEMA | CORE §2 + `_constructs-template.md` |
| 3 | Auditoria de arquivos ao declarar gravação | GLOBAL | CORE §3 (todas as skills que gravam) |
| 4 | Status/camadas consistentes (bug Mensagens⬜) | SCHEMA + SURGICAL | `_constructs-template.md` + `iniciar` |
| 5 | Numeração de perguntas sequencial | GLOBAL | CORE §5 (setup, raio-x, sistematizar, precificar…) |
| 6 | Rubrica de evidência (GOLD-ICP/GOLD-LP/CLAIM, blog=teto SILVER) | GLOBAL | CORE §6 (unifica as 2 divergentes) |
| 7 | Firecrawl ≠ Ad Library | GLOBAL + SURGICAL | CORE §7 + `escanear-concorrencia` |
| 8 | Gate de drift de ICP | GLOBAL (gate) | CORE §8 (antes de posicionar/precificar/criar-oferta/criar-lp/pitch/plano-validacao) |
| 9 | Infraestrutura ≠ gestão de tráfego | GLOBAL | CORE §9 (precificar, criar-oferta, posicionar) |
| 10 | Escada de pricing high-ticket infra | SURGICAL | CORE §10 + `precificar` |
| 11 | Curva de productização (founder-led → replicável) | GLOBAL + SURGICAL | CORE §11 + `precificar`/`criar-oferta`/`plano-validacao` |
| 12 | Promessas/garantias controláveis | GLOBAL (reforço) | CORE §12 (criar-oferta já forte; propaga p/ LP/pitch) |
| 13 | Reativação como camada escopada | GLOBAL | CORE §13 (criar-oferta, pitch, criar-lp) |
| 14 | Prova em validação (sem inventar case) | GLOBAL | CORE §14 (criar-oferta já trata; propaga) |
| 15 | Copy pública ≠ notas internas | GLOBAL | CORE §15 (criar-lp, proposta, pitch, oferta) |
| 16 | PT-BR nativo, não tradução gringa | GLOBAL | CORE §16 (todas as skills de copy) |
| 17 | LP dispatcher (A VSL / B Direct-Sales / C B2B / D SaaS) | SURGICAL | CORE §17 + `criar-lp` |
| 18 | LP vende PERDAS antes de componentes | SURGICAL | CORE §18 + `criar-lp` |
| 19 | LP com metáfora dominante única | SURGICAL | CORE §19 + `criar-lp` |
| 20 | Compliance saúde (CFM/CFN/CFO/CONFEF) | GLOBAL + SURGICAL | CORE §20 + herança em `pitch`/`criar-lp` própria + add CFN/CONFEF |
| 21 | Validação sem cold outreach pesado | GLOBAL (reforço) | CORE §21 (plano-validacao já forte) |
| 22 | Oferta productizada (entrega replicável) | GLOBAL | CORE §22 (criar-oferta, plano-validacao) |
| **23** | **Materializar + ABRIR o artefato (LP e doc de oferta renderizam HTML e abrem no navegador)** | SURGICAL (infra nova) | CORE §23 + `criar-lp` + `criar-oferta` (Passo render) |
| **24** | **One-page offer é gerada como entregável renderizado (o "clímax visível")** | SURGICAL | `criar-oferta` Passo 5d (do §4.5 do doc 09) |

═══════════════════════════════════════════════════

## 4. RISCOS

1. **`/setup` regenera o `CLAUDE.md`** → referência às rules colada nele some. Mitigação: wire principal = **hook** (não CLAUDE.md); + editar o TEMPLATE que o /setup usa pra gerar o CLAUDE.md.
2. **Injeção pesada demais** → despejar as 22 completas em toda sessão custa token. Mitigação: hook emite a **constituição compacta** (22 one-liners + pointer); a versão longa (`CALIBRATION-CORE.md`) só é lida pelas skills detail-heavy no Step 0.
3. **Reescrever comportamento que JÁ está bom** (criar-oferta garantia, pitch/validação) → risco de regressão. Mitigação: CORE REFORÇA e preenche gaps, não reescreve o que a auditoria marcou "JÁ FORTE". Regra: onde o skill já cumpre, o CORE só cita "mantém".
4. **Auto-open (R23) é infra NOVA** — `criar-lp` cospe `.tsx` (não HTML), nenhuma skill abre browser hoje. Precisa de um passo de render HTML + `open`. Risco de escopo. Mitigação: decisão explícita de scope (preview HTML leve vs Next.js full) ANTES de codificar.
5. **Drift gate (R8) pode travar demais** — gate que interrompe todo avanço pode irritar. Mitigação: gate AVISA + recomenda, não bloqueia hard; só bloqueia em drift material (ex: preço 3× fora da banda do ICP pesquisado).
6. **Duas rubricas de evidência divergentes** — unificar pode quebrar quem depende da definição atual. Mitigação: CORE §6 vira a canônica; as 2 inline passam a CITAR o CORE (não redefinir).
7. **Auto-commit no Stop hook** — cada turno commita+empurra. Mudanças grandes ficam versionadas automático (bom pra rollback), mas cuidado com commits ruidosos.

═══════════════════════════════════════════════════

## 5. ORDEM DE IMPLEMENTAÇÃO

**Rodada 1 — FUNDAÇÃO (esta rodada, additiva, baixo risco):**
1. `CALIBRATION-CORE.md` — codifica as 22+2 (FEITO nesta rodada).
2. `_constructs-template.md` — legenda epistêmica + status `◐` + proveniência.
3. Wire de propagação: hook emite constituição compacta + CLAUDE.md/template referenciam rules.
4. `_contexto/modelo-nova-economia.md` aponta pra CORE.

**Rodada 2 — SURGICAL (após GO + 2 decisões):**
5. `escanear-concorrencia` (Firecrawl≠AdLib) · `precificar` (escada infra + curva) · `criar-lp` (dispatcher + perda-antes-pilar + metáfora + compliance própria) · `criar-oferta` (reativação + render one-page + productização) · `pitch` (compliance) · `iniciar` (status registry) · Step 0 das skills que não leem CORE.

**Rodada 3 — INFRA (auto-open R23/R24):**
6. Passo de render HTML + `open` no `criar-lp` e `criar-oferta` (depende da decisão de scope).

**Decisões pendentes do Bro (2):** (a) wire de propagação; (b) scope do auto-open/render. Ver mensagem.

═══════════════════════════════════════════════════

## Changelog
- **2026-07-09 v1** — Criado após teste real E2E + investigação de 31 skills. Diagnóstico arquitetural (sem rules-layer, propagação frouxa) + mapa de 22+2 regras → aterrissagem + riscos + ordem em 3 rodadas.
