---
name: mapear-mercado
description: >
  Mapeia o mercado do nicho com pesquisa REAL: minera dores articuladas em
  fóruns/comunidades/YouTube PT-BR, captura a linguagem de compra verbatim,
  calcula o custo da inação, estrutura cada dor em 3 camadas com evidência
  marcada [GOLD/SILVER/BRONZE], ELEGE o HERO PAIN e recomenda o eixo de
  segmentação. Grava tudo em nicho/market-map.md + _constructs.md. Use quando
  o usuário rodar /mapear-mercado, perguntar "quais as dores do meu nicho",
  "o que esse mercado sofre", ou quando /raio-x mandar pra cá. Substitui a
  antiga /estudar-mercado.
---

# /mapear-mercado — O mapa real do seu mercado

Camada 1 da instalação. Antes deste módulo, o que você sabe do seu nicho é opinião.
Depois dele, é evidência: 5+ dores estruturadas com fonte, a DOR-HERÓI eleita pelo
sistema (não escolhida no chute), a linguagem que o mercado usa pra comprar, e o
número que mostra quanto custa não resolver.

**Teste que este módulo obedece:** o input vem de pesquisa que o SISTEMA roda (não
da auto-descrição do usuário), e o output contém uma decisão que o usuário não
conseguiria dar sozinho — o hero pain ELEITO de evidência real. Se em algum momento
você (agente) estiver prestes a perguntar "qual você acha que é a maior dor?",
PARE: essa resposta é sua obrigação, não dele.

## O que faz / o que NÃO faz

- ✅ Pesquisa real em 3 frentes de dor → 5+ dores em 3 camadas → hero pain eleito → eixo de segmentação → **sinais de calibração da métrica de promessa (§28)** → dossiê em arquivo
- ❌ NÃO escolhe nicho (isso é /setup + /raio-x) · NÃO analisa concorrentes a fundo (isso é /escanear-concorrencia) · NÃO nomeia mecanismo nem monta oferta (downstream)

## Ferramentas permitidas + fallback chain

Somente estas. Se uma skill antiga mencionar `reddit-research-mcp`, `customer-language-resonance` ou `competitive-ads-extractor` — são fantasmas, não existem nesta caixa. Nunca referencie.

| Ferramenta | Papel | Se falhar / não existir |
|---|---|---|
| **WebSearch** (nativo) | PRIMÁRIO — busca de threads, reclamações, benchmarks | Sempre existe. Se query zera → variar domínio/idioma (3 variações reais) antes de desistir |
| **Firecrawl MCP** (`firecrawl_search` / `firecrawl_scrape`) | Scrape das páginas achadas (fóruns, Reclame Aqui, reviews, artigos) | → WebSearch puro (usa os snippets) |
| **youtube-data MCP** (buscar vídeos) + **youtube-transcript MCP** (transcrever) | Voz de operador real PT-BR — quotes verbatim de quem vive o nicho | → WebSearch "entrevista [operador do nicho]" + Firecrawl → se nada: frente marcada [DADOS INSUFICIENTES] |

**Regra de ferro:** ferramenta falhou em toda a chain → o claim vira `[DADOS INSUFICIENTES]`. NUNCA inventa número, quote ou fonte pra preencher buraco.

## Etapa 0 — Ler o DNA (obrigatório, antes de qualquer pergunta)

