---
name: ad-library-scan
description: >
  Scrape Meta Ad Library de marca específica ou nicho via Firecrawl. Captura
  ads ativos (copy, criativos descritos, CTAs, dias rodando). Detecta hooks
  repetidos cross-ads = padrões emergentes. Salva swipe file em
  nicho/07-tendencias.md ou _brain/fontes/ads/. Use quando rodar
  /ad-library-scan, antes de criar campanha, ou periodicamente pra monitorar
  mercado.
---

# /ad-library-scan — Inteligência de ads ativos

Scrape de **Meta Ad Library** (página pública) pra ver ads que estão rodando AGORA. Detecta hooks recorrentes, copy patterns, ofertas frequentes, gaps no mercado.

**Princípio:** quem está rodando ad TEM dinheiro pra rodar = está vendendo. Lista de ads ativos = lista de "quem opera no nicho com tração".

## Pré-requisitos

- MCP `firecrawl` instalado (free 500 créditos/mês)

Se faltar:
```
ad-library-scan precisa do MCP Firecrawl pra scrape de páginas dinâmicas.

Instalar agora? [s/n]
→ claude mcp add firecrawl --env FIRECRAWL_API_KEY=...
→ Signup grátis em firecrawl.dev
```

## Modos de uso

```
/ad-library-scan [marca]                  → ads ativos de marca específica
/ad-library-scan [nicho ou keyword]       → ads do nicho geral
/ad-library-scan                           → lê nicho/00-perfil-cliente-alvo.md e busca ads do nicho
```

## Pipeline

### 1. Determinar URLs Meta Ad Library — country param obrigatório

**Pergunta país antes de buildar URL:**
```
País-alvo? (default: BR)
1) BR — Brasil (default — pra audiência brasileira)
2) US — Estados Unidos (referência de tendências)
3) PT — Portugal
4) ALL — global (sem filtro)
5) Outro: digite código ISO 3166-1 alpha-2 (ex: ES, MX, AR)
```

→ Variável `{COUNTRY}` injetada na URL.

**Por marca:**
```
https://www.facebook.com/ads/library/?active_status=active&ad_type=all&country={COUNTRY}&search_type=page&q=[marca]
```

**Por nicho/keyword:**
```
https://www.facebook.com/ads/library/?active_status=active&ad_type=all&country={COUNTRY}&search_type=keyword_unordered&q=[keyword]
```

### 2. Firecrawl scrape — SPA com pagination

Meta Ad Library é SPA com infinite scroll. Scrape inicial captura ~5-15 ads. Pra ter volume útil (≥20 ads), preciso forçar scroll via Firecrawl `actions`:

```javascript
mcp__firecrawl__firecrawl_scrape({
  url: "[URL com country param]",
  onlyMainContent: true,
  waitFor: 5000,                   // aguarda render inicial
  formats: ["markdown", "html"],
  actions: [
    { type: "wait", milliseconds: 5000 },
    { type: "scroll", direction: "down" },
    { type: "wait", milliseconds: 3000 },
    { type: "scroll", direction: "down" },
    { type: "wait", milliseconds: 3000 },
    { type: "scroll", direction: "down" },
    { type: "wait", milliseconds: 3000 }
  ]
})
```

**Validação de volume:**
```
SE ads_extracted < 15 após primeiro scrape:
  retry com waitFor: 10000 + 2 scrolls extras
SE ads_extracted < 5 mesmo com retry:
  reportar: "Meta Ad Library retornou poucos ads.
             Possíveis causas:
             1) Marca/keyword sem ads ativos no país {COUNTRY}
             2) Firecrawl rate-limited (espera 60s e retry)
             3) Meta mudou estrutura (verificar URL no browser)
             Continuar com [N] ads ou abortar?"
```

**Custo Firecrawl** (transparência):
- Scrape simples: 1 crédito
- Scrape com 3 scrolls + waits: ~3-4 créditos
- Aluno tem 500/mês free → cuidado se rodar 100+ scans no mês

### 3. Extração estruturada por ad

