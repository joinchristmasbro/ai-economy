---
title: Design Guide (Brief de Marca)
type: marca/design-guide
archetype: pendente
provisional_status: pendente
confidence: pendente
created: pendente
updated: pendente
---

<!-- Preenchido pelo /marca (dispatcher de arquétipo). Skills geradoras de visual leem aqui + o brand-tokens.json. -->
<!-- Este é o BRIEF HUMANO do sistema visual; os VALORES (OKLCH, tipo, raio, sombra, motion) vivem em marca/brand-tokens.json. Zero drift entre os dois (CALIBRATION-CORE §25). -->

<!-- ⚠️ BANNER CONDICIONAL — só aparece se provisional_status == "provisional-v1". Remover este bloco quando a marca for real (provisional_status == "defined"): -->

> ⚠️ **DESIGN SYSTEM PROVISÓRIO v1 — não é a identidade final da marca (remover quando houver identidade real).**
> Gerado pelo `/marca` pra destravar os assets com estética condizente ao nicho/arquétipo — NÃO é logo, naming nem branding definitivo. O selo de provisório vive aqui e nas **notas internas** dos assets, NUNCA na copy pública (CALIBRATION-CORE §15 + §25).

# Design Guide — {{NOME_MARCA_OU_WORKSPACE}}

O sistema visual operacional deste workspace. Todo asset renderizado (LP, proposta, one-page offer, post, carrossel, HTML/PDF) **HERDA** o que está aqui + o `brand-tokens.json` — não improvisa a paleta do zero toda vez (CALIBRATION-CORE §25). Precedência de herança: `clientes/[slug]/marca/` > `marca/` (workspace) > gerar-do-zero.

---

## 1. Arquétipo visual

**Arquétipo escolhido:** `{{ARQUÉTIPO}}`
<!-- Clinical Premium / Trust & Precision · Performance Operations / Command Center · Local Specialist / Reliability & Compliance · AI Infrastructure / Revenue Intelligence · OU derivado próprio (quando o nicho não cai limpo em 1 dos 4) -->

**Rationale (por que este, derivado dos 7 sinais):** `{{RATIONALE}}`
<!-- 1 frase por sinal que sustentou a escolha: mercado · ICP · tipo de confiança que o comprador precisa sentir · ticket · sofisticação do público · contexto regulatório · categoria emocional do problema. O arquétipo é DERIVADO desses sinais, nunca um default fixo tech-premium (CALIBRATION-CORE §25). -->

**Source do contexto:** `{{SOURCE_CONTEXT}}` <!-- declarado pelo operador vs derivado do nicho -->
**Confiança:** `{{CONFIDENCE}}` <!-- GOLD / SILVER / BRONZE -->

---

## 2. Trust profile

**Que tipo de confiança o comprador precisa SENTIR ao ver o asset:** `{{TRUST_PROFILE}}`
<!-- ex.: precisão clínica + autoridade sóbria (Clinical) · controle operacional + previsibilidade de dados (Performance Ops) · confiabilidade local + prova de execução (Local Specialist) · inteligência arquitetural + velocidade (AI Infra). É o registro emocional que a estética tem que provar antes de qualquer palavra. -->

---

## 3. Personalidade visual (3-5 adjetivos)

`{{ADJETIVO_1}}` · `{{ADJETIVO_2}}` · `{{ADJETIVO_3}}` · `{{ADJETIVO_4}}` · `{{ADJETIVO_5}}`
<!-- 3 a 5 adjetivos que a marca É visualmente. ex.: preciso, limpo, sóbrio, confiável (Clinical) · operacional, denso, controlado, de alto contraste (Performance Ops). Estes adjetivos governam toda decisão abaixo. -->

---

## 4. Direção estética

Como o arquétipo vira decisão visual concreta (cada escolha DERIVA do arquétipo, e o VALOR exato mora no `brand-tokens.json`):

- **Paleta (OKLCH):** `{{PALETA}}` — base + neutros + **acento(s) de status** conforme arquétipo.
  <!-- ex.: base clara/neutra suave + teal profundo confiável (Clinical) · base escura/neutra sofisticada + verde=agenda/on-track, azul=dados, âmbar=recuperação/atenção (Performance Ops) · dark arquitetural + elétrico contido (AI Infra). Valores literais no brand-tokens.json — aqui só a INTENÇÃO. -->