1. Ler **`_constructs.md`** (raiz do workspace) inteiro. Interessam: **OPERADOR** (quem é, o que vende, voz) e **DIAGNÓSTICO** (Substituibilidade Index + vetor de migração recomendado pelo /raio-x).
2. Ler `_contexto/empresa.md` + `nicho/00-perfil-cliente-alvo.md` se existirem (seeds do nicho).
3. Se OPERADOR está vazio → avisar: "Seu `_constructs.md` ainda não tem a seção OPERADOR. Rode `/setup` primeiro — o mapa fica muito melhor com seu contexto carregado." e perguntar se quer seguir mesmo assim.
4. Se `nicho/market-map.md` JÁ existe → modo APROFUNDAR: não refaz do zero, adiciona evidência nova, re-elege hero só se a evidência nova justificar (e diz por quê).
5. Ler **`_contexto/mcps-instalados.md`** (status dos MCPs). Se **Firecrawl** estiver skipado/pendente/não-instalado — ou se o arquivo não existir (tratar como não-instalado) — ANTES de disparar a pesquisa, dizer **uma vez**:
   > "Este módulo pesquisa **3× mais fundo com Firecrawl** — ele scrapa o corpo dos fóruns/reviews (posts + comentários), não só o snippet da busca (5 min pra instalar, tier grátis 500 créditos/mês). Quer instalar agora ou rodar em **modo reduzido** (só WebSearch)?
   > Instalar: `claude mcp add firecrawl --env FIRECRAWL_API_KEY=...` (chave grátis em firecrawl.dev)."
   - Instalar → aguarda o usuário instalar, segue com Firecrawl na chain.
   - Modo reduzido → segue só com WebSearch (usa os snippets) e anota em "Buracos declarados" do dossiê que o scrape estruturado ficou de fora (fontes podem ficar mais rasas).
6. Ler **`.claude/rules/CALIBRATION-CORE.md`** — sobretudo **§2** (separar [FATO-USUÁRIO] / [HIPÓTESE] / [INFERÊNCIA-OS] / [DADO-MERCADO] / [CLAIM-CONCORRENTE]; o selo VIAJA junto quando o dado cascateia pro próximo módulo — hipótese não vira fato por ser repetida) e **§6** (rubrica de evidência unificada — **[GOLD-ICP]** voz crua do ICP real · **[GOLD-LP]** pricing/claim visto direto na página do player · **[CLAIM-CONCORRENTE]** número do concorrente não verificado). É a rubrica canônica desta caixa: a marcação de evidência que este módulo aplica na Etapa 3 CITA a §6 (CALIBRATION-CORE §6), não define a própria.
7. Ler **`.claude/rules/outcome-metric-calibration.md`** — o framework da métrica de promessa (CALIBRATION-CORE §28). Interessam a **§1** (OUTCOME UNIT — a unidade de valor certa por nicho, 🔴 NUNCA "lead" por default) e a **§6** (linha de integração deste módulo). Este módulo NÃO crava a promessa numérica (isso é `/criar-oferta` + `/precificar`) — ele COLETA os sinais crus que a calibração usa depois. A coleta roda na **Frente 4** da Etapa 2 e grava em NICHO/MERCADO (Etapa 6).

## Etapa 1 — Confirmar o alvo (no máximo 1 pergunta)

- **Nicho no argumento do comando** (ex: `/mapear-mercado clínicas de estética`) → **não pergunta nada**. Anuncia: "Mapeando [nicho]. Vou pesquisar de verdade — leva alguns minutos." e executa.
- **Sem nicho no argumento** → puxar a **hipótese de nicho** que a Etapa 0 já leu: o campo **Nicho** de `_contexto/empresa.md` (registrado como HIPÓTESE na P8 do /setup) — ou o `nicho/00-perfil-cliente-alvo.md`, se existir. Existe e é específico? → é o **default**: "Seu /setup registrou **[nicho-hipótese]** como hipótese. Mapeio esse pra confirmar com evidência real? (responde outro nicho se preferir)".
- **Nenhuma hipótese, ou hipótese vaga** ("saúde", "empresas") → **UMA pergunta**: "Qual o nicho exato que você quer mapear? Quanto mais específico, melhor o mapa (ex: 'clínicas de estética de 1-3 profissionais', não 'saúde')."
- 🔴 O **vetor de migração** do DIAGNÓSTICO **NUNCA** é o default de nicho. Vetor = o entregável que o operador VENDE e a rota de infraestrutura dele (ex.: "posts avulsos → máquina de conteúdo instalada"), **não o mercado**. Use o vetor só pra afiar a busca (qual dor a solução que ele instala mira?), jamais pra nomear o nicho a mapear.
- Usuário respondeu vago 2 vezes → registra o que tem, declara a suposição ("vou assumir [X]") e segue. Nunca trava o funil em loop de perguntas.
- NUNCA pedir permissão pra pesquisar. Pesquisa e apresenta.

