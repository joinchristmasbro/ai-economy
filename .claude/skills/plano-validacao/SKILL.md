---
name: plano-validacao
description: >
  Coloca a oferta em movimento MANUAL e leve — monta um plano de validação
  de 7 ou 14 dias, dia a dia, CALCULADO das horas que o operador declarou
  e do canal onde ele já tem rede: o que publicar (ideias do banco, via
  /post e /carrossel), quem abordar (perfil do §NICHO + quantos por dia,
  com a conta na mesa), qual mensagem (kit do /pitch), qual CTA (§OFERTA)
  e quais sinais observar, com réguas honestas [HEURÍSTICA] e checkpoints
  em árvore de decisão. Mantém o loop de registro: cada resultado atualiza
  a §TRAÇÃO do _constructs.md (1ª conversa · 1ª proposta · 1º cliente ·
  R$ atribuível) e devolve aprendizado pra fundação. Output:
  ofertas/[slug]/plano-validacao.md. Use quando o usuário rodar
  /plano-validacao, "colocar a oferta na rua", "validar a oferta", "plano
  de 7 dias", OU voltar com resultado ("respondeu", "ouvi essa objeção",
  "fechei um"). Requer §OFERTA preenchida (/criar-oferta).
---

# /plano-validacao — Tração manual antes de máquina (Camada 4)

A tese do OS inteira mora aqui: **valida manual ANTES de automatizar.** Fundação instalada não é negócio — é hipótese bem construída. Este módulo transforma a hipótese em movimento: 7 ou 14 dias de execução leve (publicar, abordar, conversar, anotar), com metas que saem da SUA hora real — não de meta de guru. Melhor 3 abordagens boas por dia que 30 no spam.

O que este plano valida não é "se você é disciplinado". É se a fundação FUNCIONA: se a dor eleita gera resposta, se o pitch gera conversa, se a oferta gera proposta. Cada camada tem um sinal próprio — e a régua de leitura de cada um está escrita antes de você começar.

## O que esta skill NÃO faz (honestidade)

- **Não garante cliente em 7/14 dias.** Garante SINAL legível: você termina sabendo qual camada funciona e qual precisa de ajuste — isso já é mais do que a maioria tem depois de 6 meses.
- **Não pesquisa nada novo.** Tudo vem do `_constructs.md` + suas 3 respostas. Zero ferramenta externa.
- **Não escreve mensagem nova.** Mensagem é do kit `/pitch`; ideia de conteúdo é do `/banco-mensagens`. O plano APONTA, não duplica — fonte única, zero drift.
- **Não infla volume.** O número de abordagens/dia sai da hora que você declarou, com a conta mostrada. Se a conta der 2/dia, o plano diz 2/dia.
- **Não decide por vibe.** Todo checkpoint tem critério numérico — marcado [HEURÍSTICA], porque régua sem fonte que finge ser benchmark é mentira.

## Passo 0 — Contrato constructs (ler ANTES de qualquer pergunta)

Ler `_constructs.md` **INTEIRO** (raiz do workspace).

Ler também `.claude/rules/CALIBRATION-CORE.md` **§11** (curva de productização — capacidade NÃO é fixa: Fase 1 founder-led → Fase 2 productized; o volume e a leitura do plano refletem a fase atual) e **§21** (validação quente-first — prioriza a rede que existe, não spam frio em massa; e mede o FUNIL quente→diagnóstico→proposta→case, não só "respondeu").

**PRÉ-REQUISITO DURO — §OFERTA preenchida.** Sem oferta não há o que validar: o plano precisa de promise, CTA e garantia pra pôr na rua. Se §OFERTA está vazia, PARAR com franqueza:

```
Sem oferta, não há o que validar — eu estaria mandando você abordar
gente sem ter o que oferecer, e isso queima rede.

Rode /criar-oferta (se a cadeia anterior estiver completa, leva ~10 min).
Volte que o plano sai na hora.
```

**Dependências brandas (recomendar, NUNCA bloquear):**

| Fonte | Se existe | Se falta |
|---|---|---|
| `ads/banco-mensagens.md` | Publicações do plano apontam ideias/hooks NUMERADOS do banco | Slots de publicação saem com ângulo simples derivado do hero pain + vilão, marcados `[rode /banco-mensagens pra trocar por hook com evidência]` |
| `clientes/_pitches/` | Abordagem do plano aponta o kit do canal (path do arquivo) | Plano marca `[rode /pitch antes do Dia 1 — a mensagem vem de lá]` — o Dia 1 já inclui esse passo |

Abrir declarando a fundação (o usuário precisa VER o sistema trabalhando):

