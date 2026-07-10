---
name: carrossel
description: >
  Gera carrossel de Instagram completo (8-10 slides) alimentado pela fundação:
  copy cascadeada do _constructs.md (voz do operador + hero pain + linguagem de
  compra + mecanismo™ + oferta), espinha dorsal aprovada ANTES da escrita,
  design próprio com disciplina numérica, render HTML→PNG 1080×1350 via
  Playwright (com fallback HTML declarado) e legenda pronta na voz do operador.
  Funciona no dia 0 mesmo sem fundação (modo neutro) — e fica visivelmente
  melhor a cada camada instalada. Use quando o usuário rodar /carrossel,
  "carrossel sobre X", "post de carrossel", "conteúdo pro Instagram".
---

# /carrossel — Carrossel de Instagram (executor alimentado pela fundação)

Gerador de carrossel qualquer IA faz. A diferença deste: **ele lê o DNA do seu negócio antes de escrever uma palavra.** A voz é a sua (não a de LLM genérico), o gancho vem da dor que a pesquisa ELEGEU (não de brainstorm), as palavras dos slides são as que o SEU mercado usa pra descrever o problema, e o slide de virada é o seu mecanismo™ — verbatim, sem mutação. Quanto mais fundação instalada, mais o output prova por que ela existe.

**O que esta skill NÃO faz (honestidade):**
- Não promete viral. Carrossel bom aumenta salvamentos e visita ao perfil; venda vem do conjunto (perfil + oferta + destino do CTA).
- Não inventa prova. Sem caso real → o slide de prova usa matemática do custo da inação (com mark de confiança) ou sai da espinha.
- Não escreve o `_constructs.md`. Executor CONSOME o DNA; quem escreve são os módulos de fundação.
- Não pesquisa nada novo. Faltou inteligência → aponta o módulo dono e segue no modo degradado.

## Passo 0 — Contrato com a fundação (ler e DECLARAR)

Ler, nesta ordem:

1. `_constructs.md` (raiz) — INTEIRO
2. `marca/voice-dna.json` (se existir) — voz completa do operador (signature phrases / ranço), gerada pelo /setup
3. `marca/brand-tokens.json` (se existir) — **os tokens que a arte HERDA** (paleta OKLCH, tipografia display/corpo, raio, sombra, motion, density) + o **arquétipo visual** no bloco `meta`. É a fonte da cara do carrossel (CALIBRATION-CORE §25). Precedência: `clientes/[slug]/marca/` > `marca/` (workspace). Ausente → derivar do ARQUÉTIPO do nicho no Passo 4, nunca default fixo.
4. `marca/design-guide.md` — brief humano da marca (arquétipo + rationale + estilo de card/botão/seção)
5. `_contexto/preferencias.md` — tom, o que evitar
6. `.claude/rules/CALIBRATION-CORE.md` — §15 (copy pública ≠ notas internas: mark de evidência fica no `copy.md`, NUNCA vaza pra slide ou legenda), §16 (PT-BR nativo, não tradução de fórmula gringa) e **§25 (sistema visual por arquétipo: a arte HERDA os `brand-tokens.json` verbatim, zero drift; sem marca → cara específica ao ARQUÉTIPO do nicho, nunca "tech-premium" pra todo mundo)**

Depois de ler, **declarar em 2-3 linhas o que encontrou** — é a prova viva de que a fundação trabalha:

```
Fundação detectada: Operador ✅ · Mercado ✅ · Posicionamento ✅ · Oferta ⬜ · Marca ✅ (arquétipo [X])
Este carrossel sai com a SUA voz, gancho derivado do hero pain
"[nome do hero pain]" e o [Mecanismo™] como slide de virada.
A arte HERDA os brand-tokens.json (arquétipo [X]) — bg/acento/tipografia/cards saem da marca, não de default (§25).
Sem §OFERTA, o CTA sai genérico — rode /criar-oferta pra destravar CTA com promise real.
```

Adaptar ao que existe de verdade. **NUNCA travar por fundação faltando** — este executor entrega quick win no dia 0, nem que seja só com a voz da Camada 0, ou 100% neutro.

## O que este executor lê da fundação (progressive enhancement)