## Etapa 2 — Pesquisa real: 3 frentes de dor + 1 de calibração

Rodar as 3 frentes de dor (o GATE de evidência abaixo mede só elas) + a **Frente 4 de calibração** (leve, §28). Queries em PT-BR primeiro (mercado BR primeiro), EN como complemento quando o nicho tiver literatura gringa útil.

**Canais por tipo de nicho (mire onde o nicho fala de verdade — não queime 3-4 buscas em canal vazio):**

| Tipo de nicho | Onde ele reclama de verdade | Onde NÃO perder tempo |
|---|---|---|
| **Local BR** (clínica, salão, oficina, restaurante, comércio de bairro) | YouTube PT-BR, grupos de Facebook, matérias/portais setoriais, Google reviews, Reclame Aqui (sinal indireto — ver Frente 1) | Reddit (quase zera pra micro-negócio local BR) |
| **Global / técnico / digital** (SaaS, dev, e-commerce, infoproduto, agência) | Reddit, fóruns EN, YouTube, comunidades públicas indexadas (Discord/Slack) | — |

Ajuste as queries da Frente 1 a este mapa ANTES de disparar. [HEURÍSTICA — padrão de onde cada tipo de público se concentra; confirme pelo retorno real e re-mire se um canal vier seco.]

### Frente 1 — Dores articuladas (fóruns, comunidades, YouTube)

Onde o nicho reclama espontaneamente, sem filtro de marketing:

- WebSearch: `"[nicho]" "não consigo" OR "meu problema" site:reddit.com` · `[nicho] maior dificuldade fórum` · `[nicho] reclamação site:reclameaqui.com.br` · `"quem tem [negócio do nicho]" desabafo` · variações com o VOCABULÁRIO do nicho (não o seu)
- Firecrawl: scrape das 5-10 threads/páginas mais promissoras que a busca achou (extrai posts + comentários, não só o título)
- youtube-data: buscar 5-8 vídeos PT-BR de operadores reais ("rotina de [dono do negócio]", "erros de quem abre [negócio]", "a verdade sobre ter [negócio]") → youtube-transcript nos 3-5 melhores → extrair quotes verbatim (com canal + minuto aproximado)
- ⚠️ **Reclame Aqui quando o nicho é o mercado-ALVO B2B do operador** (ele vende PRA clínicas → o nicho mapeado é "clínicas de estética"): o Reclame Aqui traz reclamação de **CONSUMIDOR** (o paciente reclamando DA clínica), não do **DONO** — que é quem sente a dor que o operador resolve. Use como **sinal indireto** (o que o cliente-final xinga vira dor de reputação/operação pro dono), nunca como quote direto da dor do dono.

### Frente 2 — Linguagem de compra verbatim

Como o nicho descreve o que QUER quando está perto de pagar (é a linguagem que vai pra sua LP e sua proposta — capturada, nunca inventada):

- WebSearch: `vale a pena contratar [solução adjacente] para [nicho]` · `quanto custa [solução] [nicho]` · `[ferramenta que o nicho já paga] avaliação OR review`
- Firecrawl: scrape de reviews/depoimentos de soluções que o nicho JÁ compra
- Separar em 2 listas verbatim: **pain words** (como descrevem o problema: "fico refém de indicação", "vivo apagando incêndio") e **outcome words** (como descrevem o que querem: "agenda cheia sem eu correr atrás", "previsibilidade")

### Frente 3 — Custo da inação

O número-âncora de quanto custa NÃO resolver:

