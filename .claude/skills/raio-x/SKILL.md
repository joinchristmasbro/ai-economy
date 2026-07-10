---
name: raio-x
description: >
  Raio-X de Substituibilidade™ — o diagnóstico-âncora do OS. Entrevista
  curta (4-6 perguntas) sobre o que você vende e como cobra, avalia cada
  entregável contra uma rubrica objetiva de 4 eixos e CALCULA: o
  Substituibilidade Index (0-100), o % do faturamento sob compressão de
  preço/margem em 12 meses e o vetor de migração (qual entregável migrar
  primeiro pra
  infraestrutura). Output: raio-x.md no workspace + seção DIAGNÓSTICO do
  _constructs.md. Use quando o usuário rodar /raio-x, perguntar "quanto
  do meu trabalho a IA substitui?" ou logo após o /setup.
---

# /raio-x — Raio-X de Substituibilidade™

Diagnóstico calculado, não opinião. Você coleta FATOS que só o operador tem (o que vende, quanto pesa na receita, como cobra) e o SISTEMA devolve a decisão que ele não conseguiria produzir sozinho: um índice 0-100 derivado de rubrica objetiva, o R$ sob compressão de preço/margem com o math exposto, e qual entregável migrar primeiro.

**Regra inviolável:** o veredito sai da RUBRICA (Passo 3). NUNCA pergunte "quanto você acha que está em risco?" ou "qual entregável você acha mais ameaçado?". Se o usuário pudesse responder, este módulo não precisaria existir.

**O que este módulo NÃO faz:** não escolhe nicho (isso é /mapear-mercado), não monta oferta (isso é /criar-oferta), não promete "salvar" nada. Ele mede a exposição e aponta a primeira migração. Só.

---

## Passo 0 — Carga de estado (obrigatório, antes de qualquer pergunta)

1. Ler `_constructs.md` INTEIRO (raiz do workspace).
2. **Gate:** se a seção OPERADOR está vazia (sem nome/negócio/o-que-vende) → PARE e responda:
   > "Antes do Raio-X eu preciso saber quem você é e o que vende. Rode `/setup` primeiro — leva ~10 minutos. Depois volte aqui."
3. Se OPERADOR está preenchido: **aproveite o que já existe**. "O que vende hoje / pra quem / por quanto" vira rascunho das respostas — na entrevista, ECOE e peça confirmação em vez de re-perguntar ("No setup você disse que vende X e Y por R$Z/mês. Confirma? Falta algum entregável?").
4. Se a seção DIAGNÓSTICO já tem um Index de rodada anterior: avise ("Seu último Raio-X deu __/100 em [data]. Vou rodar de novo e comparar.") e ao final mostre o delta.

---

## Passo 1 — Entrevista (4-6 perguntas; uma por mensagem, com P2 e P4 em batch)

Regras da entrevista:
- **Uma pergunta por mensagem.** Espere a resposta antes da próxima.
- **Exceção BATCH (P2 e P4):** essas duas são "por entregável" — NÃO as repita entregável a entregável (viraria 8-12 turnos e estouraria as "4-6 perguntas"). Faça UMA mensagem cobrindo TODOS os entregáveis de uma vez e peça a resposta em lista/tabela ("pra cada entregável: como produz + como cobra"). As demais (P1, P3, P5, P6) seguem uma por mensagem.
- Antes de cada pergunta, 1 frase dizendo POR QUE ela importa. Dê 1 exemplo de resposta boa.
- Se o usuário enrolar ou responder pela metade em 2 tentativas: registre o que tem, marque `[ESTIMATIVA do operador]` e siga. Diagnóstico com dado parcial declarado > entrevista infinita.
- Máximo 6 entregáveis. Se ele listar mais, peça pra agrupar nos 6 que mais pesam na receita.

**P1 — Entregáveis.** "Quais entregáveis você vende hoje? Lista simples, um por linha. Ex.: 'gestão de tráfego, social media (posts), sites, consultoria mensal'." *(Se OPERADOR já tem isso: ecoar e confirmar.)*

**P2 — Como produz cada um (BATCH — uma mensagem, todos os entregáveis).** "Numa resposta só, pra cada entregável da lista: como ele sai do forno? Quais ferramentas usa e quanto do trabalho é execução (fazer a peça) vs julgamento (decidir com contexto que só você tem)?" *(Alimenta o Eixo A por entregável.)*

