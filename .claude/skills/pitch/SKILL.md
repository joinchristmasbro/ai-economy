---
name: pitch
description: >
  Gera o KIT DE ABORDAGEM de um prospect real — mensagem de abertura por
  canal (DM/WhatsApp frio · indicação/warm · resposta a interesse),
  diagnóstico-relâmpago de 2min (3-4 perguntas que posicionam o operador
  como estrategista, não vendedor), transição falada pro mecanismo™ e as
  3 objeções mais prováveis do nicho com resposta pronta ancorada em fato
  da fundação. Zero pesquisa nova, zero pressão artificial: o operador
  DIAGNOSTICA, não implora. Output: clientes/_pitches/[canal]-[slug].md.
  Use quando o usuário rodar /pitch, "como abordo esse prospect",
  "mensagem de primeiro contato", "me ajuda a vender pra [nome]",
  "o que falo pra ele?". Funciona no dia 0 (degrada gracioso sem fundação).
---

# /pitch — Kit de Abordagem (v0 da Suite de Aquisição)

Preparação de venda, não teatro de script. A skill compila o que a fundação já decidiu COM DADO (dor eleita com evidência, vilão, mecanismo™, garantia, âncoras) num kit que o operador usa numa conversa real: abrir sem vender, diagnosticar em 2 minutos, transicionar pro mecanismo quando — e só quando — a dor confirmar, e responder as 3 objeções que vão aparecer.

**Postura inegociável:** o operador DIAGNOSTICA, não implora. Quem diagnostica pergunta, ouve e prescreve; quem implora empurra, insiste e desconta. A única escassez permitida no kit é a real (capacidade de entrega registrada em §PRICING). Countdown falso, "só hoje", "últimas vagas" sem lastro = banidos.

## O que esta skill NÃO faz (honestidade)

- **Não pesquisa nada novo.** Tudo vem do `_constructs.md` + do que você contar do prospect. Zero ferramenta externa (nem WebSearch — pesquisa de mercado é responsabilidade do /mapear-mercado).
- **Não garante resposta.** Kit bom aumenta a chance de conversa; mensagem mágica não existe. Se o prospect não responder, o kit sugere no máximo 2 follow-ups — depois disso, próximo prospect.
- **Não inventa a dor do prospect.** Dores vêm do market-map com evidência marcada. Sem fundação, o kit sai NEUTRO e declarado como tal — nunca finge saber o que dói.
- **Não vende na abertura.** A mensagem 1 abre conversa sobre o problema. Pitch prematuro mata o canal.
- **Não menciona preço** até o prospect perguntar — e aí a resposta é o preço CALCULADO de §PRICING, verbatim, nunca desconto de improviso.

## Passo 0 — Contrato constructs (ler ANTES de qualquer pergunta)

Ler `_constructs.md` INTEIRO (raiz do workspace) + `.claude/rules/CALIBRATION-CORE.md` — §12 (garantia controlável), §13 (reativação escopada) e §20 (compliance) — + `marca/voice-dna.json` (se existir — voz completa do operador, gerada pelo /setup) + `_contexto/preferencias.md` (tom) + `clientes/[slug]/_contexto/compliance.md` (se existir — herda a compliance do cliente; senão, detecta do nicho de §NICHO). Abrir a sessão DECLARANDO o que encontrou — o usuário precisa VER a fundação trabalhando:

```
Fundação detectada: Operador ✅ · Mercado ✅ · Concorrência ✅ · Posicionamento ✅ · Oferta ⬜

Este kit sai com: sua voz, o hero pain "[nome]" na linguagem de compra do
mercado, o vilão "[nome]" e o mecanismo [MECANISMO™]. Sem §OFERTA, a
transição usa o mecanismo sem promise formal — rode /criar-oferta depois
e o kit fica mais afiado.
```

Adaptar a declaração ao que existe de verdade. **NUNCA travar por fundação incompleta** — este executor entrega quick win no dia 0, nem que seja só com a voz da Camada 0 (ou neutro, sem nada).

## O que este executor lê da fundação (progressive enhancement)