| Construct | SE EXISTE → melhora NOMEADA | SE FALTA → degradação graciosa |
|---|---|---|
| §OPERADOR — voz (signature phrases, power words, ranço) | **Como o carrossel fala.** Copy e legenda saem no jeito dele; ranço vira ban-list adicional | Tom neutro-direto competente. Convite: "rode `/setup` pra este carrossel falar como VOCÊ" |
| §NICHO — hero pain + evidência | **O ângulo do gancho.** Slide 1 ataca a dor eleita com dado, não tema chutado; skill PROPÕE 3 ângulos derivados dela | Pede tema ao usuário + propõe 3 formatos genéricos de ângulo. Convite: "rode `/mapear-mercado` pra desbloquear ângulos de dor com evidência" |
| §NICHO — linguagem de compra (pain/outcome words verbatim) | **As palavras EXATAS nos slides.** Mercado se reconhece no texto ("cadeira vazia", não "otimização de agenda") | Usa linguagem do tema dado pelo usuário, marcada como não-validada. Mesmo convite acima |
| §NICHO — custo da inação (número âncora) | **O número do slide de tensão.** Tensão com R$ dói mais que adjetivo | Tensão qualitativa (mais fraca). Mesmo convite acima |
| §POSICIONAMENTO — vilão + mecanismo™ | **O slide de virada.** Vilão nomeado no slide de erro comum; mecanismo™ VERBATIM no slide de solução (zero paráfrase, zero rebatismo) | Virada vira "a abordagem certa" sem nome próprio. Convite: "rode `/posicionar` pra ter um mecanismo™ nomeado que propaga em tudo" |
| §OFERTA — promise + garantia | **O CTA.** Slide final e legenda fecham com promise real (N + outcome + prazo) e destino claro | CTA soft ("me chama no direct" / "salva esse post"). Convite: "rode `/criar-oferta` pra CTA com promise calculada" |
| §CONCORRÊNCIA — THE GAP | **Ângulo bônus.** "O que todo mundo no mercado promete e não entrega" é gancho forte | Sem ângulo de gap. Convite: "rode `/escanear-concorrencia`" |
| `marca/brand-tokens.json` + `marca/design-guide.md` | **A cara (herdada, §25).** Bg, acento, tipografia, raio, sombra e estilo de card saem VERBATIM dos tokens — zero drift, o mesmo valor OKLCH no asset e no JSON | Sem marca → derivar a cara do **ARQUÉTIPO do nicho** (Passo 4), NUNCA o default fixo "tech-premium". Convite: "rode `/marca` pra travar o sistema visual (paleta + tipografia + arquétipo) que todos os assets herdam" |

## Passo 1 — Tema e ângulo

**Se o usuário DEU tema:** espelhar + afiar em ângulo ("tema" é assunto; "ângulo" é a afirmação específica que o carrossel defende). Confirmar em 1 linha.

**Se NÃO deu tema** (e §NICHO existe): NÃO perguntar "sobre o que você quer postar?". Fundação trabalhando = a skill PROPÕE. Derivar **3 ângulos do hero pain**, cada um com gancho rascunhado:

```
Sem tema? A fundação sugere. Seu hero pain é "[X]" [fonte, mark]. 3 ângulos:

1. CONTRAINTUITIVO — "[o erro que o mercado comete achando que resolve X]"
2. CUSTO DA INAÇÃO — "[quanto custa por mês conviver com X, em número]"
3. DESMONTE DO VILÃO — "[por que (vilão) é o verdadeiro culpado de X]"

Qual dos 3 (ou mistura)? Posso também rascunhar outro se nenhum te pegou.
```

**Se não deu tema E não há fundação:** perguntar o tema (UMA pergunta) + 2 fatos que só ele sabe (um número real do negócio, uma objeção que ouve sempre). Se enrolar, registrar o que tem e seguir neutro.

## Passo 2 — Espinha dorsal (checkpoint de coautoria — OBRIGATÓRIO)

Montar a espinha de **8-10 slides** e apresentar pra aprovação ANTES de escrever a copy completa. Estrutura canônica (adaptar quantidade, nunca a ordem lógica):

| # | Slide | Função | Construct que alimenta |
|---|---|---|---|
| 1 | GANCHO (capa) | parar o dedo — a afirmação do ângulo | hero pain + linguagem de compra |
| 2 | TENSÃO | agitar com número (custo da inação) | §NICHO número âncora |
| 3 | TENSÃO 2 / erro comum | o que o mercado tenta e falha | vilão (§POSICIONAMENTO) |
| 4 | MECANISMO™ | a virada — nome verbatim + o que faz | §POSICIONAMENTO |
| 5-6 | COMO FUNCIONA | 2-3 componentes, um por slide, outcome-first | §POSICIONAMENTO / §OFERTA stack |
| 7 | PROVA | caso real com número OU matemática do custo da inação (com mark) | §OFERTA prova / §NICHO |
| 8 | VIRADA DO LEITOR | o antes/depois na cabeça de quem lê — o que muda se aplicar | promise (§OFERTA) |
| 9 | OBJEÇÃO | matar a objeção nº 1 em uma frase | §CONCORRÊNCIA gap / §NICHO |
| 10 | CTA | próximo passo ÚNICO | §OFERTA promise ou CTA soft |

