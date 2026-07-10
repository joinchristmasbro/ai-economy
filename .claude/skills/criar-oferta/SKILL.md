---
name: criar-oferta
description: >
  Síntese FINAL da oferta — zero pesquisa nova, zero invenção. Lê o
  _constructs.md INTEIRO e compila a oferta em 7 seções traceáveis: o NOME
  DO SISTEMA vem do /posicionar, preço vem do /precificar, e a promise + a
  garantia são CALIBRADAS a prova × o que o operador controla (prova fraca →
  promessa de INSTALAÇÃO + métrica intermediária, não de resultado final que
  ele não controla). Entregáveis nomeados por decisão-de-negócio, vocabulário
  market-native. Faz NO MÁXIMO 2 perguntas (capacidade de entrega + prova
  real). Output: ofertas/[slug]/oferta.md + seção OFERTA do _constructs.md.
  Use quando o usuário rodar /criar-oferta, "montar a oferta", "fechar a
  oferta". Requer fundação instalada (/mapear-mercado → /escanear-concorrencia
  → /posicionar → /precificar completos).
---

# /criar-oferta — Síntese da oferta (traceável, não wizard)

Esta skill NÃO é um questionário. É a **mesa de montagem final**: pega as decisões que os módulos anteriores já tomaram COM DADO e compila numa oferta coerente. Cada frase da oferta é rastreável a uma seção do `_constructs.md`. **Frase sem rastro = inventada = não entra.**

O teste que governa: se o usuário conseguiria responder sozinho, não é pergunta desta skill — é decisão que o sistema já tomou upstream. Preço é CALCULADO (não "escolha uma faixa"). Mecanismo é DERIVADO (não "qual o nome do seu método?"). Promise sai da dor eleita com evidência (não da imaginação).

## O que esta skill NÃO faz (honestidade)

- **Não pesquisa nada novo.** Toda informação vem do `_constructs.md`. Faltou dado → volta pro módulo dono.
- **Não pergunta o nome do sistema.** Ele já existe, verbatim, em §POSICIONAMENTO (com registro + descriptor PT).
- **Não oferece menu de faixas de preço.** O preço já foi calculado em §PRICING.
- **Não inventa case.** Sem prova real → a seção sai marcada `[DADOS INSUFICIENTES — em validação]`.
- **Não promete o que o operador não controla.** Prova fraca ou resultado fora do controle dele → promessa de INSTALAÇÃO + métrica intermediária, nunca resultado final da clínica/cliente (ver Passo 2, calibração prova × controle).

## Passo 0 — Carga de contexto + kill-boundary

Ler, nesta ordem:

1. `_constructs.md` **INTEIRO** (raiz do workspace) — é a única fonte da oferta
2. `_contexto/modelo-nova-economia.md` — filtro de anti-padrões
3. `_contexto/framework-oferta.md` — **biblioteca de consulta** (usar §6 biblioteca de mecanismos pro STACK, §5 benchmarks pra sanity-check, §8 compliance). O naming segue o frame check do Passo 3, e o mecanismo já vem pronto do /posicionar — esta skill não batiza mecanismo.
4. `_contexto/preferencias.md` — tom de voz do operador
5. `.claude/rules/CALIBRATION-CORE.md` **INTEIRA** — a constituição do installer. Esta skill aterrissa em **§8** (gate de drift de ICP), **§9** (infra ≠ gestão de tráfego), **§11** (curva de produtização founder-led → replicável), **§12** (garantia só sobre métrica controlável), **§13** (reativação escopada + productizada, nunca retenção total), **§14** (prova em validação), **§22** (oferta productizada — plano de replicação), **§24** (one-page renderizada + aberta), **§25** (sistema visual por arquétipo — a `oferta.html` HERDA `marca/brand-tokens.json`; sem marca, deriva do arquétipo do nicho), **§28** (calibração de métrica de promessa — QUAL número por nicho) e **§29** (Promise Ladder — a oferta EXPLICA as Camadas 2-3, a garantia FORMALIZA a Camada 4, e o desfecho desejado da Camada 1 é CARREGADO pro /criar-lp liderar; §12 governa só a Camada 4, NÃO proíbe vender o desfecho na copy). Ler direto do arquivo — NÃO depender só da injeção compacta do SessionStart hook.
6. `.claude/rules/outcome-metric-calibration.md` — **framework da Métrica de Promessa (§28)**: governa QUAL número e QUAL unidade cabem no nicho (outcome unit · volume suitability · promise range · os 4 tipos de número). Alimenta a seção **Métrica de Promessa** do output (Passo 5a) e carimba o número que a promise/garantia podem usar publicamente — **só o VALIDADO**.

**KILL-BOUNDARY (sem fundação não há oferta).** Verificar seção a seção do `_constructs.md`. Se QUALQUER dependência dura estiver vazia, PARAR e apontar o módulo dono — sem "posso prosseguir mesmo assim?":

| Seção do _constructs.md | O que a oferta precisa dela | Se vazia → dizer |
|---|---|---|
| §OPERADOR | voz + contexto do negócio | "Rode `/setup` primeiro." |
| §NICHO / MERCADO | hero pain + custo da inação + linguagem de compra | "Rode `/mapear-mercado` — a promise sai da dor eleita com evidência, não dá pra inventar." |
| §CONCORRÊNCIA | THE GAP + o que os que funcionam fazem | "Rode `/escanear-concorrencia` — a garantia deriva da brecha dos concorrentes." |
| §POSICIONAMENTO | fuga de categoria + vilão (diagnóstico) + NOME DO SISTEMA (fórmula + registro) | "Rode `/posicionar` — o nome é derivado dos dados com registro por ICP, esta skill não batiza nada." |
| §PRICING | preço CALCULADO + tiers + math | "Rode `/precificar` — o preço é calculado, não escolhido de menu." |

**Dependência branda:** §DIAGNÓSTICO (/raio-x) vazio → avisar ("seu diagnóstico de substituibilidade ajuda a calibrar o pitch, recomendo rodar depois") mas seguir. Ele diagnostica VOCÊ, não o cliente — não bloqueia a oferta.

Mensagem de parada (exemplo, adaptar):

```
Fundação incompleta. A oferta é síntese do que os módulos anteriores
decidiram com dado — sem [seção], eu estaria chutando [campo].

Falta: /posicionar (mecanismo) e /precificar (preço).
Rode nessa ordem e volte. Leva ~20 min e a oferta sai 10x mais forte.
```

## Passo 1 — As perguntas (NO MÁXIMO 2, uma por vez)