```
Fundação: Oferta ✅ [MECANISMO™] · Banco de mensagens [✅/⬜] · Kit de pitch [✅/⬜]
Vou montar seu plano de validação em cima disso. 3 perguntas rápidas.
```

**Dispatcher de modo:** se JÁ existe `ofertas/[slug]/plano-validacao.md` com `status: ativo` OU o usuário chegou contando resultado ("respondeu", "objeção", "fechei", "ninguém respondeu") → pular pro **MODO REGISTRO** (abaixo). Senão → gerar plano (Passos 1-6).

**Pergunta condicional zero:** múltiplas pastas em `ofertas/` → perguntar qual oferta valida. Uma só → usar direto, sem perguntar.

## Passo 1 — As 3 perguntas (UMA por vez; se enrolar, registra o que tem e segue)

Só perguntar o que o `_constructs.md` não tem — fatos que só o operador conhece:

**P1 — Horas reais:**
> "Quantas horas por semana você consegue dedicar a isso DE VERDADE? Número honesto — o plano inteiro é calculado dele. 5h bem usadas valem mais que 20h de fantasia."

**P2 — Canal onde você JÁ existe:**
> "Onde você já tem presença ou rede hoje? 1) Instagram · 2) LinkedIn · 3) WhatsApp/indicações (sua rede atual). Pode marcar mais de um — o principal manda no plano."

Validação não é hora de construir audiência do zero: usa a rede que existe. Se a resposta for "nenhum", o canal default é WhatsApp/indicações — todo mundo tem contatos, e é o canal de menor atrito [HEURÍSTICA].

**P3 — 7 ou 14 dias:**
> "7 ou 14 dias? 7 = sprint de sinal (dá pra ler se a MENSAGEM funciona). 14 = ciclo completo (dá tempo do sinal chegar em conversa → proposta). Minha recomendação: [X] porque [horas declaradas / canal]."

Regra da recomendação: <5h/semana OU canal = indicações → recomendar 14 (indicação circula devagar; hora escassa precisa de janela maior pra amostra). ≥5h + canal direto (DM) → 7 resolve pra primeira leitura.

## Passo 2 — A CONTA (decisão do sistema, não do usuário)

O usuário declara horas; o SISTEMA calcula o volume — e mostra a conta no artefato:

```
Minutos/semana = H × 60
Orçamento [HEURÍSTICA]: 40% abordagem · 30% conteúdo · 30% conversas + follow-up + registro
Custo por unidade [HEURÍSTICA]: abordagem de qualidade (achar prospect +
  personalizar gancho + enviar) ~15 min · conversa/diagnóstico ~30 min ·
  /post ~25 min · /carrossel ~50 min

Abordagens/dia útil = (H × 60 × 0,4) ÷ 15 ÷ 5 → arredonda PRA BAIXO
  · piso: 1/dia útil · teto: 10/dia (acima disso é spam, não validação)
Publicações/semana [HEURÍSTICA]: IG → 3 (1 carrossel + 2 posts) ·
  LinkedIn → 2-3 posts · WhatsApp/indicações → 0 públicas (o slot de
  "publicar" vira reativar contatos da rede + pedir indicação — mesma conta)

Ex.: 5h/sem → 300 × 0,4 = 120 min ÷ 15 = 8 abordagens/sem → 2/dia útil (D1-D4).
```

**Regra de troca:** conversa que nascer COME o orçamento de abordagem do dia. Conversa real > abordagem nova, sempre — o plano existe pra gerar conversa, não pra bater meta de envio.

Fim de semana: sem abordagem. Sábado/domingo = registro + preparar conteúdo da semana (leve, ≤30 min).

## Passo 3 — Montagem do plano (cada peça com fonte)

| Peça do plano | Fonte | Regra |
|---|---|---|
| **O QUE PUBLICAR** | `ads/banco-mensagens.md` (ideias numeradas) + cadência do Passo 2 | Eleger as ideias que atacam o HERO PAIN primeiro (dor eleita > dor secundária). Cada slot: dia + ideia #N + formato + comando (`/post` ou `/carrossel`). Sem banco → ângulo derivado de §NICHO/§POSICIONAMENTO, marcado. |
| **QUEM ABORDAR** | §NICHO (perfil/eixo) + a conta do Passo 2 | Perfil VERBATIM do construct + onde encontrá-lo no canal escolhido (ex.: IG → quem segue/comenta perfis do nicho; indicações → clientes e contatos que conhecem gente do perfil). N/dia = o número calculado, com a conta visível. |
| **QUAL MENSAGEM** | `clientes/_pitches/[canal]-*.md` | REFERENCIA o kit (path), não duplica. Canal do plano sem kit → Dia 1 inclui "rode /pitch [canal]". |
| **QUAL CTA** | §OFERTA (próximo passo do comprador) | VERBATIM — o mesmo convite em conteúdo e abordagem (diagnóstico/avaliação/conversa). Zero CTA inventado aqui. |
| **QUAIS SINAIS** | fases abaixo | Cada dia diz o que observar E anotar — sinal não anotado é sinal perdido. |