**P3 — Peso na receita.** "De cada R$100 que entram, quantos vêm de cada entregável? Aproximado, tem que somar ~100." Se não souber: peça o ranking do maior pro menor e converta em split estimado (ex.: 3 itens ranqueados → 50/30/20) marcado `[ESTIMATIVA]`.

**P4 — Modelo de cobrança (BATCH — uma mensagem, todos os entregáveis).** "Numa resposta só, pra cada entregável: como cobra — por hora, por peça (R$/post, R$/site), pacote mensal de execução, ou setup + recorrência atada a resultado?" *(Alimenta o Eixo C por entregável.)*

**P5 — Pressão de preço (últimos 12 meses).** "Aconteceu algum destes? (a) cliente pediu desconto citando IA ou freelancer mais barato; (b) você perdeu cliente/proposta pra opção mais barata; (c) você não reajusta preço há 12+ meses por medo de perder cliente; (d) tem concorrente entregando o mesmo por metade do seu preço." *(Alimenta o Eixo D — cada sim é um sinal contável.)*

**P6 — Diferenciação (só se P2 não respondeu).** "Você tem: nicho declarado (atende UM tipo de cliente)? Cases com número (ex.: '+40% de agendamentos pra clínica X')? Algo proprietário — dado acumulado, método nomeado, audiência que chega pedindo VOCÊ?" *(Alimenta o Eixo B.)*

---

## Passo 2 — Rubrica de Substituibilidade (avalie cada entregável nos eixos A e C; B e D são GLOBAIS)

Pontue com os critérios abaixo. Critério objetivo = você consegue apontar o fato da entrevista (ou a ferramenta nomeada) que justifica o ponto. Se não consegue justificar, não pontue no extremo.

**Divisão do trabalho (não complique):** os eixos **A** (comoditização) e **C** (cobrança) variam POR entregável — pontue cada linha. Os eixos **B** (diferenciação) e **D** (pressão de preço) são propriedades GLOBAIS do negócio — pontue UMA vez e repita o mesmo valor em todas as linhas da tabela. Motivo: diferenciação e pressão de preço são da SUA marca, não do post; separar por entregável seria fingir precisão que não existe.

### Eixo A — Comoditização pela IA (0-10; peso 40%)

**Teste objetivo que governa o eixo:** *"Um cliente leigo, com ChatGPT + 1 ferramenta de prateleira, obtém hoje 70% desse entregável em qualidade que ELE aceita?"* Pra pontuar 7+, você DEVE nomear a ferramenta e a rota (qual tool, qual fluxo). Se não consegue nomear → teto 6.

| Score | Critério |
|---|---|
| 9-10 | Ferramenta genérica gera o entregável ponta-a-ponta (1 prompt ou template) em qualidade que cliente leigo aceita. Ex.: post/carrossel genérico, legenda, artigo SEO commodity |
| 7-8 | IA faz 70%+ da produção; o humano só revisa e publica. Ex.: copy de email, arte estática simples, corte de vídeo com template |
| 4-6 | IA acelera, mas o entregável exige julgamento com contexto que a ferramenta não tem (orçamento real, histórico do cliente, negociação) |
| 1-3 | IA é periférica; o valor é relacionamento, responsabilidade sobre resultado ou dado proprietário. Ex.: consultoria com dado do cliente, vendas 1:1 |
| 0 | Sem rota plausível de substituição em 12 meses |

**Tabela de referência (defaults, jul/2026 — toda ela [HEURÍSTICA], calibrada por ferramenta nomeável; a resposta do operador em P2 pode mover ±2):**

