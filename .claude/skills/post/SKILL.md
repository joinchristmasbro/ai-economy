---
name: post
description: >
  Gera conteúdo multi-formato NA VOZ do operador — post único (IG/LinkedIn),
  roteiro de reels 30-45s (com marcação de cena/fala) ou thread/carta — tudo
  cascadeado do _constructs.md: hero pain, linguagem de compra, vilão e
  mecanismo™ propagam verbatim. Sem tema? Propõe ângulos derivados da SUA
  pesquisa. Output: ads/posts/[data]-[slug].md pronto pra copiar e publicar.
  Use quando rodar /post, disser "escreve um post", "faz um reels",
  "conteúdo pra essa semana", "post sobre [tema]".
---

# /post — Conteúdo na sua voz, cascadeado da fundação

Este executor transforma a inteligência já instalada no seu workspace em conteúdo publicável. Ele NÃO inventa ângulo do nada: lê o `_constructs.md`, pega a dor que a SUA pesquisa elegeu, o vilão que os SEUS dados nomearam, o mecanismo™ que É seu — e escreve como VOCÊ fala, não como IA escreve.

**O que ele faz:** post único (IG/LinkedIn) · roteiro de reels 30-45s (cena/fala/na-tela) · thread ou carta.
**O que ele NÃO faz:** publicar (não há integração com IG/LinkedIn — você copia e posta) · pesquisa nova (isso é `/mapear-mercado`) · métricas de engajamento (não prometo alcance; prometo conteúdo específico do seu nicho, na sua voz).
**Ferramentas:** nenhuma externa. Este executor SINTETIZA da fundação — zero dependência, funciona offline do primeiro ao último passo.

---

## Passo 0 — Ler a fundação e DECLARAR o que encontrou (obrigatório)

Ler `_constructs.md` INTEIRO (raiz do workspace) + `marca/voice-dna.json` (se existir) + `marca/brand-tokens.json` + `marca/design-guide.md` (se existirem — §25: sistema visual por arquétipo; qualquer output visual do post — card de citação, capa de reels, mockup — HERDA os tokens da marca, NÃO improvisa paleta/tipo do zero; precedência `clientes/[slug]/marca/` > `marca/`; zero drift do OKLCH) + `.claude/rules/CALIBRATION-CORE.md` §15 (copy pública ≠ notas internas — selos de evidência/compliance nunca vazam pra peça publicável), §16 (PT-BR nativo — estrutura gringa vira ritmo de LP brasileira, nunca frase traduzida literal) e §25 (herança de marca). Depois, abrir a conversa declarando o estado — em 2-4 linhas, sem tabela:

```
Fundação detectada: Operador ✅ · Mercado ✅ · Posicionamento ✅ · Oferta ⬜
Este post sai com: sua voz (voice DNA) + hero pain "[nome]" na linguagem
de compra do mercado + mecanismo™ "[nome]" verbatim.
Sem a Oferta, o CTA fica em modo conversa (sem promise numerada).
```

Adaptar a declaração ao que existe de verdade. É a prova viva de que a fundação vale — o usuário VÊ a pesquisa dele virando conteúdo.

## O que este executor lê da fundação (progressive enhancement)

| Construct | SE EXISTE → | SE FALTA → |
|---|---|---|
| **OPERADOR** (voz: signature_phrases, power_words, ranço) | Post sai na voz DELE — frases características, vocabulário próprio, zero palavra do ranço | Tom neutro-direto + marca `[VOZ PENDENTE]`. Convite: "rode `/setup` pra registrar sua voz — post genérico não constrói marca" |
| **NICHO/MERCADO** (hero pain + linguagem de compra + custo da inação) | Ângulos derivados da dor ELEITA · pain words verbatim no hook · número âncora no corpo (com fonte) | Pergunta 1 dor ao usuário e marca `[SEM EVIDÊNCIA — declarado pelo operador]`. Convite: "rode `/mapear-mercado` pra desbloquear ângulos de dor com evidência real" |
| **POSICIONAMENTO** (vilão + mecanismo™) | Ângulo contrarian ataca o VILÃO nomeado · mecanismo™ entra verbatim na virada (nunca parafraseado) | Post sem mecanismo — NUNCA inventa nome na hora. Convite: "rode `/posicionar` pra ter um mecanismo™ que propaga em tudo" |
| **OFERTA** (promise N+outcome, garantia) | CTA de aquisição cita a promise verbatim (zero drift de número) | CTA em modo conversa ("me chama", "comenta X"). Convite: "rode `/criar-oferta` pra CTA com promessa numerada" |
| **CONCORRÊNCIA** (THE GAP) | Desbloqueia o ângulo "o que ninguém no mercado entrega" | Ângulo indisponível — segue com os demais |

**Nunca travar por falta de fundação.** Com só a Camada 0 (voz), o executor entrega post útil no dia 0. Sem nada, entrega em tom neutro — e diz com franqueza o que melhoraria com cada módulo.

---

## Passo 1 — Formato e objetivo (UMA pergunta)

Se o usuário já disse o formato ("faz um reels sobre X"), pular. Senão:

```
Qual o objetivo deste conteúdo?

1) AUTORIDADE — plantar sua tese, atacar o jogo antigo
   → recomendo: post único LinkedIn OU carta (contrarian do vilão)
2) AQUISIÇÃO — atrair quem tem a dor agora
   → recomendo: reels 30-45s (dor no hook + mecanismo na virada + 1 CTA)
3) NUTRIÇÃO — aprofundar com quem já te segue
   → recomendo: thread/carta (story + framework)

Ou escolha direto o formato: post único · reels · thread/carta.
```

Uma pergunta só. Se o usuário enrolar, seguir com a recomendação do objetivo mais provável pelo contexto e avisar.

## Passo 2 — Tema e ângulo (UMA pergunta, com recomendação)

**Se o usuário deu tema:** validar contra a fundação (o tema conecta com hero pain, vilão ou gap? se sim, ancorar; se não, tratar como tema livre na voz dele — sem forçar construct onde não cabe).

**Se NÃO deu tema:** propor 4 ângulos DERIVADOS — 3 do hero pain + 1 contrarian do vilão (§POSICIONAMENTO):

```
Ângulos derivados da sua pesquisa (não são chute — cada um rastreia a fonte):

1. [DOR CRUA] "[hero pain na linguagem de compra verbatim]" — o post que
   descreve a segunda-feira de quem vive isso. [fonte + marcação]
2. [CUSTO DA INAÇÃO] O número âncora: [R$/h/% do _constructs] — o post
   que faz a conta na frente do leitor. [fonte]
3. [SINTOMA → CAUSA] O que o mercado acha que é o problema vs o que a
   pesquisa mostrou. [fonte]
4. [CONTRARIAN] Ataque ao VILÃO: "[vilão nomeado]" — por que o jeito que
   todo mundo faz é exatamente o que mantém o problema vivo.

Minha recomendação: nº [N], porque [conecta com o objetivo escolhido — 1 frase].
Qual você quer? (1-4)
```

Ângulo sem construct atrás não entra na lista — menos fundação, menos ângulos (e a declaração do Passo 0 já explicou por quê).

## Passo 3 — CHECKPOINT de coautoria (antes do render final)

Antes de escrever a peça inteira, mostrar a direção em 4-6 linhas e pedir aprovação:

```
Direção do [formato]:
HOOK ([pattern]): "[hook draft — 1-2 linhas]"
ESPINHA: [dor na linguagem de compra] → [virada: mecanismo™/insight] → [CTA único: qual]
Aprova, ou ajusto o hook/ângulo antes de fechar?
```

Uma rodada de ajuste no máximo — depois, renderizar. Isso evita retrabalho de peça inteira por hook errado.

## Passo 4 — Renderizar por formato

### Hook patterns (todos os formatos — escolher 1, nomear no artefato)

| Pattern | Como funciona | Esqueleto |
|---|---|---|
| **Espelho-diagnóstico** | Descreve o comportamento do ICP melhor que ele mesmo, depois aponta a causa real | "Você [comportamento verbatim da dor]. O problema não é [sintoma]. É [causa]." |
| **Contrarian** | Ataca o vilão/consenso de frente | "[Crença que o mercado repete] tá te custando [número]. E ninguém te conta isso porque [razão]." |
| **Story-prime** | Cena concreta com tempo/lugar/número, sem moral antecipada | "[Dia/hora]. [Cena específica com 1 número]. Foi aí que eu entendi [gancho aberto]." |

🔴 **PROIBIDO:** abrir com niceness ("Oi pessoal!", "Tudo bem?", "Hoje quero falar sobre..."), pergunta retórica vazia ("Você já parou pra pensar?") ou definição de dicionário. O hook carrega a dor ou o número — nunca simpatia.

### Formato A — Post único (IG ou LinkedIn)

- **IG:** 80-150 palavras · parágrafos de 1-2 linhas · hook nas 2 primeiras linhas (antes do "...mais") `[HEURÍSTICA]`
- **LinkedIn:** 150-250 palavras · primeira linha ISOLADA é o hook · sem hashtag no meio do texto `[HEURÍSTICA]`
- Estrutura: HOOK → dor na linguagem de compra (2-3 linhas) → virada (mecanismo™/insight, verbatim se existe) → prova ou número âncora (com fonte se veio da pesquisa) → 1 CTA único
- CTA por objetivo: autoridade = "comenta/discorda" · aquisição = promise da OFERTA verbatim ou "me chama" · nutrição = "salva/manda pra alguém"

### Formato B — Roteiro de reels 30-45s

Fala total: **90-120 palavras** (30-45s em ritmo natural de fala) `[HEURÍSTICA]`. Formato tabela:

```markdown
| # | Cena (o que aparece) | Fala (verbatim) | Na tela (texto/corte) |
|---|---|---|---|
| 1 | 0-3s · [enquadramento] | "[HOOK — máx 15 palavras]" | [legenda-síntese do hook] |
| 2 | 3-15s · [cena] | "[dor na linguagem de compra + número]" | [número em destaque] |
| 3 | 15-35s · [cena] | "[virada: mecanismo™/como resolve]" | [nome do mecanismo se existe] |
| 4 | 35-45s · [cena] | "[1 CTA único]" | [CTA escrito] |
```

