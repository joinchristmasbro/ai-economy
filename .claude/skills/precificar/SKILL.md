---
name: precificar
description: >
  Calcula o preço da sua oferta com math auditável na tela — nunca "escolha uma faixa".
  Lê o _constructs.md (nicho, mecanismo, concorrência), pede só 3 números seus (ticket atual,
  capacidade de entrega, meta de receita), roda a escada de 8 degraus (CPL → agendamento →
  show → fechamento → clientes/mês → CLV → preço mínimo viável → tiers) com benchmarks BR
  embutidos [HEURÍSTICA], valida contra o pricing público dos concorrentes e grava
  ofertas/pricing.md + seção PRICING do _constructs.md. Use quando rodar /precificar,
  quando perguntar "quanto cobrar", ou depois do /posicionar.
---

# /precificar — Preço calculado, nunca chutado

Este módulo instala a camada de **Pricing** da sua Camada de Inteligência™. Ele não te pergunta "quanto você acha que vale" — ele **calcula** o preço a partir do valor que a sua infraestrutura gera pro cliente, da sua capacidade real de entrega e do pricing público dos concorrentes. O preço sai com a conta inteira na tela: qualquer número do resultado final você consegue rastrear até a origem (dado seu, benchmark declarado ou concorrente real).

**Regra do módulo:** se o usuário conseguiria responder sozinho, não é decisão deste módulo. Preço é decisão do sistema, com math auditável.

## Quando usar / quando não usar

- ✅ Depois do `/posicionar` (o mecanismo™ nomeia os tiers) — posição natural na cadeia.
- ✅ Quando o usuário perguntar "quanto eu cobro?", "meu preço tá certo?", "monta meu pricing".
- ❌ Antes do `/mapear-mercado` — sem hero pain e custo da inação, o argumento de preço sai fraco. Roda mesmo assim se o usuário insistir, mas declara o furo (ver Passo 0).
- ❌ Pra montar a oferta completa (promise, garantia, stack) — isso é o `/criar-oferta`, que consome o pricing daqui.

## Passo 0 — Ler o estado (obrigatório, antes de qualquer pergunta)

Ler QUATRO arquivos antes de qualquer pergunta:

- `.claude/rules/CALIBRATION-CORE.md` — §8 (gate de drift de ICP), §9 (infraestrutura ≠ gestão de tráfego), §10 (escada high-ticket + "preço alto → revisa antes de baixar"), §11 (curva de productização), §28 (calibração de métrica de promessa — o número que valida o ROI é calibrado DESTE nicho, nunca copiado de outro). **Governam este módulo.**
- `.claude/rules/outcome-metric-calibration.md` — o framework detalhado do §28 (Outcome Unit + Volume Suitability + Promise Range + 4 tipos de número). A escada CALCULA o preço; o **cheque de métrica de promessa** do Passo 3 usa esta régua pra validar que o número que o operador vai prometer ao cliente sustenta o setup + recorrência.
- `_contexto/modelo-nova-economia.md` — o contrato do OS (as outras skills leem, esta precisa ler também). A escada CALCULA o preço; a **escada high-ticket de infra** (CORE §10) é a régua de sanidade no Passo 3 (cheque de banda).
- `_constructs.md` INTEIRO na raiz do workspace. Deste arquivo vêm de graça (sem perguntar ao usuário):

| Seção | O que o /precificar usa | Se estiver vazia |
|---|---|---|
| OPERADOR | o que vende hoje / pra quem / por quanto (cruza com input 1) | segue — os 3 inputs cobrem |
| NICHO/MERCADO | hero pain + **custo da inação** (vira o numerador do argumento de venda) + categoria do nicho (escolhe a linha de benchmark) + **ticket do cliente final PESQUISADO** (se vier com mark ≥SILVER, ganha do benchmark embutido — ver Passo 3 e fallback chain) | avisa: "argumento de preço vai sair sem o custo da inação — recomendo rodar `/mapear-mercado` antes"; se seguir, marca `[DADOS INSUFICIENTES]` no argumento |
| CONCORRÊNCIA | pricing público dos players (âncora competitiva do Passo 4) | tenta 1 WebSearch (`"quanto custa [serviço] para [nicho]" preço mensal`); se nada com fonte → âncora = `[DADOS INSUFICIENTES]` + recomenda `/escanear-concorrencia` |
| POSICIONAMENTO | mecanismo™ (nomeia os tiers) | tiers saem com nome genérico provisório + aviso: "rode `/posicionar` e os tiers herdam o nome do mecanismo" |

