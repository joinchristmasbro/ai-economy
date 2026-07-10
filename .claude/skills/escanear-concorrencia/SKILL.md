---
name: escanear-concorrencia
description: >
  Escaneia a concorrência do nicho: descobre quem está VENDENDO de verdade
  (ads ativos via Meta Ad Library + LPs com pricing público), aplica score de
  modelabilidade em 3 sinais (dias rodando, variações, LP com oferta) e nomeia
  THE GAP — a brecha onde os que funcionam NÃO estão. Atualiza a seção
  CONCORRÊNCIA do _constructs.md. Use quando rodar /escanear-concorrencia,
  depois do /mapear-mercado e antes do /posicionar. Substitui /spy-ads.
---

# /escanear-concorrencia — quem vende de verdade no seu nicho (e onde eles NÃO estão)

Este módulo responde 3 perguntas que você não consegue responder sozinho:

1. **Quem está vendendo DE VERDADE** neste nicho? (não quem é famoso — quem tem ad rodando há meses e LP com oferta no ar)
2. **Qual a brecha (THE GAP)?** Onde os players que funcionam NÃO estão — classificada em 2 tipos, com evidência.
3. **O que os que funcionam fazem de diferente?** Mecanismos (oferta, garantia, funil, qualificação) — não estética.

**Princípio:** quem sustenta anúncio pago por 90+ dias está lucrando com ele — anúncio que não vende é desligado. A lista de ads ativos antigos é a lista de "quem opera com tração". Follower não paga boleto; ad rodando há 6 meses sim.

Você não preenche nada de cabeça aqui. O sistema pesquisa, pontua e decide. Seu único trabalho é confirmar o país-alvo e reagir ao resultado.

---

## Ferramentas + fallback chain

| Etapa | Primária | Se falhar | Se falhar de novo |
|---|---|---|---|
| Ads ativos | Firecrawl (mecânica do /ad-library-scan) | WebSearch: `"[player]" site:facebook.com/ads/library` + `"[nicho]" anúncio ativo` | Marcar `[DADOS INSUFICIENTES — ads]` e seguir só com LPs |
| LPs + pricing | Firecrawl scrape da LP | WebSearch: `"[player]" preço OR investimento OR planos` | Marcar `[DADOS INSUFICIENTES — pricing]` |

**Nunca inventar player, preço ou "dias rodando".** Dado sem fonte = `[D.I.]`. O score só usa o que foi verificado.

**Evidence marking em todo claim (rubrica unificada — CALIBRATION-CORE §6):**
- **[GOLD-LP]** — visto direto na página/ad do player: ad na Meta Ad Library com "Started running on [data]", pricing literal em LP scrapada. **Prova o que a página DIZ, não que o número é verdade.**
- **[CLAIM-CONCORRENTE]** — número/promessa de RESULTADO que o concorrente afirma ("+300% de leads", "R$50k/mês pros clientes"), mesmo que visto na LP. É marketing dele, NÃO verificado externamente — nunca tratar como fato.
- **[SILVER]** — fonte secundária confiável (matéria, diretório, review recente). **Blog/conteúdo do próprio player, de agência ou de software que vende pro nicho = teto SILVER** (é parte interessada).
- **[BRONZE]** — 1 fonte, não verificada (estimativa calculada, mostra a conta).
- **[D.I.]** — não achou; declara, não preenche.

---

## Etapa 0 — Ler o estado (gate obrigatório)

1. Ler `.claude/rules/CALIBRATION-CORE.md` (§6 rubrica de evidência, §7 Firecrawl ≠ Ad Library) + `_constructs.md` INTEIRO. Guardar DUAS coisas de seções diferentes: **NICHO / MERCADO** (o mercado-ALVO — ex: "clínicas de estética") e **OPERADOR** (o que VOCÊ vende — o campo "o que vende hoje / pra quem"). São conjuntos diferentes — o ponto 4 explica por quê.