Só perguntar o que o `_constructs.md` **não tem** — fatos que só o operador conhece. UMA pergunta por vez. Se o usuário enrolar ou não souber: registrar o que tem e seguir (nunca travar a síntese).

**Q1 — Escopo de entrega (capacidade simultânea é ECO; ritmo de instalação é a pergunta nova):**

A capacidade SIMULTÂNEA já vive em §PRICING (o /precificar capturou). Cuidado: capacidade simultânea (quantos clientes você atende AO MESMO TEMPO — limite de carteira) ≠ ritmo de instalação (quantas instalações novas você INICIA por mês). São grandezas distintas — a §4 da oferta pede o RITMO (Vagas/mês). Ecoa a capacidade e pergunta o ritmo:

> "Você mantém [N] clientes ao mesmo tempo — e consegue INICIAR quantas instalações novas por mês? E tem algo que você NÃO quer entregar (ex: rodar tráfego, atender fim de semana)?"

Só pergunta a capacidade simultânea do zero se §PRICING não a tiver.

→ Grava DOIS campos distintos: **clientes simultâneos** (limite de carteira, de §PRICING) e **vagas/mês** (ritmo de instalação = escassez real da §4, de Q1). Mais o recorte do STACK e as responsabilidades do cliente.

**Q2 — Prova real:**

> "Você tem algum caso real com números — seu, de cliente, ou do trabalho que você já faz hoje? Formato: [quem] saiu de [antes] pra [depois] em [prazo]. Se não tiver, sem problema: a oferta sai com a prova marcada 'em validação' e você captura nas primeiras entregas."

→ Alimenta §6 PROVA. **Nunca** inventar, inflar ou "arredondar" o caso. Sem caso → `[DADOS INSUFICIENTES]`.

É isso. Zero perguntas sobre resultado desejado, nome de método, ticket ou garantia — tudo isso é derivado no Passo 2.

## Passo 2 — Mesa de derivação (como cada campo nasce)

### 🔴 Antes da mesa: a calibração PROVA × CONTROLE (governa promise + garantia)

Esta é a correção mais importante da skill (calibração OfferCore, PT-BR). **A promessa acompanha a prova, e nunca promete o que o operador não controla.** Rodar este gate ANTES de derivar promise e garantia:

**Eixo 1 — força da prova** (de §NICHO + Q2):

| Prova disponível | Agressividade permitida |
|---|---|
| Caso real com número + prazo + cliente [GOLD] | promessa de RESULTADO permitida (com o número do case) |
| Depoimento sem número / evidência de mercado [SILVER] | promessa de resultado ATENUADA (piso conservador) + garantia sobre processo |
| Autoridade genérica / sem case [BRONZE] ou nenhum | **promessa de INSTALAÇÃO, não de resultado** + oferta em modo piloto |

**Eixo 2 — o que o operador CONTROLA:** ele controla o que ele INSTALA e OPERA (o sistema no ar, o conteúdo publicado, a rota de captura ativa, a mensagem enviada). Ele NÃO controla o resultado final do negócio do cliente (a clínica fechar a venda, o paciente comparecer, o lead ter dinheiro). Regra:

- Controla o resultado final → pode prometer o resultado final.
- **NÃO controla o resultado final → promete a MÉTRICA INTERMEDIÁRIA que ele move** (ex: "mais conversas qualificadas no WhatsApp", "agenda organizada e respondida em <24h"), nunca a métrica final da clínica (ex: "R$ faturado", "pacientes fechados").

**Resultante — a estrutura de 3 NÍVEIS (refinamento auditoria 2026-07-08): "o cliente não compra instalação, compra consequência".**

O erro é colapsar a promessa em "instalação" — isso é honesto mas NÃO vende (instalação é o piso da garantia, não a promessa). O certo é separar em 3 níveis:

| Nível | O que é | Exemplo (prova fraca / não controla o final) |
|---|---|---|
| **(a) PROMESSA COMERCIAL** — vende, forte, NÃO absoluta | o **outcome INTERMEDIÁRIO** que o operador influencia (não a métrica final da clínica) | *"Em 30 dias, sua clínica terá uma rota pronta pra transformar atenção do Instagram em conversas qualificadas e avaliações agendadas — sem depender de post aleatório ou indicação."* |
| **(b) GARANTIA DE CONTROLE** — o que ele BANCA | INSTALAÇÃO completa (o que ele 100% controla) | *"Se em 10 dias úteis a rota não estiver instalada com calendário, CTAs, scripts, etiquetas de qualificação, follow-up e painel — seguimos sem cobrar mensalidade até entregar."* |
| **(c) CLÁUSULA CONDICIONADA** — a peça que faltava | performance intermediária SE o cliente cumprir os combinados | *"Se após 30 dias, cumpridos os combinados mínimos da clínica [resposta ao WhatsApp em <X min, agenda aberta, materiais enviados, scripts usados], o sistema não gerar conversas qualificadas — fazemos uma rodada de otimização sem custo."* |

**Regra:** a PROMESSA (nível a) é o outcome intermediário forte (conversas qualificadas + avaliações agendadas — causalmente ligado ao dinheiro, mas que ele influencia), NUNCA "instalação" seca nem "R$ faturado" (que ele não controla). A GARANTIA vive nos níveis (b)+(c). Com prova GOLD + controle do final, a promessa (a) pode ser o resultado final com o número do case.

Prometer o resultado FINAL do cliente (R$ faturado, pacientes fechados) com prova fraca = **suicídio comercial**. Prometer só "instalação" = **oferta fraca que não vende**. O meio-termo certo = **outcome intermediário forte + garantia de instalação + cláusula condicionada.** Este gate carimba o teto de agressividade de cada nível.

### 🔴 Depois do gate: a MÉTRICA DE PROMESSA (§28 — QUAL número, por nicho)

O gate PROVA × CONTROLE define QUÃO LONGE a promessa vai (resultado final × outcome intermediário × instalação). A **Métrica de Promessa** (framework `.claude/rules/outcome-metric-calibration.md`, §28) resolve a pergunta seguinte: **QUAL número e QUAL unidade** cabem neste nicho. Rodar antes de fixar promise e garantia:

1. **Outcome unit** — a unidade de valor do nicho (agendamento qualificado · avaliação presencial · consulta comparecida · orçamento retomado · instalação vendida · oportunidade reativada…). 🔴 NUNCA "lead" por default; cada nicho tem a sua (de §NICHO, se o /mapear-mercado a capturou).
2. **Volume suitability** — número bom = cria desejo + crível + cabe na capacidade do cliente + sustenta ROI + não atrai lead ruim + respeita o ciclo. NÃO é o maior. Calibrar por ticket + capacidade + ciclo DESTE nicho — nunca copiar número de outro (12 agendamentos/mês é forte em solar, fraco/estranho em odonto geral).
3. **4 tipos de número** — validado / estimado / pesquisado / desejado. 🔴 **Só o VALIDADO entra na PROMESSA pública (§1) e na GARANTIA (§5)** (§28/§27). Estimado/pesquisado/desejado ficam na seção Métrica de Promessa como faixa interna [D.I.], nunca no texto que o cliente vê.
4. Sem número validado → promise sem número (o gate já manda pro outcome intermediário) + faixa interna [D.I.] registrada na seção Métrica de Promessa. Nunca chutar número público.

Isso alimenta a seção **Métrica de Promessa** do output (Passo 5a) e carimba o número que a §1 e a §5 podem usar.

### 🔴 Ainda na Métrica de Promessa: a PROMISE LADDER (§29 — quem fala cada camada)

O gate PROVA × CONTROLE fixa QUÃO LONGE a promessa vai; a Métrica de Promessa fixa QUAL número. A **Promise Ladder** (§29) resolve a **divisão de trabalho**: a promessa tem 4 camadas e cada asset do funil fala UMA. Colapsar as camadas gera os dois erros clássicos — garantir o que não se controla (suicídio comercial) OU ficar tão defensivo que a copy não vende (oferta fraca).

| Camada | O que é | Exemplos por nicho | Quem fala | Mapeia pra… |
|---|---|---|---|---|
| **1 — Desfecho desejado** | o resultado FINAL que o comprador QUER | alunos · matrículas · turmas cheias · pacientes · vendas · deals · agenda cheia | 🔴 **a COPY/LP LIDERA** (via o mecanismo) — /criar-lp | campo "Desfecho desejado" da Métrica de Promessa (carry-over pro /criar-lp) |
| **2 — Evento de conversão** | o elo intermediário que impulsiona o desfecho | avaliação qualificada · consulta · orçamento · visita técnica · reunião | a **OFERTA EXPLICA** | = a **outcome unit** (§28) = **§1 PROMISE nível (a)** |
| **3 — Entregável controlado** | o que o SISTEMA controla e instala | aquisição · resposta · qualificação · agendamento · reativação · follow-up · painel · scripts | a **OFERTA EXPLICA** | = **§3 STACK + camada de handoff** |
| **4 — Garantia formal** | o que se ASSINA | instalação em [prazo] · ciclo 90d · X do evento de conversão SE validado · "ou seguimos otimizando" | a **GARANTIA FORMALIZA** (§12) | = **§5 GARANTIA níveis (b)+(c)** |

**A divisão que ESTA skill respeita:**
- A **oferta EXPLICA as Camadas 2-3** — a §1 PROMISE fixa o evento de conversão (Camada 2 = outcome unit §28, nível (a) do gate); o §3 STACK entrega o controlado (Camada 3).
- A **garantia FORMALIZA a Camada 4** — §5 níveis (b)+(c), dentro da fronteira controlável do §12.
- A **copy/LP LIDERA com a Camada 1** — esta skill NÃO escreve a LP, mas **CARREGA o desfecho desejado** como campo (Passo 5a) pro /criar-lp liderar com ele. A §1 PROMISE da oferta continua no evento de conversão (Camada 2); o desfecho final (Camada 1) é o teto que a copy persegue, não o que a oferta formaliza.

**🔴 §12 governa a Camada 4, NÃO a Camada 1.** "Garantia só sobre o que o sistema controla" (§12) proíbe **ASSINAR** o desfecho final — NÃO proíbe **VENDER** o desfecho desejado na copy. Vender o destino ≠ garantir o destino. Logo: a garantia formal (Camada 4) fica em métrica controlável; a copy pública PODE e DEVE liderar com "mais alunos / mais pacientes / mais vendas" (Camada 1) via o mecanismo. O disclaimer defensivo ("sem prometer aluno", "não garantimos faturamento") vive na garantia/FAQ/notas internas — **nunca na dobra principal** (§15/§29). Esta é a peça que a estrutura de 3 níveis do gate (a/b/c, que cobre só as Camadas 2-4) não tinha: a Camada 1 devolve o desfecho pro escopo da COPY sem tocar no escopo da GARANTIA.

