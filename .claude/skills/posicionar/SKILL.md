---
name: posicionar
description: >
  Deriva o posicionamento do operador a partir do que os módulos de pesquisa
  já provaram: FUGA DE CATEGORIA (o reposicionamento que tira o operador da
  commodity) → OLD GAME (o padrão quebrado que o mercado repete) → VILÃO
  (diagnóstico market-native, NÃO batizado) → NEW GAME (a categoria que você
  ocupa) → NOME DO SISTEMA (fórmula 3 peças + regra de registro por ICP).
  Consome _constructs.md (hero pain + gap + diagnóstico) e NÃO pesquisa nada
  novo — sintetiza. Output: nicho/posicionamento.md + seção POSICIONAMENTO do
  _constructs.md. Use quando rodar /posicionar, perguntar "como me diferencio",
  "qual meu mecanismo/nome", ou depois do /escanear-concorrencia.
---

# /posicionar — Fuga de categoria → Vilão → New Game → Nome do sistema

Este módulo transforma pesquisa em posicionamento. Ele lê tudo que o `/mapear-mercado` e o `/escanear-concorrencia` provaram, faz a **fuga de categoria** (o movimento-raiz que tira o operador da guerra de preço), diagnostica o vilão em linguagem que o mercado reconhece, define a categoria que VOCÊ ocupa — e nomeia o **SISTEMA**, o nome que vai aparecer verbatim na sua oferta, LP, proposta e pitch daqui pra frente.

O naming aqui NÃO é metáfora fofa batizada (o anti-padrão: "Motor de Vitrine", "post órfão", "Paradoxo da Vitrine"). É um nome de **sistema que mexe no NEGÓCIO do cliente**, montado por fórmula (`[Mercado] + [Ativo Comercial] + [Arquitetura]`) e calibrado ao ICP por uma regra de registro. Um nome bem montado propaga 5-17× verbatim; um nome vago ou modinha morre em 1 asset. Por isso este módulo é disciplinado: o que sai daqui vira DNA.

**O princípio que governa tudo (do método OfferCore, calibração PT-BR):** *"O problema não é preço, é categoria."* A oferta existe pra TIRAR o operador da categoria-commodity. Reposiciona ANTES de nomear qualquer coisa.

**O que esta skill decide por você (não te pergunta):**
- A fuga de categoria, o Old Game e o vilão — derivados dos DADOS coletados, nunca de opinião
- 3 candidatos de nome de sistema, cada um justificado com a evidência que o originou + o registro (inglês-system / hybrid / PT-simples) que a regra recomenda, com 1 escolhido

**A única pergunta que ela te faz:** qual dos 3 candidatos de nome você adota (com recomendação clara). Você escolhe entre derivados — nunca inventa do zero.

**O que ela NÃO faz:** pesquisa nova (isso é `/mapear-mercado` e `/escanear-concorrencia`) · preço (isso é `/precificar`) · a oferta completa (isso é `/criar-oferta`) · batizar a dor e o vilão como trademark (o vilão é diagnóstico, não marca).

---

## Passo 0 — Ler o estado INTEIRO (bloqueante)

Antes de escrever uma linha de output, ler nesta ordem:

1. `_constructs.md` **inteiro** (raiz do workspace) — é o insumo principal
2. `_contexto/modelo-nova-economia.md` + `_contexto/framework-oferta.md` (contrato do OS)
3. Leitura de apoio, se existirem: `nicho/market-map.md` (dossiê do /mapear-mercado) + `nicho/concorrencia.md` (dossiê do /escanear-concorrencia) — a evidência bruta por trás dos constructs. Legado (workspaces antigos): `nicho/01-dores.md`, `nicho/04-linguagem-tipica.md`, `nicho/07-tendencias.md`
4. `.claude/rules/CALIBRATION-CORE.md` — as seções que governam este módulo: **§8** (gate de drift de ICP — o público pesquisado ainda sustenta o posicionamento que vai sair daqui), **§9** (infraestrutura instalada ≠ fee de gestão de tráfego — o léxico de construção manda no vilão, no New Game e no naming) e **§16** (PT-BR nativo — nome público, descriptor e voz com ritmo de LP brasileira, nunca fórmula gringa traduzida do tipo "Ajudando [X] a conseguir [Y]")

**Gate de insumos** — checar as seções do `_constructs.md`:

| Seção | Módulo dono | Se estiver vazia |
|---|---|---|
| NICHO / MERCADO (hero pain + evidência) | `/mapear-mercado` | 🔴 **PARAR.** "Posicionamento sem dor eleita é chute. Rode `/mapear-mercado` primeiro." |
| CONCORRÊNCIA (players + THE GAP) | `/escanear-concorrencia` | 🔴 **PARAR.** "Sem o gap mapeado, todo posicionamento vira 'sou melhor'. Rode `/escanear-concorrencia` primeiro." |
| DIAGNÓSTICO (Raio-X) | `/raio-x` | 🟡 Avisar e seguir: "Vou posicionar sem o vetor de migração do Raio-X — o vilão fica menos calibrado. Recomendo rodar `/raio-x` depois." |
| OPERADOR (voz) | `/setup` | 🟡 Avisar e seguir: bio/headline/pitch saem em tom neutro-direto, marcados `[VOZ PENDENTE — rode /setup]`. |

Nunca preencher lacuna de pesquisa com invenção. Lacuna aponta pro módulo dono — sempre.

---

## Passo 1 — Derivar o OLD GAME (o jogo saturado)

O Old Game é **o padrão quebrado que este mercado específico repete** — extraído dos players mapeados na CONCORRÊNCIA e das dores do NICHO/MERCADO. Nunca genérico.

Raciocínio interno (3 camadas — não renderizar como seções, usar pra pensar):

1. **Crença de superfície** — o que o mercado inteiro acredita? (ex: "mais leads = mais clientes")
2. **Premissa por baixo** — por que acreditam? (ex: "volume resolve tudo")
3. **Mecanismo de falha** — por que quebra na prática? Com o número da evidência. (ex: "80% dos leads não têm dinheiro nem urgência — [fonte, GOLD]")

Fontes obrigatórias do Old Game:
- "O que os players fazem igual" ← campo *players mapeados* + *o que os que funcionam fazem de diferente* da CONCORRÊNCIA
- A narrativa do HERO PAIN ← espinha emocional do Old Game (o custo de quem está preso nele)
- O *custo da inação* ← o número âncora do Old Game

**Teste de derivação:** cada frase do Old Game precisa apontar pra um dado do `_constructs.md` ou de `nicho/`. Frase que não rastreia a dado = deletar ou marcar `[DADOS INSUFICIENTES]`.

---

## Passo 2 — Diagnosticar o VILÃO (não batizar)

O vilão é a resposta a: **"qual é o padrão QUEBRADO que este mercado repete?"** — mas ele é um **diagnóstico em linguagem que o mercado reconhece**, NÃO uma marca registrada. Esta é a correção mais importante deste módulo.

**🔴 A regra (calibração OfferCore, PT-BR):** o vilão é linguagem de DIAGNÓSTICO simples e market-native — algo que o cliente ouve e pensa *"é exatamente isso que acontece comigo"*. NÃO é uma metáfora fofa nem uma síndrome inventada com ™.

| ❌ Vilão batizado (o anti-padrão que soa folk-marketing) | ✅ Vilão como diagnóstico (market-native) |
|---|---|
| "o post órfão" | "conteúdo que não vira agendamento" / "o Instagram-vitrine" |
| "Paradoxo da Vitrine™" | "Instagram ativo, agenda instável" |
| "Síndrome da Agenda Fantasma™" | "o modelo do lead genérico" |
| "Buraco Negro dos Leads™" | "leads que ninguém responde a tempo" |

Repare: os ✅ descrevem o padrão quebrado em palavras que o dono JÁ usa. Os ❌ inventam um nome de marca pra dor — soa exagerado, artificial, e o cliente sente o marketeiro chegando.

Regras:
- **Derivado dos dados, NUNCA default.** Cada nicho tem o seu. Exemplos reais pra calibrar o TIPO (não copiar): "o modelo do lead genérico" (dental) · "a fragmentação do stack" (webinars) · "o excesso de produto" (skincare). O seu sai da SUA pesquisa.
- **NÃO trademark, NÃO batizado.** Sem ™ no vilão. Sem síndrome/paradoxo/efeito inventado. Se você se pegou criando um nome-de-marca pra dor → é o anti-padrão → reescreva como diagnóstico plano.
- O vilão é um **modelo/padrão/sistema**, nunca uma pessoa ou empresa concorrente nomeada (concorrente é referência, não inimigo público — citar nominalmente soa amador e defensivo).
- Se o DIAGNÓSTICO (Raio-X) existir: cruzar com os *pontos comoditizáveis* — o melhor vilão costuma ser exatamente o modelo antigo que a IA está comoditizando.
- Formato no output: o vilão em **negrito** (frase de diagnóstico, não marca) + 1 parágrafo explicando como opera e quanto custa (número + fonte).