- **Tipografia:** display `{{FONTE_DISPLAY}}` · corpo `{{FONTE_CORPO}}` · mono `{{FONTE_MONO}}`
  <!-- humanista de alta legibilidade (Clinical) · geométrica com toque mono (Performance Ops / AI Infra) · legível e acessível (Local Specialist) -->
- **Raio:** `{{RAIO}}` <!-- médio (Clinical) · pequeno-médio (Local) · pequeno (AI Infra) -->
- **Sombra / elevação:** `{{SOMBRA}}` <!-- sutil (Clinical) · funcional de card de dado (Performance Ops) -->
- **Espaçamento:** `{{ESPACAMENTO}}`

---

## 5. Estilo de card / botão / seção

- **Card:** `{{ESTILO_CARD}}`
  <!-- ex.: card de dado com header de status + número em destaque (Performance Ops) · card arejado com bastante whitespace e borda hairline (Clinical) · card sólido com badge de prova/certificação (Local Specialist) -->
- **Botão:** `{{ESTILO_BOTAO}}`
  <!-- forma, preenchimento, estado hover/pressed, uso do acento; o CTA usa o acento primário, ações secundárias usam neutro -->
- **Seção:** `{{ESTILO_SECAO}}`
  <!-- ritmo das seções, uso de grids operacionais / linhas de fluxo / divisórias; como uma dobra se distingue da próxima -->

---

## 6. Referências

`{{REFERÊNCIAS}}`
<!-- 2-4 referências VISUAIS que ancoram a direção (produtos/sites/dashboards que acertam o registro do arquétipo). Servem de norte, não de cópia. -->

---

## 7. Anti-referências

`{{ANTI_REFERÊNCIAS}}`
<!-- O que este visual NÃO pode parecer — o guard-rail do arquétipo (CALIBRATION-CORE §25):
  Clinical → ❌ hype, neon, agressividade, "startup crypto"
  Performance Ops → ❌ fitness genérico (halteres/suor/foto clichê), motivacional barato, SaaS genérico
  Local Specialist → ❌ SaaS frio demais, institucional genérico
  AI Infra → ❌ "IA futurista" exagerada, gradientes aleatórios, robôs, startup genérica
  E o anti-default universal: ❌ tech-premium fixo tipo Linear/Stripe pra todo mundo. -->

---

## 8. Regras de uso

- **Herança obrigatória:** todo asset visual lê ESTE guia + o `brand-tokens.json` e aplica os valores — improvisar paleta/tipo/raio do zero é drift (CALIBRATION-CORE §25).
- **Zero drift:** o OKLCH/tipo/raio que sai no asset é IDÊNTICO ao do `brand-tokens.json`. Divergiu → o asset está errado, não o token.
- **Acento com semântica:** `{{REGRA_ACENTO}}` <!-- se o arquétipo usa acentos de status (verde/azul/âmbar), cada cor carrega significado fixo (on-track/dados/atenção) e não pode ser usada decorativamente. -->
- **Compliance (§20):** `{{NOTA_COMPLIANCE}}` <!-- nicho regulado (saúde/estética/nutrição/odonto/edu-física): sobriedade que o conselho exige, sem sensacionalismo/antes-e-depois no design. Só preencher se aplicável ao nicho. -->
- **Provisório (§15 + §25):** se `provisional_status == provisional-v1`, o selo de provisório fica nas **notas internas** dos assets — NUNCA na copy pública.
- **Precedência:** cliente > workspace > gerar-do-zero.

---

## 9. Density

**Densidade da informação:** `{{DENSITY}}`
<!-- compacta pra Command Center (muito dado por tela, grids apertados) · arejada pra Clinical (whitespace generoso, respiro). Governa espaçamento, tamanho de card e quantidade de elementos por dobra. -->

---

## 10. Motion principles

**Princípios de movimento:** `{{MOTION}}`
<!-- durations + easing + intenção do arquétipo:
  Clinical → contido/preciso, transições suaves e curtas
  Performance Ops → com propósito, movimento que comunica dado/fluxo/status
  AI Infra → crisp, rápido, arquitetural
  Local Specialist → contido, sem exibicionismo.
  Valores exatos (ms/curva) no brand-tokens.json — aqui a INTENÇÃO. -->

---

<!-- SINCRONIA COM brand-tokens.json (bloco meta, 9 campos): market_design_archetype · rationale · trust_profile · category_cues · visual_personality · anti_references · provisional_status · source_context · confidence. Este guia é o espelho HUMANO desses campos — mantê-los coerentes (CALIBRATION-CORE §25). -->