| Campo da oferta | Fonte (verbatim ou derivado) | Regra de derivação |
|---|---|---|
| **PROMISE = nível (a) da estrutura de 3 níveis** | derivado de §NICHO (hero pain + custo da inação) + §PRICING (math) + **gate PROVA × CONTROLE** + **Métrica de Promessa (§28)** | **Primeiro roda o gate acima.** Se prova forte E controla o final → promessa = resultado final com o número do case. Se prova fraca OU não controla o final → promessa = **outcome INTERMEDIÁRIO forte** (a rota que transforma atenção em conversas qualificadas + avaliações agendadas), NUNCA "instalação" seca nem métrica final da clínica. Prazo = janela até a rota estar rodando. Se o custo da inação está BRONZE/[HEURÍSTICA], a promise herda o mark. O custo da inação vira contexto de URGÊNCIA (o que o cliente perde hoje), não a métrica prometida. **A UNIDADE e o número saem da Métrica de Promessa (§28): outcome unit do nicho (nunca "lead" por default) + só número VALIDADO na promessa pública; sem número validado → promise sem número (a faixa interna fica na seção Métrica de Promessa).** |
| **NOME DO SISTEMA** | **verbatim** de §POSICIONAMENTO (nome + registro + descriptor PT) | Copiar sem mutação — nome, registro (hybrid/PT/inglês-system) e descriptor PT. Nome mudou na sua cabeça? Não muda aqui — rode /posicionar de novo. **™ segue o registro:** sem ™ pra cliente pequeno (soa marketeiro); ™ só se o §POSICIONAMENTO registrou inglês-system pra comprador sofisticado. |
| **STACK (entregáveis por decisão-de-negócio)** | §POSICIONAMENTO (componentes) + biblioteca `framework-oferta.md` §6 + Q1 | Selecionar 3-5 componentes que movem o KPI do hero pain. Split setup × recorrência (modelo Nova Economia). **🔴 Nomear cada entregável por DECISÃO-DE-NEGÓCIO, não por tarefa** (calibração OfferCore): "Mapa de Demanda" (não "briefing"), "Rota WhatsApp→Avaliação" (não "captura"/"link na bio"), "Campanha de Agenda do Mês" (não "calendário editorial"). Cada rename move commodity→sistema. IA na retaguarda, ferramenta no máximo entre parênteses. **🔴 CAMADA DE HANDOFF OBRIGATÓRIA (refinamento auditoria):** a oferta NUNCA é só conteúdo/atração — DEVE incluir a camada de **operação comercial** que o operador controla (a rota atenção→conversa→qualificação→agendamento: scripts, triagem, follow-up, recuperação, confirmação). Motivo: o que mais faz falhar é o cliente não executar a parte dele (responde devagar, preço seco, sem follow-up) e culpar o operador. Sem controlar o handoff, o operador entrega conteúdo e leva a culpa pelo buraco de vendas. Pitch: *"a gente não só posta, a gente instala a rota entre atenção, conversa e avaliação."* Q1 corta o que o operador não entrega. **Fallback biblioteca:** se a §6 não cobrir o mecanismo central, NÃO trave — nomeie a partir de §POSICIONAMENTO e marque `[derivado de §POSICIONAMENTO — fora da biblioteca §6]`. **🔴 REATIVAÇÃO É CAMADA ESCOPADA + PRODUCTIZADA (CALIBRATION-CORE §13):** se o stack inclui reativação/retenção, ela entra como camada base, add-on OU tier — ESCOPADA e reutilizável (winback da base parada, recuperação de no-show, follow-up estruturado), NUNCA como promessa de retenção total ("ninguém cancela" / resolver todo o churn / assumir a causa-raiz do churn). O que o pitch promete de reativação tem que estar no tier que o prospect vai comprar. **🔴 PLANO DE PRODUTIZAÇÃO (CALIBRATION-CORE §22 + §11):** o stack DEVE incluir a camada de replicação — SOPs, templates, checklists, automações e playbook de instalação — que faz cada instalação ficar mais rápida depois dos 2-3 primeiros clientes (curva founder-led → replicável). A oferta EXPLICA esse caminho, não entrega só os componentes do primeiro cliente. |
| **PRICING + tiers (fases por prova)** | **verbatim** de §PRICING | Copiar preço, tiers e o math que justifica. **Estruturar em 2 FASES quando a prova é fraca** (calibração OfferCore): Fase 1 = piloto (menor, gera a prova) → Fase 2 = pós-validação (maior, com o case na mão). Usar os tiers de §PRICING como as fases (tier de entrada = piloto; tier acima = pós-prova). Achou caro/barato? Não ajusta aqui — rode /precificar de novo. |
| **GARANTIA = níveis (b)+(c) da estrutura de 3 níveis** | derivada de §CONCORRÊNCIA (THE GAP) + §PRICING (margem) + **gate PROVA × CONTROLE** | Duas peças: **(b) garantia de controle** = INSTALAÇÃO completa com prazo curto ("rota instalada em 10 dias úteis com [componentes], ou seguimos sem cobrar mensalidade até entregar") — o que ele 100% banca. **(c) cláusula condicionada** = performance intermediária SE o cliente cumprir os combinados mínimos ("cumpridos [pré-condições], se não gerar conversas qualificadas em 30 dias, otimização sem custo"). Prova forte + controla o final → pode somar uma garantia de resultado com o número do case. NUNCA "R$ recuperado ou grátis" com prova fraca. Pré-condições = responsabilidades do cliente (Q1 + escopo). Garantia que a margem não banca = falsa → reduzir escopo, não remover pré-condição. **🔴 FRONTEIRA CONTROLÁVEL (CALIBRATION-CORE §12):** a garantia opera SÓ sobre métrica que o SISTEMA controla — instalação da infra, agendamento/consulta qualificada, oportunidades reativadas, SLA de follow-up, otimização sem custo se critérios cumpridos. NUNCA sobre faturamento, fechamento, receita recuperada, comparecimento total, churn zero, retenção total ou desfecho clínico (dependem de preço/oferta/atendimento/experiência/disponibilidade do cliente). Fronteira que TODO módulo downstream (LP, pitch, proposta) preserva verbatim: "o sistema controla a máquina que leva a oportunidade qualificada até a agenda; o cliente controla fechamento, atendimento, preço, oferta, disponibilidade e experiência." |
| **PROVA** | Q2 + §NICHO (evidência de mercado, com marks) | Caso real com números [GOLD]. Sem caso próprio: evidência de mercado de §NICHO citada como "dado de mercado, não resultado meu" [SILVER/BRONZE]. Sem nada: `[DADOS INSUFICIENTES — em validação]`. A força daqui é o Eixo 1 do gate PROVA × CONTROLE. |
| **ARGUMENTO CENTRAL / CTA** | §POSICIONAMENTO (fuga de categoria + vilão) + PROMISE | 1 frase: category-escape/vilão → nome do sistema → promise (calibrada). É a frase que o operador fala quando perguntam "o que você faz?". |

**Marks propagam, nunca são lavados.** Campo derivado de dado [BRONZE] ou [HEURÍSTICA] carrega o mark no rascunho da oferta (o operador decide se mantém no material público, mas o arquivo interno registra a confiança real).

### Fio de derivação completo (exemplo ILUSTRATIVO — números fictícios, não copiar)

Como um `_constructs.md` de clínicas odontológicas viraria oferta — **com o gate PROVA × CONTROLE aplicado** (operador sem case ainda, não controla o comparecimento final da clínica):

| No _constructs.md está... | Vira na oferta... |
|---|---|
| §NICHO hero pain: "agenda furada — 30-40% de no-show" [SILVER] · custo da inação: "R$18-25K/mês em cadeira vazia" [BRONZE] | **PROMISE (calibrada):** "Em 45 dias, o sistema de confirmação e reativação instalado e rodando — a agenda respondida no mesmo dia e a base parada sendo reativada." Instalação + métrica intermediária (o que ele CONTROLA). O "R$18-25K em cadeira vazia" vira contexto de URGÊNCIA (o que a clínica perde hoje), NÃO a métrica prometida — porque a prova é fraca e ele não controla o comparecimento |
| §POSICIONAMENTO nome do sistema: "Dental Booking Engine" (hybrid) · descriptor PT: "Sistema de confirmação e reativação que enche a cadeira sem depender de mais leads" | **§2 verbatim** — nome + descriptor no título, tagline e §7. Sem ™ (clínica pequena = registro hybrid/PT). Nunca vira "Blindagem de Agenda" nem "BookingShield" no meio do caminho |
| §CONCORRÊNCIA THE GAP: "players vendem 'mais leads' e entregam curioso desqualificado; ninguém instala o sistema de confirmação" | **GARANTIA (calibrada a controle):** "Sistema de confirmação e reativação instalado e rodando em 45 dias, ou seguimos operando sem custo até estar no ar." Garante o que ELE controla (instalação), não o comparecimento da clínica — porque sem case a promessa de resultado seria irresponsável |
| §PRICING: "Setup R$14K + R$2,5K/mês · tiers R$8K/R$14K/R$22K" | **§4 em 2 FASES:** Fase 1 piloto = tier de entrada (gera o case) → Fase 2 pós-validação = tier acima (com a prova na mão). O math vai junto; a skill não arredonda "porque soa melhor" |
| Q1: "atendo 8 clientes ao mesmo tempo, inicio 3 instalações/mês, não rodo tráfego do cliente" | **STACK (decisão-de-negócio):** "Rota de Confirmação de Agenda", "Campanha de Reativação da Base", "Mapa de No-Show" — não "automação de WhatsApp"/"disparo". Tráfego fora do escopo (pré-condição do cliente) · **§4:** "3 vagas/mês" (ritmo) + "8 clientes simultâneos" (carteira) |
| Q2: sem case ainda | **§6:** `[DADOS INSUFICIENTES — em validação: capturar case nas 3 primeiras entregas]` — e a garantia de INSTALAÇÃO segura a venda no lugar da prova de resultado |