**Teste do vilão:** leia em voz alta pro dono imaginário do nicho. Se ele reconhece como um fato da rotina dele → ✅. Se soa como um termo que um curso inventou → ❌ reescreva.

---

## Passo 3 — A FUGA DE CATEGORIA + o NEW GAME

Aqui mora o movimento-raiz. Antes de nomear qualquer coisa, o operador precisa SAIR da categoria-commodity onde está preso. É isto que faz a oferta valer preço.

### 3a. A fuga de categoria (o reposicionamento — LIDERA o output)

Derivar o pivô explícito da identidade do operador: **de [identidade-commodity atual] → [nova categoria].** A identidade atual vive em §OPERADOR (o que ele se chama hoje). A nova categoria descreve **o resultado de negócio que ele instala**, não a tarefa que ele executa.

| ❌ Identidade-commodity (tarefa) | ✅ Nova categoria (resultado de negócio) |
|---|---|
| "social media freelancer" | "especialista em conteúdo de demanda + rota de agendamento para clínicas de estética" |
| "gestor de tráfego" | "operador de aquisição previsível para [nicho]" |
| "designer" | "instalador de infraestrutura de conversão para [nicho]" |

**Agree-and-redirect (não brigue com a objeção, redirecione a categoria):** não argumente "conteúdo/tráfego/design ainda importa". CONCORDE que a categoria antiga está morrendo ("conteúdo solto está virando commodity, você tem razão") e reposicione pra função de funil ("o que não vira commodity é conteúdo que gera demanda + a rota que transforma essa atenção em agendamento"). Mata a categoria antiga, nunca o operador. **Nota de vocabulário (refinamento auditoria):** conteúdo = função de MARKETING (atrai), a rota/WhatsApp = função de VENDAS (converte). Não misturar num nome só ("conteúdo comercial" é o anti-padrão — "comercial" é palavra de vendas).

### 3b. O New Game (a categoria que você ocupa)

O New Game é **o jogo que você joga e os outros não**, derivado do THE GAP:

- Formato: "De [Old Game] para [New Game]" — **um pivô único**, nunca "opção A, B ou C"
- O New Game ataca diretamente o vilão (se não ataca, o pivô está errado)
- Precisa caber no gap classificado pela CONCORRÊNCIA (o espaço que os players deixaram vazio — é ali que você entra sem brigar de igual)
- Filtro Nova Economia: o New Game precisa comportar setup + recorrência (nunca hora vendida) e IA na retaguarda, não no pitch

Junto do New Game, derivar dois blocos de bullets (3-5 cada, todos com número + fonte herdada):

- **POR QUE O JOGO ANTIGO PERDE** — custos quantificados do Old Game (% perdido, R$ desperdiçado, horas queimadas)
- **O QUE O MERCADO QUER DE VERDADE** — outcomes (nunca features), na *linguagem de compra* verbatim do NICHO/MERCADO

---

## Passo 4 — Nomear o SISTEMA (o coração do módulo)

O nome é o do SEU sistema — o que faz o New Game ser seu. É **DERIVADO do hero pain + do gap**, nunca inventado no vácuo. E é um nome de **sistema que mexe no NEGÓCIO do cliente**, não uma metáfora batizada.

> **Por que não a metáfora fofa (a virada de calibração):** naming metafórico batizado ("Motor de Vitrine", "Ímã de Pacientes") lê como folk-marketing pra oferta high-ticket B2B BR. O que lê como consultor de estratégia é o nome **funcional-sistêmico**: aponta o mercado + o ativo de negócio que ele move + a arquitetura. Não é um verbo bonito com sufixo — é `[Mercado] + [Ativo Comercial] + [Arquitetura]`.

> **🔴 O NOME É CONSEQUÊNCIA, NÃO PONTO DE PARTIDA (refinamento auditoria 2026-07-08).** O comprador não compra mecanismo — compra alívio de uma PERDA específica. O nome só é forte se vem DEPOIS de: (1) perda econômica clara (§NICHO custo da inação), (2) fluxo operacional que corrige a perda (o New Game + os componentes), (3) o evento-de-valor que o operador entrega. Se você está nomeando antes disso, pare. E no asset (LP/oferta/proposta), **a PERDA lidera, não o nome** — o comprador se reconhece antes de admirar a marca.

