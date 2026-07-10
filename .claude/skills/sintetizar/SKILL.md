---
name: sintetizar
description: >
  Processa _brain/inbox/ e organiza notas no knowledge graph. Classifica cada
  captura (conceito? fonte? insight cross-cliente?), move pra pasta certa,
  promove confidence se há evidência cross-source. Atualiza _brain/_index.md
  (MOC). Use quando rodar /sintetizar, ao fim de uma sessão de captura, ou
  semanalmente. Recomendado domingo ou sexta.
---

# /sintetizar — Organiza o cérebro

Pega tudo que tá na `_brain/inbox/` e organiza no knowledge graph. Classifica, move, linka, promove confidence.

**Princípio:** capture é fluxo livre, organização é responsabilidade desta skill. Aluno NÃO precisa pensar em onde colocar — joga na inbox e roda `/sintetizar` semanalmente.

## Pré-requisitos

- `_brain/` deve existir (criada pelo `/setup`)
- Idealmente: notas na `_brain/inbox/` (senão skill avisa "inbox vazia, nada pra processar")

## Pipeline

### 1. Lê toda `_brain/inbox/`

Lista todos arquivos `.md` (e qualquer outro formato).

### 2. Classifica cada nota

Pra cada nota, decide categoria:

**Conceito** (vai pra `_brain/conceitos/`):
- Captura é abstrata/teórica (modelo mental, princípio, framework)
- Não está vinculada a fonte específica
- Pode aplicar em múltiplos contextos
- Ex: "Filtro inverso aumenta qualidade reduzindo volume"

**Fonte** (vai pra `_brain/fontes/[tipo]/`):
- Captura é vinculada a fonte específica (URL, livro, vídeo, conversa)
- Tem origem rastreável
- Ex: "Quote de um operador de ofertas de referência no podcast X sobre disqualification"

**Insight cross-cliente** (vai pra `_brain/insights/`):
- Padrão observado em 2+ clientes do aluno
- Cross-references existentes
- Ex: "3 clientes do nicho odonto reportam que pacientes não voltam sem lembrete WhatsApp"

**Indeterminado** → pergunta ao aluno qual categoria.

### 3. Aplica template apropriado

Se vai pra `conceitos/`: usa template `_modelo/_conceito.md`
Se vai pra `fontes/`: usa template `_modelo/_video.md` / `_post.md` / `_ad.md` / `_artigo.md` (escolhe pelo tipo de fonte)
Se vai pra `insights/`: usa template `_modelo/_insight.md`

Preenche YAML frontmatter:
- `stage: seedling` (default)
- `created: [data captura]`
- `linked-clients`, `linked-concepts`, `linked-sources` (sugere baseado em conteúdo)

### 4. Promote confidence (se aplicável)

**Seedling → Budding:** revisitada pelo menos 1x (manualmente OU por outra captura referenciando)

**Budding → Evergreen:** citada por 3+ outras notas OU aplicada com sucesso em 2+ clientes

Skill detecta evidência:
- Conta `linked-sources` apontando pra essa nota
- Conta `linked-concepts` reverso
- Se threshold atingido → sugere promoção

```
Conceito "filtro-inverso" tá em stage: budding mas tem 5 fontes apontando pra ele.
Promover a evergreen? [s/n]
```

### 5. Pattern detection cross-cliente

Pra cada cliente em `clientes/`, lê `_contexto/historico.md` (gargalos declarados) e `_contexto/negocio.md` (ICP).

Se 3+ clientes têm:
- Mesmo gargalo declarado → sugere insight em `_brain/insights/`
- ICP similar → sugere conceito sobre o nicho cross-cliente
- Mesma tentativa anterior que falhou → sugere insight de "anti-pattern do nicho"

```
Detectei padrão cross-cliente: 4 clientes (clientes/[a], [b], [c], [d]) declaram
gargalo similar — "leads chegam mas não fecham na call".

Criar insight em _brain/insights/leads-chegam-nao-fecham.md? [s/n]
```

### 6. Atualiza MOC

Atualiza `_brain/_index.md`:

```markdown
## Estado atual

| | Total | Seedling | Budding | Evergreen |
|---|---:|---:|---:|---:|
| Conceitos | 12 | 3 | 6 | 3 |
| Fontes | 47 | – | – | – |
| Insights | 4 | – | – | – |

## Últimos 5 capturas (inbox)

[auto-listado das capturas mais recentes]

## Conceitos mais conectados

1. [[conceitos/filtro-inverso]] — 12 links
2. [[conceitos/aplicacao-funnel]] — 8 links
3. [[conceitos/voice-dna]] — 6 links
```

### 7. Inbox cleanup

Após processar, move notas processadas pra suas pastas finais. Remove arquivos da `_brain/inbox/` (ou marca como `processed_[date]_[slug].md` se aluno preferir histórico).

## Output exemplo

```
═══════════════════════════════════════════════
  /sintetizar — processado em 2026-04-25
═══════════════════════════════════════════════

INBOX        12 capturas
  Conceitos      3 (1 nova, 2 atualizadas)
  Fontes         7 (4 youtube, 2 reddit, 1 artigo)
  Insights       1 (cross-cliente: 4 clientes nicho odonto)
  Skipped        1 (conteúdo ambíguo, requer review manual)

PROMOÇÕES SUGERIDAS
  ⬆ "filtro-inverso" budding → evergreen (5 fontes apontam)
  ⬆ "voice-dna-capture" seedling → budding (revisitada 2x esta semana)

PATTERNS DETECTADOS
  ★ 4 clientes nicho odonto → criar insight "leads chegam mas não fecham"?

KNOWLEDGE GRAPH
  Conceitos:  12 (+1 esta sessão)
  Fontes:     47 (+7 esta sessão)
  Insights:   4 (+1 sugerido)
  Total links: 156 (+22 esta sessão)

PRÓXIMO
  Confirme promoções e patterns acima.
  /iniciar — ver dashboard atualizado
  /intel-synthesis — gerar weekly brief
```

## Regras

- Roda **periodicamente** (semanalmente ideal)
- Skipped notes (ambíguas) FICAM na inbox até revisão manual
- Promoção de stage SEMPRE pergunta antes (não automático)
- Pattern detection cross-cliente SEMPRE pergunta antes de criar insight
- Frontmatter atualizado em TODAS notas processadas
- MOC `_brain/_index.md` atualizado ao final
- Idempotente: rodar 2x seguidas não causa side effects
- Logs de processamento em `_brain/insights/_log-sintetizacoes.md` (audit trail)