Pra cada ad capturado:
- **Brand/Page:** nome do anunciante
- **Ad copy:** texto integral
- **Visual descrição:** cores predominantes, tipo (still/video), elementos visuais
- **CTA:** botão (texto + destino se visível)
- **Dias rodando:** "Started running on [data]"
- **Plataformas:** FB / IG / Messenger / Audience Network
- **Variações:** ads com mesmo copy mas visuais diferentes

### 4. Detecção de padrões cross-ads

Após capturar 20+ ads:
- **Hooks recorrentes:** primeiras palavras/frases que aparecem em múltiplos ads
- **Pain points repetidos:** dores invocadas
- **Promise patterns:** estrutura de promessa
- **CTA patterns:** "Aplicar" / "Saiba mais" / "Agendar" frequência
- **Visual archetypes:** tipos de imagem (founder face / produto / cliente / split / etc.)

### 5. Salvar em swipe file

**Default:** atualiza `nicho/07-tendencias.md` com novos achados:

```markdown
## Swipe File — atualizado 2026-04-25

### Hooks recorrentes (top 5)
1. "Você cobra menos de R$X mas trabalha o dobro" — 8 ads
2. "Por que [nicho] perde 70% dos leads na primeira semana?" — 5 ads
3. ...

### Top 11 referências (5 ads + 3 vídeos + 3 posts)

#### Ad 1 — [marca]
- Hook: "[texto]"
- Copy: "[texto completo]"
- Visual: [descrição]
- CTA: "[texto]" → [destino]
- Rodando há: [N] dias
- Por quê funciona: [análise]
- URL: [Meta Ad Library link]

#### Ad 2 — [marca]
...

### Padrões emergentes
- 70% dos ads usam [padrão]
- 50% promete [outcome específico]
- Visual dominante: [tipo]

### Gaps observados
- Nenhum ad do nicho ataca [pain X] explicitamente — oportunidade
- Maioria usa promessa genérica — diferencial: usar números
```

**Alternativa:** salvar individualmente em `_brain/fontes/ads/[brand]-[date]/index.md` se aluno quer audit detalhado.

## Modos avançados

### Scan competitor específico

```
/ad-library-scan competidor-X
```

→ Pega TODOS os ads ativos do competidor X. Análise focada (vs. nicho geral).

Salva em `competidores/competidor-X/ads-2026-04-25.md`.

### Scan funil pós-clique (se Firecrawl premium)

Pra cada ad detectado, pode (opcional) seguir o link do CTA e fazer scrape da LP destino. Custa créditos extras Firecrawl.

```
/ad-library-scan competidor-X --funnel
```

→ Salva também `competidores/competidor-X/funnel-mapped-2026-04-25.md` com LP scraped.

## Mensagem final

```
═══════════════════════════════════════════════
  AD-LIBRARY-SCAN: [target]
═══════════════════════════════════════════════

ADS CAPTURADOS    [N] ativos
PERÍODO           captura: 2026-04-25

PADRÕES DETECTADOS
  ★ Hook recorrente: "[texto]" em [N] ads
  ★ Visual archetype dominante: [tipo] em [%]
  ★ CTA mais frequente: "[texto]" em [%]

GAP OBSERVADO
  Nenhum ad ataca [pain X] — oportunidade pra teu cliente

TOP 5 ADS COMPLETOS
  1. [marca] — rodando há [N]d
  2. [marca] — rodando há [N]d
  ...

SAVED
  ✓ nicho/07-tendencias.md (atualizado)
  ✓ _brain/fontes/ads/[date]/ ([N] arquivos)

PRÓXIMO
  /escanear-concorrencia          — análise mais profunda dos top 3
  /creative-strategy — usar swipe pra gerar ad próprio
```

## Regras

- **Sempre informar quanto Firecrawl créditos usou** (transparência de custo)
- **Pattern detection só com 10+ ads** (volume suficiente pra padrão real)
- **Gaps observados** = oportunidades acionáveis (não relatório)
- **Swipe file editável manualmente** — aluno pode adicionar análise própria
- **Frontmatter YAML** em todo arquivo criado
- **Source URL** preservado em cada ad (audit trail)
- **Compliance:** se aluno tá em nicho regulado, sinaliza ads que podem violar (ex: clínica que promete resultado)