### 4.0. O nome tem 3 CAMADAS (não um nome só)

Um construct de naming produz TRÊS saídas, não uma. Isto separa a marca (que pode ser sofisticada) da clareza (que o comprador leigo precisa):

| Camada | O que é | Registro | Exemplo (Marina → clínica) |
|---|---|---|---|
| **Nome público** | o que aparece na vitrine (LP/bio/pitch) — DEVE conter o **evento-de-valor** | segue os 5 critérios (4c); no ecossistema Accelera/AI-Economy, English-system é a estética da casa | *Aesthetic Demand OS* |
| **Mecanismo interno** | o "como" nomeado, usado em deck/call/proposta — pode ser mais concreto/funcional | livre | *Rota Instagram→WhatsApp→Avaliação* |
| **Descriptor** | 1 frase PT que traduz o nome e conecta canais + evento-de-valor — carrega a CLAREZA pro comprador leigo | sempre PT, sempre presente | *"Sistema que transforma a atenção do Instagram e as conversas do WhatsApp em avaliações agendadas"* |

**🔴 O EVENTO-DE-VALOR é ingrediente obrigatório** do nome público OU do descriptor: a coisa concreta que, quando acontece, o comprador SENTE valor — "avaliação agendada", "conversa qualificada", "paciente reativado", "orçamento pedido". Nome sem evento-de-valor fica bonito e não vende sozinho. (A Peça 2 "Ativo Comercial" da fórmula aponta pro evento; garanta que o descriptor o torne concreto.)

**🔴 Disciplina do descriptor (canal ≠ matéria-prima):** o descriptor transforma o que PASSA pelos canais (atenção, conversas, interesse), NUNCA o canal em si. Canal (Instagram, WhatsApp) é ONDE o sistema OPERA via estratégia/processo — não o que vira o resultado. ✅ "transforma a **atenção** do Instagram e as **conversas** do WhatsApp em avaliações". ❌ "transforma o Instagram e o WhatsApp em avaliações" (category error).

### 4a. A fórmula (3 peças) — a taxonomia INTERNA do nome público

```
[Mercado / Nicho]  +  [Ativo Comercial]  +  [Arquitetura Sistêmica]
    Aesthetic              Demand                    OS
                      "Aesthetic Demand OS"
```

**Banco de palavras (escolher por derivação, nunca por sonoridade):**

- **Peça 1 — Mercado** (impede o genérico; ancora no nicho): Aesthetic · Clinic · Patient · Local · MedSpa · Procedure · Dental · Legal · [o substantivo do NICHO em PT quando o registro for PT: Clínica · Paciente · Agenda]
- **Peça 2 — Ativo comercial** (mostra que mexe no NEGÓCIO, não em conteúdo/tarefa): Demand · Conversion · Booking · Revenue · Pipeline · Acquisition · Retention · [PT: Demanda · Conversão · Agenda · Aquisição · Reativação]
- **Peça 3 — Arquitetura** (cada uma = percepção diferente): **OS** (sistema operacional / infra) · **Engine** (motor, geração contínua) · **System / Sistema** (claro, menos sofisticado) · **Protocol / Protocolo** (método validado — ponte semântica com nichos que já usam "protocolo", ex: estética) · **Framework** (modelo estratégico) · **Flow** (jornada) · **Pipeline** (funil/oportunidades avançando) · **Infrastructure / Infraestrutura** (robusto/high-ticket, pesado) · **Stack** (ferramentas integradas, público tech) · **Loop** (ciclo/retenção) · **Matrix** (inteligência/proprietário)

### 4b. Nome por CENTRO DE GRAVIDADE da oferta

A Peça 3 (arquitetura) sai do que a oferta REALMENTE entrega — não de qual palavra soa melhor:

| Centro de gravidade da oferta | Arquitetura | Exemplo |
|---|---|---|
| Conteúdo que gera demanda | OS | Aesthetic **Demand OS** |
| Conversão de quem já chega | Engine | Clinic **Conversion Engine** |
| Tráfego + funil | Pipeline | Local **Patient Pipeline** |
| Implementação completa (CRM+automação+campanhas+dashboards) | Infrastructure | Aesthetic **Revenue Infrastructure** |
| Tech / automação integrada | Stack | Clinic **Growth Stack** |
| Aquisição | OS | Patient **Acquisition OS** |
| Agendamento | Engine | Aesthetic **Booking Engine** |

