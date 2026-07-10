# {{nome}} — Seu Sistema Operacional AI-First

> Manual gerado pelo `/setup` em {{data}}, customizado pelo seu perfil.
> Atualizado periodicamente conforme você usa o sistema.

---

## Visão geral

Você está rodando um **sistema operacional dedicado a um nicho**: `{{nicho}}`.

Esse workspace existe pra você **construir e vender infraestrutura de growth pra empresas desse nicho**. Cada cliente que entrar vira pasta dedicada com workspace próprio, voice DNA, brand tokens, compliance customizada.

**Como o sistema pensa:**

1. **Inteligência primeiro** — pesquisa real antes de gerar qualquer asset
2. **Captura tudo** — toda fonte, conversa, insight vai pro `_brain/`
3. **Cresce com o tempo** — semana 1 vs semana 12 = sistema 10× mais inteligente
4. **Voice DNA é fonte da verdade** — nunca inventa tom/palavras
5. **Compliance é check obrigatório** — antes de publicar qualquer coisa

---

## Anatomia do workspace

```
.
├── _contexto/               ← Quem você é + tese + frameworks
├── _brain/                  ← Cérebro acumulado (knowledge graph)
│   ├── inbox/               ← drop zone (capture livre)
│   ├── conceitos/           ← evergreen notes
│   ├── fontes/              ← literature notes (yt/reddit/ads/artigos)
│   └── insights/            ← cross-cliente patterns + weekly briefs
├── nicho/                   ← Cérebro do nicho (12 arquivos)
├── ofertas/                 ← Ofertas estruturadas
├── clientes/                ← Cada cliente em pasta própria
├── landing-pages/           ← LPs geradas (4 tipos)
├── system-design/           ← Arquitetura por camada
├── processos/               ← Workflows recorrentes
├── funcionarios/            ← Agentes IA configurados
├── nutricao/                ← Sequências email + WhatsApp
├── ads/                     ← Criativos + copy
├── scripts-venda/           ← Scripts pra humanos
├── marca/                   ← Sua identidade
└── templates/               ← Referências reusáveis
```

**Princípio de organização:** PARA + Johnny.Decimal. Pasta com `_modelo/` = template pra duplicar.

---

## 17+ skills — organizadas por jornada

### 🌅 Diário (uso recorrente)

| Skill | Quando usar |
|-------|-------------|
| `/iniciar` | Início de cada sessão. Mostra dashboard com estado real + 3 ações sugeridas |
| `/syncar` | Salvar trabalho no GitHub (commit + push) |
| `/atualizar` | Auditoria de drift entre documentado e real (cada 14 dias) |

### 🔍 Inteligência (pesquisa + síntese)

| Skill | Quando usar |
|-------|-------------|
| `/mapear-mercado` | Aprofundar nicho — popula 12 arquivos do framework central |
| `/youtube-intel` | 4 modos: extract/baseline/scan/monitor. Outliers + literature notes |
| `/knowledge-extractor` | Capturar fonte (URL/transcript/texto) em literature note estruturada |
| `/sintetizar` | Processar `_brain/inbox/` semanalmente. Move + linka + promove confidence |
| `/intel-synthesis` | Weekly brief com pattern detection. Sextas/domingos |
| `/escanear-concorrencia` | Espia ads de competidores (Meta Ads Library, LinkedIn, TikTok) |
| `/ad-library-scan` | Scrape Meta Ad Library de marca/nicho específico |

### 💰 Comercial (oferta + LP + ads)

| Skill | Quando usar |
|-------|-------------|
| `/criar-oferta` | Pipeline de criação de oferta (5 perguntas → Briefing) |
| `/criar-lp` | LP premium em 4 camadas. 2 tipos: institucional + obrigado |
| `/gerar-imagem` | Prompts profissionais pra Midjourney/Flux/Ideogram + MCPs free |
| `/copiloto` | Sparring partner contextual ao nicho. Sem juízo, sem cliché |

