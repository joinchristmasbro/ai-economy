# AI-First OS

> **AI-First OS** — o ambiente técnico onde você constrói o sistema operacional do seu negócio na Nova Economia da IA.
> Configure pela web, instale com 1 prompt, opere.

Esse repositório configura seu Claude Code com 28 skills calibradas em frameworks comprovados de criação de oferta, estudo de mercado, knowledge management e implantação de sistema em clientes. Workspace dedicado a **um nicho específico** — você se torna especialista nele.

Não é o sistema operacional do seu **negócio** — é o ambiente técnico onde você o constrói. A operação comercial (oferta, aquisição, entrega, recorrência) você constrói aqui dentro.

---

## Instalar

Abre o Claude Code numa pasta vazia e cola:

```
Instala o AI-First OS nesta pasta: baixa github.com/joinchristmasbro/ai-economy via curl (sem git), extrai aqui e roda /setup.
```

Claude faz o resto: baixa o tarball, extrai, navega e inicia a configuração. **Não precisa de git instalado.**

**Alternativa terminal (1 linha, sem git):**

```bash
curl -fsSL https://codeload.github.com/joinchristmasbro/ai-economy/tar.gz/refs/heads/main | tar -xz --strip-components=1 && claude
```

E dentro do Claude Code:

```
/setup
```

Setup leva ~10 minutos: registra quem você é, o que vende e sua voz (Voice DNA de textos reais seus), cria o `_constructs.md` — o DNA do negócio — e instala/testa os MCPs. A pesquisa de verdade vem depois, na cadeia de instalação (`/raio-x` → `/mapear-mercado` → ...).

---

## O que vem no kit

**Diário (3)**
- `/iniciar` — painel inteligente: estado real + próximo movimento (rode primeiro a cada sessão)
- `/syncar` — commit + push manual (git já é automático via hook Stop)
- `/atualizar` — varre estado real e detecta drift do contexto (cada 14 dias)

**Setup + Cliente (4)**
- `/setup` — wizard inicial, define o nicho do workspace + multi-agent research + auto-install MCPs
- `/novo-cliente` — wizard robusto 6 blocos / ~28min: workspace completo do cliente (CLAUDE.md específico + voice DNA empírico via NNG sliders + Jung archetype + StoryBrand BrandScript + Dunford positioning + brand tokens W3C + RACI + compliance auto-detect por nicho)
- `/playbook-cliente` — guia as 6 fases de implantação no cliente
- `/trocar-nicho` — arquiva nicho atual e configura novo

**A Instalação — cadeia canônica (9)**
- `/raio-x` — diagnóstico de substituibilidade: Index 0-100 + % do faturamento em risco + vetor de migração, CALCULADOS
- `/mapear-mercado` — pesquisa real do nicho: dores em 3 camadas com evidência + HERO PAIN eleito + linguagem de compra verbatim
- `/escanear-concorrencia` — quem vende de verdade: ads ativos + score de modelabilidade + THE GAP nomeado
- `/posicionar` — Old Game → vilão → New Game → MECANISMO™ derivado dos dados (frame-checked)
- `/precificar` — preço CALCULADO: escada de 8 degraus + 3 pisos + tiers (nunca "escolha uma faixa")
- `/criar-oferta` — síntese final: 7 seções traceáveis ao `_constructs.md` (máx 2 perguntas)
- `/criar-lp` — LP premium 4 camadas (copy + tokens W3C + sections + Next.js+shadcn) · 2 tipos: institucional + obrigado
- `/banco-mensagens` — o arsenal de comunicação compilado da fundação: 10 ângulos + 20 hooks + dores/desejos verbatim + objeções respondidas + 20 ideias executáveis
- `/plano-validacao` — a oferta em movimento: plano manual de 7-14 dias CALCULADO da sua capacidade, com sinais/réguas e registro de tração (§TRAÇÃO)

**Execução — o piso que a fundação alimenta (4)**
- `/carrossel` — carrossel IG 8-10 slides: copy cascadeada da fundação + render PNG 1080×1350 (fallback HTML)
- `/post` — post IG/LinkedIn, roteiro de reels 30-45s ou thread/carta, na voz do operador
- `/pitch` — kit de abordagem por canal (DM frio / indicação / interesse): abertura + diagnóstico-relâmpago + 3 objeções respondidas
- `/proposta` — proposta comercial pro prospect: preço CALCULADO + mecanismo™ + garantia da fundação (HTML A4 + versão WhatsApp)

Todo executor lê o `_constructs.md` antes de escrever e melhora conforme a fundação instala — funciona no dia 0 e fica visivelmente melhor a cada camada.

**Inteligência (knowledge management) (7)**
- `/youtube-intel` — 4 modos: video-extract / channel-baseline / niche-scan / monitor
- `/knowledge-extractor` — extrai fonte (URL/transcript/texto) em literature note 3-camadas
- `/sintetizar` — processa `_brain/inbox/` → conceitos/fontes/insights (semanal)
- `/conectar` — reorganização profunda do `_brain/` com auto-link + promoção (mensal)
- `/intel-synthesis` — weekly brief com pattern detection cross-source
- `/ad-library-scan` — scrape Meta Ad Library via Firecrawl (coleta usada pelo /escanear-concorrencia)
- `/copiloto` — sparring contextual: validação de oferta, pricing check, pitch check