⚠️ **"Revenue" / "Infrastructure" só se a entrega banca** (CRM + automação + campanhas + follow-up + dashboards). Nome maior que a entrega = vazio.

### 4c. A REGRA DE REGISTRO (inglês-system vs hybrid vs PT-simples) — 5 critérios

O MESMO conceito ganha registro diferente conforme QUEM COMPRA. Rodar os 5 critérios sobre o **cliente final do operador** (não sobre o operador):

1. **Sofisticação do comprador:** leigo/local (clínica pequena, salão, negócio familiar) → **PT simples** · sofisticado (agência, operador de growth, tech, franquia, premium, infoprodutor, B2B, SaaS, founder high-ticket) → **inglês-system**.
2. **Ticket:** ~R$2k/mês → nome claro direto · R$8k setup + R$3k/mês → mais robusto · R$20k+ → quase exige system/infrastructure. *(Caveat: ticket alto = percepção SISTÊMICA, não necessariamente inglês; PT forte ainda vende em premium BR.)*
3. **Canal:** conversa/WhatsApp → PT (o nome vira marca depois) · página/VSL/anúncio high-ticket → inglês (se o público entende) · PDF de proposta → inglês OK · bio de clínica pequena → simples.
4. **Tolerância a abstração:** clínica pequena tolera pouca (agenda/WhatsApp/avaliação/clientes) · operador/agência tolera muita (pipeline/infra/OS/conversion layer). **Erro clássico = vender "infrastructure" pra quem só quer "agenda".**
5. **Risco de modinha:** inglês atrapalha se parece guru/importado/buzzword/nome-maior-que-a-entrega. **🔴 EVITAR "AI" no nome quando o comprador usa IA como OBJEÇÃO** (ex: clínica → "então é IA, posso fazer eu"). IA fica no BASTIDOR, nunca no nome.

**DEFAULT = HYBRID:** nome inglês (marca/sofisticação) **+ descriptor PT (clareza)**. Nunca inglês sozinho pra público não-tech.

> Ex hybrid: **"Aesthetic Demand OS"** — *Sistema que transforma a atenção do Instagram e as conversas do WhatsApp em avaliações agendadas.*

**🔴 REGISTRO DA CASA — decisão do Bro (08/07):** no ecossistema **Accelera / AI Economy / AI-First OS**, o registro **English-system é a estética da marca** e vale como default MESMO quando o comprador final é leigo/local (override consciente do critério 1). O tradeoff (comprador não parsear o inglês) é coberto por duas coisas: o **descriptor PT** carrega a clareza + o asset **lidera com a PERDA, não com o nome**. Ou seja: o nome público pode ser inglês; a clareza vem do descriptor + do loss-first. Fora do ecossistema do Bro (operador com marca própria não-tech), rodar os 5 critérios sem esse override.

**Sobre o ™:** o ™ é da marca do OS (nível operador sofisticado — "AI-First OS™" é on-brand). Pro nome que o operador pequeno pitcha a um cliente pequeno, **sem ™** — soa marketeiro. Registro manda no ™ também.

### 4d. FRAME-CHECK (sobrevive, agora dentro da fórmula)

A Peça 2 (ativo comercial) DEVE descrever **um ativo/ação de negócio** (Demand, Conversion, Booking, Acquisition, Retention…) — NUNCA **identidade/status** (Frame B: "Owner", "Dono", "Master", "Pro", "Expert", "Elite"). Isto continua valendo: zero heróis batizam identidade no slot de função.

| ❌ Identidade (Frame B) | ✅ Ativo comercial |
|---|---|
| "Aesthetic **Owner** System" | "Aesthetic **Demand** OS" |
| "Clinic **Master** Engine" | "Clinic **Conversion** Engine" |
| "Sistema do **Dono** de Clínica" | "Sistema de **Agenda** da Clínica" |

**Como checar:** a Peça 2 descreve o que o SISTEMA MOVE no negócio (demanda, conversão, agenda, receita), ou o que a PESSOA VIRA (dono, expert)? Se é o que a pessoa vira → Frame B → reescrever com um ativo comercial.

### 4e. CARO vs VAZIO + teste das 5 perguntas