| Construct | SE EXISTE → como melhora o kit | SE FALTA → degrada gracioso |
|---|---|---|
| §OPERADOR (voz: signature phrases, ranço) | Abertura e respostas soam como VOCÊ — prospect não fareja template | Kit em tom neutro-direto; convite: "rode /setup pra registrar sua voz" |
| §NICHO hero pain + linguagem de compra | Abertura fala do problema com as PALAVRAS que o mercado usa (pain words verbatim) | Abertura usa o problema que VOCÊ descrever do prospect, marcada [SEM EVIDÊNCIA DE MERCADO]; convite: "rode /mapear-mercado pra desbloquear ângulos de dor com fonte" |
| §NICHO dores secundárias | Alimentam as 3-4 perguntas do diagnóstico-relâmpago (cada pergunta mira uma dor real) | Diagnóstico usa 4 perguntas-esqueleto [HEURÍSTICA] (sintoma → número → tentativa → custo) |
| §NICHO custo da inação | Vira âncora de objeção "tá caro" / "vou deixar pra depois" (número + mark) | Resposta de objeção sai qualitativa, marcada [DADOS INSUFICIENTES — sem número âncora] |
| §CONCORRÊNCIA (THE GAP + players) | Objeções derivadas do que o mercado APRENDEU a desconfiar; âncora competitiva pronta | Objeções saem do padrão universal [HEURÍSTICA]; convite: "rode /escanear-concorrencia" |
| §POSICIONAMENTO (vilão + mecanismo™) | Transição nomeia o vilão e entrega o mecanismo VERBATIM — o momento estrategista | Transição descreve o que você faz em 1 frase simples, sem ™; convite: "rode /posicionar pra ter um mecanismo nomeado" |
| §OFERTA (promise + garantia) | Garantia vira a resposta da objeção de risco; promise calibra o convite final | Convite final = "diagnóstico gratuito de 20min" (próximo passo universal) |
| §PRICING (preço calculado + capacidade) | Resposta pronta se preço surgir + escassez REAL ("pego N clientes por mês") | Se preço surgir: "responda com uma call de diagnóstico, não com número de improviso" |

## Passo 1 — Wizard (UMA pergunta por vez; se o usuário enrolar, registra o que tem e segue)

**P1 — Canal:**

> "Por onde você vai chegar nesse prospect?
>
> 1) **DM/WhatsApp frio** — ele não te conhece
> 2) **Indicação/warm** — alguém apontou você (ou ele já te segue)
> 3) **Resposta a interesse** — ELE chegou (comentou, respondeu story, pediu info)"

**P2 — O prospect (1-2 perguntas, o mínimo que muda o kit):**

> "Quem é? Nome/negócio + o que você já sabe da situação dele (1-3 linhas). Se for indicação: quem indicou e o que essa pessoa comentou."

Se o usuário não souber quase nada → seguir com o que tem. O kit personaliza com o que existe; o que não existe, o diagnóstico-relâmpago descobre na conversa (é pra isso que ele serve).

## Passo 2 — Mesa de derivação (como cada peça do kit nasce)

| Peça | Fonte | Regra de derivação |
|---|---|---|
| **(a) Abertura** | §NICHO (pain words verbatim) + §OPERADOR (voz) + P2 (contexto) | Abre com o PROBLEMA na linguagem de compra do mercado + 1 detalhe específico do prospect. Curta (regras por canal no Passo 3). Termina em pergunta leve, nunca em pitch/link/pedido de call. |
| **(b) Diagnóstico-relâmpago (2min)** | §NICHO (hero pain + dores secundárias) | 3-4 perguntas que o OPERADOR faz pro PROSPECT. Arco: sintoma ("como tá X hoje?") → número ("quanto isso custa/rende por mês?") → tentativa ("o que você já tentou?") → custo de seguir igual. Cada pergunta mira uma dor mapeada — quem pergunta certo já provou que entende do assunto. |
| **(c) Transição pro mecanismo™** | §POSICIONAMENTO (vilão + mecanismo VERBATIM) + §OFERTA (promise) | 1 parágrafo FALADO (não texto de LP): eco do que o prospect respondeu → nomeia o vilão ("isso acontece porque [vilão]") → mecanismo™ verbatim em 1 frase de outcome → convite pro próximo passo. Zero jargão de IA — IA é retaguarda, não pitch. |
| **(d) 3 objeções + respostas** | §CONCORRÊNCIA (THE GAP) + §NICHO (custo da inação) + §OFERTA (garantia) + §PRICING (âncora) | Eleger as 3 MAIS PROVÁVEIS do nicho (o gap diz do que o mercado desconfia). Cada resposta na voz do operador + ancorada em UM fato da fundação: custo da inação (número + mark), âncora competitiva ou garantia. Resposta valida a objeção antes de responder — nunca atropela. |