### 🏢 Cliente (instalação + playbook)

| Skill | Quando usar |
|-------|-------------|
| `/novo-cliente` | Setup robusto de cliente novo (6 blocos, ~25min). Cria workspace completo |
| `/playbook-cliente` | Guia 6 fases de implantação no cliente |

### 🔄 Pivot

| Skill | Quando usar |
|-------|-------------|
| `/trocar-nicho` | Arquiva nicho atual + configura novo. Mantém preferências |

---

## Roadmap dos primeiros 30 dias

> Customizado pelo perfil declarado no `/setup`.

{{ROADMAP_CUSTOMIZADO_AQUI}}

---

## Como evoluir o sistema

### Criar skills próprias

Quando uma tarefa aparecer mais de 2x:
```
/copiloto isso parece repetível. Vale criar uma skill?
```

Skills ficam em `.claude/skills/[nome]/SKILL.md`. Frontmatter obrigatório:
```yaml
---
name: nome-da-skill
description: >
  Quando usar essa skill (1-2 frases). Use quando o usuário rodar /[nome]...
---
```

### Adicionar MCPs novos

```bash
claude mcp add [nome-mcp] --env API_KEY=...
```

Lista de MCPs free recomendados em `templates/ferramentas/catalogo.md`.

### Atualizar contexto

Quando algo mudar (novo cliente, mudança de foco, ferramenta nova):
```
/atualizar
```

Skill detecta drift e propõe correções.

---

## Princípios operacionais

1. **Captura primeiro, organiza depois** — `_brain/inbox/` é zona livre. `/sintetizar` organiza semanalmente.
2. **Concept-oriented**, não source-oriented — padrão recorrente vira conceito linkado a múltiplas fontes.
3. **Stages de confidence** — toda nota tem `seedling` / `budding` / `evergreen`. Promove com evidência.
4. **Voice DNA é semente** — refina com 1ª entrega real, não com adjetivos.
5. **Compliance check obrigatório** — antes de publicar qualquer copy, sistema valida via `compliance-checklist.json`.
6. **Cliente em workspace próprio** — cada `clientes/[slug]/` tem seu CLAUDE.md, marca/, _contexto/.
7. **Compound intelligence** — sistema fica MAIS inteligente toda semana. Brief consolida, não acumula.

---

## Troubleshooting

### "Skill X não tá funcionando"
```
/atualizar
```
Skill detecta config drift e propõe correção.

### "MCP X falhou"
Conferir `_contexto/mcps-instalados.md`. Se status FAIL:
```bash
claude mcp list
claude mcp test [nome]
```

### "Cliente parado, não sei o que fazer"
```
/playbook-cliente [slug]
```
Foca na fase atual + checklist + ações concretas.

### "Workspace ficou bagunçado"
```
/sintetizar
```
Processa inbox, atualiza MOC, organiza.

### "Quero mudar de nicho"
```
/trocar-nicho [novo-nicho]
```
Arquiva atual + reconfigura.

---

## Recursos

- **Comunidade Nova Economia da IA:** [link da comunidade]
- **Gate page workshop:** https://aieconomy-gate.vercel.app
- **Docs MCPs:** mcp.so
- **Skill Blueprint:** `templates/references/skill-blueprint.md`
- **Collection Chain Map:** `templates/references/collection-chain-map.md`

---

## Próximos passos imediatos

1. **Hoje:** rode `/iniciar` pra ver dashboard inicial
2. **Esta semana:** rode `/mapear-mercado` pra aprofundar `nicho/`
3. **Próximas 2 semanas:** rode `/criar-oferta` + `/criar-lp` pra ter primeiro funil
4. **Mês 1:** rode `/intel-synthesis` toda sexta pra compounding intelligence

> Esse manual é vivo. `/atualizar` regenera quando seu contexto muda significativamente.