O padrão a internalizar: **a oferta não cria nada — ela traduz.** Cada célula da direita morre sem a célula da esquerda. E a força da prova é o que carimba quão longe a promise e a garantia podem ir.

## Passo 3 — Naming check (antes de escrever)

O NOME DO SISTEMA chega pronto do /posicionar (com registro + descriptor PT). Copiar **verbatim**, sem mutação, respeitando o ™ do registro (sem ™ pra cliente pequeno). Mas TUDO que ESTA skill nomear — os entregáveis do stack, o nome da garantia, título de bônus — passa por 2 filtros:

**Filtro 1 — decisão-de-negócio, não tarefa (calibração OfferCore):** cada entregável tem nome de uma decisão/ativo de negócio, não de uma tarefa operacional.

| ❌ Tarefa (commodity) | ✅ Decisão-de-negócio (sistema) |
|---|---|
| "briefing" / "reunião de alinhamento" | "Mapa de Demanda" |
| "captura de leads" / "link na bio" | "Rota WhatsApp→Avaliação" |
| "calendário editorial" / "pauta de posts" | "Campanha de Agenda do Mês" |
| "relatório de métricas" | "Leitura de Conversão do Mês" |

**Filtro 2 — sem identidade (Frame B):** nenhum entregável ou sub-nome usa "Dono", "Master", "Pro", "Expert", "Elite" (descreve quem a pessoa vira, não o ativo que o sistema move). Usar o ativo de negócio (Demanda, Conversão, Agenda, Reativação, Confirmação).

**PROIBIDO também:** nome que colide com player mapeado em §CONCORRÊNCIA (checar a lista antes de salvar) · naming genérico de sonoridade sem derivação (nome bonito que serve pra qualquer nicho = nome de nada) · metáfora fofa batizada com ™ pra cliente pequeno ("Motor de Vitrine™", "Blindagem de Agenda™").

## Passo 4 — Gates anti-slop (rodar ANTES de salvar)

**1. Teste de substituição:** trocar o nicho no texto da oferta por outro qualquer. Se a oferta ainda fizer sentido, tá genérica — reescrever a seção usando a linguagem de compra verbatim de §NICHO (pain words / outcome words do mercado real).

**2. Ban-list (grep no output antes de entregar):**
- Cacoetes de guru: "transformação", "mindset", "guru", "sucesso" (vago), "elite", "destrave", "alavancar" (vago), "próximo nível"
- Cacoetes de IA: "não é só X, é Y", "num mundo onde", "imagine...", "revolucione", "potencialize", "eleve seu negócio"
- Hedge em registro comercial: "pode ser", "talvez", "depende", "você poderia"

**3. Filtro Nova Economia (anti-padrões do modelo — preservados):**
- Setup tem hora/projeto disfarçado? → reescrever como instalação com preço sobre resultado
- Pitch vende "automatização com IA"? → reposicionar pra outcome (IA é retaguarda)
- Setup fraco + mensalidade alta? → re-balancear o split do stack
- Sistema depende de operação manual contínua do operador? → reformular componente

**4. Coerência com §PRICING:** se a oferta montada contradiz o modelo (ex: stack não justifica o setup calculado) → NÃO ajustar preço aqui; flag + recomendar re-rodar /precificar com o escopo de Q1.

**5. Voz:** registro comercial-decisivo, 2ª pessoa dominante. Frases-pivô do padrão:
- "Você recebe:" / "O que nós instalamos:" / "Nós garantimos:"
- "**Sistema:** [nome]" (label + valor, estilo spec-sheet)

**6. Vocabulário market-native + separação de FUNÇÃO DE FUNIL (refinamento auditoria):** dois testes. Primeiro, market-native (as palavras que o NICHO usa, não jargão de social media). Segundo, **nunca misturar função de marketing com função de vendas num nome só** — "conteúdo comercial" é o anti-padrão (conteúdo = marketing, comercial = vendas; misturar suja qual pedaço do funil você fala). Nomear as camadas por função:

| Camada | Função | Nome | Componentes |
|---|---|---|---|
| **Conteúdo de Demanda** | marketing (atrai a pessoa certa) | *interno:* "conteúdo de demanda" · *pro cliente:* "conteúdo que faz a pessoa certa chamar" | dor · desejo · prova · objeção · critério de escolha · CTA |
| **Rota WhatsApp→Avaliação** | vendas (converte interesse em agenda) | "Rota WhatsApp→Avaliação" | triagem · qualificação · convite · follow-up · confirmação · recuperação · motivo de perda |
| **Painel de Aprendizado** | gestão (mostra onde perde dinheiro) | "Painel de Aprendizado" | conversas · qualificadas · agendadas · comparecimento · perda · tempo de resposta |
| **Rotina de Otimização** | melhoria (ajusta com base nos dados) | "Rotina de Otimização" | ajuste quinzenal de conteúdo + WhatsApp por motivo de perda |

| ✅ USAR (market-native) | ❌ EVITAR |
|---|---|
| avaliação · agenda · conteúdo de demanda · prova · confiança · rota · conversas qualificadas · procedimentos prioritários · reativação | **"conteúdo comercial"** (mistura marketing+vendas) · call/consulta (quando o nicho diz "avaliação") · post bonitinho · gestão de Instagram · pacote de posts · engajamento (métrica) · viralizar · trends · "IA para posts" · agenda cheia garantida |

Cada troca move commodity→sistema. Se o nicho tem termo próprio (§NICHO), ele ganha da lista genérica.