2. **Checar o Firecrawl (gate de qualidade, não bloqueio) — mas Firecrawl ≠ Ad Library (CORE §7).** Ler `_contexto/mcps-instalados.md`. Firecrawl é UMA via de coleta pra Meta Ad Library — não a única (há acesso manual à Ad Library, outros scrapers, Google Ads Transparency, TikTok Creative Center). Se Firecrawl está ✓ instalado → seguir. Se está pendente/skipado → NÃO degradar em silêncio, e **NÃO confundir "sem Firecrawl" com "sem tração"** — o que falta é ESTA via de coleta, não a existência de tração no mercado. Avisar:

```
O Firecrawl não está instalado nesta caixa.

Firecrawl é a via automática que uso pra ler a Meta Ad Library (ads ativos +
"dias rodando" + variações). SEM ele, essa via de coleta cai — mas isso é
"sem esta forma de acessar a Ad Library", NÃO "esses players não têm tração".

Sem os dados de tração (dias/variações), os sinais 1 e 2 ficam [D.I. — tração:
sem via de Ad Library] e nenhum player pode ser declarado MODELÁVEL (§7: não
se declara tração sem evidência de tração). O veredito de cada player fica no
teto de ~2/6 (só a LP pontua).

Como quer seguir?
  1) Instalar agora (~5 min, grátis) — recomendado
     → claude mcp add firecrawl --env FIRECRAWL_API_KEY=...
     → signup grátis em firecrawl.dev
  2) Acessar a Ad Library manualmente (facebook.com/ads/library) e me colar o que ver
  3) Modo reduzido — só LPs + pricing via WebSearch (sem dado de tração)
```

Se modo reduzido: marcar o scan `[PARCIAL — sem via de Ad Library]`; o sinal 1 de todo player vira `[D.I. — tração]`, ninguém é declarado MODELÁVEL (veredito máx = sinal misto — §7 proíbe declarar modelável sem tração) e a Etapa 4 (swipe) sai como hipótese, não como padrão validado. **Ao reportar, dizer "sem Ad Library" quando o gargalo é tração de anúncios — nunca terceirizar a culpa só pro Firecrawl.**

3. **Se NICHO / MERCADO está vazio → PARAR.** Dizer:

```
A seção NICHO/MERCADO do seu _constructs.md ainda está vazia.
Sem nicho definido + hero pain eleito, escanear concorrência vira turismo.

Rode primeiro: /mapear-mercado
```

4. **Declarar EXPLÍCITO quem é o concorrente (o fork que decide todo o downstream).** O concorrente NÃO é o seu nicho-alvo — é quem DISPUTA o mesmo cliente que você. Fixar antes de qualquer busca:

> **Concorrente = quem vende [o que o §OPERADOR vende] PARA [o §NICHO], não o próprio [§NICHO].**
> Ex: você vende marketing/growth para clínica de estética → o concorrente é *outra agência/operador que vende marketing para clínica de estética*, NÃO a clínica (a clínica é seu CLIENTE, não seu rival).

Montar a keyword-base de busca no formato **"[serviço do operador] para [nicho]"** — ex: `marketing para clínica de estética`, `agência para clínica de estética`, `tráfego para clínica de estética`. Toda busca da Etapa 1 parte daí: buscar só o nome do nicho traz o próprio nicho anunciando, não os rivais do operador. Errar esse fork joga TODO o downstream (gap, posicionamento, oferta) pro lado errado.

5. Se o nicho existe, fazer **UMA pergunta** (uma por vez, sempre):

```
Vou escanear quem vende [serviço do §OPERADOR] para [NICHO do _constructs.md].
País-alvo dos anúncios? (Enter = BR)
```

6. Modos de invocação:

```
/escanear-concorrencia            → escaneia o nicho inteiro (default)
/escanear-concorrencia [player]   → foco: só esse player, em profundidade
```

---

## Etapa 1 — Descobrir os players (coleta)

### 1A. Ads ativos — reusar a mecânica do /ad-library-scan

**Não reimplementar.** Executar a coleta exatamente como definida em `.claude/skills/ad-library-scan/SKILL.md` (Pipeline, etapas 1-3): URL da Meta Ad Library com `country={COUNTRY}`, scrape Firecrawl com scrolls + waits, validação de volume, extração estruturada por ad (brand, copy, CTA, **dias rodando**, plataformas, **variações**).