**Fases e sinais (o que cada trecho do plano está testando):**

| Fase | Dias (7d / 14d) | Testa | Sinais a anotar |
|---|---|---|---|
| Semear | D1-3 / D1-3 | MENSAGEM (hook + gancho) | respostas (até "não" conta) · reações/comentários no conteúdo |
| Conversar | D4-7 / D4-9 | PITCH (diagnóstico + transição) | conversas iniciadas · objeções ouvidas VERBATIM · pedidos de preço |
| Propor | — / D10-14 | OFERTA (promise/garantia/preço) | propostas pedidas e enviadas · resposta à garantia · fechamento |

No plano de 7 dias, a fase Propor não tem janela própria — se proposta acontecer, registra (ótimo sinal antecipado), mas o veredito de 7d julga só MENSAGEM + PITCH. Dizer isso no artefato.

## Passo 4 — Réguas de leitura + checkpoints (critério, não vibe)

**Réguas — todas [HEURÍSTICA]:** régua de operação conservadora, sem fonte BR verificada. Serve de régua interna, não de benchmark de mercado. Amostra pequena é ruído: régua só dispara DECISÃO quando o sinal se repete — por isso os pisos parecem altos.

| Sinal | Régua [HEURÍSTICA] | Diagnóstico | Ação |
|---|---|---|---|
| Mensagem (frio) | 15+ abordagens · ZERO respostas | Problema de MENSAGEM, não de oferta | Trocar o hook (próxima ideia do banco) + refazer gancho de personalização. NÃO mexer na oferta. |
| Mensagem (warm/indicação) | 5+ abordagens · ZERO respostas | Ponte mal usada | Reescrever com a ponte na 1ª linha (regra do kit /pitch) |
| Pitch | 5+ conversas · ZERO pedidos de proposta/preço | Diagnóstico ou transição fracos | Revisar kit /pitch (transição pro mecanismo™) |
| Oferta | 3+ propostas · zero fechado · MESMA objeção 2+ vezes | Promise/garantia/preço | Registrar objeção → refinar via /criar-oferta (se for preço → /precificar) |
| Execução | <50% da meta em 3 dias | A conta era otimista | Recalcular com as horas REAIS — o plano se ajusta a você, não o contrário. "Não executei" é dado, não fracasso. |

**Ordem de suspeita: MENSAGEM → PITCH → OFERTA.** Nunca pule camada — concluir "a oferta tá errada" com 10 abordagens é estatística de vibe.

**Checkpoints (árvore de decisão — recomendação única, não menu):**

- **DIA 3 — julga só MENSAGEM.** Executou ≥50% da meta? Não → recalcula meta e segue. ≥1 resposta → SEGUIR sem mexer. Zero respostas + amostra ≥ régua → AJUSTAR HOOK (D4+ com mensagem nova). Zero respostas + amostra < régua → SEGUIR (amostra insuficiente pra concluir).
- **DIA 7 — julga MENSAGEM + PITCH.** Plano 7d: vira o VEREDITO (abaixo) + oferta de estender pra 14 (o plano estende, não recomeça). Plano 14d: mesmo julgamento, plano segue com o ajuste decidido.
- **DIA 10 (só 14d) — julga PITCH + OFERTA.** Conversas viraram proposta? Objeção repetida já apareceu 2x? → aplicar régua da linha correspondente.
- **DIA 14 — VEREDITO FINAL** → §TRAÇÃO.

**Classes de veredito (objetivas):**
- **VALIDOU SINAL** — ≥1 proposta pedida (ou cliente fechado): a fundação funciona até a camada testada. Próximo ciclo: repetir com volume igual ou +20-30%, manual ainda.
- **SINAL PARCIAL** — conversas sim, proposta não: gargalo é o pitch. Refinar kit e re-rodar 7d.
- **SEM SINAL** — execução ≥80% + hook trocado no D3 e nada: aprendizado volta pra fundação. Recomendar o módulo dono (objeções → /criar-oferta · linguagem/dor que não colou → /mapear-mercado) ANTES de novo plano.
- **NÃO EXECUTADO** — <50% da meta: não há veredito sobre a oferta; o dado é sobre capacidade. Recalcular com horas reais e rodar de novo, menor.