Nunca bloqueia por seção vazia — **aponta o furo, degrada com honestidade e segue.** Construct que existe upstream NUNCA é re-perguntado ao usuário.

## Passo 1 — Os 3 inputs (UMA pergunta por vez)

Só 3 perguntas. Faça UMA, espere a resposta, faça a próxima. Linguagem de gente, sem jargão. Se o usuário enrolar ou não souber, registra o default, marca `[HEURÍSTICA]` e segue — não trava o wizard.

1. **Ticket atual — ECOAR e confirmar, nunca re-perguntar.** O §OPERADOR do `_constructs.md` já tem "por quanto" (capturado no /setup). Ecoa: *"Você registrou que cobra em média R$X por cliente — ainda vale, ou mudou?"* Só pergunta do zero se o campo estiver vazio. (Vale responder "nunca vendi esse serviço" → usa o benchmark da categoria como referência de partida.)
2. **"Quantos clientes você consegue atender BEM ao mesmo tempo, hoje, sem contratar ninguém?"**
   - Default se não souber: **5** `[HEURÍSTICA — capacidade típica de operador solo com entrega automatizada]`.
3. **"Qual sua meta de receita mensal com essa oferta nos próximos 6 meses?"**
   - Se não tiver meta: segue sem o piso da meta (degrau 7 usa só os outros 2 pisos) e registra "meta não declarada".

TODO o resto vem do `_constructs.md` ou dos benchmarks embutidos abaixo. **Dado real do usuário SEMPRE ganha do benchmark** — se ele já rodou tráfego, tem CRM ou gestor, pergunta zero a mais: só substitui o default pelo número real e marca a origem.

## Passo 2 — Escolher o modelo (2 paradigmas, dispatcher simples)

| Paradigma | Quando | Estrutura |
|---|---|---|
| **B — Setup + recorrência** (DEFAULT do OS) | Existe instalação inicial real (funil, automação, agente de IA, CRM, site) antes da operação contínua — que é o caso de quase toda oferta deste OS | Taxa de instalação única + mensalidade por tier |
| **A — Recorrência pura em tiers** | Não existe instalação distinta: o serviço é gestão contínua desde o dia 1 (raro no modelo Nova Economia — se cair aqui, questione se não está esquecendo o setup) | 3 mensalidades escalonadas, sem taxa de entrada |

Default em dúvida: **B**. Princípio operacional #1 deste workspace: setup + recorrência, nunca hora. Declare o paradigma escolhido e o porquê em 1 linha antes de rodar a escada.

## Benchmarks embutidos (todos [HEURÍSTICA] — leia a nota)

> **Nota de honestidade:** os números abaixo são prática corrente de tráfego pago BR, **sem fonte auditada** — por isso TODOS carregam `[HEURÍSTICA]`. Servem pra conta rodar hoje. Qualquer número real (seu CRM, seu gestor de tráfego, relatório do cliente) substitui o default na hora e vira `[GOLD — dado próprio]`.

Categoria = a do **cliente final do nicho** (quem o comprador do seu serviço atende), lida do NICHO/MERCADO:

| Categoria do nicho | CPL Meta* | Lead→Agend.* | Show* | Fechamento* | Ticket cliente final* | Relação anual* |
|---|---|---|---|---|---|---|
| Saúde/estética local (clínica, dentista, harmonização) | R$15-35 | 25-40% | 55-70% | 25-40% | R$800-4.000/procedimento | 2-4 compras/ano |
| Serviço local recorrente (academia, pet, gastronomia) | R$5-15 | 20-35% | 50-65% | 30-50% | R$150-500/mês | 6-12 meses de retenção |
| B2B profissional (contábil, advocacia, consultoria) | R$40-120 | 15-25% | 60-75% | 15-25% | R$1.500-8.000/mês | 12+ meses de retenção |
| Imobiliário / high-ticket consumidor | R$15-45 | 10-20% | 50-65% | 5-12% | R$8.000-30.000/comissão | 1 compra |
| Educação / serviço digital | R$8-25 | 15-30% | 50-65% | 10-20% | R$500-3.000 | 1-2 compras/ano |