- WebSearch: `[nicho] ticket médio` · `[nicho] taxa de no-show OR inadimplência OR churn` · `quanto [nicho] perde com [problema da Frente 1]`
- Sem benchmark publicado → CALCULAR e mostrar a conta: (frequência do problema × valor unitário × 12 meses), marcado `[ESTIMATIVA-BRONZE]` com cada premissa declarada. Conta mostrada > número mágico.

### Frente 4 (leve) — Sinais de calibração da métrica de promessa (§28)

Coleta best-effort: NÃO conta pro GATE das 3 frentes de dor, marca `[D.I.]` o que faltar, nunca inventa (§27). Objetivo: entregar pro downstream os sinais que dizem QUAL número faz sentido prometer NESTE nicho — insumo direto da seção "Métrica de Promessa" do `/criar-oferta` e da validação de ROI do `/precificar`. Aqui você COLETA e MARCA; a promessa numérica é decidida lá, calibrada ao nicho, NUNCA copiada de outro (§28: "12 agendamentos/mês" é forte em solar e fraco em odonto geral/fitness/jurídico).

**Primeiro a UNIDADE DE VALOR do nicho.** 🔴 NUNCA "lead" por default. Cada nicho conta o resultado numa unidade própria: lead qualificado · agendamento qualificado · consulta comparecida · orçamento solicitado/retomado · proposta enviada · reunião comercial · avaliação presencial · paciente de tratamento específico · instalação vendida · aluno matriculado · oportunidade reativada. Descobrir na pesquisa: quando o nicho fala em "ganhar cliente", qual o ELO concreto que ele conta? (dentista → avaliação; solar → visita técnica/instalação; escola → matrícula; advogado → consulta/caso elegível). Capturar o termo VERBATIM do mercado (a Frente 2 já traz pistas). Nicho regulado → a unidade fica no comercial/operacional (agendamento/comparecimento/orçamento), nunca no desfecho clínico (§20).

**Sinais de volume/economia (marcar cada um pela rubrica §6; o que não achar = `[D.I.]`):**
- **Ticket médio / AOV** — valor de uma venda (a Frente 3 já buscou ticket médio → reaproveita, não repesquisa)
- **LTV** — quanto vale o cliente ao longo do relacionamento
- **Valor de UMA oportunidade** — quanto vale 1 [unidade] a mais no mês pro operador (âncora do desejo pela promessa)
- **Capacidade típica/mês** — quantos [unidade] o cliente do nicho consegue atender (limita o número que dá pra prometer)
- **Ciclo de venda** — do 1º contato ao fechamento (curto → número maior faz sentido; longo → número menor porém mais valioso)
- **Frequência de compra** — recorrente · pontual · sazonal
- **Gargalo operacional** — o que trava o crescimento hoje (agenda · equipe · território · mídia · fechamento)
- **Termos do mercado** — como o nicho nomeia a unidade e o resultado (vocabulário verbatim pra promessa soar nativa)

- WebSearch: `[nicho] ticket médio` · `[nicho] LTV OR valor do cliente` · `[nicho] capacidade de atendimento OR agenda` · `[nicho] ciclo de venda` — variar com o vocabulário do nicho.

**Perfil de volume (1 linha `[INFERÊNCIA-OS]`):** classificar em baixo-volume/alto-valor · médio/médio · alto-volume/baixo-valor · recorrente · limitado por capacidade/agenda/equipe/território/ciclo. É o que diz se "12/mês" seria FORTE ou FRACO aqui — sem ainda cravar número (§28: número bom ≠ número maior).

### GATE de evidência (antes de sintetizar)

- Mínimo **12 fontes** somando as 3 frentes (link ou canal+vídeo identificável cada)
- Mínimo **5 quotes verbatim** de operador/cliente real do nicho
- Se não bateu: mais 3 variações de query POR frente fraca (mudar domínio, idioma, sinônimo do nicho). Ainda assim não bateu → declarar o buraco no output com `[DADOS INSUFICIENTES]` — nunca completar com invenção.

## Etapa 3 — Estruturar cada dor em 3 camadas (Sandler)