Rodar 2 buscas:
- **Por keyword-serviço** (o formato fixado na Etapa 0: `"[serviço do operador] para [nicho]"` + 1-2 variações — `agência para [nicho]`, `tráfego/marketing para [nicho]`, `como conseguir clientes para [nicho]`). Isso traz quem ANUNCIA vendendo pro nicho — os rivais do operador — não o nicho anunciando a si mesmo. Podem entrar 1-2 termos da "linguagem de compra" do _constructs.md, mas sempre no formato "serviço PARA nicho".
- **Por marca**, pra cada player que emergir com 2+ ads na busca por keyword-serviço

### 1B. LPs + pricing público — WebSearch + Firecrawl

Pra cada player detectado nos ads (ou informado pelo usuário):
1. Seguir o destino do CTA do ad (ou WebSearch `"[player]" + [nicho]`) até a LP
2. Firecrawl scrape da LP: headline, oferta, pricing visível, CTA de venda (agendar/comprar/aplicar)
3. WebSearch complementar: `"[player]" preço`, `"[player]" quanto custa` — pricing citado fora da LP é [SILVER]

**Meta de volume:** 3-7 players com dado verificável. Menos de 3 → declarar `[DADOS INSUFICIENTES — N/7 players verificados]` no artefato e seguir com o que tem.

### Se a busca retornar ZERO players

**Não declarar "mercado virgem".** Em mercado BR de serviços, quando a busca retorna zero, a causa mais provável é busca mal calibrada (keyword errada, país errado, nicho descrito em jargão que o mercado não usa) — não categoria vazia [HEURÍSTICA — prior do OS-mãe: ~90% dos "zero competidor" caem após segunda busca]. Antes de concluir ausência:
1. Repetir 1A com 2-3 keywords alternativas (sinônimos + linguagem de compra do _constructs.md)
2. Repetir sem filtro de país (ALL) pra ver se a categoria existe fora
3. Só então registrar: `[Busca 2x recalibrada + global: ZERO players verificados]` — e tratar isso como ALERTA no /posicionar, não como festa

### 1C. Filtro de niche-fit (binário — ANTES de pontuar qualquer um)

A keyword "[serviço] para [nicho]" reduz o lixo, mas não zera: ainda vêm advogado do setor, software de gestão, curso pra donos do nicho, e o próprio nicho anunciando. Antes de gastar score em alguém, passar CADA player detectado por uma pergunta sim/não:

> **Este player vende marketing/growth (ou o mesmo serviço do §OPERADOR) PARA o [§NICHO]?**

- **SIM** → segue pra Etapa 2 (score de modelabilidade).
- **NÃO** → sai agora, sem pontuar. Registrar 1 linha no artefato: `[excluído — não vende [serviço] pro nicho: é [o que é]]` (ex: "advogado do setor", "SaaS de agendamento", "curso pra donos", "a própria clínica anunciando").

Player que falha o filtro NÃO entra na tabela de score — pontuar rival irrelevante polui THE GAP e faz o /posicionar mirar no alvo errado.

---

## Etapa 2 — Score de modelabilidade (3 sinais, 0-6)

Entram aqui **só os players que passaram o filtro de niche-fit (1C)**. Pra cada um, pontuar SÓ com dado verificado. Escala comprimida do framework do OS-mãe [HEURÍSTICA — thresholds simplificados; base empírica citada por sinal]:

| Sinal | 2 pts | 1 pt | 0 pts |
|---|---|---|---|
| **1. Dias rodando** (o mais forte) | >90 dias — proven winner: só ~11% dos ads sobrevivem além de 60 dias [SILVER — Brandsearch, dataset 47K ads] | 30-90 dias — validando | <30 dias ou sem dado — nada provado |
| **2. Densidade de variações** | 5+ variações ativas do mesmo ângulo — está ESCALANDO | 2-4 variações — testando com verba | 0-1 — teste solto |
| **3. LP ativa com oferta** | LP no ar com oferta clara + pricing OU CTA de venda direto | LP no ar com CTA mas sem oferta/pricing visível | LP genérica, institucional ou fora do ar |

**Interpretação:**