\* `[HEURÍSTICA]` — sem fonte auditada; use o meio da faixa como default e diga isso na tela.

**Precedência sobre o benchmark embutido:** se o §NICHO/MERCADO trouxer o ticket do cliente final PESQUISADO com mark ≥SILVER (ex: "ticket R$200 [SILVER]"), esse número SEMPRE ganha da coluna "Ticket cliente final*" da tabela — o embutido é chute de categoria, o pesquisado é o nicho real. Se os dois divergirem mais de 2× `[HEURÍSTICA — gatilho de conflito]`, **declare o conflito explícito no `pricing.md`**: qual número usou, qual descartou e por quê (nunca troca em silêncio).

Outros defaults usados na escada (mesma regra):
- **Verba de mídia de referência do cliente final:** R$3.000/mês `[HEURÍSTICA — PME BR típica]`
- **Captura de valor:** cobrar 10-25% da receita nova gerada; o cliente fica com 4-10× o que paga `[HEURÍSTICA — regra de captura]`
- **Margem mínima:** 60% (preço mensal ≥ custo de entrega ÷ 0,4) `[HEURÍSTICA — piso pra oferta vendável]`
- **Setup fee:** 1,5-2× a mensalidade do tier `[HEURÍSTICA]`
- **Escala de tiers:** Tier 1 ≈ 0,5× · Tier 3 ≈ 1,8-2× o Tier 2 `[HEURÍSTICA — escala geométrica]`

## Passo 3 — A escada (8 degraus, CADA conta na tela)

Rodar em sequência, **mostrando o cálculo de cada degrau em linguagem simples** ("de cada 100 leads, 30 agendam..."). Cada número declara a origem: `[dado seu]`, `[HEURÍSTICA]` ou `[concorrente]`. Degraus 1-6 medem o **valor que a infraestrutura gera pro cliente final** — é isso que justifica o preço. Degraus 7-8 convertem valor em preço.

```
1. CPL — quanto custa 1 lead no nicho
   → benchmark da categoria (meio da faixa) OU dado real
2. AGENDAMENTO — % de leads que viram conversa marcada
   → custo por agendamento = CPL ÷ %
3. SHOW — % que aparece na conversa
   → custo por reunião real = degrau 2 ÷ %
4. FECHAMENTO — % que vira cliente
   → CAC do cliente final = degrau 3 ÷ %
   → cascata na tela: "R$3.000 de mídia → X leads → Y agendam → Z aparecem → N fecham"
5. CLIENTES NOVOS/MÊS que o sistema gera = verba de mídia ÷ CAC do cliente final
6. CLV do cliente final = ticket × relação anual (da tabela)
   → RECEITA NOVA/MÊS GERADA = clientes novos × ticket (e anual = × CLV)
7. PREÇO MÍNIMO VIÁVEL do operador = o MAIOR entre 3 pisos (mostrar os 3):
   a) piso de VALOR   = 10-25% da receita nova gerada/mês
   b) piso de META    = meta de receita ÷ capacidade de entrega
   c) piso de MARGEM  = custo de entrega mensal (ferramentas + horas, itemizado) ÷ 0,4
   → declarar QUAL piso venceu e por quê — essa é a justificativa auditável do preço
8. TIERS 1/2/3 — Tier 2 = preço calculado (RECOMENDADO):
   Tier 1 ≈ 0,5× (escopo cortado: 1 canal, sem otimização contínua)
   Tier 3 ≈ 1,8-2× (escopo premium: multi-canal, prioridade, relatório vivo)
   + setup fee por tier (paradigma B) = 1,5-2× a mensalidade do tier
```