Apresentar como lista numerada com 1 linha por slide + de onde veio (trace). Perguntar:

> "Essa é a espinha. Aprova, ou mexe em algo antes de eu escrever a copy final?"

**Esperar a resposta.** Usuário é coautor da direção; a skill é coautora da execução. Só depois do OK escrever a copy slide a slide.

## Passo 3 — Copy dos slides (craft gates anti-slop)

Regras de escrita:

- **1 ideia por slide.** Slide com "e também" está errado.
- **Display ≤8 palavras · corpo ≤20 palavras** [HEURÍSTICA — legibilidade de feed, sem fonte formal]. Cortou e doeu? Corta de novo.
- **Linguagem de compra VERBATIM** onde existir — as palavras do mercado, não sinônimo bonito.
- **Números carregam mark internamente:** no arquivo `copy.md` todo número cita fonte + [GOLD/SILVER/BRONZE/HEURÍSTICA]. Na arte o mark não aparece — mas número sem fonte NÃO entra na arte.
- **Mecanismo™ verbatim.** Mudou na sua cabeça? Não muda aqui — rode `/posicionar` de novo.

**Gate 1 — Teste de substituição:** trocar o nicho do carrossel por outro qualquer. Se a copy ainda funcionar, tá genérica — REFAZER com linguagem de compra + números do nicho. Aplicar slide a slide, não só no conjunto.

**Gate 2 — Teste de voz alta:** ler gancho + legenda em voz alta (mentalmente, frase a frase). Soa como o operador falaria num áudio de WhatsApp? Se soa como post de LinkedIn corporativo ou legenda de coach, reescrever usando as signature phrases do §OPERADOR e respeitando a lista de ranço.

**Gate 3 — Ban-list (refusal automático, reescreve na hora):**

```
guru-português: transformação, mindset, sucesso (vago), guru, próximo nível,
alavancar, destravar (metafórico), escala exponencial, jornada, propósito (vago),
imersão, virar a chave, mentalidade, abundância, high performance
IA-inglês: leverage, unlock, empower, harness, seamless, robust, game-changing,
revolutionary, transformative, cutting-edge, dive deep, delve
frases: "Boost your X", "no mundo acelerado de hoje", "não é sobre X, é sobre Y",
"a verdade que ninguém te conta", "o segredo que os gurus escondem"
tiques visuais: emoji em display · mais de 1 emoji por slide · reticências de
suspense em todo slide · TUDO EM CAPS (caps só em 1-3 palavras de ênfase)
+ a lista de "ranço" do §OPERADOR (vale como ban-list pessoal)
```

**Gate 4 — Checkpoint final de coautoria:** mostrar a copy completa (formato compacto: slide → texto) e confirmar antes de renderizar. Ajuste é barato em texto e caro em PNG.

## Passo 4 — Design (sistema próprio, disciplina numérica)

**Fonte da cara — herança primeiro (CALIBRATION-CORE §25):**

1. **`marca/brand-tokens.json` existe → a arte HERDA, zero drift.** Bg, acento(s), tipografia (display/corpo), raio, sombra, motion e density saem VERBATIM dos tokens — o valor OKLCH que entra no slide é o MESMO do JSON (o teste de drift do `/marca` valida isso). Precedência: `clientes/[slug]/marca/` > `marca/` (workspace). Os tokens numéricos da tabela abaixo viram só o ESQUELETO de layout (canvas, margem, escala de tamanhos, spacing) — cor e tipografia vêm da marca.
2. **Sem `brand-tokens.json` → derivar a cara do ARQUÉTIPO do nicho** (mesmo dispatcher do `/marca`: Clinical Premium / Performance Operations / Local Specialist / AI Infrastructure, ou derivado próprio). Clínica não sai igual a box de crossfit; agência de IA não sai igual a HVAC local. Escolher a direção condizente com nicho/ICP/ticket/confiança/regulação/categoria-emocional — **NUNCA o default fixo "tech-premium" pra todo mundo.** Convite: "rode `/marca` pra travar isso de vez e todos os assets herdarem."

**Não copiar o design de nenhum concorrente ou template de mercado — o sistema é nosso**, com a mesma disciplina de número que um bom designer usaria:

| Token | Valor | Por quê |
|---|---|---|
| Canvas | 1080×1350 (4:5) | maior área vertical no feed |
| Margem de segurança | 96px em todos os lados | nada de texto além dela, nunca |
| Grid de spacing | múltiplos de 8px | ritmo vertical consistente |
| Display (Manchete) | 104px · line-height 1.05 · letter-spacing −0.03em | título grande, kerning apertado em display |
| Título (Régua) | 64px · 1.12 · −0.02em | hierarquia clara abaixo do display |
| Corpo | 38px · 1.4 · 0 | legível no celular sem zoom |
| Eyebrow | 24px · CAIXA ALTA · +0.12em | rótulo, não competição com o título |
| Paginação | 24px, canto inferior direito ("03/09") | sinaliza swipe |
| Contraste texto/fundo | ≥7:1 no corpo (WCAG AAA) | leitura com brilho baixo, no sol |
| Famílias tipográficas | máx. 2 (1 display + 1 corpo) | mais que isso vira ruído |
| Cores | HERDADAS do `brand-tokens.json` (verbatim) · sem marca → paleta do ARQUÉTIPO | zero drift com a marca; sem marca, a cor bate o arquétipo (Clinical = base clara/neutra + teal profundo · Performance Ops = base escura + status verde/azul/âmbar · AI Infra = dark arquitetural + elétrico contido · Local = neutro quente + acento confiável), nunca o mesmo neutro pra todos. Scaffold de última instância (só sem arquétipo detectável): fundo `#101014` · texto `#F4F4F2` · acento `#E8FF47` |

**3 layouts nomeados** (todo slide usa um deles — nada fora do sistema):

- **MANCHETE** — capa (1) e virada (4, 8). Display gigante em 2-4 linhas, 1-3 palavras-chave em cor de acento. Zero corpo de texto. Eyebrow opcional no topo.
- **RÉGUA** — slides de corpo (2, 3, 5, 6, 9). Eyebrow + título + corpo curto + paginação + barra de progresso fina no rodapé (largura proporcional a N/total, 4px de altura, cor de acento).
- **PLACA** — prova (7) e CTA (10). Hierarquia invertida: o número ou a frase-chave em 120px no centro, contexto em 32px embaixo. Moldura de 2px na cor de acento a 48px da borda.

Fontes: **HERDAR do `brand-tokens.json`** (tipografia display/corpo dos tokens; se houver `@font-face` local em `marca/`, referenciar). Sem marca → a família condizente com o arquétipo (Clinical/Local = humanista de alta legibilidade · Performance Ops = geométrica com toque mono · AI Infra = mono+geométrica). Último recurso: `Inter` via Google Fonts com fallback declarado `system-ui, -apple-system, sans-serif` (offline renderiza no fallback — degrada, não quebra).

## Passo 5 — Render HTML→PNG (Playwright via npx, com verificação + fallback)

Gerar **1 arquivo HTML auto-contido por slide** em `slides/` (CSS inline, body fixo 1080×1350, zero dependência externa além da fonte). **Os valores de cor/fonte abaixo são ilustrativos — substituir pelos tokens HERDADOS do `brand-tokens.json` (ou os do arquétipo, se sem marca), §25.** O esqueleto de layout (dimensões, padding 96px, escala de tamanhos) não muda; só a paleta e a tipografia vêm da marca:

```html
<!doctype html><html><head><meta charset="utf-8"><style>
  * { margin:0; box-sizing:border-box; }
  body { width:1080px; height:1350px; background:#101014; color:#F4F4F2;
         font-family:'Inter',system-ui,sans-serif; padding:96px;
         display:flex; flex-direction:column; justify-content:center; }
  .display { font-size:104px; line-height:1.05; letter-spacing:-0.03em; font-weight:800; }
  .acento { color:#E8FF47; }
  /* cores/fontes acima = HERDADAS do brand-tokens.json (§25); demais tokens do Passo 4, por layout */
</style></head><body class="layout-manchete"> ... </body></html>
```

Sequência de render (com verificação em cada degrau):

```bash
# 1. VERIFICAR se Playwright roda nesta máquina
npx -y playwright --version
# 2. Garantir o browser (primeira vez baixa ~120MB — avisar o usuário)
npx -y playwright install chromium
# 3. Renderizar slide a slide
npx -y playwright screenshot --viewport-size=1080,1350 \
  --wait-for-timeout=2000 "slides/slide-01.html" "png/slide-01.png"
```

**Inspeção obrigatória antes do lote:** renderizar SÓ o slide 1, ABRIR o PNG (Read da imagem) e checar visualmente: glifo faltando (símbolo virando quadrado), texto vazando a margem de 96px, contraste, quebra de linha feia. Só depois de aprovado renderizar os demais. PNG gerado ≠ PNG certo.