**7. Evidence-floor (o freio anti-"embalar habilidade fraca com linguagem forte" — refinamento auditoria).** A IA é ótima em criar lógica convincente pra algo não provado. Antes de a oferta sair, checar 5 provas mínimas (herdadas de §NICHO + §CONCORRÊNCIA + §DIAGNÓSTICO + Q2):
1. O mercado reconhece a dor com as PRÓPRIAS palavras (linguagem de compra verbatim em §NICHO)?
2. A dor custa dinheiro ou agenda (custo da inação com número)?
3. A pessoa já tentou resolver de outro jeito (o Old Game documentado)?
4. O operador controla uma parte RELEVANTE da solução (o handoff, não só o conteúdo)?
5. O sistema gera um 1º "evento de valor" em 14-30 dias (conversas qualificadas / avaliação agendada)?

Se ≥2 falharem → a oferta sai marcada `[HIPÓTESE FRACA — validar antes de tráfego]` e o handoff recomenda `/plano-validacao` (piloto). Floor **gradual**: quem já atua (tem clientes) traz parte da prova; iniciante-zero roda o piloto mínimo. Nunca inventar prova pra fechar o floor.

**8. Compliance do nicho** (framework-oferta §8): saúde/regulados — zero promessa de resultado clínico garantido (a garantia opera sobre métrica comercial que o operador controla: agendamento, conversas qualificadas, sistema instalado — nunca desfecho de tratamento nem receita). **🔴 Estende ao CONTEÚDO que o sistema gera:** em nichos médicos (estética com procedimento médico, odonto, etc.), posts/provas/antes-e-depois seguem publicidade do conselho (ex: CFM Resolução 2.336/2023 `[VERIFICAR]` — antes/depois só com caráter educativo + autorização + privacidade + sem sensacionalismo/autopromoção; identificação com registro quando aplicável). A oferta DEVE incluir uma camada mínima de compliance no conteúdo, senão cria risco pro cliente.

## Passo 5 — Output (artefatos, nunca só texto na conversa)

### 5a. Criar `ofertas/[slug]/oferta.md`

Slug = nome do sistema em kebab-case (ex: `dental-booking-engine`). Estrutura obrigatória — **cada seção com a linha de TRACE**:

```markdown
---
slug: [slug]
sistema: "[NOME DO SISTEMA verbatim]"
registro: [hybrid / PT-simples / inglês-system]
status: rascunho
criada: [AAAA-MM-DD]
---

# [NOME DO SISTEMA] — Oferta

## 0. A PERDA (o doc LIDERA com isso, não com o nome — refinamento auditoria)
[1-2 frases: a perda específica do comprador, na linguagem dele + o número (custo da inação). O comprador se reconhece ANTES de ver qualquer nome de sistema.]
`← _constructs.md §NICHO (hero pain + custo da inação) + §POSICIONAMENTO (vilão-diagnóstico)`

## Métrica de Promessa (nota interna — calibra §1 e §5, §28 + Promise Ladder §29)
- **Desfecho desejado (Camada 1 — §29):** [o resultado FINAL que o comprador QUER — alunos / matrículas / pacientes / vendas / agenda cheia. 🔴 CARRY-OVER pro /criar-lp LIDERAR (via mecanismo). A oferta NÃO o promete (§1) nem o garante (§5) — só o registra aqui. §12 proíbe GARANTIR o desfecho (Camada 4), não VENDER o desfecho na copy (Camada 1).]
- **Outcome unit (Camada 2 — §28):** [unidade de valor do nicho — agendamento qualificado / avaliação presencial / consulta comparecida / orçamento retomado / instalação vendida / oportunidade reativada — 🔴 NUNCA "lead" por default]
- **Número validado (se houver):** [número + fonte: case / garantia definida / histórico próprio / input confirmado] OU `[D.I. — sem número validado]`
- **Faixa interna sugerida:** conservadora [x–y/mês] · agressiva [w–z/mês] `[estimada/pesquisada — NÃO pública]`
- **Número PÚBLICO permitido:** [só o VALIDADO] OU "nenhum — promise sem número"
- **Número PROIBIDO / arriscado:** [o que não cabe na capacidade / atrai lead ruim / está fora do controle — ex: "50 avaliações/mês" sem prova nem capacidade]
- **Garantia possível (número):** [número que aguenta garantia operacional real] OU "sem número — garantia de instalação (nível b)"
- **Inputs faltantes:** [ticket / capacidade mensal / fechamento / verba / ciclo que faltam pra fechar a faixa]
> 🔴 Só o número **VALIDADO** entra na §1 PROMISE e na §5 GARANTIA públicas (§28/§27). Estimado / pesquisado / desejado ficam AQUI (nota interna), nunca no texto que o cliente vê. Número calibrado a ESTE nicho (ticket · capacidade · ciclo), nunca copiado de outro.
> 🔴 **Promise Ladder (§29):** §1 PROMISE = Camada 2 (evento de conversão = outcome unit) · §3 STACK = Camada 3 (entregável controlado) · §5 GARANTIA = Camada 4 (o que se assina, §12) · **Desfecho desejado = Camada 1** (o que a LP LIDERA) — CARREGADO aqui, não formalizado na oferta. §12 governa só a Camada 4: não bloqueia vender o desfecho na copy.
`← _constructs.md §NICHO (outcome unit + sinais de volume) + §PRICING (ticket/capacidade/math) + Q2 (número validado) + .claude/rules/outcome-metric-calibration.md (§28) + CALIBRATION-CORE §29 (Promise Ladder — Camada 1 desfecho desejado)`

## 1. PROMISE (nível a — outcome intermediário forte)
"[outcome intermediário que o operador influencia — a rota que vira conversas qualificadas + avaliações] em [prazo]."
[1 parágrafo: pra quem (perfil de §NICHO), o que a rota instala, por que agora
(custo da inação como URGÊNCIA, não como métrica prometida). NÃO promete "instalação" seca nem o resultado final do cliente.]
`← _constructs.md §NICHO (hero pain + custo da inação) + §PRICING (math) + gate PROVA × CONTROLE`

## 2. O SISTEMA
**[Nome verbatim]** — [descriptor PT: o (tipo de sistema) que (verbo) (ativo de negócio) pra (perfil)]
**Vilão que ele mata:** [diagnóstico verbatim de §POSICIONAMENTO — não batizado]
**Componentes** (entregáveis por decisão-de-negócio, ingredientes de UM sistema):
| Componente | Dor que resolve | O que faz |
|---|---|---|
`← _constructs.md §POSICIONAMENTO (nome + registro verbatim · entregáveis = decisão-de-negócio ✔)`

## 3. STACK DE ENTREGÁVEIS (por camada de função de funil)
**Marketing — Conteúdo de Demanda:** [o que atrai a pessoa certa]
**Vendas — Rota WhatsApp→Avaliação (handoff OBRIGATÓRIO):** [triagem, scripts, follow-up, recuperação — o que o operador controla]
**Gestão — Painel de Aprendizado + Rotina de Otimização:** [o que mede + ajusta]
**Reativação (se no escopo — camada base/add-on/tier):** [winback da base parada · recuperação de no-show · follow-up estruturado — ESCOPADA e reutilizável, nunca "retenção total"/"ninguém cancela"/resolver todo o churn (§13)]
**Plano de produtização (founder-led → replicável):** [SOPs · templates · checklists · automações · playbook de instalação — como a entrega fica mais rápida e replicável depois dos 2-3 primeiros clientes (§22 + §11)]
**Do cliente (pré-condições):** [responsabilidades — alimentam a garantia nível b/c]
`← §POSICIONAMENTO + framework-oferta §6 (biblioteca) + Q1 (capacidade/escopo) + camada handoff obrigatória + CALIBRATION-CORE §13/§22/§11`

## 4. PRICING (em fases, se a prova pede)
**Fase 1 — Piloto (gera a prova):** [tier de entrada — setup + mensal]
**Fase 2 — Pós-validação (com o case):** [tier acima — setup + mensal]
**Math que justifica:** [verbatim do /precificar]
**Vagas/mês (ritmo de instalação):** [de Q1 — escassez real da oferta]
**Clientes simultâneos (limite de carteira):** [de §PRICING/Q1 — grandeza distinta de vagas/mês]
`← _constructs.md §PRICING (verbatim — CALCULADO, não escolhido) + Q1 (ritmo)`

## 5. GARANTIA (níveis b + c — calibrada a controle)
**(b) Garantia de instalação:** "[rota instalada com componentes] em [prazo curto], ou seguimos sem cobrar mensalidade até entregar."
**(c) Cláusula condicionada:** "cumpridos [pré-condições do cliente], se não gerar [outcome intermediário] em [prazo], otimização sem custo."
**Por que podemos garantir:** [ataca THE GAP + é o que o operador controla, por isso a margem banca]
`← _constructs.md §CONCORRÊNCIA (THE GAP) + §PRICING (margem banca) + gate PROVA × CONTROLE`

## 6. PROVA
[Caso com números + mark de evidência] OU
[DADOS INSUFICIENTES — em validação: capturar case nas 3 primeiras entregas]
`← Q2 (operador) + §NICHO (evidência de mercado, marks preservados)`

## 7. ARGUMENTO CENTRAL + CTA
**A frase:** [fuga de categoria/vilão] → [nome do sistema] → [promise calibrada].
**Próximo passo do comprador:** [1 ação: diagnóstico/avaliação/reserva — per GTM do nicho, na palavra do nicho]
`← §POSICIONAMENTO (fuga de categoria + vilão) + §1 (promise)`
```

