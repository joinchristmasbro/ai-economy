---
name: knowledge-extractor
description: >
  Extrai conhecimento estruturado de qualquer fonte (URL, transcrição, texto
  livre, post, ad). Sistema 3-camadas (raw → indexed → schemas). Validação
  ESQS + Admiralty Code + CRAAP (frameworks públicos). Salva em
  _brain/fontes/[tipo]/. Use quando rodar /knowledge-extractor [URL/texto],
  ler artigo importante, capturar quote, ou processar inbox.
---

# /knowledge-extractor — Extração estruturada de conhecimento

Sistema 3-camadas pra transformar qualquer fonte em literature note linkada. Aplica frameworks públicos (ESQS scoring, Admiralty Code, CRAAP) pra graduar confidence. Cada nota vira nó no knowledge graph do `_brain/`.

**Princípio (Andy Matuschak axiom público):** notas devem ser **atomic + concept-oriented + densely linked**. Não source-oriented.

## Pré-requisitos (auto-check ANTES de qualquer fetch)

Função `validate_capability(input)` roda PRIMEIRO. Se falha → reporta + para. Não inicia processamento sem garantias.

### 1. Estrutura `_brain/` existe?

```bash
test -d _brain/inbox && test -d _brain/conceitos && test -d _brain/fontes
```
Se NÃO → reportar: "_brain/ não detectado. Execute /setup primeiro pra inicializar workspace." → ABORTAR.

### 2. Auto-detect tipo de fonte (FIRST)

Antes de validar dependências, detectar o que é o input:

| Pattern | Tipo | Roteamento |
|---------|------|-----------|
| `youtube.com/watch` ou `youtu.be/` | YouTube vídeo | **AUTO-REDIRECT pra `/youtube-intel video-extract [url]`** (sem perguntar) |
| `youtube.com/channel/` ou `youtube.com/@` | YouTube canal | Sugerir `/youtube-intel channel-baseline [url]` |
| `reddit.com/r/.*/comments/` | Reddit post | Tipo: reddit |
| `facebook.com/ads/library` | Meta Ad | Tipo: ad |
| `^https?://` (outras URLs) | Artigo/blog | Tipo: artigo |
| Texto colado (sem URL) | Texto livre | Tipo: texto, pula validação fetch |
| Path local (`./`, `/`, `C:`, `D:`) | Arquivo local | Tipo: arquivo |

Se URL YouTube detectada → executar `/youtube-intel video-extract [url]` direto. NÃO processar como artigo (vai falhar).

### 3. Validate fetch capability (só pra URLs)

Pra URLs (não YouTube, já redirecionado), antes de tentar fetch:

```
DEPENDENCIES:
  - WebFetch: built-in ✓ (sempre disponível)
  - Firecrawl: opcional (necessário pra SPAs com JS rendering)

DECISION:
  if URL é Meta Ad Library OR site SPA conhecido:
    if Firecrawl instalado:
      use mcp__firecrawl__firecrawl_scrape(url, waitFor=5000)
    else:
      reportar: "Esta URL é SPA. WebFetch não vai capturar conteúdo dinâmico.
                 Instalar Firecrawl agora? [s/n]
                 OU continuar com WebFetch (output incompleto)? [s/n]"
      aguardar resposta
  else:
    use WebFetch(url) primeiro
    if response empty/error:
      fallback pra Firecrawl (se instalado)
```

### 4. Pra texto colado direto

Sem dependências externas — prosseguir direto pra Camada 1.

## Inputs aceitos

```
/knowledge-extractor [URL]                  → fetch + extract (Firecrawl/WebFetch)
/knowledge-extractor [transcript]           → texto colado direto
/knowledge-extractor [path-pra-arquivo]     → arquivo local
/knowledge-extractor                        → menu (escolhe fonte)
```

## 3 camadas de processamento

### Camada 1 — RAW (captura literal)

- Texto da fonte preservado integralmente (ou snippet se muito longo)
- Metadata: URL, autor, publicação, data captura, hash do conteúdo
- ZERO interpretação — raw fica como evidência futura

Salvo em `_brain/fontes/[tipo]/[slug]/raw.md` (opcional, só pra fontes longas tipo transcripts/artigos)

### Camada 2 — INDEXED (literature note)

Estrutura padrão por tipo de fonte (carrega template de `_brain/fontes/[tipo]/_modelo/_*.md`):

**YouTube:** Hook / Mental Model / Quotes / Estrutura / Packaging / Aplicabilidade
(usar `/youtube-intel video-extract` quando for vídeo — mais robusto)

**Reddit post:** Quote principal literal / Linguagem capturada / Top comments / Aplicabilidade

**Ad:** Hook / Copy completa / Visual descrição / CTA / Funil pós-clique / Padrões

**Artigo/blog:** Tese central / Argumentos principais / Quotes / Dados/números / Crítica

**Texto solto:** Contexto / Quote literal / Aplicabilidade

Salvo em `_brain/fontes/[tipo]/[slug]/index.md`

### Camada 3 — SCHEMAS (evergreens, automático após volume)

Quando 3+ fontes em camada 2 mencionam o MESMO conceito:
- Skill detecta padrão recorrente
- Sugere promover a `_brain/conceitos/[conceito-slug].md`
- Linka todas as fontes via `linked-sources` no frontmatter
- Conceito começa com `stage: budding` (3 fontes) ou `stage: evergreen` (5+)