**Ramo OFERTA ORGÂNICA-FIRST (quando a aquisição é conteúdo/orgânico, sem funil de mídia pago):** a cascata CPL→CAC dos degraus 1-5 pressupõe tráfego pago — se a oferta não tem funil pago, ela NÃO se aplica (não invente CPL). Troque os degraus 1-5 por: **valor = custo da inação recuperável** (do §NICHO/MERCADO — quanto o problema custa parado por mês que o sistema recupera) **+ verba de impulsionamento** (o pouco de mídia que turbina o orgânico, se houver). Degraus 6-8 rodam igual (CLV, preço mínimo viável pelos 3 pisos, tiers). Declare na tela: "aquisição orgânica — valor vem da recuperação, não da cascata de mídia".

**Cheques de realidade (rodar os 4, mostrar as contas):**
- **Salto de ticket:** se Tier 2 > 3× o ticket atual do usuário, não recua o cálculo — recomenda degrau: "próximos 2 clientes a R$[intermediário], depois sobe pro calculado".
- **Meta × capacidade:** clientes necessários = meta ÷ Tier 2. Se > capacidade → dizer na lata: "com essa capacidade, ou o preço sobe pra R$X ou a meta não fecha" (com a conta).
- **ROI apresentável:** receita nova gerada ÷ preço Tier 2 ≥ 3:1. Abaixo disso o preço não se sustenta na venda — reduzir preço OU revisar escopo, nunca maquiar o número.
- **Métrica de promessa × ROI (§28):** o preço só se sustenta se o número que o operador vai PROMETER ao cliente for calibrado a ESTE nicho. Pega a **outcome unit** do §NICHO/MERCADO (agendamento qualificado · avaliação presencial · orçamento retomado · instalação vendida — o elo da escada de compromisso que o sistema CONTROLA; nicho regulado fica no comercial/operacional, nunca no desfecho clínico; NUNCA "lead" por default) e roda a conta reversa na tela: **X [outcome unit]/mês → vendas potenciais (X × fechamento) → receita nova (× ticket do cliente final) → margem → cabe na capacidade mensal do cliente final? → sustenta o setup + recorrência do Tier 2?** 🔴 O número de promessa NÃO se copia de outro nicho — "12/mês" é forte em solar (ticket alto, ciclo longo, capacidade limitada) e fraco/estranho em odonto geral, fitness ou jurídico. Calibra do ticket + capacidade + ciclo DAQUI (régua: `.claude/rules/outcome-metric-calibration.md`). Se o número não sustenta o preço OU estoura a capacidade do cliente → recalibra a FAIXA (conservadora/agressiva), nunca força o número bonito pra fechar conta. Se o §NICHO/MERCADO ainda não fixou a unidade, usa o elo operacional da própria escada (agendamento, degrau 2) e avisa: "a métrica de promessa fecha no `/criar-oferta` (seção Métrica de Promessa)".

**Desempate (quando ROI e meta se contradizem):** se o cheque-ROI puxa o preço pra BAIXO e o cheque-meta puxa pra CIMA ao mesmo tempo, a ordem é FIXA: (1) revisar ESCOPO primeiro — adicionar componente de recuperação/valor que sobe a receita nova gerada (levanta o ROI sem mexer no preço); (2) reduzir preço por ÚLTIMO; (3) NUNCA baixar o N de clientes (nem da capacidade, nem da meta) pra fechar a conta.

**Cheque da escada high-ticket de infra (CALIBRATION-CORE §10):** o preço calculado tem que ATERRISSAR numa faixa nomeada — não é fee de gestão de tráfego (§9), é instalação de ativo:
- **R$10-15K setup** — piloto / starter / founding client / instalação mínima (NÃO é a oferta principal).
- **R$20-35K setup** — oferta PRINCIPAL, operação madura com caixa/urgência/capacidade de capturar valor. É o centro.
- **R$45-50K+ setup** — operação maior, multiunidade, mais canais/integrações.
- **Recorrência R$3-8K/mês** — varia por escopo, canais, gestão, otimização, evolução.

Declare em qual faixa o setup calculado caiu. Se caiu no piloto (R$10-15K), diga que é a porta de entrada e o principal (R$20-35K) é o destino quando meta/prova/capacidade crescem — **não force o número pra cima**.