Checks do artefato: **§0 A PERDA abre o doc** (não o nome — buyer-first) · nome do sistema verbatim em ≥3 âncoras (título + §2 + §7) · **Métrica de Promessa preenchida** (outcome unit do nicho + 4 tipos de número; só o VALIDADO na §1/§5 pública, §28) · **Desfecho desejado (Camada 1, §29) registrado** como carry-over pro /criar-lp · **promessa = nível (a) outcome intermediário forte** (= Camada 2; não instalação seca, não resultado final não-controlado) · **garantia = níveis (b)+(c)** (= Camada 4; instalação + cláusula condicionada) · handoff/Rota presente no STACK · zero número divergente entre seções · tudo dentro do teto do gate PROVA × CONTROLE.

### 5b. Atualizar `ofertas/_index.md`

```
| [slug] | [NOME DO SISTEMA] | rascunho | [camada atacada] | [data] |
```

### 5c. Atualizar `_constructs.md`

Seção **OFERTA** (preencher cada campo + trace):
- Métrica de Promessa (outcome unit + número validado/faixa interna, §28) · PROMISE (N + outcome + prazo) · Garantia · Stack de entregáveis · Argumento central
- Trace: cada campo aponta a seção do próprio arquivo que o originou

Tabela **STATUS DA INSTALAÇÃO**: linha `2 — Oferta | /criar-oferta` → ✅ instalada + data.

### 5d. Renderizar o DOCUMENTO DA OFERTA premium + ABRIR (CALIBRATION-CORE §24 + §23)

O `oferta.md` é markdown cru — o operador NÃO "vê" a fundação nele, e a oferta "parece que não foi gerada". A fundação merece o clímax visível: renderizar a oferta numa página web premium e ABRIR.

1. Gerar `ofertas/[slug]/oferta.html` — HTML single-file autossuficiente (CSS inline). **🔴 O estilo HERDA a marca, não é fixo (CALIBRATION-CORE §25):**
   - **Se existe `marca/brand-tokens.json` → HERDAR os tokens, zero drift.** Precedência: `clientes/[slug]/marca/` > `marca/` (workspace). Ler o arquivo e aplicar os valores literais no CSS inline — paleta OKLCH (base + neutros + acento de status), tipografia (display/body/mono), raio, sombra, motion (durations/easing) e density do token. O OKLCH que sai no HTML é **o mesmo** do `brand-tokens.json` (o teste de zero-drift de §25). Se `provisional_status: provisional-v1`, o selo de provisório vai só nas **notas internas** (§15), nunca na copy pública.
   - **Se NÃO existe marca → derivar do ARQUÉTIPO do nicho (§25), não assumir cego.** Ler o arquétipo em §NICHO/§POSICIONAMENTO (mercado · ICP · confiança · ticket · regulação · categoria emocional) e escolher a direção condizente: odonto/estética/saúde → *Clinical Premium* (base clara neutra, acento teal/azul profundo); fitness/box/franquia com agenda → *Performance Operations* (base escura, alto contraste, acentos de status verde/azul/âmbar); serviço local/facilities → *Local Specialist* (neutro quente sólido, badges de prova); **IA/automação/revenue/diagnóstico → *AI Infrastructure*** (dark arquitetural, mono+geométrica, acento elétrico contido — é aqui que o antigo "naipe AI Economy" preto/branco/cinza sóbrio vira o default). Para ofertas de IA/revenue **tende** a AI Infrastructure, mas **DERIVAR do nicho** — nunca defaultar tech-premium fixo pra um nicho clínico/local/fitness. Recomendar rodar `/marca` pra travar os tokens depois.
   - Sóbrio em qualquer arquétipo — não colorido de guru. Estrutura estilo report (herdando o material acima):
     - Header + cards de métrica (custo da inação · N+outcome da promise · vagas/mês · faixa de pricing).
     - As 7 seções do `oferta.md` (lidera com §0 A PERDA — buyer-first).
     - Um **SCORE** de prontidão da oferta (mesma pegada visual do Raio-X Index).
     - Fecho: como aplicar / próximo passo.