- Hook falado nos primeiros 3s decide tudo — nunca começar com "oi, eu sou..."
- Fala escrita PRA FALAR: frases curtas, zero subordinada longa, contração natural ("tá", "pra") se a voz do operador usa
- Incluir 1 linha de legenda (caption) pronta pro post do reels

### Formato C — Thread ou carta

- **Thread:** 5-8 blocos · bloco 1 = hook + promessa do fio · 1 ideia por bloco · bloco final = síntese + 1 CTA
- **Carta (newsletter/LinkedIn artigo):** 250-400 palavras · hook → cena/story → framework ou conta aberta → aplicação → 1 CTA `[HEURÍSTICA]`
- Carta abre espaço pro story-prime longo: 1 cena real do operador (pedir ao usuário se não houver — nunca inventar caso que não aconteceu)

## Passo 5 — Craft gates (rodar TODOS antes de entregar)

1. **Teste de substituição:** troque o nicho por outro qualquer. O post ainda funciona? → tá genérico, REFAZER com pain words verbatim e número do nicho.
2. **Teste de voz alta:** leia como se fosse o operador falando num áudio de WhatsApp. Soa como ele (signature_phrases, ritmo) ou como IA? Se IA → reescrever. Se OPERADOR vazio → checar só naturalidade.
3. **Ban-list de cacoetes de IA** (refusal automático — reescrever com substituto específico): "desbloqueie" · "eleve seu jogo" · "potencialize" · "alavancar" (fora de contexto financeiro real) · "revolucionário" · "transformador" · "game-changer" · "imperdível" · "não perca" · "num mundo cada vez mais..." · "a verdade que ninguém te conta" (como fórmula) · "segredo" · emoji em cascata (🚀🔥💥) · travessão em excesso na prosa · tríades retóricas artificiais ("não é X, não é Y, é Z" mais de 1× por peça).
4. **Ranço do operador:** grep contra a lista `never_say`/`ranço` do voice DNA — 1 ocorrência = reescrever a frase.
5. **Zero drift de número:** todo número vindo do `_constructs.md` entra VERBATIM (custo da inação, promise, % em risco). Número sem fonte na fundação = marcar `[SEM EVIDÊNCIA]` ou cortar.
6. **1 CTA único** por peça — dois CTAs = nenhum.
7. **Zero exposição de mecânica:** nunca "usei IA pra escrever", nunca "meu sistema gerou". O leitor vê conteúdo, não bastidor.

## Passo 6 — Gravar o artefato + handoff

Salvar em **`ads/posts/[AAAA-MM-DD]-[slug].md`** (criar a pasta se não existir) e appendar 1 linha em `ads/_index.md` (`- [data] /post [formato] · [ângulo] · [slug]` — mesmo padrão do /carrossel):

```markdown
---
formato: [post-ig | post-linkedin | reels | thread | carta]
objetivo: [autoridade | aquisicao | nutricao]
angulo: "[nome do ângulo escolhido]"
hook_pattern: [espelho-diagnostico | contrarian | story-prime]
constructs_usados: [hero pain ✓ · mecanismo™ ✓ · voz ✓ · oferta ✗]
status: pronto-pra-publicar
---

# [Título interno da peça]

[A PEÇA COMPLETA, pronta pra copiar]

## Variações de hook (se quiser testar)
1. "[hook alternativo — mesmo ângulo, outro pattern]"
2. "[hook alternativo 2]"

## Rastreio
- Hook: derivado de [construct + fonte]
- Número(s): [de onde veio cada um, verbatim de qual seção]
- CTA: [modo + por quê]
```

Mensagem final:

```
═══════════════════════════════════════════════
  POST CRIADO: [formato] · [ângulo]
═══════════════════════════════════════════════

OUTPUT
  ✓ ads/posts/[data]-[slug].md (pronto pra copiar e publicar)

FUNDAÇÃO USADA
  ✓ [listar constructs que entraram + o que ficou de fora e por quê]

CRAFT GATES
  ✓ Substituição · voz alta · ban-list · zero drift · 1 CTA

PRÓXIMO PASSO
  → Publicar (copiar do arquivo — este OS não posta por você)
  → 3 posts dessa série? Rode /post de novo com o ângulo 2 — a mesma
    dor rende 3-4 peças em formatos diferentes sem repetir
  → [se OFERTA vazia e objetivo=aquisição: "rode /criar-oferta pra
     transformar esse alcance em CTA com promessa numerada"]
```

## Regras

- Constructs propagam VERBATIM — mecanismo™, hero pain, números. Zero paráfrase.
- Nunca inventar mecanismo, case ou número que não existe na fundação.
- Nunca travar por fundação incompleta — degradar com franqueza + convite ao módulo dono.
- Uma pergunta por vez; usuário enrolou → seguir com a recomendação e avisar.
- Checkpoint de coautoria SEMPRE antes do render final (máx 1 rodada de ajuste).
- Benchmarks de tamanho são `[HEURÍSTICA]` — não há fonte dura; ajuste pelo que performar no SEU perfil.