**🔴 Se o preço parecer alto (CORE §10 — ordem FIXA, baixar preço é o ÚLTIMO recurso):** revisar nesta ordem antes de mexer no número — (1) ICP · (2) maturidade da operação · (3) custo da inação · (4) escopo · (5) prova · (6) garantia · (7) forma de pagamento · (8) ROI · (9) capacidade de captura de valor. **NUNCA baixar o preço até caber num ICP errado** — se o ICP pesquisado não sustenta a faixa principal, isso é DRIFT (§8): avisa e recomenda revisitar o `/mapear-mercado`, não silenciosamente rebaixa a oferta.

**Curva de productização (CORE §11):** a capacidade de entrega NÃO é fixa. Fase 1 (2-3 primeiros clientes) é founder-led/manual — capacidade menor, é onde nascem os SOPs/templates. Fase 2 (productized) a instalação vira replicável — a mesma equipe atende mais com playbook. O tier de capacidade reflete a fase atual; a oferta explica o caminho pra fase 2 (isso vive no `/criar-oferta` §22).

**Anticlímax (piso de META vence E Tier 2 ≈ ticket atual):** quando o piso vencedor é o de META e o preço calculado bate no que o usuário JÁ cobra, não devolva isso seco — vira anticlímax ("o sistema me mandou cobrar o que eu já cobro"). Faça 2 coisas: (1) **tela do "e se":** "e se a meta fosse R$[2-3× a meta atual]? → Tier 2 = R$Y/mês, as MESMAS [N] vagas" — a conta é idêntica, só troca o input de meta; (2) **puxa o potencial pra MANCHETE:** o resultado não é o mensal plano — é setup R$[S] (que o ticket avulso atual não captura) + capacidade de [N] clientes simultâneos + margem [X]%. A conta já existe no artefato; a manchete lidera com o teto, não com o piso.

**Nomes dos tiers:** herdam o mecanismo™ do POSICIONAMENTO + sufixo de AÇÃO: `[Mecanismo™] Instalação / Operação / Escala`. PROIBIDO sufixo de identidade (Pro, Master, Expert, Elite, Dono, VIP) — slot 2 sempre mecanismo ou metáfora concreta, nunca "quem você vira".

## Passo 4 — Validar contra a âncora competitiva

Montar a tabela com os players da seção CONCORRÊNCIA (pricing público coletado pelo `/escanear-concorrencia`) e posicionar o usuário nela:

```
| Player            | Modelo           | Preço público        | Fonte |
| [Player real 1]   | [modelo]         | R$X                  | [...] |
| [Player real 2]   | [modelo]         | R$Y/mês              | [...] |
| VOCÊ (Tier 2)     | setup+recorrência| R$S setup + R$M/mês  | calculado acima |
```

E responder por escrito: **acima de quem, abaixo de quem, e POR QUÊ o preço se sustenta aí** (o que a infraestrutura entrega que o mais barato não entrega; por que não precisa cobrar o preço do mais caro). Nunca inventar player nem preço — sem pricing público real, a linha sai `[DADOS INSUFICIENTES]` e a validação declara: "pricing calculado mas NÃO ancorado em concorrência — rode /escanear-concorrencia pra fechar".

## Passo 5 — Gravar os artefatos (nunca só texto na conversa)

**1. Escrever `ofertas/pricing.md`:**