Agrupar achados por TEMA (não por fonte). Cada dor candidata só entra no top 5+ com **2+ fontes independentes**. Estrutura obrigatória por dor:

```
### Dor N — [frase na linguagem do mercado]
- **Superfície** (o sintoma que ele descreve): [quote verbatim + fonte] [GOLD/SILVER/BRONZE]
- **Negócio** (quanto custa em R$ ou horas — COM a conta): [math + fonte] [marcação]
- **Pessoal** (o que faz com a vida/cabeça dele): [quote ou padrão observado + fonte] [marcação]
- **Fontes:** [2+ links/refs]
```

**Exemplo do formato preenchido (calibre por ele — e NÃO copie o conteúdo):**

```
### Dor 2 — "Vivo refém de indicação"
- **Superfície:** "se o boca-a-boca seca num mês, eu não sei de onde vem o próximo
  cliente" — dono de clínica, thread r/empreendedorismo, 140 upvotes [GOLD]
- **Negócio:** agenda oscila 40% mês a mês; com ticket médio R$180 e ~60 slots,
  a oscilação custa R$4.3K/mês (conta: 60 × 40% × R$180) [BRONZE — ticket de
  benchmark setorial, oscilação reportada em 3 threads]
- **Pessoal:** "não consigo planejar nem as férias, tô sempre no modo sobrevivência"
  — vídeo "a real de ter clínica própria", canal X, ~min 8 [SILVER]
- **Fontes:** [3 links]
```

**Marcação de evidência (rubrica canônica = CALIBRATION-CORE §6):**
- `[GOLD-ICP]` = voz crua do ICP real (operador do nicho) com fonte rastreável — idealmente triangulada com 3+ fontes independentes (que não se citam entre si)
- `[GOLD-LP]` = visto direto em página/ad de player (prova o que a página DIZ, não que é verdade — mais usado no /escanear-concorrencia)
- `[SILVER]` = 1 fonte autoritativa (relatório setorial, dado público, transcrição de operador real) OU consultor que vive do nicho; **blog/conteúdo de fornecedor/agência/software que vende pro nicho = teto SILVER** (parte interessada)
- `[BRONZE]` = 1 fonte não verificada, ou estimativa calculada (mostra a conta)
- `[CLAIM-CONCORRENTE]` = número/promessa de resultado que o player afirma — não verificado; nunca tratar como fato
- `[D.I.]` = não achou — declara, não preenche

**Elegibilidade da fonte do quote (quem conta como o quê):**
- **Operador real do nicho** — dono/gestor que VIVE o negócio (o dono da clínica, o gestor da oficina): fonte primária da dor → pode ser **[GOLD-ICP]** (com triangulação de 3+).
- **Consultor/especialista que VIVE do nicho** — consultor de gestão de clínicas, contador do setor, mentor que atende só esse mercado: conhece a dor por dentro, mas é 2ª mão → no máximo **[SILVER]**. Conta como fonte da dor (não é consumidor).
- **Paciente / consumidor final** — quem COMPRA do nicho, não quem OPERA: **sinal indireto**, nunca quote direto da dor do operador nem uma das 5 quotes do GATE. Vira contexto ("o cliente-final reclama de X → isso pressiona o dono"), não a dor-fonte.

**Independência de fonte:** 5 artigos citando o mesmo estudo = 1 fonte, não 5. Duas threads do mesmo autor = 1 fonte. Cheque antes de carimbar [GOLD].

**Regras de classificação:**
- Dor sem camada Negócio (sem math) = INCÔMODO, não dor sangrando. Mercado não paga pra resolver incômodo — rebaixar.
- Pelo menos 1 dor DESCARTADA ou rebaixada no output. Se tudo virou "dor crítica", você não filtrou nada.
- Checagem de contradição: se a pesquisa contradiz o que o operador assumia (ex: o gargalo declarado no /setup ou /raio-x não é a dor que o mercado paga pra resolver) → dizer na cara, com o dado, e reposicionar como oportunidade maior. Não esconder pra agradar.