**Marks propagam, nunca são lavados.** Âncora [BRONZE]/[HEURÍSTICA] carrega o mark no arquivo interno — o operador decide o que fala em voz alta, mas o kit registra a confiança real de cada número.

**Garantia só no que o sistema controla (CALIBRATION-CORE §12).** A transição (c) e as objeções de risco (d) só prometem o que a máquina entrega — infra no ar, oportunidade qualificada levada à agenda, follow-up estruturado, base reativada. NUNCA prometer faturamento, cliente/aluno fechado, comparecimento total, churn zero ou desfecho: isso depende do prospect (fechamento, atendimento, preço, oferta, experiência). Se a objeção tocar em resultado final, a resposta preserva a fronteira verbatim: "o sistema controla a máquina que leva a oportunidade qualificada até a agenda; o cliente controla fechamento, atendimento, preço, oferta, disponibilidade e experiência."

**Reativação entra escopada (CALIBRATION-CORE §13).** Se reativação aparecer na transição ou nas objeções, mira só leads antigos / no-shows / base parada / winback / oportunidades perdidas — NUNCA "resolve toda retenção", "ninguém cancela" nem assume a causa-raiz do churn. O que o pitch promete de reativação tem que estar no tier que o prospect vai comprar (§PRICING), não escondido num pacote mais caro.

**Compliance herdada em nicho regulado (CALIBRATION-CORE §20).** Nicho de saúde/estética/nutrição/fitness/clínica/odontologia/educação física → o kit NÃO promete desfecho clínico, faturamento garantido, antes/depois, retenção total nem fechamento garantido, e separa métrica comercial (oportunidade/agendamento) de desfecho clínico. Herda de `clientes/[slug]/_contexto/compliance.md` se existir; senão, detecta do §NICHO. Sinalizar o órgão nas NOTAS INTERNAS do kit: **CFM** (médico) · **CFO** (odonto) · **CFN** (nutrição) · **CONFEF** (educação física) · LGPD universal. O disclaimer vive nas notas internas, nunca vira headline da abordagem.

## Passo 3 — Regras por canal (aplicar na peça (a))

### DM/WhatsApp frio
- **Tamanho:** ≤4 linhas (~300 caracteres). Ninguém lê parede de texto de desconhecido.
- **Anatomia:** [gancho específico do prospect — algo que você VIU: post, site, anúncio] + [o problema, nas pain words do mercado] + [pergunta leve de abertura].
- **PROIBIDO:** "oi, tudo bem?" seco · "tenho uma solução perfeita pra você" · "posso te roubar 5 minutinhos?" · link na mensagem 1 · áudio na mensagem 1 · apresentar a empresa ("somos uma agência que...").
- **Follow-up:** máximo 2, espaçados 3-4 dias, cada um agrega algo novo (dado, observação) — nunca "oi, viu minha mensagem?".

### Indicação/warm
- **Nomeia a ponte na primeira linha:** "O [nome] comentou que você tá [situação]" — a ponte é o gancho, não desperdiça.
- Pode ser 1-2 linhas mais longa que o frio; o diagnóstico pode começar já na mensagem 2.
- **PROIBIDO:** fingir intimidade que não existe · pular direto pra proposta porque "veio quente" (indicação compra conversa, não fechamento).

### Resposta a interesse
- ELE chegou — não recomeça do zero nem faz cerimônia. Agradece em meia linha e vai direto pra 1ª pergunta do diagnóstico.
- **PROIBIDO:** despejar a oferta inteira na primeira resposta (interesse ≠ decisão) · mandar preço antes do diagnóstico.

