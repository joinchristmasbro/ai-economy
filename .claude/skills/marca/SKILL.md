---
name: marca
description: >
  Gera o SISTEMA VISUAL OPERACIONAL do workspace (ou de um cliente) — brand tokens que
  TODOS os assets herdam (LP, proposta, one-page offer, post, carrossel, PDFs/HTMLs
  renderizados). NÃO é logo nem branding completo — é o design system que faz a estética
  cascatear igual a voz. Antes de gerar, roda um DISPATCHER DE ARQUÉTIPO VISUAL que escolhe
  a direção condizente com nicho/ICP/ticket/confiança/sofisticação/regulação/categoria
  emocional — nunca um "tech-premium" padrão pra todo mundo. Sem marca definida, gera um
  design system PROVISÓRIO v1 ESPECÍFICO ao nicho/arquétipo, marcado como não-final. Output:
  marca/brand-tokens.json + marca/design-guide.md. Use quando rodar /marca, "define a marca",
  "sistema visual", "brand tokens", "identidade provisória", ou antes de gerar o primeiro asset visual.
---

# /marca — o sistema visual que todos os assets herdam

Esta skill instala a camada **Marca Visual** do workspace. Ela NÃO desenha logo nem faz branding completo — ela produz o **design system operacional** (os tokens) que a LP, a proposta, o documento de oferta, o post e o carrossel LEEM e aplicam. Hoje, sem isso, cada asset improvisa a paleta OKLCH do zero toda vez — a estética não cascateia. O `/marca` resolve isso: gera UMA vez, todo asset herda.

**O que NÃO faz:** logo, naming de marca, identidade final. Se o operador não tem marca, gera uma **provisória v1** — explicitamente marcada como não-final.

**Princípio-mãe (CALIBRATION-CORE §25):** cada nicho merece um system design condizente. Clínica não parece box de crossfit; agência de IA não parece HVAC local. Por isso o **dispatcher de arquétipo roda ANTES dos tokens** — nunca um default fixo.

## Passo 0 — Carga de contexto

Ler:
1. `_constructs.md` — **§NICHO/MERCADO** (mercado + ICP + hero pain + **categoria emocional** do problema), **§POSICIONAMENTO** (mecanismo, vilão), **§OFERTA** (o que vende) e **§PRICING** (ticket). É daqui que o arquétipo é derivado.
2. `.claude/rules/CALIBRATION-CORE.md` — **§16** (PT-BR nativo), **§20** (compliance/regulação), **§25** (herança de marca + arquétipo + provisório).
3. `_contexto/preferencias.md` — se o operador já declarou algo de preferência visual.
4. Se `marca/brand-tokens.json` já existe → modo **ATUALIZAR** (não sobrescreve cego — mostra o que muda).
5. `marca/_modelo/brand-tokens.json` — o schema-base (W3C 3-camadas) que este módulo popula.

**Alvo:** workspace (`marca/`) OU cliente específico (`clientes/[slug]/marca/`). Perguntar só se ambíguo.

## Passo 1 — 🎯 DISPATCHER DE ARQUÉTIPO VISUAL (antes de qualquer token)

Escolher a direção visual a partir de **7 sinais** do nicho/oferta — nunca um default:
mercado · ICP · **tipo de confiança que o comprador precisa sentir** · ticket · sofisticação do público · contexto regulatório · **categoria emocional do problema.**

### Os 4 arquétipos canônicos

| Arquétipo | Quando (nichos) | Sensação | Evitar | Direção de tokens |
|---|---|---|---|---|
| **1. Clinical Premium / Trust & Precision** | saúde, odonto, estética, nutrição, procedimentos, áreas reguladas | confiança, precisão, limpeza, autoridade, cuidado | hype, neon, agressividade, "startup crypto" | base clara/neutra suave, acento azul/teal confiável e profundo, whitespace generoso, sombras sutis, motion contido/preciso, tipografia humanista de alta legibilidade, raio médio |
| **2. Performance Operations / Command Center** | academias boutique, boxes, studios, fitness maduro, franquias, negócios com agenda/ocupação/churn/equipe | performance, controle, operação, movimento, dados, previsibilidade | fitness genérico (halteres/suor/foto clichê), motivacional barato, SaaS genérico | base **escura ou neutra sofisticada**, **alto contraste**, acentos de **STATUS** (verde=agenda/on-track, azul=dados, âmbar=recuperação/atenção), **cards de dados**, linhas de fluxo, **grids operacionais**, componentes dashboard/agenda/funil/reativação, tipografia geométrica com toque mono, motion com propósito |
| **3. Local Specialist / Reliability & Compliance** | serviço local, facilities, HVAC, limpeza, jurídico local, reformas, manutenção | confiabilidade, presença local, execução, segurança, prova, resposta rápida | SaaS frio demais, institucional genérico | neutro quente/sólido, acento confiável, badges/certificações/provas, tipografia legível e acessível, motion contido, raio pequeno-médio |
| **4. AI Infrastructure / Revenue Intelligence** | IA, automação, revenue systems, diagnóstico, B2B tech, growth infra | inteligência, velocidade, arquitetura, precisão, sistema | "IA futurista" exagerada, gradientes aleatórios, robôs, startup genérica | dark/neutro **arquitetural**, acento preciso (elétrico mas contido), cues de sistema/arquitetura, componentes de revenue/diagnóstico, tipografia mono+geométrica, motion crisp, raio pequeno |

