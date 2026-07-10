# _constructs.md — o DNA do seu negócio

> Este arquivo é o estado vivo da sua Camada de Inteligência™. Cada módulo do OS LÊ este arquivo antes de rodar e ATUALIZA a própria seção depois. Os constructs daqui propagam VERBATIM pra todos os seus ativos (oferta, LP, proposta, pitch) — é o que garante que tudo fala a mesma língua, com os mesmos números.
> **Não edite de cabeça.** Se algo aqui está errado, rode o módulo que o gerou de novo — construct sem evidência atrás é chute, e chute não propaga.

---

## LEGENDA (proveniência + status — CALIBRATION-CORE §2, §4)

**Selo de proveniência em todo campo forte** (o selo VIAJA no cascade — hipótese não vira fato por ser repetida no módulo seguinte):

| Selo | Significa |
|---|---|
| `[FATO-USUÁRIO]` | dito diretamente pelo operador |
| `[HIPÓTESE]` | recorte/ICP/dor/preço/tese ainda não validada |
| `[INFERÊNCIA-OS]` | conclusão do sistema a partir dos dados |
| `[DADO-MERCADO: GOLD-ICP/GOLD-LP/SILVER/BRONZE]` | evidência externa com fonte (ver rubrica CORE §6) |
| `[CLAIM-CONCORRENTE]` | número/promessa vista na página do concorrente, NÃO verificada |
| `[SIMULADO]` | dado de teste/sandbox — NUNCA contamina o DNA como real |
| `[D.I.]` | dados insuficientes — declara, não preenche |

**Status na tabela abaixo:** `⬜ não iniciado` · `◐ parcial` (rodou mas incompleto/em validação) · `✅ instalado`.

---

## STATUS DA INSTALAÇÃO

| Camada | Módulo | Status | Última atualização |
|---|---|---|---|
| 0 — Operador | /setup | ⬜ pendente | — |
| 1 — Diagnóstico | /raio-x | ⬜ pendente | — |
| 1 — Mercado | /mapear-mercado | ⬜ pendente | — |
| 1 — Concorrência | /escanear-concorrencia | ⬜ pendente | — |
| 2 — Posicionamento | /posicionar | ⬜ pendente | — |
| 2 — Pricing | /precificar | ⬜ pendente | — |
| 2 — Oferta | /criar-oferta | ⬜ pendente | — |
| 3 — Marca Visual | /marca | ⬜ pendente | — |
| 3 — Growth Assets | /criar-lp | ⬜ pendente | — |
| 3 — Mensagens | /banco-mensagens | ⬜ pendente | — |
| 4 — Validação | /plano-validacao | ⬜ pendente | — |

> Assets EXECUTADOS (pitch, proposta, post, carrossel) não têm linha de Camada, mas o `/iniciar` os mostra numa faixa "Assets executados" ao escanear `clientes/_pitches/`, `clientes/_propostas/` e `ads/` — asset no disco nunca aparece como vazio no painel (CORE §4).

---

## OPERADOR (preenchido pelo /setup)

- **Nome / negócio:**
- **O que vende hoje / pra quem / por quanto:**
- **Voz (DNA):** signature_phrases: · power_words: · ranço (nunca usar):
- **Gargalo declarado:**

## DIAGNÓSTICO (preenchido pelo /raio-x)

- **Substituibilidade Index:** __/100
- **% do faturamento em risco (12m):**
- **Pontos comoditizáveis detectados:**
- **Vetor de migração recomendado:**

## NICHO / MERCADO (preenchido pelo /mapear-mercado)

- **Nicho + eixo de segmentação:**
- **HERO PAIN (nome + fórmula):** — [evidência: fonte, GOLD/SILVER/BRONZE]
- **Dores secundárias (2-4):**
- **Linguagem de compra (pain words / outcome words, verbatim do mercado):**
- **Custo da inação (número âncora):**

## CONCORRÊNCIA (preenchido pelo /escanear-concorrencia)

- **Players mapeados (nome · tempo rodando · sinal de tração):**
- **THE GAP (a brecha, classificada):**
- **O que os que funcionam fazem de diferente:**

## POSICIONAMENTO (preenchido pelo /posicionar)

- **Old Game (o jogo saturado):**
- **VILÃO (derivado dos dados, nomeado):**
- **New Game (a categoria):**
- **MECANISMO™ (hero construct — propaga verbatim em TUDO):**
- **Frame check:** slot-2 = Frame A/D ✔

## PRICING (preenchido pelo /precificar)

- **Modelo (setup + recorrência / projeto / tiers):**
- **Preço CALCULADO (com o math que o justifica):**
- **Tiers:** 1: · 2: · 3:
- **Capacidade de entrega (clientes simultâneos):**
- **Âncora competitiva:**

## OFERTA (preenchido pelo /criar-oferta)

- **PROMISE (N + outcome + prazo):**
- **Garantia:**
- **Stack de entregáveis:**
- **Argumento central (1 frase):**
- **Trace:** cada campo acima aponta a seção deste arquivo que o originou

## TRAÇÃO (preenchido pelo /plano-validacao — os sinais que provam a fundação)

- **Plano ativo:** [7d / 14d] · início: · fim:
- **Movimentos executados:** (publicações · abordagens · propostas enviadas)
- **Sinais observados:** (respostas · conversas · objeções reais ouvidas)
- **RESULTADOS (marcadores):** 1ª conversa: · 1ª proposta: · 1º cliente fechado: · R$ atribuível:
- **Aprendizado que volta pra fundação:** (objeção nova → §OFERTA · linguagem nova → §NICHO)

---

*Regra do OS: módulo novo SEMPRE lê este arquivo inteiro antes de rodar. Se uma seção upstream está vazia, o módulo avisa e recomenda rodar o módulo dono dela primeiro.*