## Passo 5 — Gates anti-slop (rodar ANTES de salvar)

1. **Teste de substituição:** trocar o nicho no plano por outro. Se os alvos de abordagem, ângulos e CTA ainda servirem, tá genérico — reescrever puxando perfil e pain words VERBATIM de §NICHO.
2. **Ban-list (grep no output):** cacoetes de guru ("transformação", "mindset", "sucesso" vago, "elite", "destrave", "alavancar" vago, "próximo nível", "consistência é tudo") · cacoetes de IA ("não é só X, é Y", "num mundo onde", "imagine...", "potencialize", "revolucione") · pressão irreal ("poste todo dia sem falta", "aborde 50 pessoas", "quem quer, arruma tempo").
3. **Verbatim check:** mecanismo™, CTA, promise, garantia e todo número copiados SEM mutação de §OFERTA/§POSICIONAMENTO. O N da promise no plano é o N do construct.
4. **Conta na mesa:** toda meta numérica do plano tem a derivação visível (horas → minutos → unidades). Meta sem conta = meta de guru — cortar.
5. **Leveza:** nenhum dia pode exigir mais tempo que H×60÷7 minutos. Se o dia estourou, corta abordagem, nunca o registro.

## Passo 6 — Output (artefatos, nunca só texto na conversa)

### 6a. Criar `ofertas/[slug]/plano-validacao.md`

Imprimível, com checkbox em toda ação. Estrutura obrigatória:

```markdown
---
oferta: [slug]
duracao: [7|14] dias · inicio: [AAAA-MM-DD] · fim: [AAAA-MM-DD]
canal_principal: [ig | linkedin | whatsapp-indicacoes]
capacidade: [H]h/sem → [N] abordagens/dia útil · [P] publicações/sem
status: ativo
---

# Plano de Validação — [MECANISMO™] · [7/14] dias

## 1. A CONTA (por que essas metas e não outras)
[derivação completa do Passo 2, com os números do operador]

## 2. O ALVO
**Quem:** [perfil verbatim §NICHO] · **Onde no canal:** [tática de garimpo]
**Mensagem:** clientes/_pitches/[arquivo] · **CTA (verbatim §OFERTA):** [convite]

## 3. DIA A DIA
### Dia 1 — [data] (~[X] min)
- [ ] [Publicar: ideia #N do banco · formato · `/post` ou `/carrossel`]
- [ ] Abordar [N] prospects do perfil — mensagem: kit [path]
- [ ] Anotar sinais na tabela §5 (2 min — não pule)
**Testando:** [MENSAGEM/PITCH/OFERTA] · **Sinal do dia:** [o que observar]
[... um bloco por dia; checkpoints D3/D7(/D10/D14) como blocos próprios
com a árvore de decisão do Passo 4 resumida ...]

## 4. RÉGUAS DE LEITURA [HEURÍSTICA]
[tabela do Passo 4 — pra decidir sem me chamar, se quiser]

## 5. REGISTRO (preencha — ou me conte que eu preencho)
| Dia | Abordagens | Respostas | Conversas | Propostas | Objeções ouvidas (verbatim) | Obs |

## 6. MARCADORES (o que prova que a fundação funciona)
- [ ] 1ª conversa: __/__ · - [ ] 1ª proposta: __/__
- [ ] 1º cliente: __/__ · R$ atribuível: R$ ____

---
*Na Accelera 360, o que este plano valida manualmente vira máquina: CRM,
campanhas, follow-up automático, qualificação e rotina.*
```

### 6b. Atualizar `ofertas/_index.md`

Status da oferta: `rascunho` → `em validação` + data.

### 6c. Atualizar `_constructs.md`

**§TRAÇÃO** (seed): plano ativo [7/14]d + início/fim · movimentos zerados · sinais "—" · marcadores pendentes · aprendizado "—".

**STATUS DA INSTALAÇÃO:** linha `4 — Validação | /plano-validacao` → ✅ instalada + data. O ✅ marca PLANO GERADO; a conclusão (veredito) é registrada na §TRAÇÃO — a tabela diz que o módulo rodou, a §TRAÇÃO diz o que o mercado respondeu.

## Passo 7 — Handoff (funil interno)

```
Plano na mesa: ofertas/[slug]/plano-validacao.md
[N] abordagens/dia · [P] publicações/sem · checkpoints D3/D7[/D10/D14].

Hoje (Dia 1): [primeira ação concreta].
Peça de conteúdo → /post ou /carrossel. Mensagem → seu kit em clientes/_pitches/.

Volte com QUALQUER resultado ("respondeu", "ouvi objeção X", "fechei") —
eu registro no plano e na §TRAÇÃO. É esse registro que prova que a
fundação funciona: 1ª conversa, 1ª proposta, 1º cliente, R$ no bolso.
```