## Etapa 4 — Eleger o HERO PAIN (decisão do SISTEMA)

Depois das 5+ dores estruturadas, o sistema ELEGE 1 dor-herói. Não é enquete — é eleição justificada por evidência. O usuário pode contestar depois com dado; ele não escolhe no gosto.

**Fórmula do nome:** `[Nome] = [crença falsa] + [consequência] + [paradoxo]`
> Ex: **"Armadilha do Volume"** = crença "mais leads = mais clientes" + consequência "R$5K/mês em curiosos que não fecham" + paradoxo "quebrado apesar de lotado".

**Critérios de eleição (nesta ordem):**
1. **Guarda-chuva:** as outras dores derivam dela ou desembocam nela
2. **Densidade de evidência:** a dor com mais quotes verbatim + math confirmado
3. **Sufixo Tier 1:** Armadilha · Paradoxo · Ciclo (Trap/Paradox/Cycle se o nicho for global/técnico). Evitar como herói: Crise, Status Quo (fracos)

**Regras de naming (invioláveis):**
- Slot funcional do nome = **Frame A** (mecanismo/ação: Armadilha, Ciclo, Sangria) ou **Frame D** (metáfora concreta: Esteira, Roleta, Balde Furado). **NUNCA Frame B** (identidade/destino: "do Dono", "do Mestre", "Pro") — identidade não descreve o mecanismo da dor.
- Idioma travado: nicho BR → nome 100% PT-BR. Nicho global/técnico → 100% EN. Misturar é proibido.
- O nome emerge DA evidência (primeiro os sintomas e a conta, depois o batismo) — não nasce de brainstorm.

**Bloco obrigatório no output:**
> **HERO PAIN eleito: [Nome]** — eleito porque [critério 1 + evidência]. As dores [X] e [Y] derivam dele. Evidência mais forte: [quote/math + fonte]. Este nome propaga verbatim pro posicionamento, pricing e oferta — não reescreva downstream.

## Etapa 5 — Eixo de segmentação (tabela decisória)

Antes de recomendar recorte, classifique O QUE o operador instala no cliente (a solução dele, da seção OPERADOR/DIAGNÓSTICO):

| Sua solução é... | Teste rápido | Eixo recomendado |
|---|---|---|
| **HORIZONTAL** — o mesmo sistema serve qualquer sub-tipo do nicho | Trocar o sub-tipo no pitch NÃO exige reconstruir nada (mesmo deploy serve estética, odonto, dermato...) | **Maturidade do negócio**: Início (solo, faixa R$X/mês) · Crescimento (equipe pequena, R$Y) · Domínio (multi-unidade, R$Z+) |
| **VERTICAL** — cada sub-tipo exige rebuild (procedimento, regulação, integração) E o cliente final compra o procedimento específico | Trocar o sub-tipo exige reescrever funil/copy/workflow do zero | **Procedimento / Especialização**: focar no sub-tipo de maior ticket COM dor articulada na pesquisa |
| **JÁ ESTREITO** — o nicho já é um recorte único, sem sub-tipos com dores distintas | Não há variação relevante de dor entre sub-grupos | **Não segmentar** — declarar explicitamente por quê |

- Eixo secundário SEMPRE: faixa de faturamento (vira dimensão de pricing no /precificar).
- 🔴 Anti-padrão nº 1: segmentar por procedimento quando a solução é horizontal — encolhe o mercado endereçável 5-20× sem ganhar nada em produto (caso real de calibração do OS-mãe: recorte por procedimento derrubou o alvo de ~5.000-8.000 pra ~200-500 clínicas). Na dúvida entre os dois → horizontal + maturidade.
- A recomendação de eixo cita a evidência da Etapa 3 que a sustenta (dores variam por maturidade? por procedimento? não variam?).

## Voz do dossiê (como escrever o market-map.md)