## Passo 4 — Gates anti-slop (rodar ANTES do render final)

**1. Checkpoint de coautoria (obrigatório):** mostrar a DIREÇÃO antes de renderizar o kit completo — a abertura + as 3-4 perguntas do diagnóstico em rascunho:

> "Direção do kit: abertura puxando [dor X, nas palavras do mercado] + diagnóstico focando [arco]. É assim que você falaria, ou ajusto o tom antes de fechar?"

Aprovou → renderiza. Ajustou → incorpora e renderiza. Nunca entregar o arquivo final sem esse aceite.

**2. Teste de substituição:** trocar o nicho no kit por outro qualquer. Se a abertura e o diagnóstico ainda funcionarem, tá genérico — reescrever com a linguagem de compra verbatim de §NICHO.

**3. Teste de voz alta:** ler abertura, transição e respostas EM VOZ ALTA. Se soar telemarketing, LP falada ou coisa que o operador nunca diria num áudio de WhatsApp → reescrever. O kit é fala, não copy.

**4. Ban-list (grep no output):**
- Cacoetes de guru: "transformação", "mindset", "sucesso" (vago), "elite", "destrave", "alavancar" (vago), "próximo nível", "virar a chave"
- Cacoetes de IA: "não é só X, é Y", "num mundo onde", "imagine...", "revolucione", "potencialize", "eleve seu negócio"
- Pressão artificial: "última chance", "só hoje", "vagas acabando" (sem lastro em §PRICING), "não perca essa oportunidade"
- Servilismo: "desculpa incomodar", "sei que você é ocupado, mas", "posso te roubar um minutinho?"

**5. Verbatim check:** mecanismo™, garantia, custo da inação e qualquer número copiados SEM mutação do `_constructs.md`. Zero drift — o número da objeção é o número do construct.

## Passo 5 — Output (artefato em arquivo, nunca só texto na conversa)

### 5a. Criar `clientes/_pitches/[canal]-[slug].md`

Canal = `dm-frio` | `indicacao` | `interesse`. Slug = prospect em kebab-case (ex: `indicacao-clinica-sorriso.md`). Criar a pasta `clientes/_pitches/` se não existir. Estrutura obrigatória — cada bloco com linha de trace:

```markdown
---
prospect: [nome/negócio]
canal: [dm-frio | indicacao | interesse]
nicho: [de §NICHO, ou "neutro — sem fundação de mercado"]
fundacao_usada: [ex: "voz + mercado + posicionamento" | "voz apenas" | "nenhuma"]
status: pronto
criado: [AAAA-MM-DD]
---

# Kit de Abordagem — [prospect] · [canal]

## 1. ABERTURA
[mensagem pronta pra copiar/colar, na voz do operador]
**Por que funciona:** [1 linha — qual dor ela toca e por quê sem pitch]
**Não fazer:** [1 linha — o erro típico deste canal]
`← _constructs.md §NICHO (pain words) + §OPERADOR (voz) + contexto P2`

## 2. DIAGNÓSTICO-RELÂMPAGO (2 min — você pergunta, ele fala)
| # | Pergunta | O que ela revela | Dor de origem |
|---|---|---|---|
[3-4 linhas]
**Regra de ouro:** você fala 20%, ele fala 80%. A pergunta certa vale
mais que qualquer argumento — quem diagnostica não precisa se vender.
`← _constructs.md §NICHO (hero pain + dores secundárias)`

## 3. TRANSIÇÃO PRO MECANISMO™ (falada — usar quando a dor confirmar)
"[parágrafo: eco do que ele disse → vilão → mecanismo™ verbatim → convite]"
**Se a dor NÃO confirmar:** não force a transição — agradeça e saia limpo.
`← _constructs.md §POSICIONAMENTO (vilão + mecanismo verbatim) + §OFERTA (promise)`

## 4. AS 3 OBJEÇÕES MAIS PROVÁVEIS
### "[objeção 1, como o prospect fala]"
**Resposta (sua voz):** [valida → responde → devolve pergunta]
**Âncora:** [custo da inação R$X [mark] | âncora competitiva | garantia]
`← _constructs.md §[seção de origem]`
[repetir pra objeções 2 e 3]

## SE PERGUNTAREM PREÇO ANTES DA HORA
[resposta que devolve pro diagnóstico; preço verbatim de §PRICING só
depois da dor quantificada — ou "call de diagnóstico" se §PRICING vazio]
`← _constructs.md §PRICING`
```

