---
name: sistematizar
description: >
  Embala a HABILIDADE do operador num SISTEMA vendável, cruzando o que ele já
  sabe fazer com metodologias reais e validadas de mercado + IA na retaguarda.
  Fluxo INVERTIDO (buyer-first): perda cara → evento de valor → o que o operador
  controla → sistema mínimo → naming (por último). Entrevista a caixa de
  ferramentas metodológica (extrai método de decisões passadas, não de "qual é
  seu método?"), consulta a biblioteca de metodologias (retrieve-first) +
  pesquisa só o delta, cruza pela matriz de 3 filtros, compila a rota concreta
  (playbook de entrega + camada "como funciona por dentro") e deposita a
  metodologia nova com confiança+fonte. Output: nicho/metodologia.md + seção
  MÉTODO do _constructs.md. Roda DEPOIS de /escanear-concorrencia e ANTES de
  /posicionar. Use quando rodar /sistematizar, "como eu entrego isso?", "torna
  concreto", "qual o método", "embalar minha habilidade".
---

# /sistematizar — Habilidade → Sistema vendável (o "como" concreto)

Esta skill resolve o buraco entre a oferta bonita e a entrega real. Ela pega a **habilidade** do operador (o que ele sabe fazer) e a **metodologia validada do mercado** (o que os melhores fazem hoje), cruza as duas, e produz um **sistema operacional concreto** — a rota que gera um evento de valor repetível, com IA na retaguarda.

**A tese (calibração OfferCore + auditoria 2026-07-08):** *"não transformar habilidade em NOME — transformar habilidade em ATIVO OPERACIONAL que produz um evento de valor repetível."* O comprador não liga pra habilidade do operador; liga pra perda dele. Então o nome vem por último; a perda e o sistema vêm primeiro.

**🔴 O RISCO MORTAL que esta skill existe pra evitar:** virar uma máquina de **embalar habilidade fraca com linguagem forte**. A IA é ótima em criar lógica convincente pra algo não provado. Por isso o **evidence-floor é obrigatório** (Passo 6): nenhum sistema vira oferta sem passar no teste de evidência.

## O fluxo INVERTIDO (buyer-first)

```
perda cara do mercado → evento de valor → o que o operador CONTROLA →
sistema mínimo → (só então) naming
```

Cada passo abaixo segue essa ordem. O naming NÃO acontece aqui — acontece no `/posicionar`, DEPOIS, como consequência do que esta skill provou.

## Onde encaixa na cadeia

```
/mapear-mercado (a perda) → /escanear-concorrencia (o gap) →
  /sistematizar (a rota concreta + o método) → /posicionar (nomeia como consequência) →
  /precificar → /criar-oferta (compila, com o handoff que esta skill definiu)
```

---

## Passo 0 — Carga de contexto + retrieve-first (bloqueante)

**Ler, nesta ordem:**
1. `_constructs.md` INTEIRO — precisa de §NICHO (hero pain + custo da inação + linguagem de compra), §CONCORRÊNCIA (gap), §OPERADOR (quem é), §DIAGNÓSTICO (Raio-X) se existir.
2. `_contexto/modelo-nova-economia.md` (filtro de anti-padrões) + `_contexto/framework-oferta.md` (biblioteca de mecanismos §6).

**Gate de insumos:** se §NICHO ou §CONCORRÊNCIA vazias → 🔴 PARAR e mandar rodar `/mapear-mercado` + `/escanear-concorrencia` (sem a perda e o gap, esta skill não tem o que cruzar).

**Retrieve-first (protocolo `research-retrieve-first.md`):** ANTES de pesquisar metodologia nova, consultar a biblioteca da casa. Domínios prováveis pro caso IG→WhatsApp→agendamento: `estudos/dominios/whatsapp-automation/`, `quiz-funnels/`, `sales-nurture-frameworks/`, `conteudo/`, `ads-creative-ai/`, `form-engineering/` + `.claude/methodologies/INDEX.md` + `estudos/_map.md`. Self-grade cobertura × frescor: o que a casa já tem responde? Se sim + fresco → REUSA (cita path+data+confiança). Se parcial/velho/nada → pesquisa só o **delta** no Passo 4.

---

## Passo 1 — Mapear os ESTADOS-GARGALO + escolher o EVENTO DE VALOR (buyer-first)

Não começar por "qual oferta?". Começar mapeando que o cliente-alvo não tem UM gargalo — tem uma **cadeia de estados-gargalo possíveis**, e clínicas diferentes travam em pontos diferentes. **🔴 Enumerar explicitamente os estados** (de §NICHO + a cadeia causal do Passo 3), porque é o eixo que decide o cenário que a oferta assume:

| Estado-gargalo (exemplo clínica) | A clínica está travada em... |
|---|---|
| Sem atenção | não posta nada / sem audiência — precisa de presença antes de rota |
| **Atenção sem rota** | posta e gera interesse, mas vaza no WhatsApp (sem triagem/follow-up) |
| Lead desqualificado | atrai curioso que pergunta preço e some |
| No-show | agenda avaliação mas o paciente não aparece |
| Base parada | tem cliente antigo mas não reativa |

**Estes estados NÃO são a segmentação por maturidade** (solo/equipe/multi-unidade) que o `/mapear-mercado` já fez — são um eixo distinto (o estado operacional do funil do cliente). Os dois coexistem.

**O evento de valor** (a coisa concreta que, quando acontece, o cliente SENTE valor): escolher UM principal + uma métrica intermediária. Ex: evento = **avaliação agendada**; métrica intermediária = **conversa qualificada**. Regra: causalmente ligado ao dinheiro E **influenciável pelo operador** (Passo 3). "Faturamento" não é operável; "avaliação agendada" é.

**⚠️ A escolha do ESTADO-ALVO (qual estado a oferta ataca) NÃO acontece aqui — acontece no Passo 5, DEPOIS da entrevista**, porque ela precisa cruzar o estado mais comum/caro (pesquisa) com a força do operador (Passo 2). Aqui só se ENUMERA os estados e se define o evento de valor. Os estados não escolhidos viram os **ramos do diagnóstico** (Camada B — a avaliação identifica o estado da clínica específica).

---

## Passo 2 — Entrevistar a CAIXA DE FERRAMENTAS metodológica do operador

**Princípio que governa tudo (auditoria):** *não pergunte o que a pessoa SABE; pergunte o que ela já FEZ FUNCIONAR.* A maioria não sabe nomear o próprio método — extraia-o das decisões passadas. UMA pergunta por vez, conversacional, sem despejar a lista.

**🔴 PROFUNDIDADE COM RETORNO (regra da experiência — decisão do Bro):** a profundidade FICA (6 blocos, 45 perguntas — NÃO comprimir nem remover pergunta), mas a entrevista NÃO é formulário. **Ao FIM de cada bloco, ANTES de ir pro próximo, devolver ao operador 1-2 frases de retorno útil** — o que aquele bloco já revelou: um aprendizado, um diagnóstico parcial, uma tensão ou uma hipótese. **Pergunta sem retorno é proibida** (vira "formulário"): a lógica é *vazio é o inimigo* — cada etapa longa tem que pagar payoff imediato pra o operador SENTIR avanço, não só responder no escuro.

**Indicador de progresso (obrigatório):** abrir cada bloco com a fase nomeada + a barra — `Bloco X de 6 [▓…░]`. A numeração pública das perguntas continua sequencial 1..45 sem saltos, independente da barra de blocos (CALIBRATION-CORE §5).

Rodar em 6 blocos (adaptar as palavras ao nicho; abaixo, calibrado pra social media / clínica). **Cada bloco: barra de progresso → perguntas → retorno ao operador → próximo bloco:**

**Bloco 1 de 6 — Destravar**  `[▓░░░░░]`
1. Quando seu trabalho dá muito certo, o que normalmente aconteceu antes?
2. Que tipo de cliente você ajuda com mais facilidade?
3. Que tipo de cliente você não deveria aceitar, mesmo pagando?
4. O que seus melhores clientes elogiam?
5. O que você faz que parece óbvio pra você, mas outros profissionais erram?

→ **Retorno ao operador (antes do Bloco 2):** devolver a força-assinatura que apareceu ("você entrega acima da média em [X]") + o cliente que ele deve evitar. 1 aprendizado concreto, não um "obrigado, próxima". Mostrar: `Bloco 1 de 6 ✓`.

**Bloco 2 de 6 — Extrair casos reais**  `[▓▓░░░░]`
6. Me conta 3 situações em que você gerou resultado melhor que o esperado.
7-9. Em cada uma: qual era o problema inicial? O que o cliente achava que precisava? O que você percebeu que ele realmente precisava?
10-12. Qual foi a 1ª ação? A 2ª? O que você NÃO fez de propósito?
13-15. Que sinal mostrou que começou a funcionar? Que parte dependia de você? Que parte dependia do cliente?

→ **Retorno ao operador (antes do Bloco 3):** nomear o PADRÃO que se repetiu nos 3 casos (o método implícito dele) + o elo que dependeu DELE vs do cliente. Essa é a 1ª peça da caixa de ferramentas. Mostrar: `Bloco 2 de 6 ✓`.

**Bloco 3 de 6 — Extrair diagnóstico**  `[▓▓▓░░░]`
16. Quando você olha o Instagram de um cliente, o que repara nos primeiros 60s?
17. Que sinais mostram conteúdo atraindo curioso ruim?
18. Que sinais mostram perfil que gera interesse mas perde no WhatsApp?
19. Que sinais mostram que o problema é atendimento, não conteúdo?
20. Que sinais mostram que o cliente não tem oferta clara?
21. Que sinais mostram que o cliente não deveria investir em aquisição ainda?

→ **Retorno ao operador (antes do Bloco 4):** devolver a LENTE de diagnóstico dele (o que ele lê nos 60s que os outros não leem) + a tensão que isso expõe. Diagnóstico parcial, não formulário. Mostrar: `Bloco 3 de 6 ✓`.

**Bloco 4 de 6 — Extrair regras de decisão**  `[▓▓▓▓░░]`
22-24. Como você decide o que postar? Qual CTA usar? Se o conteúdo deve educar, provar, quebrar objeção ou chamar pra avaliação?
25-26. Como decide quando mandar pro WhatsApp? Como diferencia curiosa de interessada real?
27-29. Como escreveria a mensagem pra quem perguntou "quanto custa?"? Como recuperaria quem sumiu? Como reduziria no-show?
30. Como faria o cliente parecer confiável sem promessa antiética?

→ **Retorno ao operador (antes do Bloco 5):** espelhar 1-2 REGRAS de decisão nomeadas que apareceram ("quando [gatilho] → você faz [ação]") — candidatas diretas às if-then do Passo 7. Mostrar: `Bloco 4 de 6 ✓`.

**Bloco 5 de 6 — Extrair ativos**  `[▓▓▓▓▓░]`
31-33. Que templates/perguntas/planilhas/roteiros/prompts/checklists você já usa?
34-35. Que partes do seu processo poderiam virar modelo reutilizável? Que partes ainda dependem do seu julgamento?
36-38. O que entregaria em 1h com os dados na mão? O que precisa ser customizado por cliente? O que pode ser padronizado?

→ **Retorno ao operador (antes do Bloco 6):** separar o que JÁ é ativo reutilizável do que ainda depende do julgamento dele — a 1ª hipótese de productização (§11). Mostrar: `Bloco 5 de 6 ✓`.

**Bloco 6 de 6 — Extrair crenças e mecanismo**  `[▓▓▓▓▓▓]`
39-40. Qual a crença errada que os clientes têm sobre o canal? E que os profissionais como você têm sobre o nicho?
41-44. Qual o velho jeito de resolver? Por que ele falha? Qual o novo jeito? Por que agora funciona melhor?
45. Qual o MENOR sistema que geraria valor perceptível em 14 dias?

→ **Retorno ao operador (fecha a entrevista):** devolver o vilão/crença errada + o CANDIDATO a mecanismo (a rota mínima que apareceu) — deixando claro que o NOME vem depois, no /posicionar (buyer-first). Mostrar: `Entrevista completa — 6 de 6 ✓`.

→ Sintetizar num rascunho de **caixa de ferramentas** (o que o operador domina + suas regras de decisão + seus ativos). Isto é a matéria-prima do cruzamento.

---

## Passo 3 — Mapear a CADEIA CAUSAL + o que o operador CONTROLA

Desenhar a cadeia do evento de valor, ponta a ponta, e marcar cada elo:

```
Ex (clínica): conteúdo → identificação → chama no WhatsApp → qualificação →
  orientação → avaliação agendada → confirmação → comparecimento → clínica fecha
```

Marcar por elo: **controla / influencia / não controla.** No exemplo: controla conteúdo/CTA/scripts/organização/follow-up/painel · influencia confirmação · **não controla** comparecimento nem fechamento clínico. Esse mapa alimenta a calibração PROVA × CONTROLE do `/criar-oferta` (a promessa para no último elo que o operador influencia).

---

## Passo 4 — Trazer a METODOLOGIA de mercado (retrieve-first → delta)

Para cada elo que o operador controla/influencia, buscar a metodologia real e validada de como os melhores fazem hoje:

1. **Retrieve** (Passo 0 já consultou a biblioteca): reusar o que a casa tem, com confiança.
2. **Delta** (só o que falta): pesquisar com os scouts (WebSearch + Firecrawl + YouTube PT). Ex de metodologia buscável: comment-to-DM (ManyChat), conteúdo por intenção, sequência de follow-up 24h/72h/7d, triagem por perfil/urgência/procedimento, redução de no-show.
3. **Onde a IA plugga:** marcar, por metodologia, onde a IA amplifica (escreve as perguntas de qualificação, personaliza o follow-up, lê intenção, adapta conteúdo por procedimento) — sempre RETAGUARDA.
4. **Auto-deposit (obrigatório, sem perguntar):** metodologia nova ou revalidada → depositar em `estudos/dominios/[domínio]/` com frontmatter de proveniência (data · fonte · confiança GOLD/SILVER/BRONZE · validade) + 1 linha no índice. Nunca re-pesquisar o que já achamos.

**Stack recomendado por maturidade (não pesar antes de provar):** começar simples — ManyChat (comment-to-DM) + WhatsApp Business + Google Sheets/Looker. CRM robusto (RD Station Conversas / Kommo / GHL) só quando o volume pedir. `[VERIFICAR frescor das ferramentas — decaem]`.

---

## Passo 5 — CRUZAR (matriz de 3 filtros — o antídoto ao genérico)

O cruzamento bom fica onde os 3 se encontram:

| Filtro | Pergunta | Fonte |
|---|---|---|
| **1. Gargalo caro do mercado** | onde o cliente perde dinheiro? (muita view/pouca conversa · muita conversa/pouco agendamento · muito agendamento/muito no-show · muito paciente/pouca recompra) | §NICHO + Passo 1 |
| **2. Vantagem real do operador** | o que ELE faz acima da média? (conteúdo · storytelling · direct · WhatsApp · diagnóstico de perfil · oferta · follow-up) | Passo 2 (caixa de ferramentas) |
| **3. Controle + productização** | o que dá pra virar processo repetível (templates, prompts, automações, SOPs)? | Passo 3 + Passo 4 |

**Verticalizar dentro da vertical:** "clínicas de estética pequenas" é largo demais (limpeza de pele baixo-ticket ≠ harmonização recorrente). Segmentar por procedimento/estágio (facial / corporal / harmonização / laser / recém-aberta / agenda ociosa / base parada) — a economia muda, a rota se calibra. Cruza com `.claude/rules/sub-segmentation-axis-detection.md` (via workspace principal) se disponível.

Output do cruzamento: a **tese** — *"transformar [gargalo caro] usando [vantagem do operador] via [rota productizável]"*. Ex: *"transformar atenção orgânica do Instagram em conversas qualificadas no WhatsApp para avaliações de [procedimento prioritário]."*

### 5.1. 🔴 DISPATCHER: mercado dominante vs fragmentado (decide o TIPO de lead)

Antes de escolher o alvo, classificar o mercado (da pesquisa do §NICHO) — isto reconcilia a plataforma de oferta de referência (padrão assertivo) com o método categórico de posicionamento, que só parecem discordar:

| Mercado | Regra | Lead da oferta | Ref |
|---|---|---|---|
| **DOMINANTE** (~70% das clínicas travam no MESMO estado) | nichar no gargalo | **ASSERTIVO** — lidera com o estado específico + enemy-reframe + estado ativo ("você acha que precisa de X, seu problema é Y"). Alta ressonância, baixa cobertura | plataforma de oferta de referência (dental: gargalo dominante = qualificação/no-show) |
| **FRAGMENTADO** (clínicas travam em pontos DIFERENTES) | oferta diagnóstica | **CATEGÓRICO** — lidera com a CATEGORIA de perda ("vazamento de avaliações") + reframe + o diagnóstico acha o ponto. Segmento estreito, sintoma flexível, **resultado único**. Cobertura equilibrada | método categórico de posicionamento (estética: fragmentado) |

**Em ambos:** segmento estreito + **núcleo econômico único** (a unidade que TODOS os gargalos drenam — ex: "avaliação agendada") + diagnóstico de entrada + mecanismo modular que adapta ao ponto. A diferença é SÓ o lead. **Regra decisiva:** *"se ~70% do mercado tem o mesmo gargalo → oferta nichada no gargalo; se fragmentado → oferta diagnóstica com promessa específica no resultado."*

**🔴 Erro a evitar:** aplicar o lead assertivo (padrão da plataforma de oferta de referência) num mercado fragmentado = assume o cenário errado (foi meu erro no 1º draft da Marina). O dispatcher pega isso.

### 5.2. DECIDIR O ESTADO-ALVO / NÚCLEO — com o operador, explícito

Se DOMINANTE → o alvo é o estado-gargalo dominante. Se FRAGMENTADO → o alvo é o **núcleo econômico** (o resultado único), e os estados viram ramos do diagnóstico. Em qualquer caso, DEFINIR JUNTO com o operador, informado — NÃO assumir. Apresentar assim (UMA decisão):

```
Clínicas de estética travam em [N] estados diferentes: [lista do Passo 1].
- A pesquisa (§NICHO) mostra que "[estado X]" é o mais comum + o mais caro.
- Sua força (da entrevista, Passo 2) é "[Y]".
→ Recomendo mirar "[estado Z]": é onde o mercado mais sangra E onde você entrega
  acima da média. A OFERTA lidera com esse cenário (Camada A).
  Os outros [N-1] estados NÃO somem — viram os RAMOS do diagnóstico (Camada B):
  a avaliação de entrada identifica o estado da clínica específica e a rota se adapta.

Confirma "[estado Z]" como alvo? (ou me diz outro — você decide, informado.)
```

**Por que isso importa (arquitetura 2 camadas — plataforma de oferta de referência + auditoria):** a OFERTA prescreve UM estado (não pode agradar todos sem virar genérica); o DIAGNÓSTICO de entrada cobre o resto. Sem esta decisão explícita, o sistema (ou quem gera o doc) escolhe o estado no palpite e a oferta "assume o cenário errado". Com ela, o alvo é uma decisão consciente do operador, e os estados não-escolhidos viram a Camada B (não são desperdiçados).

- Se o operador escolher outro estado que sua força NÃO cobre bem → sinalizar o risco ("você mira [W], mas sua vantagem é [Y] — a entrega fica mais fraca aí; topa mesmo?") e registrar a decisão dele.
- Gravar em §MÉTODO: **estado-alvo** (Camada A) + **estados-ramo** (Camada B, os que o diagnóstico cobre).

---

## Passo 6 — EVIDENCE-FLOOR (o freio — obrigatório antes de compilar)

Nenhum sistema vira oferta antes de 5 provas mínimas:

1. O mercado reconhece a dor com as PRÓPRIAS palavras (linguagem de compra em §NICHO)?
2. A dor custa dinheiro ou agenda (número)?
3. A pessoa já tentou resolver de outro jeito (Old Game)?
4. O operador controla uma parte RELEVANTE (o handoff, não só o conteúdo — Passo 3)?
5. O sistema gera um 1º evento de valor em 14-30 dias?

**Floor gradual:** operador que já atua (tem clientes) traz parte da prova; iniciante-zero roda o piloto mínimo (`/plano-validacao`). Se ≥2 falham → NÃO compilar oferta forte; marcar `[HIPÓTESE FRACA]` e recomendar validar antes. **Nunca inventar prova pra fechar o floor.**

**Prova de mercado mínima recomendada** (antes de escalar): entrevistas com clientes-alvo + 1 piloto com cobrança simbólica → registro dos gargalos → prova do evento de valor → depoimento/evidência operacional. Right-size pela maturidade.

---

## Passo 7 — COMPILAR o sistema mínimo + o playbook (o Compilador de Oferta Operacional)

Montar a **rota mínima** (o menor sistema que gera o evento de valor) em módulos por função de funil, e o **playbook de entrega** (instalável em <1h):

**A rota mínima (4 camadas por função — cascade pro /criar-oferta):**
- **Marketing — Conteúdo de Demanda:** conteúdo por intenção (dor/desejo/prova/objeção/critério/CTA).
- **Vendas — Rota WhatsApp→Avaliação (o handoff):** triagem, qualificação, convite, follow-up (24h/72h/7d), confirmação, recuperação, motivo de perda.
- **Gestão — Painel de Aprendizado:** conversas/qualificadas/agendadas/comparecimento/perda/tempo de resposta.
- **Melhoria — Rotina de Otimização:** ajuste quinzenal por motivo de perda.

**Conhecimento vira REGRAS (if-then)** — não "faz conteúdo bom", e sim: *se o procedimento tem medo alto → conteúdo educativo + prova de segurança; se o lead pergunta preço → responder com contexto + convite pra avaliação, nunca preço seco; se a pessoa some → sequência 24h/72h/7d.*

**Ativos reutilizáveis:** formulário de diagnóstico da clínica · matriz de procedimentos · banco de objeções · calendário por intenção · biblioteca de CTAs · scripts de WhatsApp · etiquetas de qualificação · sequência de follow-up · painel · checklist de compliance · prompts de adaptação por procedimento.

**Instalar em <1h:** intake do cliente → duplicar template → importar calendário 30d → configurar CTAs/links WhatsApp pré-preenchidos → etiquetas → colar scripts → ativar painel → treinar dona/recepção (vídeo 15min) → auditoria de 7 dias.

**Camada "como funciona por dentro" (credibilidade — 2 audiências):** o playbook completo é do OPERADOR. Pro DOC/cliente, uma versão que prova que é um SISTEMA sem expor a ferramenta (senão dispara "então faço eu"). O concreto reforça "você precisa disso montado", não "é só um app".

**Compliance (nicho regulado):** se procedimento médico, o conteúdo segue publicidade do conselho (ex: CFM 2.336/2023 `[VERIFICAR]` — educativo, autorização, privacidade, sem sensacionalismo). Checklist de compliance é ativo obrigatório aqui.

---

## Passo 8 — Gravar artefatos

### 8a. `nicho/metodologia.md`
```markdown
# Metodologia / Sistema — [nicho]
> Gerado por /sistematizar em [data]. Fluxo buyer-first. Alimenta /posicionar (naming) + /criar-oferta (stack + handoff).

## A PERDA + O EVENTO DE VALOR
[perda na linguagem do cliente] · evento = [X] · métrica intermediária = [Y]

## CADEIA CAUSAL + CONTROLE
[cadeia] — controla: [...] · influencia: [...] · não controla: [...]

## CAIXA DE FERRAMENTAS DO OPERADOR (da entrevista)
[o que ele domina + regras de decisão + ativos]

## METODOLOGIA DE MERCADO (retrieve + delta)
[por elo: metodologia + onde a IA plugga + fonte/confiança]

## A TESE (cruzamento 3 filtros)
[gargalo × vantagem × productização]

## EVIDENCE-FLOOR
[5 checks: pass/fail + marca [HIPÓTESE FRACA] se aplicável]

## A ROTA MÍNIMA (4 camadas) + REGRAS (if-then) + ATIVOS + INSTALAÇÃO <1h
[...]

## COMPLIANCE
[checklist do nicho]
```

### 8b. Atualizar `_constructs.md` — seção **MÉTODO** (nova):
```markdown
## MÉTODO (preenchido pelo /sistematizar)
- **Estados-gargalo mapeados:** [lista dos N estados]
- **🔴 ESTADO-ALVO (Camada A — a oferta lidera com este):** [estado Z] — decidido COM o operador (pesquisa × força)
- **Estados-ramo (Camada B — o diagnóstico de entrada cobre):** [os N-1 restantes]
- **Perda + evento de valor:** [...]
- **Controle (o que o operador entrega/opera):** [...] → alimenta PROVA × CONTROLE do /criar-oferta
- **Rota mínima (4 camadas):** Conteúdo de Demanda · Rota WhatsApp→Avaliação (handoff) · Painel · Otimização
- **Mecanismo interno (candidato):** [Rota X→Y→Z] → /posicionar transforma em nome
- **Evidence-floor:** [status]
```
E STATUS: linha do /sistematizar → ✅ + data.

### 8c. Auto-deposit das metodologias novas em `estudos/dominios/` (Passo 4) + índice.

---

## Passo 9 — Handoff
> **Sistema compilado.** A rota, o que você controla, e a metodologia estão em `nicho/metodologia.md` e no `_constructs.md` (§MÉTODO).
> **Próximo: `/posicionar`** — agora o nome vem como consequência do que a rota prova. Depois `/precificar` → `/criar-oferta` (que já puxa o handoff daqui).

---

## Quality gates
- [ ] Fluxo buyer-first respeitado (perda → evento → controle → sistema → naming por último; NÃO nomeou aqui)
- [ ] **Estados-gargalo enumerados (Passo 1) + ESTADO-ALVO decidido COM o operador, explícito (Passo 5.1)** — não assumido; os não-escolhidos registrados como ramos do diagnóstico (Camada B)
- [ ] Entrevista extraiu método de DECISÕES passadas (não "qual seu método?")
- [ ] Retrieve-first ANTES de pesquisar; delta depositado com confiança+fonte
- [ ] Cadeia causal com mapa de controle (alimenta PROVA × CONTROLE)
- [ ] Cruzamento pelos 3 filtros + verticalização dentro da vertical
- [ ] **Evidence-floor rodado** — [HIPÓTESE FRACA] se ≥2 falham; nunca inventar prova
- [ ] Rota em 4 camadas por função (com o handoff explícito) + regras if-then + ativos + instalação <1h
- [ ] IA sempre na retaguarda; camada "como funciona" não expõe a ferramenta pro cliente
- [ ] Compliance do nicho aplicado (checklist)
- [ ] Artefatos salvos (metodologia.md + §MÉTODO + deposit) + handoff pro /posicionar

## Anti-patterns
| Anti-pattern | Correção |
|---|---|
| Nomear o sistema aqui | Naming é do /posicionar, DEPOIS — buyer-first |
| Perguntar "qual é seu método?" | Extrair de decisões passadas (o que já fez funcionar) |
| Embalar habilidade fraca com linguagem forte | Evidence-floor obrigatório; [HIPÓTESE FRACA] se não passa |
| Entregar só conteúdo (sem o handoff) | O handoff (Rota WhatsApp) é o que o operador controla — sem ele, leva a culpa pelo buraco de vendas |
| Metodologia genérica ("padrão de clínica") | Matriz 3 filtros + verticalizar dentro da vertical |
| Re-pesquisar o que a casa já tem | Retrieve-first; reusar com citação |
| Expor "IA/ManyChat" no pitch do cliente | IA na retaguarda; camada "como funciona" prova sistema sem virar app |