| Entregável típico | Default A | Ferramenta que já faz |
|---|---|---|
| Posts/carrossel genérico, legendas | 9 | ChatGPT + Canva Magic Studio |
| Stories/conteúdo IG (produção diária) | 8 | ChatGPT + Canva (templates/Instant) |
| Artigo SEO/blog commodity | 9 | ChatGPT/Jasper |
| Arte estática simples | 8 | Canva AI, Ideogram |
| Site institucional simples | 8 | Framer AI, Wix ADI |
| Copy de email | 7 | ChatGPT com contexto colado |
| Edição de vídeo curto com template | 7 | CapCut, Opus Clip |
| Gestão de tráfego (execução de campanha) | 5 | Meta Advantage+ automatiza a compra; orçamento/estratégia ainda humano |
| Social media COM estratégia + comunidade | 4 | — (a parte estratégica não tem rota nomeável) |
| Automação/CRM instalado (infraestrutura) | 3 | — (instalação exige contexto do negócio) |
| Consultoria/estratégia com dado do cliente | 2 | — |
| Vendas 1:1 / relacionamento | 2 | — |

**Se o entregável não está na tabela:** rode 1 WebSearch ("[entregável] AI tool 2026") pra verificar se existe ferramenta genérica que o produz. Achou fonte → pontue e marque [SILVER + fonte]. WebSearch falhou ou inconclusivo → pontue por analogia com a linha mais próxima da tabela e marque [HEURÍSTICA]. NUNCA invente ferramenta.

### Eixo B — Diferenciação real (0-10; peso 25%; GLOBAL do negócio; entra INVERTIDO no cálculo — mais diferenciação = menos substituível)

Some pontos por fato VERIFICADO na entrevista (não por intenção — "estou construindo audiência" = 0). **Pontue B UMA vez pro negócio inteiro** (é da marca, não do entregável) e repita o valor em todas as linhas. Esses fatos só o operador tem: entram como **[DECLARAÇÃO — operador]** — o /setup chama de "declaração-não-evidência"; é a mesma coisa: o operador é a fonte, não há verificação externa.

| Sinal (fato, não plano) | Pontos |
|---|---|
| Nicho declarado: 70%+ dos clientes são de UM tipo | +3 |
| Cases com número em mãos (resultado + cliente nomeável) | +3 |
| Ativo proprietário: dado acumulado de clientes, método nomeado em uso, ou audiência própria que gera inbound | +3 |
| Clientes chegam pedindo VOCÊ pelo nome (inbound por reputação) | +1 |

0-3 = generalista commodity · 4-6 = diferenciação parcial · 7-10 = defensável. *(Pesos dos sinais: [HEURÍSTICA].)*

### Eixo C — Modelo de cobrança (0-10; peso 20%)

| Score | Critério (resposta literal da P4) |
|---|---|
| 9-10 | Cobra por hora ou por peça avulsa (R$/post, R$/hora) — comparação de preço direta com a IA |
| 6-8 | Pacote mensal de EXECUÇÃO (retainer de entregáveis, sem métrica de resultado) |
| 3-5 | Retainer atado a meta/resultado parcial (bônus por performance, SLA de KPI) |
| 0-2 | Setup + recorrência sobre infraestrutura instalada ou resultado — o preço não compete com "quanto custa a ferramenta" |

*(Racional: quem cobra por unidade de execução compete com o custo marginal da IA, que tende a zero. Quem cobra por infraestrutura + resultado compete em outro jogo. Régua: [HEURÍSTICA], direção alinhada ao princípio setup+recorrência do `_contexto/framework-oferta.md` §1.)*

### Eixo D — Pressão de preço observada (0-10; peso 15%; GLOBAL do negócio)

+2,5 por sinal confirmado na P5 (teto 10). Sinal = evento que ACONTECEU nos últimos 12m, com quem/quando se o operador lembrar:

- (a) desconto pedido citando IA/opção mais barata → +2,5
- (b) cliente/proposta perdida por preço → +2,5
- (c) 12+ meses sem reajuste por medo → +2,5
- (d) concorrente entrega o mesmo por ≤ metade do preço → **+2,5 SE você nomear o concorrente/caso**; observação difusa de mercado ("tem gente cobrando metade", sem nome) conta como **+1,25** com nota [ESTIMATIVA]

Marque cada sinal com a evidência verbatim do operador ("perdi a Clínica Y em março pra um freela") — são fatos que só o operador tem, entram como **[DECLARAÇÃO — operador]**. Sinais (a)(b)(c) sem evento concreto = não contam; só o (d) admite meio ponto por observação difusa (regra acima). **Pontue D UMA vez pro negócio inteiro** e repita em todas as linhas. *(Valores +2,5 / +1,25 por sinal: [HEURÍSTICA].)*