**Fallback declarado (se qualquer degrau falhar — npx bloqueado, download do browser falhou, sem internet):** NÃO travar. Entregar os HTMLs prontos + `PREVIEW.md` ensinando o render manual:

```
1. Abra slides/slide-01.html no Chrome
2. F12 (DevTools) → ícone de celular (device toolbar) → dimensões 1080×1350
3. Cmd+Shift+P (Ctrl+Shift+P no Windows) → "Capture screenshot"
4. Repita por slide. O PNG sai exatamente no tamanho do canvas.
```

## Passo 6 — Legenda (na voz do operador)

Estrutura:

```
[PRIMEIRA LINHA — gancho ≤125 caracteres [HEURÍSTICA — ponto de corte do
 "...mais" no feed]. COMPLEMENTA o slide 1, não repete: se a capa afirma,
 a primeira linha provoca ou contextualiza]
[corpo — 3-6 linhas curtas, 1 frase por linha, voz do §OPERADOR com
 signature phrases; expande a ideia do carrossel sem reexplicar slide a slide]
[CTA — o MESMO do slide 10, palavra por palavra (zero drift)]
[3-5 hashtags específicas do nicho — nada de #marketing #empreendedorismo]
```

Gerar também **1 variação alternativa da primeira linha** (ângulo diferente) pra teste A/B manual.

## Output — `ads/carrosseis/[slug]/`

```
ads/carrosseis/[slug]/
├── copy.md        ← ângulo + espinha aprovada + copy por slide + TRACE
│                     (slide → construct de origem) + marks de todo número
├── legenda.md     ← legenda pronta + variação A/B da primeira linha
├── slides/        ← slide-01.html ... slide-NN.html (auto-contidos)
├── png/           ← slide-01.png ... (se o render rodou)
└── PREVIEW.md     ← instruções de render manual (SEMPRE gerado)
```

Adicionar 1 linha na tabela de `ads/_index.md` (slug · "carrossel orgânico" · Instagram · status). **Não escrever no `_constructs.md`** — executor consome o DNA, não o edita.

## Mensagem final + handoff

```
═══════════════════════════════════════════════
  CARROSSEL: [slug] · [N] slides · ângulo: [ângulo]
═══════════════════════════════════════════════

FUNDAÇÃO USADA
  ✓ Voz: §OPERADOR ([como])          ✓/⬜ Mecanismo™: [nome verbatim]
  ✓/⬜ Gancho: hero pain "[X]"        ✓/⬜ CTA: §OFERTA
  ✓/◐ Marca: [arquétipo] ([tokens herdados / arquétipo do nicho, sem marca])
  [se algo ⬜: 1 linha de convite pro módulo dono]

CRAFT GATES
  ✓ Substituição (não sobrevive fora do nicho)
  ✓ Voz alta · ✓ Ban-list zero ocorrências · ✓ Espinha e copy aprovadas por você

RENDER
  ✓ png/ ([N] arquivos, slide 1 inspecionado)   — ou —
  ⚠ Playwright indisponível → HTMLs prontos + PREVIEW.md (2 min por slide)

PRÓXIMO PASSO
  1. Postar e observar salvamentos + visitas ao perfil (48h)
  2. CTA aponta pra onde? Sem destino → /criar-lp
  3. Próximo carrossel: /carrossel com o ângulo [2/3] que ficou na mesa
```

## Regras (resumo executável)

- Ler `_constructs.md` ANTES de tudo + DECLARAR o que encontrou (Passo 0)
- NUNCA travar por fundação faltando — degradar gracioso + convite de 1 linha
- Sem tema + com hero pain → PROPOR 3 ângulos (fundação trabalha, não espera)
- Espinha aprovada ANTES da copy · copy aprovada ANTES do render (2 checkpoints)
- Mecanismo™, linguagem de compra e CTA da oferta = VERBATIM (zero drift)
- 4 craft gates: substituição · voz alta · ban-list · coautoria
- Design: arte HERDA `brand-tokens.json` verbatim (§25); sem marca → cara do ARQUÉTIPO do nicho, nunca default fixo; só os 3 layouts do sistema, tokens numéricos do Passo 4, contraste ≥7:1
- Render: verificar Playwright → inspecionar slide 1 → lote. Falhou → HTML + PREVIEW.md, nunca trava
- Número sem fonte não entra na arte; todo número tem mark no copy.md
- Executor não escreve o `_constructs.md`