2. **Moldura de estado (§2/§14):** operador FUNDANDO → a página abre marcada "Oferta v1 — hipótese a validar" e os campos sem prova carregam `[HIPÓTESE]`/`[D.I. — em validação]`; operador JÁ ATUANDO → usa os números do `/raio-x`.
3. **Copy pública ≠ notas internas (§15):** selos de evidência, compliance e ressalvas ficam num bloco "notas internas" recolhível (ou rodapé discreto) — NUNCA no corpo persuasivo.
4. Abrir: `open ofertas/[slug]/oferta.html` (macOS) · `xdg-open` (Linux) · `start` (Windows). Se `open` falhar, dar o path absoluto — mas SEMPRE renderizar o HTML.

Bloco de AUDITORIA ao gravar (§3): listar `oferta.md` + `oferta.html` + `_index.md` + linha STATUS + a linha de proveniência de 1 seção.

## Passo 6 — Handoff (funil interno)

```
Oferta compilada: [NOME DO SISTEMA]
→ ofertas/[slug]/oferta.md   (7 seções, cada uma rastreável ao _constructs.md)
→ ofertas/[slug]/oferta.html → ABERTO no navegador ✅ (seu documento de oferta premium)

Fundação completa. Confere o documento que abriu. Próximo: /criar-lp (seu primeiro ativo no ar).

Enquanto isso, no mundo real: valide a promise em 3-5 conversas com
clientes do perfil — a oferta é rascunho até alguém pagar por ela.
```

## Comportamentos especiais

**Refinar oferta existente:** detectar pasta `ofertas/[slug]/` mencionada → modo refinar. Ler a oferta atual e perguntar o que mudou. MAS: mudança de preço → "rode /precificar"; mudança de nome/vilão/categoria → "rode /posicionar"; mudança de dor/mercado → "rode /mapear-mercado". Esta skill só refina localmente o que nasceu aqui: capacidade, escopo do stack, prova, CTA. Salvar nova versão preservando a anterior (o hook de git guarda histórico).

**Múltiplas ofertas no mesmo nicho:** permitido — cada execução cria pasta nova em `ofertas/[slug]/`. Cada uma exige o próprio ciclo /posicionar + /precificar (nome e preço não se herdam entre ofertas).

**Constructs com marks fracos:** se a fundação inteira está em [BRONZE]/[HEURÍSTICA], a skill monta a oferta mas abre o output com: "Atenção: esta oferta está apoiada em evidência fraca ([listar]). Ela funciona como rascunho de trabalho — fortaleça rodando [módulo] antes de investir em tráfego."

## Quality gates (checklist final — se algum falhar, corrigir antes de salvar)

- [ ] `_constructs.md` lido INTEIRO; 5 dependências duras presentes (ou skill PAROU no Passo 0)
- [ ] ≤2 perguntas feitas, uma por vez, e nenhuma pedia decisão que o sistema já tomou
- [ ] **§0 A PERDA abre o doc** (buyer-first — o comprador se reconhece ANTES de ver o nome)
- [ ] **Gate PROVA × CONTROLE rodado ANTES de promise/garantia** — teto de agressividade carimbado
- [ ] **Métrica de Promessa (§28) preenchida** — outcome unit do nicho (não "lead"), número classificado (validado / estimado / pesquisado / desejado), **só o VALIDADO na §1/§5 pública**; número calibrado ao nicho (ticket · capacidade · ciclo), não copiado de outro
- [ ] **Promise = nível (a) outcome intermediário FORTE** (a rota → conversas qualificadas + avaliações), nunca "instalação" seca nem resultado final não-controlado. Custo da inação = urgência, não métrica prometida
- [ ] **Promise Ladder (§29) mapeada** — Desfecho desejado (Camada 1) registrado como carry-over pro /criar-lp; §1 PROMISE = Camada 2 (evento de conversão) · §3 STACK = Camada 3 · §5 GARANTIA = Camada 4; §12 governa SÓ a Camada 4 (não bloqueia vender o desfecho na copy)
- [ ] **Garantia = níveis (b) instalação + (c) cláusula condicionada** — margem banca o que ele controla
- [ ] **Evidence-floor (5 provas) checado** — se ≥2 falham, oferta marcada [HIPÓTESE FRACA] + recomenda /plano-validacao
- [ ] **Camada de handoff/operação-WhatsApp presente no STACK** (não só conteúdo)
- [ ] **Reativação (se no stack) escopada + productizada** — camada base/add-on/tier, nunca "retenção total"/"ninguém cancela"/resolver todo o churn (CALIBRATION-CORE §13)
- [ ] **Plano de produtização presente** — SOPs/templates/checklists/playbook de instalação (curva founder-led → replicável, CALIBRATION-CORE §22 + §11)
- [ ] **Garantia só sobre métrica controlável** (instalação · agendamento/consulta qualificada · reativação · SLA de follow-up · otimização condicionada), nunca faturamento/fechamento/receita recuperada/comparecimento/desfecho clínico (CALIBRATION-CORE §12)
- [ ] Nome do sistema, preço, tiers e math copiados VERBATIM (zero mutação); ™ só se o registro pede
- [ ] Entregáveis nomeados por DECISÃO-DE-NEGÓCIO (não tarefa); Frame B (identidade) zero; zero colisão com player mapeado
- [ ] Pricing em 2 fases quando a prova é fraca (piloto → pós-validação)
- [ ] Cada seção tem linha de trace `← _constructs.md §X`
- [ ] Prova real ou `[DADOS INSUFICIENTES]` — nunca case inventado/inflado
- [ ] Teste de substituição passou (trocou o nicho → oferta quebra)
- [ ] Ban-list limpa (guru + cacoete de IA + hedge) + vocabulário por função de funil ("conteúdo de demanda" não "conteúdo comercial")
- [ ] Compliance de conteúdo aplicado em nicho médico/regulado
- [ ] Filtro Nova Economia passou (4 anti-padrões)
- [ ] Zero drift de número entre seções (mesmo número em promise, garantia e math)
- [ ] 3 artefatos salvos: oferta.md + ofertas/_index.md + _constructs.md (OFERTA + STATUS)
- [ ] Handoff entregue: "Fundação completa. Próximo: /criar-lp"
