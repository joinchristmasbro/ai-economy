---
title: aifirst-os
type: workspace-root
created: 2026-04-25
---

This file provides guidance to Claude Code (claude.ai/code) when working in this repository.

# aifirst-os

Ambiente técnico do Claude Code dedicado a **um nicho específico**. Você usa esse workspace pra construir e vender infraestrutura de growth instalada pra empresas desse nicho.

Se você acabou de clonar este repo:

```
/setup
```

Setup leva ~10 minutos. Registra o operador (quem você é, o que vende, sua voz) e cria o `_constructs.md` — o DNA que todos os módulos leem e atualizam. Depois disso, este arquivo é regenerado com seu contexto.

**Primeiro comando após o setup:** `/iniciar` (NÃO `/init` — `/init` é built-in genérico do Claude Code; `/iniciar` é a skill deste OS que mostra o painel de estado real).

---

<!-- Conteúdo abaixo é regenerado pelo /setup. Antes do /setup, é o template universal. -->

## Lentes de leitura (carga automática a cada sessão)

Toda sessão carrega, antes de qualquer ação:

1. **`_contexto/empresa.md`** — quem você é, o que faz, qual nicho atua
2. **`_contexto/preferencias.md`** — tom, estilo, o que evitar
3. **`_contexto/estrategia.md`** — foco do trimestre, objetivo 90d, anti-valores
4. **`_contexto/modelo-nova-economia.md`** — tese e princípios operacionais
5. **`_contexto/framework-oferta.md`** — frameworks, critérios, biblioteca de mecanismos
6. **`.claude/rules/CALIBRATION-CORE.md`** — as 22+2 regras invioláveis do installer (fato≠hipótese, evidência, drift-gate, pricing infra, garantia controlável, LP dispatcher, compliance, materializar+abrir artefato). Injetada compacta em toda sessão pelo SessionStart hook; skills detail-heavy leem inteira no Step 0.

Skills geradoras de visual também consultam `marca/design-guide.md`.

A diferença operacional desse repo: **nenhuma skill executa sem aplicar o filtro do modelo Nova Economia + o CALIBRATION-CORE**. Se uma sugestão violar um princípio, a skill recusa e oferece alternativa. E correção que o usuário faz na conversa (§1) vira regra do installer, não só remendo do artefato.

## 4 princípios operacionais

Todas as skills seguem (detalhes em `_contexto/modelo-nova-economia.md`):

1. **Setup + recorrência, nunca hora.** Toda oferta tem instalação inicial (preço sobre resultado) + recorrência mensal.
2. **IA na retaguarda, não no pitch.** Cliente compra resultado; IA é mecanismo invisível.
3. **Sistema antes de escala.** Replicar antes do sistema estar maduro é replicar caos.
4. **Pesquisa antes de criar.** Skills puxam dados reais antes de sugerir.

## Estrutura do workspace

Workspace dedicado a 1 nicho. Organizado em PARA (Areas + Resources) com Johnny.Decimal-style numbering:

```
_contexto/         Areas — quem você é + tese + framework
_brain/            Areas — knowledge graph (inbox/conceitos/fontes/insights)
nicho/             Areas — cérebro do nicho (market-map + concorrência + posicionamento, populados pela cadeia de instalação)
ofertas/           Areas — múltiplas ofertas estruturadas
system-design/     Areas — arquitetura por camada
clientes/          Areas — cada cliente em pasta (workspace próprio com voice DNA + brand tokens + compliance)
processos/         Areas — workflows recorrentes
funcionarios/      Areas — agentes IA especializados
landing-pages/     Areas — LPs por tipo (institucional + obrigado)
nutricao/          Areas — sequências email + WhatsApp
ads/               Areas — criativos + copy de campanhas
scripts-venda/     Areas — scripts pra humanos
_arquivo/          Areas — nichos/ofertas/clientes arquivados

marca/             Resources — identidade visual + prompts de imagem
dados/             Resources — drop zone (gitignored)
templates/         Resources — perfis, ofertas, ferramentas, references
```

Compatível com Obsidian: wiki-links (`[[arquivo]]`), frontmatter YAML, `_index.md` como MOC. Aponte o vault do Obsidian pra esta pasta.

## Skills disponíveis (28)