**Assets (1)**
- `/gerar-imagem` — prompts profissionais 8-camadas + lookup modelo certo + MCPs free

Deprecadas (redirecionam): `/estudar-mercado` → `/mapear-mercado` · `/spy-ads` → `/escanear-concorrencia`

---

## Primeiros 60 minutos

Sequência sugerida pra sair com cérebro do nicho + uma oferta estruturada:

```
/setup                   → registra o operador + voz + _constructs.md (~10 min)
/raio-x                  → diagnóstico de substituibilidade (~10 min)
/mapear-mercado          → dores reais + hero pain eleito com evidência (~15 min)
/escanear-concorrencia   → quem vende de verdade + THE GAP (~15 min)
/posicionar              → vilão + mecanismo™ derivado (~10 min)
/precificar              → preço calculado + tiers (~5 min)
/criar-oferta            → oferta sintetizada, 7 seções traceáveis (~5 min)
```

Output final: workspace com nicho mapeado em profundidade + 1 oferta com Briefing da oferta + swipe file pra alimentar copy/criativos.

---

## Estrutura

Workspace dedicado a **1 nicho**. PARA + Johnny.Decimal:

```
_contexto/        Areas — perfil, preferências, modelo, framework
nicho/            Areas — cérebro do nicho (12 arquivos do Framework Central)
ofertas/          Areas — múltiplas ofertas estruturadas (Briefing da oferta 4 seções)
system-design/    Areas — arquitetura por camada (aquisição/conversão/operação/métricas)
clientes/         Areas — cada cliente em pasta (perfil + 6 fases)
processos/        Areas — workflows recorrentes
funcionarios/     Areas — agentes IA especializados
landing-pages/    Areas — LPs por tipo (institucional + obrigado)
nutricao/         Areas — sequências email + WhatsApp
ads/              Areas — criativos + copy
scripts-venda/    Areas — scripts pra humanos (SDR, closer, recall)
_arquivo/         Areas — histórico (nichos/ofertas/clientes arquivados)

marca/            Resources — identidade visual
dados/            Resources — drop zone (gitignored)
templates/        Resources — perfis + ofertas + ferramentas
```

Filosofia: cada coisa tem endereço permanente. `clientes/[nome]/` são instâncias dedicadas. `nicho/` é o cérebro central. `_contexto/` são responsabilidades permanentes.

---

## Workspace = 1 nicho

Workspace é dedicado a **um nicho específico**. Se você atacar 2 nichos paralelos, abra 2 workspaces (1 por nicho). Pra trocar de nicho mantendo o workspace, use `/trocar-nicho` — arquiva o atual e configura o novo.

Por que essa restrição: a tese é "construa uma vez, instale em N empresas". Sistema é dedicado a UM nicho, instalado em múltiplas empresas DAQUELE nicho. Workspace cheio de inteligência mista vira diluído.

---

## Abrindo no Obsidian

O repo é compatível com Obsidian. Aponta seu vault pra esta pasta e tudo funciona como grafo conectado.

Plugins recomendados: **Dataview** (queries dinâmicas em frontmatter), **Templater** (automação de templates), **Graph Analysis** (visualiza relações entre nicho/ofertas/clientes/processos).

---

## Comunidade Nova Economia da IA

Evoluímos o sistema em conjunto. Se você participou do workshop, está na comunidade. Traz teu caso, compartilha o que construiu, ajuda a evoluir as próximas skills.

Link: [COMMUNITY_URL]

---

## Ferramentas utilizadas

Todas as skills rodam com ferramentas que EXISTEM na caixa — zero dependência externa obrigatória:

- **Built-in:** WebSearch + WebFetch (primárias de toda pesquisa)
- **MCPs (instalados e testados pelo /setup):** Firecrawl (scrape de LPs + Meta Ad Library) · youtube-data + youtube-transcript (voz real do nicho)
- **CLI:** `gh` (backup automático)

Fallback chain universal: ferramenta falha → WebSearch → `[DADOS INSUFICIENTES]`, nunca inventa. Catálogo de MCPs opcionais em `templates/ferramentas/catalogo.md`.

---

## Expandindo teu OS

O Claude Code tem marketplace nativo de plugins (`/plugin install <nome>`). Skills externas que combinam com este modelo:

- `deep-research` — pesquisa profunda em qualquer tema
- `video-to-skill` — transforma vídeo em skill executável
- `git-helper` — workflows git avançados

Não estamos construindo wrapper próprio de skills — `/plugin` nativo é suficiente.

---

## FAQ

**Travou em alguma skill, o que faço?**
Cada skill aceita "não sei" / "pula" como resposta. Coloca placeholder e segue — voltas depois com `/atualizar`.

**Funciona no Mac e Windows?**
Sim. Claude Code roda em ambos. As skills são markdown puro.

**Posso modificar as skills?**
Pode e deve. Cada skill é um arquivo `.md` em `.claude/skills/<nome>/SKILL.md`. Edita à vontade. Se quiser que vire skill global (pra todos seus projetos), move pra `~/.claude/skills/`.

**Como atualizar pra próxima versão do kit?**
`git pull` na pasta. Se você editou skills, resolve conflitos manualmente (mantenha as suas customizações).

**Quero atacar 2 nichos. Como?**
Abre 2 workspaces. 1 por nicho. Cada um especializado.

---

Construído com a comunidade Nova Economia da IA · Workshop: [LP_URL]