| Score | Veredito | O que fazer |
|---|---|---|
| 5-6 | **MODELÁVEL** | Referência primária — o swipe de mecanismos (Etapa 4) sai daqui |
| 3-4 | Sinal misto | Registrar, citar com ressalva, não modelar às cegas |
| 0-2 | Sem tração provada | Listar e ignorar na análise — pode ser novato ou já morto |

### Por que followers/audiência valem ZERO no score

Audiência não é sinal de venda: uma agência de marketing dental US de referência tem **~72 seguidores no Instagram** e mais de **$30M investidos em ads** ao longo de 10+ anos — quem filtra por follower excluiria um dos players mais lucrativos do nicho dela [GOLD — perfil público + claims verificados no OS-mãe]. Follower mede fama; ad antigo + LP com oferta medem CAIXA. Se quiser, cite a audiência como observação de contexto no texto — nunca como coluna do score.

---

## Etapa 3 — Nomear THE GAP (a brecha)

THE GAP = onde os players MODELÁVEIS **não** estão. Só existe gap se houver evidência dos dois lados: (a) prova de que os que funcionam estão em X, e (b) prova de que ninguém verificado está em Y.

Classificar em **um** de 2 tipos:

| Tipo | Definição | Evidência exigida |
|---|---|---|
| **TIER VAZIO** | A faixa de preço/entrega entre os players está desocupada (ex: player A cobra R$500/mês básico, player B cobra R$15K/mês enterprise — o meio, R$2-5K, está vazio) | Pricing verificado [GOLD/SILVER] de 2+ players + ausência confirmada na faixa intermediária |
| **ICP MAL SERVIDO** | Os players atendem outro perfil de cliente (porte, maturidade, sub-segmento) e o ICP do seu _constructs.md fica sem opção calibrada (ex: todos falam com clínica multi-unidade; o solo está órfão) | ICP dos players inferido de LP/copy scrapada [GOLD] + contraste explícito com o NICHO/MERCADO do _constructs.md |

**Formato obrigatório do gap (com trilha de evidência):**

```
THE GAP [tipo: TIER VAZIO | ICP MAL SERVIDO]:
[frase única e específica]
Evidência: [player A faz X — fonte] · [player B faz Y — fonte] · [ninguém verificado faz Z — busca N players]
```

Se a evidência não sustenta nenhum dos 2 tipos → registrar `GAP: [DADOS INSUFICIENTES — mercado coberto ou coleta rasa]`. Gap forçado vira posicionamento de fantasia no /posicionar — pior que gap nenhum.

---

## Etapa 4 — Swipe de mecanismos (o que os que funcionam fazem de DIFERENTE)

Só dos players MODELÁVEIS (score 5-6). Extrair **mecanismos**, não estética — cor de botão e foto bonita não explicam por que o ad roda há 8 meses.

**Gatilho de fonte-única (< 2 players modeláveis):** se houver menos de 2 players com score 5-6, o swipe sai de 1 fonte só — e isso é viés: você estaria tratando o mecanismo de um único operador como se fosse padrão do mercado. Nesse caso:
- Declarar no artefato: `[SWIPE MONO-FONTE — 1 player modelável; padrão não triangulado, tratar como hipótese]`.
- Fica AUTORIZADO puxar os players de **sinal misto (score 3-4)** pro swipe, cada mecanismo marcado **"com ressalva"** (score 3-4 = tração não confirmada; o mecanismo pode não ser o que sustenta a venda). Nunca puxar score 0-2 (sem tração provada = sem sinal).
- O /posicionar herda esse alerta e trata o mecanismo derivado como aposta a validar, não como verdade de mercado.

Procurar:

- **Estrutura da oferta:** o que prometem, com que número, em que prazo
- **Modelo de cobrança:** setup + recorrência? projeto? tiers? (comparar com o princípio setup+recorrência do `_contexto/modelo-nova-economia.md`)
- **Garantia / reversão de risco:** existe? é específica ou decorativa?
- **Passo de qualificação:** o CTA leva pra compra direta, agendamento, aplicação, quiz? (o degrau do funil é decisão de mecanismo)
- **Ângulo do hook que sobrevive:** qual dor/resultado o ad mais antigo ataca (esse ângulo está PAGO — validado com dinheiro alheio)