### 5b. Regra de estado

Este executor **NÃO escreve no `_constructs.md`** — consome o DNA, não o edita (mesmo contrato do /carrossel, /post e /proposta; regra da casa: quem tem linha na tabela STATUS marca a própria linha, quem não tem nunca escreve). O registro do kit vive no próprio artefato em `clientes/_pitches/`.

## Passo 6 — Handoff (funil interno)

```
Kit pronto: clientes/_pitches/[canal]-[slug].md
[N] blocos: abertura + diagnóstico 2min + transição + 3 objeções respondidas.

Prospect respondeu e a conversa andou? Rode /proposta — ela pega este kit
+ sua oferta e monta o documento de fechamento.

Sem resposta em 3-4 dias: use o follow-up 1 do kit. Depois do follow-up 2,
próximo prospect — kit se reaproveita, insistência não.
```

## Comportamentos especiais

**Vários prospects:** um arquivo por prospect+canal. O kit de um NÃO se recicla pro outro sem re-rodar P2 (o gancho específico é o que separa abordagem de spam).

**Prospect de nicho diferente do instalado:** avisar — "sua fundação é de [nicho A]; esse prospect é [nicho B]. O kit sai NEUTRO (dores e objeções de [nicho A] não se aplicam). Pra vender em [nicho B] com dado, rode a cadeia de instalação nele (ou /trocar-nicho)."

**Fundação zerada (dia 0 real):** gerar o kit neutro com o esqueleto [HEURÍSTICA] (abertura por observação específica + diagnóstico sintoma→número→tentativa→custo + transição de 1 frase + 3 objeções universais: "já tentei algo parecido" / "tá caro" / "não é prioridade agora"). Abrir o arquivo com: "Kit neutro — sem fundação de mercado atrás. Funciona pra hoje; rode /mapear-mercado e /posicionar e gere de novo: as perguntas e objeções passam a vir de evidência real."

**Pedido de "script de fechamento":** fora do escopo — este kit vai da abertura ao aceite do próximo passo. Fechamento = /proposta.

## Quality gates (checklist final — se algum falhar, corrigir antes de salvar)

- [ ] `_constructs.md` lido INTEIRO + declaração de fundação feita na abertura da sessão
- [ ] Nunca travou por fundação incompleta (degradou gracioso + convite ao módulo dono)
- [ ] ≤3 perguntas ao usuário (canal + contexto), uma por vez
- [ ] Abertura: ≤ limite do canal, abre com problema na linguagem de compra, ZERO pitch/link/preço
- [ ] Diagnóstico: 3-4 perguntas, cada uma rastreável a uma dor (ou marcada [HEURÍSTICA])
- [ ] Transição: vilão + mecanismo™ VERBATIM (ou fallback declarado sem ™)
- [ ] 3 objeções, cada resposta com âncora de fato + mark de evidência preservado
- [ ] Checkpoint de coautoria feito ANTES do render final
- [ ] Teste de substituição passou (trocou o nicho → kit quebra)
- [ ] Teste de voz alta passou (é fala, não copy)
- [ ] Ban-list limpa (guru + IA + pressão artificial + servilismo)
- [ ] Garantia/transição só no que o sistema controla — zero promessa de faturamento/fechamento/comparecimento/desfecho (CALIBRATION-CORE §12)
- [ ] Reativação, se citada, escopada a leads antigos/no-shows/base parada/winback — nunca "resolve toda retenção" (CALIBRATION-CORE §13)
- [ ] Nicho regulado → sem desfecho clínico/antes-depois/faturamento garantido + órgão (CFM/CFO/CFN/CONFEF) sinalizado nas notas internas (CALIBRATION-CORE §20)
- [ ] Zero drift de número vs `_constructs.md`
- [ ] Artefato salvo em `clientes/_pitches/[canal]-[slug].md` + STATUS atualizado
- [ ] Handoff entregue: "/proposta quando o prospect responder"