- **Evidência → Claim → Implicação (ratio 3:1):** 3 evidências empilhadas → 1 claim em bold → 1 implicação. Frases pivot: "O que isso revela:" · "O padrão real:" · "Isso significa:". Dado sem síntese é inventário, não análise.
- **Frase punch** depois de cada bloco de evidência: 1 frase, máx 12 palavras. Modelo: "O problema não é [X]. É [Y]."
- **Especificidade:** "leads são caros" não serve; "R$3-5K/mês em 50+ leads, 80% curiosos" serve. Mire 3 números por frase quando houver dado.
- **Linguagem do mercado, não a sua:** as dores são tituladas com as palavras DELES (capturadas na Frente 2), não com jargão de marketing.
- **Declarativo:** evidência forte → afirme. Fraca → "1 fonte apenas, precisa validação". Nunca o meio-termo hedgeado.
- A energia emocional vem dos DADOS: só escreva "sangrando" se tiver a conta mostrando o sangue.

## Etapa 6 — Gravar os artefatos (nada vive só na conversa)

### 6.1 `nicho/market-map.md` (o dossiê — criar/atualizar)

```markdown
# Market Map — [nicho]
> Gerado por /mapear-mercado em [data]. Fontes: [N] · Quotes verbatim: [N].

## HERO PAIN: [Nome]
[bloco de eleição completo da Etapa 4]

## As dores (top 5+, 3 camadas cada)
[Etapa 3 completa, com marcação + fontes]

## Dores descartadas/rebaixadas
[quais e por quê — 2-4 linhas]

## Linguagem de compra (verbatim — usar como está em LP/proposta)
- Pain words: [10-15 frases literais + fonte]
- Outcome words: [10-15 frases literais + fonte]
- Palavras a evitar (jargão seu que o nicho não usa): [lista]

## Custo da inação
[número-âncora + a conta aberta + marcação]

## Sinais de calibração da métrica (§28 — insumo pra /criar-oferta e /precificar; NÃO é a promessa)
- **Unidade de valor do nicho:** [unidade verbatim — ex: avaliação presencial, matrícula, instalação — 🔴 NUNCA "lead" por default] [marcação]
- **Perfil de volume:** [baixo-volume/alto-valor · limitado por capacidade · recorrente · etc — 1 linha] [INFERÊNCIA-OS]
- **Ticket médio · LTV · valor de 1 oportunidade:** [valores + marcação ou [D.I.]]
- **Capacidade típica/mês · ciclo de venda · frequência:** [valores + marcação ou [D.I.]]
- **Gargalo operacional:** [o que trava o crescimento hoje]
- **Termos do mercado (unidade + resultado, verbatim):** [lista]

## Eixo de segmentação recomendado
[classificação da solução + eixo + evidência que sustenta]

## Buracos declarados
[tudo que ficou [DADOS INSUFICIENTES] — pra caçar depois]
```

### 6.2 `_constructs.md` — seção NICHO/MERCADO (preencher os campos, não reescrever o arquivo)

- **Nicho + eixo de segmentação:** [nicho] · eixo [maturidade/procedimento/único]
- **HERO PAIN (nome + fórmula):** [Nome] = [crença falsa] + [consequência] + [paradoxo] — [evidência: fonte, GOLD/SILVER/BRONZE]
- **Dores secundárias (2-4):** [nomes curtos]
- **Linguagem de compra:** [top 3-5 pain words · top 3-5 outcome words, verbatim]
- **Custo da inação (número âncora):** [R$ ou horas + marcação]
- **Unidade de valor + perfil de volume (§28):** unidade [verbatim, 🔴 não "lead"] · perfil [baixo-volume/alto-valor · limitado por capacidade · recorrente…] + sinais crus (ticket · LTV · capacidade/mês · ciclo · valor de 1 oportunidade · gargalo), cada um com marcação ou [D.I.]. NÃO é a promessa numérica — é o insumo que `/criar-oferta` (seção "Métrica de Promessa") e `/precificar` (validação de ROI) calibram (§28).

### 6.3 STATUS DA INSTALAÇÃO (no `_constructs.md`)