### Diário
```
/iniciar            dashboard visual — estado real + 3 ações sugeridas
/syncar             commit + push pro GitHub
/atualizar          varre estado real + detecta drift
```

### A Instalação (a cadeia canônica — rodar EM ORDEM)
```
/setup                  Camada 0: wizard 8 perguntas + Voice DNA do operador + _constructs.md + MCPs reais
/raio-x                 diagnóstico de substituibilidade — Index 0-100 + % em risco + vetor de migração (calculado)
/mapear-mercado         pesquisa real do nicho — dores 3 camadas + HERO PAIN eleito + linguagem de compra verbatim
/escanear-concorrencia  quem vende de verdade — score de modelabilidade + THE GAP nomeado
/posicionar             Old Game → vilão → New Game → MECANISMO™ derivado (frame-checked)
/precificar             preço CALCULADO — escada 8 degraus + 3 pisos + tiers
/criar-oferta           síntese final — 7 seções traceáveis ao _constructs.md (máx 2 perguntas)
/criar-lp               LP premium 4 camadas · 2 tipos: institucional + obrigado
/banco-mensagens        arsenal de comunicação compilado da fundação — 10 ângulos + 20 hooks + objeções respondidas + 20 ideias executáveis
/plano-validacao        a oferta em movimento — plano manual 7-14d CALCULADO (horas→abordagens/dia) + sinais com régua + registro de tração (§TRAÇÃO)
```

### Execução (o piso que a fundação alimenta)
```
/carrossel          carrossel IG 8-10 slides — copy cascadeada da fundação + render PNG 1080×1350 (fallback HTML)
/post               post IG/LinkedIn, roteiro de reels 30-45s ou thread/carta — na voz do operador
/pitch              kit de abordagem por canal (DM frio / indicação / interesse) — abertura + diagnóstico 2min + 3 objeções
/proposta           proposta comercial pro prospect — preço CALCULADO + mecanismo™ + garantia da fundação (HTML A4 + WhatsApp)
```

**Regra do contrato dos executores:** todo executor lê a fundação e melhora conforme ela instala — abre declarando o que detectou no `_constructs.md`, degrada gracioso sem travar (funciona no dia 0) e propaga constructs VERBATIM (mecanismo™, hero pain, números, garantia — zero drift). Executor CONSOME o DNA, não o edita. Handoff natural: `/pitch` → `/proposta` (abordagem → fechamento); `/carrossel` e `/post` são independentes.

### Cliente
```
/novo-cliente       wizard robusto (6 blocos / ~28min) — workspace completo do cliente
/playbook-cliente   guia 6 fases de implantação no cliente
/trocar-nicho       arquiva nicho atual + configura novo
```

### Inteligência (knowledge management)
```
/youtube-intel            4 modos: video-extract / channel-baseline / niche-scan / monitor
/knowledge-extractor      extrai fonte (URL/transcript) em literature note 3-camadas
/sintetizar               processa _brain/inbox/ → conceitos/fontes/insights (semanal)
/conectar                 reorganização profunda do _brain/ — auto-link + promoção (mensal)
/intel-synthesis          weekly brief com pattern detection cross-source
/ad-library-scan          scrape Meta Ad Library (Firecrawl) — coleta usada pelo /escanear-concorrencia
/copiloto                 sparring contextual ao nicho
```

### Assets
```
/gerar-imagem             prompts profissionais 8-camadas · lookup modelo certo · MCPs free
```

Deprecadas (redirecionam): `/estudar-mercado` → `/mapear-mercado` · `/spy-ads` → `/escanear-concorrencia`.

Detalhes em cada `.claude/skills/<nome>/SKILL.md`.

## Pipeline base de uso