```markdown
# Pricing — [oferta] pra [nicho]
> Gerado por /precificar em [AAAA-MM-DD]. Todo número marca a origem:
> [dado seu] · [HEURÍSTICA] · [concorrente real]. Preço = decisão calculada, não faixa.

## 1. A escada (math completo)
[os 8 degraus com cada conta e origem de cada número]

## 2. Tiers
| | [Mecanismo™] Instalação | [Mecanismo™] Operação ⭐ | [Mecanismo™] Escala |
| Setup | R$ | R$ | R$ |
| Mensal | R$ | R$ | R$ |
| Escopo | ... | ... | ... |
| Pra quem | ... | ... | ... |
⭐ = recomendado (comece vendendo este — [razão do piso vencedor])
Potencial (só quando o piso de META vence e Tier 2 ≈ ticket atual): "e se a meta fosse R$__? → R$Y/mês, as mesmas N vagas" — manchete lidera com setup + capacidade + margem, não com o mensal plano.

## 3. Âncora competitiva
[tabela do Passo 4 + acima/abaixo de quem e por quê]

## 4. Argumento de preço (usar na venda, verbatim)
"[Custo da inação: o problema custa R$X/mês parado]. O [Mecanismo™] gera
[N clientes novos/mês = R$Y de receita nova]. Custa R$M/mês — se paga [Z]×.
[Comparação: funcionário/agência tradicional custa R$W e não entrega N]."

## 5. Cheques de realidade
Margem: X% (piso 60%) · Meta: N clientes × Tier 2 = R$Y vs meta R$Z ·
Salto vs ticket atual: [ok / degrau recomendado] · ROI apresentável: Z:1 ·
Métrica de promessa × ROI (§28): outcome unit = [unidade do nicho, não "lead"] · X/mês [calibrado DESTE nicho, não copiado] → cabe na capacidade · [sustenta / não sustenta] o Tier 2 [se não: faixa recalibrada, não número forçado] ·
Banda do modelo: setup R$S [dentro de / abaixo de] R$20-50K → [parágrafo do degrau de entrada, se abaixo] ·
Conflito benchmark×pesquisado: [nenhum / declarado: usei R$__ (§NICHO ≥SILVER), descartei R$__ embutido, divergência __×] ·
Desempate ROI×meta: [n/a / aplicado: escopo revisado antes de preço, N de clientes intacto]
```

**2. Atualizar `_constructs.md` → seção PRICING** (verbatim, é daqui que o `/criar-oferta` lê):

```markdown
## PRICING (preenchido pelo /precificar)
- **Modelo:** [B setup + recorrência | A recorrência pura] — [porquê em 1 linha]
- **Preço CALCULADO (com o math que o justifica):** Tier 2 = R$S setup + R$M/mês —
  piso vencedor: [valor|meta|margem], conta: [1 linha]. Detalhe: ofertas/pricing.md
- **Tiers:** 1: [nome] R$__ · 2: [nome] R$__ ⭐ · 3: [nome] R$__
- **Capacidade de entrega:** [N] clientes simultâneos (input 2 — o /criar-oferta lê daqui, não re-pergunta)
- **Âncora competitiva:** [acima de X, abaixo de Y, porquê] (ou [DADOS INSUFICIENTES])
```

**3. Atualizar STATUS DA INSTALAÇÃO:** linha `2 — Pricing | /precificar` → `✅ instalado | [data]`.

## Passo 6 — Handoff

Fechar SEMPRE com:

> **Pricing instalado.** Preço calculado, ancorado e gravado em `ofertas/pricing.md`.
> **Próximo: rode `/criar-oferta`** — ele pega esse preço + o mecanismo™ + o hero pain e monta a oferta completa (promise, garantia, stack). Você não vai inventar nada lá: tudo já está no seu `_constructs.md`.

## Honestidade + fallback chain (inegociável)

Ordem de confiança pra QUALQUER número da escada:
1. **Dado real do usuário** (CRM, histórico de tráfego, contrato) → `[GOLD — dado próprio]`, sempre ganha
2. **Âncora do `_constructs.md`** (pricing público coletado com fonte) → `[GOLD/SILVER — concorrente]`
3. **Dado PESQUISADO do §NICHO/MERCADO com mark ≥SILVER** (ticket do cliente final, custo da inação, ticket de mercado) → **SEMPRE ganha do benchmark embutido** — o pesquisado é o nicho real, o embutido é chute de categoria. Divergência >2× vs benchmark `[HEURÍSTICA — gatilho]` = declarar o conflito no `pricing.md`.
4. **Benchmark embutido** desta skill → `[HEURÍSTICA]`, sempre com asterisco na tela
5. **WebSearch** (1 busca, só pra âncora competitiva faltante)
6. Falhou tudo → `[DADOS INSUFICIENTES]` no campo. A escada roda com o que tem e **declara o furo** — nunca inventa número pra fechar conta bonita.