**Regra do dispatcher:**
- Derivar o arquétipo dos 7 sinais → **PROPOR + rationale** (1 frase por sinal) → confirmar com o operador em 1 pergunta, OU **auto-selecionar** se os sinais forem inequívocos (ex: nicho odontológico → Clinical Premium sem perguntar).
- Se o nicho não cair limpo em 1 dos 4, **derivar um arquétipo próprio** com o mesmo rigor (nunca forçar num dos 4 nem cair no tech-premium default).
- **NUNCA** default fixo "tech-premium genérico" pra todos.

### Exemplo travado (referência canônica)

**Fitness Acquisition OS → `Performance Operations / Command Center`** — e NÃO: ❌ fitness motivacional · ❌ SaaS genérico · ❌ clínica hospitalar · ❌ agência de tráfego.
A estética comunica: operação madura · agenda/ocupação/base · dados e controle · sistema instalado · inteligência comercial · premium sem parecer inacessível · energia de performance sem virar academia clichê.
Direção: base escura/neutra sofisticada · alto contraste · acentos verde/azul/âmbar ligados a status/agenda/ocupação/recuperação · cards de dados · linhas de fluxo · grids operacionais · componentes que lembram dashboard/agenda/funil/reativação · imagem/ilustração de OPERAÇÃO (não "pessoa malhando").

## Passo 2 — Modo (tem marca vs não tem)

- **(a) Tem identidade real** (cores/tipografia/logo declarados) → CAPTURA e formaliza em tokens. `provisional_status: "defined"`.
- **(b) Não tem** → GERA design system provisório v1 **ESPECÍFICO AO ARQUÉTIPO** (não genérico). `provisional_status: "provisional-v1"`.

## Passo 3 — Gerar os tokens (DERIVADOS do arquétipo)

Popular o schema W3C (base em `marca/_modelo/brand-tokens.json`), com TODA escolha derivada do arquétipo escolhido:
- **Paleta OKLCH** — base + neutros + **acento(s) de status** conforme o arquétipo (ex: Performance Ops usa verde/azul/âmbar de status; Clinical usa teal profundo; AI Infra usa elétrico contido).
- Tipografia (display/body/mono conforme arquétipo), raio, sombras, espaçamentos, motion (durations/easing), **density** (compacta pra Command Center; arejada pra Clinical).
- **Estilo de card / botão / seção** — descritos no design-guide + refletidos nos tokens de component.

## Passo 4 — Output (artefatos + auditoria)

### 4a. `marca/brand-tokens.json`
Popular o schema W3C + o bloco **`meta`** com os 9 campos:
`market_design_archetype` · `rationale` · `trust_profile` · `category_cues` · `visual_personality` · `anti_references` · `provisional_status` (`defined` | `provisional-v1`) · `source_context` (de onde veio: declarado pelo operador vs derivado do nicho) · `confidence` (GOLD/SILVER/BRONZE).

### 4b. `marca/design-guide.md`
Brief humano: **banner de provisório** (se aplicável) + arquétipo + rationale + personalidade visual + direção estética + estilo de card/botão/seção + **referências** + **anti-referências** + **regras de uso** + density + motion principles.

### 4c. Status + auditoria
- `_constructs.md` tabela STATUS: linha **Marca** → `✅ instalada` (defined) ou `◐ provisório` (provisional-v1) + data.
- Bloco de AUDITORIA (§3): arquivos gravados + arquétipo escolhido + status.

## Passo 5 — Handoff

```
Marca instalada — arquétipo: [X]. Status: [defined / PROVISÓRIO v1].
Os assets agora herdam estes tokens: /criar-lp · /proposta · /criar-oferta · /post · /carrossel.
[se provisório:] ⚠️ Design system PROVISÓRIO v1 — não é a identidade final da marca.
Gerado pra destravar os assets com estética condizente ao nicho; substitua quando tiver marca real.
```

## Regras (CALIBRATION-CORE)

- **Dispatcher SEMPRE antes dos tokens (§25)** — nunca default fixo tech-premium; o arquétipo tem que bater o nicho/ICP/ticket/confiança/regulação/categoria-emocional.
- **Provisório carrega o selo (§25)** — `provisional_status` nunca vira branding oficial em silêncio; o aviso de provisório vai nas **notas internas** dos assets, NUNCA na copy pública (§15).
- **Precedência de herança:** cliente `clientes/[slug]/marca/` > workspace `marca/` > gerar-do-zero.
- **Compliance (§20)** — nicho regulado (saúde/estética/nutrição/odonto/edu-física): o visual respeita (sem sensacionalismo/antes-e-depois no design; sobriedade que o conselho exige).
- **PT-BR nativo (§16)** no design-guide.
- **Zero drift** — o valor OKLCH que sai no asset é o mesmo do `brand-tokens.json` (o teste em §5 do CALIBRATION_PLAN valida isso).