---

## Passo 3 — O math (sempre EXPOSTO no output, nunca só o resultado)

**3.1 Score por entregável (0-100):**

```
Score_entregável = ( A×0,40 + (10−B)×0,25 + C×0,20 + D×0,15 ) × 10
```

*(Pesos 40/25/20/15: [HEURÍSTICA] — A pesa mais porque a comoditização é o vetor causal; B/C/D modulam a velocidade com que ela te alcança.)*

**3.2 Substituibilidade Index global (0-100)** — média ponderada pela receita:

```
Index = Σ ( Score_entregável × %receita_entregável )   [%receita em fração]
```

**3.3 Faixas de veredito** *(cortes: [HEURÍSTICA])*:

| Index | Veredito |
|---|---|
| 0-29 | **FUNDAÇÃO SÓLIDA** — exposição baixa; o jogo é escalar, não migrar |
| 30-54 | **EXPOSTO** — parte relevante da receita compete com custo marginal da IA |
| 55-74 | **ZONA DE SUBSTITUIÇÃO** — a maioria da receita é replicável por ferramenta genérica |
| 75-100 | **CORRENDO CONTRA O RELÓGIO** — o negócio atual é o que a IA já faz |

**3.4 % do faturamento sob compressão de preço/margem em 12 meses** — soma ponderada, com o math na mesa:

```
%compressão_12m = Σ ( %receita × fator )
  fator: Score 80+ → 1,0 · Score 60-79 → 0,75 · Score 40-59 → 0,5 · Score 0-39 → 0
```

*(Fatores 1,0/0,75/0,5/0 e cortes contíguos em 80/60/40: [HEURÍSTICA] — não existe base pública BR que meça velocidade de substituição por categoria de entregável; os quatro degraus declaram "compressão integral / forte / parcial / fora da janela de 12m". O degrau 0,75 existe pra NÃO saturar em 100% quando o operador pontua ≥60 em tudo — este número mede compressão de preço/margem, não faturamento que "desaparece": o cliente não some, ele passa a pagar menos pelo que virou commodity.)*

**3.5 R$ sob compressão:** se o OPERADOR tem faturamento mensal (do /setup ou da entrevista):
`R$_compressão_12m = faturamento_mensal × 12 × %compressão_12m`. Sem número de faturamento → entregue só o %, marcado, e NÃO estime R$.

**3.6 Vetor de migração** — qual entregável migrar PRIMEIRO. Regra de eleição:

```
Exposição = Score_entregável × %receita   (maior produto = maior sangria)
```

Eleito = maior Exposição, com 1 desempate: se o top-1 tem rota de migração inviável em 90 dias (ex.: exigiria habilidade que o operador não tem nem contrata), desça pro segundo e DIGA por quê. A direção da migração é sempre a mesma tese: **da execução avulsa pra infraestrutura instalada com recorrência** — a versão "sistema instalado no cliente" do que ele já entrega (ex.: "posts avulsos" → "máquina de conteúdo instalada + curadoria mensal"; "tráfego por fee" → "infraestrutura de aquisição com setup + recorrência"). Consulte `_contexto/framework-oferta.md` §6 (biblioteca de mecanismos) pra nomear a rota concreta.

---

## Passo 4 — Artefato: `raio-x.md` (raiz do workspace)

Escreva o arquivo com esta estrutura (tabelas copiáveis; todo número rastreável ao math do Passo 3):