## Craft gates (rodar ANTES de gravar)

- **Teste de substituição:** troque o nicho no `pricing.md` mentalmente. Se nada quebra, tá genérico — refaça. O CPL tem que ser da categoria, a âncora tem que ter player real, o argumento tem que carregar o custo da inação DESTE nicho.
- **Teste da faixa:** se em qualquer lugar o output diz "entre R$X e R$Y, escolha" como resposta final → FALHOU. Faixa só existe DENTRO da conta (benchmark); o resultado é UM número por tier, com piso vencedor declarado.
- **Ban list:** "valor justo" · "preço psicológico" · "o mercado costuma cobrar" (sem fonte) · "depende do seu contexto" · "pode ser razoável" · "talvez funcione" · "transformação" · "mindset" · "sucesso" (vago) · "precificação estratégica" (sem conta junto).
- **Tom:** CFO simpático. "R$25 o lead × 30% × 60% × 30% = R$463 por cliente novo" ✅ · "o custo de aquisição parece ok" ❌. Direto, com número, explicado em linguagem de gente.

## Anti-padrões (rejeição imediata)

| Anti-padrão | Correção |
|---|---|
| Preço chutado / "escolha uma faixa" | Escada completa na tela, piso vencedor declarado |
| Pricing sem âncora competitiva E sem declarar o furo | Tabela com player real OU `[DADOS INSUFICIENTES]` explícito |
| Benchmark sem asterisco (heurística disfarçada de fato) | Todo default = `[HEURÍSTICA]` visível na tela e no artefato |
| Re-perguntar o que o `_constructs.md` já sabe | Ler antes; construct existente nunca vira pergunta |
| Tier com sufixo de identidade (Pro/Master/Elite/Dono) | Sufixo de ação: Instalação/Operação/Escala |
| Margem <60% aceita em silêncio | Mostrar a conta + reduzir custo de entrega OU subir preço |
| Meta impossível não confrontada | "Ou preço sobe pra R$X ou meta não fecha" com a conta |
| Output só na conversa | `ofertas/pricing.md` + PRICING + STATUS gravados SEMPRE |
| Duas perguntas na mesma mensagem | Uma por vez; se enrolar, default `[HEURÍSTICA]` e segue |

## Auto-verificação (antes de encerrar)

- [ ] `_constructs.md` lido inteiro no Passo 0; furos upstream apontados com módulo dono
- [ ] Exatamente 3 perguntas feitas, uma por vez (zero re-pergunta de construct existente)
- [ ] 8 degraus na tela, cada número com origem marcada
- [ ] 3 pisos calculados + piso vencedor declarado (a justificativa auditável)
- [ ] 3 cheques de realidade rodados com conta visível
- [ ] Âncora competitiva com player real OU `[DADOS INSUFICIENTES]` declarado
- [ ] Tiers nomeados com mecanismo™ + sufixo de ação (zero Frame B)
- [ ] `ofertas/pricing.md` gravado + PRICING atualizado verbatim + STATUS ✅
- [ ] Handoff pro `/criar-oferta` na última mensagem
- [ ] Craft gates passados (substituição + faixa + ban list)
- [ ] Ticket do cliente final: se §NICHO/MERCADO tem pesquisado ≥SILVER, usou ele (não o benchmark embutido); divergência >2× declarada no `pricing.md`
- [ ] Aquisição classificada: paga (cascata CPL→CAC) OU orgânica-first (valor = custo da inação recuperável + impulsionamento — não inventou CPL)
- [ ] Métrica de promessa × ROI (§28): outcome unit do nicho (não "lead"), número CALIBRADO DESTE nicho (não copiado de outro), conta reversa rodada (X/mês → vendas → margem → capacidade do cliente → sustenta Tier 2); se não sustenta/estoura capacidade → faixa recalibrada, não número forçado
- [ ] Cheque de banda do modelo rodado: setup < R$20K → parágrafo do degrau de entrada (nunca contradição solta)
- [ ] Desempate ROI×meta na ordem certa (escopo → preço → nunca N de clientes); anticlímax (preço ≈ ticket atual) tratado com tela "e se" + manchete no potencial