```
FUNDAÇÃO    /setup → Camada 0 (operador + voz + _constructs.md)
                /raio-x → diagnóstico de substituibilidade
DESCOBRIR   /mapear-mercado → hero pain eleito com evidência
                /escanear-concorrencia → players + THE GAP
                /youtube-intel niche-scan → outliers do nicho
CAPTURAR    /knowledge-extractor → fonte em literature note
                drop em _brain/inbox/ → /sintetizar (semanal)
CONSTRUIR   /posicionar → vilão + mecanismo™ derivado
                /precificar → preço calculado + tiers
                /criar-oferta → síntese da oferta (7 seções traceáveis)
                /criar-lp → LP premium 4 camadas
                /gerar-imagem → assets visuais
EXECUTAR    /banco-mensagens → o arsenal (ângulos, hooks, objeções, ideias)
                /carrossel · /post → conteúdo cascadeado da fundação
                /pitch → /proposta → abordagem e fechamento de prospect
VALIDAR     /plano-validacao → 7-14d manual: publicar + abordar + medir sinais
                resultados registram em §TRAÇÃO (1ª conversa · 1ª proposta · 1º cliente · R$)
                /novo-cliente → workspace completo do cliente
                /playbook-cliente → 6 fases de implantação
ITERAR      /copiloto → sparring contextual
                /atualizar → drift detection (cada 14 dias)
                /intel-synthesis → weekly brief (sextas)
                /syncar → backup constante
PIVOTAR     /trocar-nicho → arquivar e recomeçar (raro)
```

## Auto-reflexão

O sistema mantém contexto vivo, não estático. Comportamentos rodam em background:

**Captura de correção em tempo real.** Quando você corrigir algo durante uma sessão ("na verdade é assim", "não faço isso", "prefiro assim"), o sistema pergunta uma vez se quer salvar a regra. Se sim, vai pro arquivo certo (`empresa.md` se é fato sobre o negócio, `preferencias.md` se é estilo, `estrategia.md` se é prioridade, `nicho/0X.md` se é sobre o mercado, `CLAUDE.md` se é regra deste workspace). Adiciona linha nova, não reescreve arquivo.

**Drift detection passiva.** Toda vez que você pede ação que envolve dado já registrado (receita, foco, nicho, dor), o sistema cruza: o que você acabou de dizer condiz com o que está documentado? Se não, sinaliza e pergunta qual está atualizado.

**Auditoria por demanda.** `/atualizar` faz uma varredura completa: 14 dias de commits, status dos sistemas em `clientes/`, alinhamento entre foco e execução. Output é um relatório de drift acionável.

## Workflow

Antes de executar qualquer tarefa, verificar se existe skill em `.claude/skills/`. Se sim, seguir a skill. Se não, executar normalmente.

Quando uma tarefa repetível for executada sem skill, perguntar:

> "Isso parece repetível. Quer transformar em skill ou processo?"

(Skill pra automação, processo pra workflow manual recorrente)

## Skills personalizadas

Quando você criar skill nova:

- Específica deste workspace → `.claude/skills/<nome>/SKILL.md`
- Genérica (útil em qualquer projeto) → `~/.claude/skills/<nome>/SKILL.md`

Frontmatter obrigatório: `name` (sem espaços) e `description` (1-2 frases sobre quando usar).

Skills consultam `_contexto/modelo-nova-economia.md` + `_contexto/framework-oferta.md` antes de gerar — esse é o contrato do sistema.

## Hooks ativos

Configurados em `.claude/settings.json` — rodam automaticamente:

- **`SessionStart`** → `bash .claude/hooks/session-start-brain.sh` — carrega cérebro do workspace (status do nicho, clientes ativos, brain growth) no início de cada sessão
- **`Stop`** (após cada turno do Claude) → auto-commit + push silencioso (`git add -A; git commit -m "sync: AAAA-MM-DD HH:MM"; git push`). **Não precisa rodar `/syncar` manualmente** — git é automático. Por isso `dados/` precisa estar gitignored (drop zone com possíveis arquivos sensíveis).

Implicações:
- Mudanças no workspace ficam preservadas a cada interação (não perde trabalho)
- NUNCA commitar dados sensíveis sem checagem (LGPD do cliente, credenciais) — colocar em `dados/` (gitignored)
- Se quiser desabilitar auto-commit temporariamente, comente o hook `Stop` em `.claude/settings.json`

## MCPs e ferramentas

Configurados em `.claude/mcp.json` (alimentado pelo /setup, com teste real por ferramenta). Só ferramentas que EXISTEM:

- **Built-in:** WebSearch, WebFetch (primárias de todo módulo de pesquisa)
- **MCPs:** Firecrawl (scrape LPs + Meta Ad Library) · youtube-data + youtube-transcript (voz real do nicho)
- **CLI:** `gh` (backup automático via hook Stop)

Fallback chain universal: ferramenta falha → WebSearch → se falha → `[DADOS INSUFICIENTES]`, nunca inventa. Status de cada MCP em `_contexto/mcps-instalados.md`.