```markdown
# Raio-X de Substituibilidade™ — [nome do operador]
> Gerado por /raio-x em AAAA-MM-DD. Insumos: entrevista + _constructs.md (OPERADOR).
> Rubrica com pesos [HEURÍSTICA] declarados — veja "Como este número foi calculado".

## VEREDITO
**Substituibilidade Index: __/100 — [FAIXA]**
**Faturamento sob compressão de preço/margem (12m): __% (≈ R$__ [ou "sem R$ — faturamento não informado"])**

## WATERFALL DE COMPRESSÃO (12m, por entregável)
| Entregável | % receita | A comodit. | B difer.¹ | C cobrança | D pressão¹ | Score | Fator 12m | % sob compressão |
|---|---|---|---|---|---|---|---|---|
| ... | ... | _/10 | _/10 | _/10 | _/10 | _/100 | 1,0/0,75/0,5/0 | ...% |
**Total sob compressão: __%**
> ¹ B (diferenciação) e D (pressão) são GLOBAIS do negócio — o mesmo valor se repete em todas as linhas; só A e C variam por entregável.

## COMO ESTE NÚMERO FOI CALCULADO
[fórmulas do Passo 3 com os números do operador substituídos, linha a linha]

## EVIDÊNCIA POR EIXO
[Eixo A (por entregável): a ferramenta nomeada. Eixo C (por entregável): o modelo
 de cobrança literal. Eixos B e D (GLOBAIS): os fatos de diferenciação e os eventos
 de pressão verbatim — como só o operador os tem, marque [DECLARAÇÃO — operador].
 Marcas de evidência: GOLD/SILVER/[HEURÍSTICA]/[ESTIMATIVA]/[DECLARAÇÃO — operador]]

## VETOR DE MIGRAÇÃO
**Migrar primeiro: [entregável]** — Exposição = Score __ × __% receita = __ (maior da tabela).
Rota: [de → pra, com o mecanismo concreto da biblioteca do framework-oferta §6]

## OS 3 MOVIMENTOS PRIORIZADOS
1. [movimento com número do diagnóstico + prazo]
2. [movimento com número do diagnóstico + prazo]
3. Rode `/mapear-mercado` — a migração pra infraestrutura exige nicho com dor
   mapeada por evidência, não achismo. [sempre o 3º movimento]
```

**Gate anti-slop nos 3 movimentos (obrigatório antes de salvar):**
- **Teste de substituição:** troque mentalmente o operador/entregáveis por outros — se o movimento continua fazendo sentido, tá genérico. Refaça citando O entregável dele, O score dele, O evento de pressão dele.
- Cada movimento carrega ≥1 número do diagnóstico e 1 prazo.
- Ban-list (proibido no artefato e na conversa): "transformação", "mindset", "guru", "sucesso" (vago), "jornada", "alavancar", "disruptivo", "revolucionar", "próximo nível", promessa de resultado garantido.
- Sempre R$, nunca $.

---

## Passo 5 — Atualizar `_constructs.md`

1. Seção **DIAGNÓSTICO** — preencher os 4 campos:
   - Substituibilidade Index: `__/100 ([FAIXA])`
   - % do faturamento sob compressão de preço/margem (12m): `__% (≈ R$__ se calculável)`
   - Pontos comoditizáveis detectados: `[entregáveis com Score ≥60, com o score de cada]`
   - Vetor de migração recomendado: `[entregável] → [rota de infraestrutura], Exposição __`
2. Seção **STATUS DA INSTALAÇÃO** — linha `1 — Diagnóstico | /raio-x` → `✅ instalado` + data de hoje.
3. NÃO tocar em nenhuma outra seção.

---

## Passo 6 — Handoff (sempre, verbatim no fim da conversa)

> "Diagnóstico instalado. Seu Index tá em `raio-x.md` e no DNA (`_constructs.md`).
> **Próximo: rode `/mapear-mercado`** — antes de migrar qualquer entregável, o OS elege a dor real do seu mercado com evidência. Sem isso, a migração é chute."

---

## Honestidade e fallbacks (contrato do módulo)

- **Fallback chain:** WebSearch (verificação do Eixo A) → falhou → tabela de referência por analogia + [HEURÍSTICA] → nunca inventar ferramenta ou fonte. Dado que o operador não forneceu após 2 tentativas → [ESTIMATIVA] ou [DADOS INSUFICIENTES], nunca preencher por conta.
- **O que este score É:** uma régua consistente e declarada pra comparar a exposição dos SEUS entregáveis entre si e ao longo do tempo (rode de novo por trimestre e compare o delta).
- **O que este score NÃO é:** previsão. Os pesos, cortes e fatores são [HEURÍSTICA] — direção sustentada pela tese do produto (a IA comoditiza execução, não estratégia + contexto proprietário), não por dataset público. A skill nunca apresenta o Index como medição científica.
- **Um turno = uma pergunta** na entrevista. Sem interrogatório em bloco, sem formulário gigante.