Linha `1 — Mercado | /mapear-mercado` → `✅ instalado | [data de hoje]`.

**Propagação verbatim:** o que entra em NICHO/MERCADO vira DNA — `/posicionar`,
`/precificar` e `/criar-oferta` vão copiar o hero pain e o número-âncora LETRA POR
LETRA. Por isso: nome final aqui (não rascunho), número com marcação, zero campo
preenchido "por enquanto". Este módulo só toca a própria seção + STATUS — nunca
edita seções de outros módulos.

## Etapa 7 — Auto-verificação (corrigir ANTES de entregar)

- [ ] Pesquisa REAL rodou (WebSearch no mínimo) — zero output gerado de memória de treino
- [ ] 12+ fontes totais · 5+ quotes verbatim · cada dor do top com 2+ fontes independentes
- [ ] Toda dor tem as 3 camadas; toda candidata a hero tem math na camada Negócio
- [ ] Pelo menos 1 dor descartada/rebaixada
- [ ] Hero pain ELEITO com bloco de justificativa (não perguntado ao usuário)
- [ ] Nome do hero: fórmula aplicada + Frame A/D (zero "do Dono"/"Master"/"Pro") + 1 idioma só
- [ ] Eixo de segmentação classificado pela tabela + justificado com evidência da pesquisa
- [ ] **Sinais de calibração (§28) coletados:** unidade de valor do nicho definida (verbatim, 🔴 NÃO "lead" por default) + perfil de volume + sinais crus (ticket/LTV/capacidade/ciclo/valor-de-1-oportunidade/gargalo) marcados ou `[D.I.]` — gravados no market-map + NICHO/MERCADO. Este módulo COLETA, não crava a promessa numérica
- [ ] **Teste de substituição:** troque o nicho no dossiê — se ainda fizer sentido, tá genérico. REFAÇA com a evidência específica que coletou
- [ ] Ban-list zero ocorrências: "transformação", "mindset", "guru", "sucesso" (vago), "alavancar", "elevar ao próximo nível", "revolucionar", "desbloquear todo o potencial" · zero hedges ("pode ser", "talvez", "provavelmente" — se a evidência é fraca, diga "1 fonte apenas, precisa validação")
- [ ] Todo claim numérico com marcação [GOLD/SILVER/BRONZE] ou [DADOS INSUFICIENTES]; estimativas próprias com a conta aberta
- [ ] `nicho/market-map.md` salvo + `_constructs.md` (NICHO/MERCADO + STATUS) atualizado

## Handoff (sempre fechar assim)

> Mapa instalado: [N] dores estruturadas, hero pain **[Nome]** eleito, eixo [eixo]. Tudo em `nicho/market-map.md` e no seu `_constructs.md`.
> **Próximo: rode `/escanear-concorrencia`** — agora que sabemos O QUE dói, vamos ver quem já cobra pra resolver e onde está a brecha.

## Racionalizações comuns (e por que não colam)

| "..." | Realidade |
|---|---|
| "Já conheço esse nicho, nem preciso pesquisar" | Conhecimento de treino é genérico e datado. Dor real tem nuance local, temporal e financeira que só pesquisa ao vivo pega. Sem pesquisa = lista que qualquer IA cospe. |
| "Achei 2 posts, já dá" | 1-2 fontes = BRONZE. Dor sangrando exige triangulação (3+ fontes independentes). O gate existe por isso. |
| "O usuário disse que a dor principal é X" | Input do usuário = hipótese pra TESTAR, não verdade pra confirmar. Se a pesquisa contradiz, mostrar o dado e reposicionar — concordar de graça é sabotagem educada. |
| "Não achei número, deixa sem" | Sem camada Negócio a dor não sustenta pricing depois. Calcule com premissas declaradas [BRONZE] ou rebaixe a dor. |
| "Vou escrever o dossiê e completo as fontes depois" | Output antes de pesquisa = alucinação com cara de relatório. A pesquisa GERA o dossiê, não decora ele. |