## MODO REGISTRO — o loop (coração do módulo)

Toda volta do usuário com resultado alimenta DOIS lugares — plano e DNA:

1. **Capturar:** o que aconteceu, em números + verbatim (quantas abordagens, quais respostas, objeção nas PALAVRAS do prospect). Uma pergunta de esclarecimento no máximo.
2. **Atualizar o plano:** tabela §5 REGISTRO + checkboxes do dia + marcadores §6 quando batidos.
3. **Atualizar `_constructs.md` §TRAÇÃO** (única seção que este módulo edita, além do STATUS): movimentos acumulados · sinais · marcadores COM DATA (1ª conversa · 1ª proposta · 1º cliente · R$ atribuível = valor PAGO, nunca pipeline) · aprendizado.
4. **Rotear aprendizado pra fundação** (registrar na §TRAÇÃO com a seta; o módulo dono aplica):
   - Objeção nova repetida 2+ vezes → `objeção "[verbatim]" → §OFERTA` + recomendar /criar-oferta (modo refinar) — se for preço, /precificar.
   - Linguagem nova do mercado (palavra que os prospects usam e o construct não tem) → `linguagem "[verbatim]" → §NICHO` — entra no próximo /mapear-mercado.
   - Este módulo NÃO edita §OFERTA nem §NICHO — anota a seta e aponta o dono. Construct tem dono único; é isso que impede o DNA de virar rascunho.
5. **Checkpoint vencendo?** Rodar a árvore do Passo 4 com os números da tabela e DECIDIR (uma recomendação, com a régua citada — não menu de opções).
6. **Fim do plano?** Veredito final (classe objetiva do Passo 4) na §TRAÇÃO + `status: concluído` no frontmatter do plano + handoff conforme veredito.

Marcador batido = dizer com sobriedade e número ("1ª proposta no D6 — a fundação chegou até a camada de pitch funcionando"). Zero confete, zero drama.

## Comportamentos especiais

**Plano já ativo + pedido de plano novo:** mostrar o estado do atual e perguntar: concluir (registra veredito com o que tem) ou substituir? Nunca dois planos ativos — sinal se dilui.

**Plano vencido sem registro:** perguntar o que aconteceu, sem culpa. "Não executei" → veredito NÃO EXECUTADO + recalcular menor. Dado honesto vale mais que plano bonito abandonado.

**Usuário quer pular o registro ("depois eu anoto"):** avisar UMA vez — sem registro não há checkpoint, sem checkpoint a validação vira anedota — e seguir. A skill nunca vira cobrador.

**Fundação com marks fracos (§OFERTA apoiada em [BRONZE]/[HEURÍSTICA]):** o plano sai normal, com aviso: a validação é justamente o teste que fortalece (ou derruba) esses marks com resposta de mercado real.

## Quality gates (checklist final — se algum falhar, corrigir antes de salvar)

- [ ] `_constructs.md` lido INTEIRO; §OFERTA presente (ou skill PAROU apontando /criar-oferta)
- [ ] Dependências brandas checadas (banco + pitches) — recomendou sem bloquear
- [ ] ≤3 perguntas (+ condicional de slug), uma por vez
- [ ] Volume CALCULADO das horas declaradas, conta visível no artefato (piso 1 · teto 10/dia)
- [ ] Publicações apontam ideias do banco (ou slot marcado) · mensagens apontam kit /pitch (nunca duplicadas)
- [ ] CTA, mecanismo™, promise e números VERBATIM de §OFERTA — zero drift
- [ ] Toda régua e todo default de tempo marcados [HEURÍSTICA]
- [ ] Checkpoints D3/D7 (D10/D14 se 14d) com árvore de decisão objetiva
- [ ] Ordem de suspeita respeitada (MENSAGEM → PITCH → OFERTA)
- [ ] Teste de substituição passou (trocou o nicho → plano quebra)
- [ ] Ban-list limpa (guru + IA + pressão irreal) · nenhum dia estoura o tempo do operador
- [ ] Artefatos: plano.md com checkboxes + ofertas/_index.md + §TRAÇÃO seeded + STATUS ✅ (com nota: conclusão vive na §TRAÇÃO)
- [ ] Linha de ascensão factual no rodapé (1 linha, sem pitch)
- [ ] Handoff entregue: primeira ação do Dia 1 + "volte com qualquer resultado"