Cada mecanismo com fonte: `[player — ad de N dias / LP scrapada]`.

**O que NÃO entra no swipe:** paleta, fonte, "vibe", frases pra copiar verbatim. Copiar copy de concorrente queima credibilidade e vira commodity — o /posicionar usa mecanismos pra DERIVAR o seu, não pra clonar.

---

## Etapa 5 — Artefato: `nicho/concorrencia.md`

Escrever o arquivo (frontmatter YAML com data + país + nicho). Estrutura:

```markdown
# Concorrência — [nicho] · [país] · [data]

## Players (score de modelabilidade 0-6)

| Player | Dias rodando | Variações | LP + oferta | Score | Veredito | Fontes |
|---|---|---|---|---|---|---|
| [nome] | 140d [GOLD] | 6 ativas [GOLD] | pricing R$X visível [GOLD] | 6/6 | MODELÁVEL | [links] |
| [nome] | 45d [GOLD] | 2 [GOLD] | CTA sem pricing | 3/6 | sinal misto | [links] |
| ... | | | | | | |

(Audiência/followers: ZERO peso no score — ver skill. Contexto opcional no texto.)

## THE GAP

[bloco no formato obrigatório da Etapa 3, com tipo + evidência]

## Swipe de mecanismos (players modeláveis)

1. **[mecanismo]** — [player, fonte]. Por que sustenta: [1-2 frases]
2. ...

## Limites desta coleta
[o que ficou [DADOS INSUFICIENTES], créditos Firecrawl usados, data — este arquivo decai: ads morrem; re-escanear em ~30-60 dias]
```

---

## Etapa 6 — Atualizar `_constructs.md`

Atualizar SÓ a seção **CONCORRÊNCIA** (e a linha de STATUS):

```markdown
## CONCORRÊNCIA (preenchido pelo /escanear-concorrencia)

- **Players mapeados (nome · tempo rodando · sinal de tração):** [top 3-5, com score]
- **THE GAP (a brecha, classificada):** [TIER VAZIO | ICP MAL SERVIDO] — [frase + evidência resumida]
- **O que os que funcionam fazem de diferente:** [2-4 mecanismos, com fonte]
```

E na tabela STATUS DA INSTALAÇÃO: `1 — Concorrência | /escanear-concorrencia | ✅ instalado | [data]`.

Esses constructs propagam VERBATIM pro /posicionar e pro /criar-oferta — não parafrasear depois.

---

## Craft gates (rodar ANTES de entregar)

1. **Teste de substituição:** troque o nicho no THE GAP e no swipe — se ainda fizer sentido, está genérico. Refazer com o dado específico deste mercado.
2. **Trilha de evidência:** todo player na tabela tem fonte; todo claim tem [GOLD/SILVER/BRONZE]; nenhum número inventado.
3. **Ban-list:** zero "mercado virgem"/"oceano azul" sem a recalibração da Etapa 1 · zero "transformação", "mindset", "sucesso" vago, "domine o mercado" · zero coluna de followers no score.
4. **Gap honesto:** se não há gap sustentado, o artefato diz isso. `[DADOS INSUFICIENTES]` é output válido; gap inventado não é.

---

## Mensagem final

```
═══════════════════════════════════════════════
  ESCANEAR-CONCORRENCIA: [nicho] · [país]
═══════════════════════════════════════════════

PLAYERS VERIFICADOS   [N] (modeláveis: [M])
MAIS ANTIGO NO AR     [player] — [N] dias [GOLD]

THE GAP  [TIER VAZIO | ICP MAL SERVIDO]
  [frase única do gap]

MECANISMOS QUE SUSTENTAM
  1. [mecanismo] — [player]
  2. [mecanismo] — [player]

SAVED
  ✓ nicho/concorrencia.md
  ✓ _constructs.md → seção CONCORRÊNCIA + STATUS

CRÉDITOS FIRECRAWL USADOS  ~[N]

PRÓXIMO
  /posicionar — derivar seu vilão + mecanismo™ do gap
  que acabamos de nomear. É o próximo passo natural.
```