**CARO** = aponta ativo de negócio + arquitetura + contexto de mercado + descriptor PT.
**VAZIO** = abstrato ("Glow Success System") · buzzword overload ("AI Aesthetic Growth Conversion Flow OS" = indecisão) · tool-pulling ("InstaGlow AI") · sem contraste com o vilão.

**Teste das 5 perguntas (todo candidato passa antes de virar candidato):**
1. Diz o mercado?
2. Diz o ativo de valor (o que move no negócio)?
3. Diz a arquitetura?
4. Evita canal estreito (Insta/Reels/Content/Social/Chatbot/**AI no centro**)?
5. Tem tradução comercial em 1 frase simples? *(Se não explica simples → vaidoso demais → reprova.)*

### 4f. Derivar 3 candidatos (cada um com rota de evidência + registro)

Gerar exatamente 3 candidatos, um por rota de derivação, cada um já com a fórmula + o registro que a regra recomenda:

1. **Rota da dor** — Peça 2 = o ativo que o hero pain drena (dor = "agenda instável" → ativo = Demand/Agenda/Booking)
2. **Rota do gap** — Peça 2 = o ativo que ocupa o THE GAP (o que os players NÃO entregam e o mercado pede)
3. **Rota do centro de gravidade** — arquitetura (Peça 3) puxada do que a oferta REALMENTE entrega (§4b) + *vetor de migração* do Raio-X, se existir. Adaptar o padrão do que funciona, NUNCA copiar nome de concorrente.

Apresentar assim (e fazer **UMA pergunta só**):

```
Os 3 candidatos de NOME, derivados da sua pesquisa (fórmula: Mercado + Ativo + Arquitetura):

1. "[Nome]" — registro: [hybrid/PT-simples/inglês-system] — derivado de: [hero pain X / gap Y / centro de gravidade Z + fonte]
   Descriptor PT: "[1 frase que traduz]"
   No pitch: "[frase de 1 linha usando o nome]"
2. "[Nome]" — ...
3. "[Nome]" — ...

Minha recomendação: o nº [N], no registro [X], porque [razão ancorada em evidência + nos 5 critérios de registro — 1-2 frases].

Qual você adota? (1, 2 ou 3 — ou peça variação de UM deles)
```

- Se o usuário pedir variação: variar APENAS o candidato pedido, re-rodando o frame-check + teste das 5 perguntas. Máximo 2 rodadas — depois, decidir pela recomendação.
- Se o usuário enrolar ou não responder direto: registrar o recomendado, avisar ("segui com o nº N — dá pra trocar re-rodando /posicionar") e seguir.
- Se o usuário propor um nome do zero: acolher COMO 4º candidato, rodar o frame-check + as 5 perguntas + teste de substituição, e dizer com franqueza se perde pros derivados (e por quê). Ele decide — mas informado.

---

## Passo 5 — Gravar os artefatos (nunca deixar só na conversa)

### 5a. Criar `nicho/posicionamento.md`

```markdown
# Posicionamento — [nicho]

> Gerado por /posicionar em [data]. Fontes: _constructs.md (NICHO/MERCADO + CONCORRÊNCIA + DIAGNÓSTICO).
> O NOME DO SISTEMA daqui propaga VERBATIM em oferta, LP, proposta e pitch. Não parafrasear.

## A FUGA DE CATEGORIA
**De [identidade-commodity atual] → [nova categoria].** [1 frase: o que muda de tarefa pra resultado de negócio + o agree-and-redirect com a categoria antiga.]

## O JOGO ANTIGO (Old Game)
[1-2 parágrafos: o padrão quebrado + como opera + breakpoint. Cada claim com número + fonte herdada.]

**O VILÃO: [diagnóstico market-native, NÃO batizado]**
[1 parágrafo: como o vilão opera + quanto custa (número âncora + fonte). Frase de diagnóstico, sem ™.]

### Por que o jogo antigo perde
* [bullet quantificado + fonte]
* [3-5 total]

## O JOGO NOVO (New Game)
**De [Old Game] para [New Game].** [1 parágrafo: a categoria que você ocupa + por que o gap te pertence.]

### O que o mercado quer de verdade
* [outcome na linguagem de compra verbatim + fonte]
* [3-5 total]

## O NOME DO SISTEMA (3 camadas)
**Nome público:** "[Nome escolhido]" — registro: [inglês-system / hybrid / PT-simples] (fórmula: [Mercado] + [Ativo Comercial] + [Arquitetura])
**Mecanismo interno (deck/call/proposta):** "[o 'como' nomeado — ex: Rota X→Y→Z]"
**Descriptor PT (carrega a clareza):** "[1 frase que conecta os canais + o evento-de-valor]"
**Evento-de-valor:** [a coisa concreta que o comprador SENTE — avaliação agendada / conversa qualificada / orçamento pedido]
[1 parágrafo: o ativo de negócio que o sistema move + de qual evidência foi derivado + por que este registro (5 critérios / override da casa se ecossistema Accelera).]
[Candidatos não escolhidos: "[B]", "[C]" — registrados caso queira revisitar.]

## NA SUA VOZ (prontos pra usar)
**Headline (LP/perfil):** [ICP + outcome + nome do sistema — 1 frase]
**Bio (~150 caracteres):** [na voz do operador]
**Pitch de 1 linha ("o que você faz?"):** "Eu instalo o [NOME DO SISTEMA] pra [ICP] [outcome com número] sem [vilão]."

## Próximo passo
Rode `/precificar` — o preço vai ser CALCULADO sobre este posicionamento.
```

**Regra da voz** (bloco NA SUA VOZ): usar `signature_phrases` + `power_words` da seção OPERADOR; nunca usar o que está no `ranço`. Ler em voz alta mentalmente: soa como O OPERADOR falando, ou como IA? Se soa como IA, reescrever. Se OPERADOR está vazio: tom neutro-direto + marcar `[VOZ PENDENTE — rode /setup]`.

### 5b. Atualizar `_constructs.md`

Seção POSICIONAMENTO (preencher todos os campos):

```markdown
## POSICIONAMENTO (preenchido pelo /posicionar)

- **Fuga de categoria:** De [identidade-commodity] → [nova categoria]
- **Old Game (o jogo saturado):** [1 frase]
- **VILÃO (diagnóstico market-native, NÃO batizado):** [frase de diagnóstico] — [meia frase de como opera]
- **New Game (a categoria):** De [X] para [Y] — [1 frase]
- **NOME PÚBLICO (hero construct — propaga verbatim em TUDO):** "[Nome]"
- **Mecanismo interno (deck/call):** "[Rota X→Y→Z ou o 'como' nomeado]"
- **Descriptor PT:** "[1 frase que traduz o nome + conecta canais + evento-de-valor]"
- **Evento-de-valor:** [avaliação agendada / conversa qualificada / etc]
- **Registro:** [inglês-system / hybrid / PT-simples] · fórmula = [Mercado] + [Ativo Comercial] + [Arquitetura]
- **Frame check:** Peça 2 = ativo comercial ("[palavra]"), não identidade ✔ · 5 perguntas ✔ · evento-de-valor presente ✔
```

E na tabela STATUS DA INSTALAÇÃO: linha `2 — Posicionamento | /posicionar` → ✅ instalado + data.

---

## Passo 6 — Handoff

Fechar SEMPRE com:

> **Camada de Posicionamento instalada.** A fuga de categoria, o vilão, o New Game e o nome do sistema "[Nome]" estão gravados em `nicho/posicionamento.md` e no `_constructs.md` — a partir de agora esse nome aparece igual em tudo que o OS gerar.
> **Próximo: rode `/precificar`** — o preço sai calculado sobre esse posicionamento, não chutado.

---

## Craft gates (rodar ANTES de entregar)

1. **Teste de substituição:** troque o nicho na fuga de categoria, no vilão e no nome. Se ainda funciona pra outro nicho, tá genérico — **refaça** ancorando nos dados específicos deste mercado.
2. **Teste de rastreio:** todo claim com número tem fonte herdada ([GOLD/SILVER/BRONZE] do módulo upstream)? Claim órfão = cortar ou `[DADOS INSUFICIENTES]`.
3. **Ban-list (rejeitar no texto todo):** "transformação" · "mindset" · "guru" · "sucesso" (vago) · "elite" · "inovador/inovação" · "revolucionário" · "desbloqueie" · "eleve/potencialize/alavanque" · "no mundo de hoje" · "jornada" (vago). Se aparecer → reescrever a frase com substância (número, ativo de negócio, resultado).
4. **Zero concorrente nomeado** no posicionamento final (nome de player fica na CONCORRÊNCIA como referência, não no seu pitch).
5. **Uma pergunta por vez.** Este módulo faz UMA pergunta (a escolha do nome). Se você se pegar empilhando perguntas, corte.
6. **Vilão não-batizado:** o vilão passou no teste do dono? (reconhece como fato da rotina, não como termo que um curso inventou). Se soa como marca/síndrome/paradoxo com ™ → reescrever como diagnóstico.
7. **Registro coerente com o comprador:** rodou os 5 critérios sobre o CLIENTE FINAL do operador? Não vendeu "infrastructure" pra quem só quer "agenda"? Sem "AI" no nome quando o comprador usa IA como objeção?

## Quality gates (checklist final)

- [ ] `_constructs.md` lido INTEIRO; gates de insumo respeitados (parou/avisou quando vazio)
- [ ] Fuga de categoria explícita ("De [identidade-commodity] → [nova categoria]"), lidera o output
- [ ] Old Game rastreável a dados (concorrência + hero pain + custo da inação)
- [ ] Vilão = diagnóstico market-native, derivado — NÃO batizado (sem ™/síndrome/paradoxo), não pessoa/empresa
- [ ] New Game = pivô ÚNICO ("De X para Y"), ataca o vilão, cabe no gap, passa o filtro setup+recorrência
- [ ] 3 candidatos de nome (fórmula Mercado+Ativo+Arquitetura), cada um com rota de evidência + registro declarado + 1 recomendado
- [ ] Frame-check: Peça 2 = ativo comercial, nenhum Frame B (identidade) sobreviveu
- [ ] Teste das 5 perguntas passou no nome escolhido (mercado + ativo + arquitetura + evita canal estreito/AI-no-centro + traduz em 1 frase)
- [ ] **3 camadas geradas** (nome público + mecanismo interno + descriptor PT) e o **evento-de-valor** está no público OU no descriptor
- [ ] **Nome é consequência** (veio depois de perda + fluxo + evento) e o asset lidera com a PERDA, não com o nome
- [ ] Registro pelos 5 critérios sobre o cliente final; no ecossistema Accelera/AI-Economy vale o override English-system + descriptor PT; ™ só se o registro pede
- [ ] `nicho/posicionamento.md` criado com headline + bio + pitch NA VOZ do operador
- [ ] `_constructs.md` atualizado (POSICIONAMENTO completo + STATUS ✅)
- [ ] Craft gates passados (substituição + rastreio + ban-list + vilão + registro)
- [ ] Handoff pro `/precificar` explícito

## Anti-patterns (o que mata este módulo)

| Anti-pattern | Por que falha | Correção |
|---|---|---|
| Perguntar "qual o nome do seu sistema?" | Usuário não tem como saber — o sistema deriva, ele escolhe | 3 candidatos derivados + recomendação |
| Vilão batizado ("post órfão", "Paradoxo da Vitrine™", "Síndrome da X") | Soa folk-marketing; o cliente sente o marketeiro chegando | Diagnóstico market-native que o dono reconhece como fato |
| Vilão default ("falta de gestão", "o mercado tá difícil") | Vilão genérico não posiciona ninguém | Derivar do padrão quebrado que OS DADOS mostram |
| Nome = metáfora fofa batizada ("Motor de Vitrine", "Ímã de Pacientes") | Lê folk-marketing pra high-ticket B2B BR | Nome funcional-sistêmico: Mercado + Ativo Comercial + Arquitetura |
| Peça 2 = identidade (Frame B: "Dono", "Owner", "Expert") | Nomeia o destino, não o ativo de negócio | Ativo comercial (Demand/Conversion/Booking/Acquisition) |
| Inglês-system pra comprador leigo/local | Vende "infrastructure" pra quem só quer "agenda" — não conecta | Rodar os 5 critérios; default hybrid (nome + descriptor PT) |
| "AI" no centro do nome quando IA é a objeção | Comprador pensa "então posso fazer eu com ChatGPT" | IA no bastidor; nome aponta o resultado de negócio |
| Copiar o nome de um concorrente | É referência (rota 3 adapta o padrão), não catálogo | Forjar nome NOVO derivado da síntese |
| Posicionar sem gap mapeado | Vira "sou melhor que todo mundo" — indefensável | Parar e mandar rodar `/escanear-concorrencia` |
| Oferecer 3 pivôs de New Game ("pode ser A, B ou C") | Posicionamento é decisão, não cardápio | Um pivô único, recomendado com razão |
| Bio/pitch em voz de IA | O operador não fala assim — ninguém acredita | Voz da seção OPERADOR; ranço banido; ler em voz alta |
| Entregar só na conversa | Compacta a sessão, evapora o trabalho | Artefato em arquivo, sempre |