NÃO cria conceito automaticamente — pergunta antes:
```
Detectei padrão recorrente: "filtro inverso" mencionado em 3 fontes:
- _brain/fontes/youtube/[a]/
- _brain/fontes/reddit/[b]/
- _brain/fontes/artigos/[c]/

Promover a conceito evergreen em _brain/conceitos/? [s/n]
```

## Validação por confidence (frameworks públicos)

Cada claim extraído ganha marcação:

**GOLD** — 2+ fontes independentes apoiam, fonte autoritativa, dados quantificados, recente
**SILVER** — 1 fonte autoritativa OU 2 fontes secundárias
**BRONZE** — 1 fonte única, sem corroboração

Aplicação dos frameworks (sem invocar nomes acadêmicos no output — usa GOLD/SILVER/BRONZE intuitivo):

```
Critérios sintéticos (derivados de ESQS + CRAAP + Admiralty):
- Authority: autor é praticante real do tema? educator? não-expert?
- Currency: publicação recente vs. desatualizada
- Accuracy: dados quantificados vs. afirmações soltas
- Relevance: aplica ao nicho do aluno?
- Purpose: objetivo do autor (informar / vender / persuadir)
```

Tudo isso gera 1 score → traduz pra GOLD/SILVER/BRONZE no output.

## Pipeline completo

1. **Detect tipo de fonte** (URL → tipo de site → template; transcript → texto; etc.)
2. **Fetch raw** (se URL → WebFetch ou Firecrawl)
3. **Apply template** (camada 2 — literature note estruturada)
4. **Score evidência** (GOLD/SILVER/BRONZE pra cada claim)
5. **Save** em `_brain/fontes/[tipo]/[slug]/index.md`
6. **Link sugestões:**
   - Conceitos existentes em `_brain/conceitos/` que essa fonte apoia
   - Outras fontes que mencionam tema similar
   - Clientes em `clientes/[*]/` onde isso aplica
7. **Pattern detection:** se 3+ fontes mencionam mesmo padrão → sugere promover a evergreen
8. **Update MOC:** `_brain/_index.md` com nova fonte

## Output exemplo (artigo)

```markdown
---
type: fonte-artigo
title: "Why the Disqualification Strategy Works"
url: "https://example.com/article"
author: "John Doe"
publication: "Marketing Examined"
published: 2026-03-15
extracted: 2026-04-25
stage: seedling
confidence_overall: silver
linked-concepts: ["filtro-inverso"]
linked-clients: []
linked-sources: ["_brain/fontes/youtube/[vídeo-relacionado]/"]
tags: ["sales", "qualification", "high-ticket"]
---

# Why the Disqualification Strategy Works

## Tese central
Disqualification explícita aumenta close rate porque (a) filtra prospects que não fechariam e (b) cria autoridade percebida.

## Argumentos principais
1. **[GOLD]** Forms longos (15+ campos) reduzem volume em 70% mas dobram close rate
   → Citado em 3 sources do artigo + corroborado por [_brain/fontes/youtube/x/]
2. **[SILVER]** Pricing visível antes do form filtra tire-kickers
   → um operador de ofertas de referência (fonte primária, não validada externamente)
3. **[BRONZE]** "Disqualification = trust builder"
   → Claim do autor, sem evidência quantificada

## Quotes
- "If you tell people who CAN'T work with you, the ones who CAN trust you more."

## Dados/números
- Close rate dobra com form 15+ campos (n=124 application funnels)
- Volume reduz 65-75% (consistente em 3 case studies citados)

## Aplicabilidade
[Pra preencher manualmente]

## Conceitos relacionados
- [[../../conceitos/filtro-inverso]] — esse artigo apoia o conceito

## Crítica
Autor não cita o efeito disso em CAC efetivo (volume baixo pode aumentar CPL antes de aumentar fechamento). Falta dado de margem cruzada.
```

## Mensagem final

```
═══════════════════════════════════════════════
  EXTRAÍDO: [tipo] — [título]
═══════════════════════════════════════════════

SAVED         _brain/fontes/[tipo]/[slug]/index.md
CONFIDENCE    [overall: GOLD/SILVER/BRONZE]
LINKED        [N] conceitos · [N] fontes · [N] clientes

PADRÃO RECORRENTE
  Detectado: "[nome do padrão]" mencionado em [N] fontes
  → Promover a conceito? [s/n]

NEXT
  /sintetizar       — processar inbox + atualizar MOC
  /iniciar          — ver dashboard atualizado
```

## Regras

- 3 camadas SEMPRE (raw quando aplicável, indexed obrigatório, schemas opcional)
- ESQS/Admiralty/CRAAP aplicados como SCORE → traduz pra GOLD/SILVER/BRONZE no output (sem invocar nomes acadêmicos)
- Atomic notes (1 fonte = 1 nota; conceito recorrente = 1 nota separada)
- Concept-oriented links (não source-oriented)
- Frontmatter YAML obrigatório
- Source marking em todo claim
- "Aplicabilidade" sempre em branco — força reflexão manual do aluno
- Cross-source pattern detection: 3+ fontes mesmo tema → sugere evergreen
- NUNCA promove a evergreen automaticamente — pergunta antes
