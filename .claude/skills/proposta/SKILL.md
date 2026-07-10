---
name: proposta
description: >
  Gera proposta comercial pra um prospect específico — HTML single-file
  printável (A4) + versão curta pra WhatsApp. O diferencial: NÃO pergunta
  seu preço — puxa o preço CALCULADO, o mecanismo™, a garantia e o custo
  da inação direto do _constructs.md e aplica ao caso do prospect. Só
  pergunta o contexto DELE (nome, segmento, o problema que ele trouxe).
  Output: clientes/_propostas/[prospect]/proposta.html + whatsapp.md +
  registro.md. Use quando rodar /proposta, "monta uma proposta pro [nome]",
  "preciso mandar proposta", "fechei uma call, e agora?".
---

# /proposta — A proposta que sai da fundação (não do chute)

A proposta comum pergunta: "quanto você quer cobrar?". Esta skill não pergunta — **o preço já foi calculado** pelo /precificar, o mecanismo™ já foi derivado pelo /posicionar, a garantia já foi forjada pelo /criar-oferta. O que esta skill faz é **aplicar tudo isso ao caso de UM prospect real**: o problema que ELE trouxe, na conta que ELE entende, no documento que ELE recebe.

**Regra do módulo:** a proposta não cria nada — ela traduz a fundação pro caso do prospect. Frase sem rastro no `_constructs.md` ou no intake = inventada = não entra.

## O que esta skill NÃO faz (honestidade)

- **Não calcula preço.** Preço vem VERBATIM de §PRICING. Achou caro/barato? Rode `/precificar` de novo — não ajusta aqui "pra fechar o negócio".
- **Não inventa garantia.** Garantia vem de §OFERTA. Sem §OFERTA → a proposta sai com "compromissos de entrega" (derivados do escopo), nunca com garantia improvisada.
- **Não inventa case nem prova.** Sem prova real na fundação → a seção não existe. Proposta com case inventado é fraude, não copy.
- **Não promete resultado que o math não sustenta.** O custo da inação aplicado ao prospect é ESTIMATIVA declarada como estimativa — dentro do próprio documento.
- **Não gera PDF por mágica.** Gera HTML impecável pra imprimir (Cmd+P → PDF). Playwright pra PDF automático é opcional, com fallback declarado.

## Passo 0 — Ler a fundação + DECLARAR o que encontrou

Ler, nesta ordem:

0. `.claude/rules/CALIBRATION-CORE.md` — §12 (garantia só no que o sistema controla), §15 (copy pública limpa ≠ selos/notas internas), §16 (PT-BR nativo, nunca fórmula gringa traduzida), §23 (materializar + abrir o artefato no navegador) e §25 (sistema visual por arquétipo — o HTML A4 HERDA os brand tokens, não improvisa paleta do zero). São as regras que esta proposta preserva VERBATIM ao cascatear a fundação pro caso do prospect.
1. `_constructs.md` **INTEIRO** (raiz do workspace)
2. `ofertas/[slug]/oferta.md` — se §OFERTA aponta pra uma oferta compilada (é mais rica que o resumo do constructs: stack completo, pré-condições, prova)
3. **Marca (CALIBRATION-CORE §25):** `marca/brand-tokens.json` — os tokens que o HTML A4 HERDA (paleta OKLCH, tipografia, raio, sombra, motion, density); `marca/design-guide.md` complementa com logo + regras de uso em linguagem humana. **Precedência de herança:** se a proposta é pra um cliente com marca própria, `clientes/[slug]/marca/brand-tokens.json` GANHA do workspace `marca/`. Se nenhum existe → o render aplica a estética do ARQUÉTIPO do nicho (§25), nunca um default neutro genérico.
4. `marca/voice-dna.json` (se existir) — voz completa do operador (signature phrases / ranço), gerada pelo /setup
5. `_contexto/preferencias.md` — tom do operador
6. `clientes/_index.md` — o prospect já existe como cliente/lead registrado?

Abrir a conversa declarando o estado (prova viva de que a fundação vale):

```
Fundação detectada: Operador ✅ · Mercado ✅ · Posicionamento ✅ · Pricing ✅ · Oferta ✅

Esta proposta sai com: sua voz, o hero pain do nicho ([nome]), o mecanismo™
([nome verbatim]), o preço CALCULADO (R$[X] setup + R$[Y]/mês) e a garantia
da oferta. Só preciso do contexto do prospect — 3 perguntas.
```

(Adaptar a lista ao que realmente existe. Nunca declarar camada vazia como ✅.)

## O que este executor lê da fundação (progressive enhancement)

Este é o executor que MAIS depende da fundação. Nunca trava — mas degrada com franqueza:

| Construct | SE EXISTE → | SE FALTA → degrada + convite |
|---|---|---|
| §OPERADOR (voz) | Proposta escrita na SUA voz (signature phrases, zero palavras do seu ranço) | Tom neutro profissional. "Rode `/setup` pra proposta sair com a sua cara." |
| §NICHO (hero pain + custo da inação) | Diagnóstico usa a linguagem de compra do mercado + seção "o custo de não agir" com número âncora e a conta na tela | Diagnóstico usa só as palavras do prospect (intake); sem seção de custo da inação. "Rode `/mapear-mercado` pra desbloquear o argumento financeiro — é ele que justifica o investimento." |
| §CONCORRÊNCIA (THE GAP) | 1 parágrafo de contraste implícito ("por que as soluções comuns falham") sem citar nome de player | Sem contraste. "Rode `/escanear-concorrencia` pra proposta atacar a desconfiança que o mercado já tem." |
| §POSICIONAMENTO (mecanismo™ + vilão) | Seção "como funciona" apresenta o MECANISMO™ verbatim em 3 passos, vilão nomeado no diagnóstico | Seção vira "nossa abordagem" descritiva, sem nome. "Rode `/posicionar` — mecanismo nomeado fecha mais que método sem nome." |
| §PRICING (preço calculado + tiers + capacidade) | Investimento = tier recomendado + âncora + math resumido ("por que esse preço"); vagas/mês = escassez REAL | **Degrada MAL** — ver bloco abaixo. |
| §OFERTA (promise + garantia + stack) | Garantia verbatim, escopo setup×recorrência, "o que NÃO está incluído" das pré-condições | **Degrada MAL** — ver bloco abaixo. |

### 🔴 §PRICING ou §OFERTA vazios — o aviso franco

Proposta sem math é a proposta de todo mundo: preço chutado, garantia de boca, escopo elástico. Se §PRICING **ou** §OFERTA estiverem vazios, dizer na lata e oferecer as duas rotas — **o usuário escolhe, a skill não trava:**

```
Aviso honesto: sua fundação não tem [preço calculado / oferta compilada].
Sem isso, a proposta sai no modo básico — VOCÊ me diz o preço e eu monto
o documento. Funciona, mas é a proposta que qualquer um faz: sem o math
que justifica o número, sem garantia derivada de dado.

Duas rotas:
1. (recomendada) Rode /precificar (~10 min) [e /criar-oferta] e volte —
   a proposta sai 10x mais defensável.
2. Sigo no modo básico agora: você fornece preço, escopo e garantia (se
   houver), e o documento registra que esses campos vieram de você, não
   do sistema.
```

No modo básico: TODO campo fornecido à mão é registrado no `registro.md` interno como `[OPERADOR — sem math de fundação]`. Sem drama, mas sem lavar a origem.

## Passo 1 — Contexto do prospect (3 perguntas, UMA por vez)

Só o que a fundação NÃO tem: o caso concreto. UMA pergunta por vez; se o usuário enrolar, registra o que tem e segue.

**Q1 — Quem é:**
> "Nome do prospect e do negócio dele? (ex: Dra. Paula — Clínica Sorriso, Campinas)"

**Q2 — O problema que ELE trouxe (verbatim):**
> "O que ele te disse que dói? Nas palavras DELE, o mais literal possível — é isso que abre a proposta. Se ele deu algum número (quantos pacientes perde, quanto gasta, quanto fatura), me passa junto."

**Q3 — Contexto da conversa:**
> "Como vocês chegaram até aqui — foi call, indicação, respondeu anúncio? E ficou combinado algum próximo passo?"

O número que o prospect deu em Q2 é OURO: a conta do custo de não agir usa o número DELE (marcado no documento como "com base no que você me relatou"). Sem número dele → usa o número âncora de §NICHO, declarado como dado de mercado, não medição do negócio dele.

## Passo 2 — Mesa de derivação (como cada seção nasce)

| Seção da proposta | Fonte | Regra |
|---|---|---|
| **1. Diagnóstico do problema DELE** | Q2 (verbatim) + §NICHO (hero pain, linguagem de compra) + §POSICIONAMENTO (vilão) | Abre com as palavras DELE, conecta ao padrão do mercado ("você não está sozinho — [hero pain]"), nomeia o vilão como causa estrutural. Zero diagnóstico genérico. |
| **2. O custo de não agir** | número de Q2 (preferido) OU custo da inação de §NICHO | Conta simples e visível: [número] × [período] = [total/ano]. Se o número é do prospect: "com base no que você me relatou". Se é de mercado: "dado de mercado do seu segmento — no seu caso pode variar". SEMPRE piso conservador do range, nunca teto. |
| **3. Como funciona — o MECANISMO™** | **verbatim** §POSICIONAMENTO + stack de §OFERTA | Nome verbatim (zero mutação). 3 passos numerados: o que instala → o que roda → o que ele vê (resultado mensurável). Descrever por outcome; ferramenta entre parênteses no máximo — IA na retaguarda, não no pitch. |
| **4. Escopo + o que NÃO está incluído** | §OFERTA stack (setup × recorrência × pré-condições) | Setup: 3-5 itens. Recorrência: o que roda todo mês. **"O que NÃO está incluído"** = exclusões declaradas + pré-condições viradas pra ele ("do seu lado: [X]"). Essa seção protege VOCÊ — escopo sem borda vira trabalho infinito. |
| **5. Investimento** | **verbatim** §PRICING | Tier recomendado = o que resolve o problema de Q2 (default: tier do meio). Âncora = tier acima ("pra contexto, o plano completo é R$Z") ou âncora competitiva de §PRICING. Math resumido em 2-3 linhas: "por que esse preço" (custo de não agir vs investimento — a proposta paga por si em [N] meses, conta na tela). Vagas: capacidade real de §PRICING ("trabalho com [N] clientes simultâneos; [X] vagas abertas") — se não existe, NÃO inventar escassez. |
| **6. Garantia** | **verbatim** §OFERTA | Fórmula número + prazo + reversão, com as pré-condições explícitas. Sem §OFERTA → seção vira "Compromissos de entrega" (prazos e entregáveis do escopo), sem garantia inventada. |
| **7. Próximos passos + validade** | Q3 + capacidade | 1 ação clara (assinar/agendar/responder), prazo de validade da proposta: default **7 dias corridos** `[HEURÍSTICA — janela usual de decisão B2B; ajuste se o ciclo do nicho for outro]`. Validade existe porque a vaga é finita (capacidade real) — não teatro de urgência. |

**Marks são internos.** [GOLD/SILVER/BRONZE/HEURÍSTICA] vão pro `registro.md` — o documento do prospect usa a versão honesta em linguagem de gente: "dado de mercado", "estimativa conservadora", "com base no que você relatou". Nunca jargão interno na frente do cliente; nunca lavar estimativa como fato.

**Zero drift de número:** o N da garantia, o preço, o prazo — idênticos ao `_constructs.md`, dígito por dígito.

## Passo 3 — Checkpoint de coautoria (ANTES de renderizar)

Mostrar a espinha em 6 linhas e esperar aprovação — o render final só sai com direção aprovada:

```
Espinha da proposta pra [prospect]:
· Diagnóstico: [1 frase — o problema dele + o vilão]
· Custo de não agir: R$[X]/mês → R$[Y]/ano ([origem do número])
· Mecanismo: [nome™] em 3 passos
· Investimento: [tier recomendado] — R$[setup] + R$[mês] (âncora: [tier acima])
· Garantia: [1 linha]
· Validade: [data] · Vagas: [real ou omitido]

Aprova a direção, ou ajusta algo antes do documento final?
```

Ajuste de preço/garantia/mecanismo pedido aqui → redireciona pro módulo dono (`/precificar`, `/criar-oferta`, `/posicionar`). Ajuste de ênfase, ordem, tom, escopo do caso → faz aqui.

## Passo 4 — Render: HTML single-file printável (A4)

Criar `clientes/_propostas/[prospect-slug]/proposta-[AAAA-MM-DD].html`. Single file, CSS inline no `<head>`, ZERO request externo (fonte do sistema, sem CDN — o arquivo tem que abrir offline no notebook do prospect).

**Design — HERDA a marca (sóbrio premium · CALIBRATION-CORE §25 · zero drift):** o A4 NÃO tem paleta cravada própria — ele estiliza **a partir dos tokens** de `brand-tokens.json` (precedência `clientes/[slug]/marca/` > `marca/`). O valor OKLCH / tipo / raio que sai no HTML é o MESMO do token — o teste de §25 valida isso.
- **Se `brand-tokens.json` existe:** mapear tokens → CSS custom properties no `:root` e estilizar a partir delas — `--accent` (cor primária = títulos de seção + linha do investimento + régua sob o hero), `--ink` (texto), `--surface` (fundo do documento), `--font-display`/`--font-body` (tipografia declarada, sempre com fallback de fonte do sistema — sem `@import`/CDN, preservando o single-file offline; fonte custom só se embutida base64), `--radius` (cantos da tabela/cards), sombra e density conforme o arquétipo. Nenhuma cor/fonte hardcoded no CSS que não venha de uma variável do token.
- **Se NÃO existe `brand-tokens.json` (nem cliente nem workspace):** aplicar a estética do **ARQUÉTIPO do nicho** derivado de §NICHO/§POSICIONAMENTO (§25 — **Clinical Premium:** base clara neutra suave + acento teal/azul profundo, whitespace generoso, raio médio · **Performance Operations:** neutro sofisticado, alto contraste, acento de status · **Local Specialist:** neutro quente sólido, acento confiável, raio pequeno-médio · **AI Infrastructure:** neutro arquitetural, acento elétrico contido, raio pequeno + toque mono). NÃO cair num neutro genérico "pra todo mundo". Registrar no `registro.md` que a proposta saiu com estética PROVISÓRIA de arquétipo (não tokens reais) e sugerir rodar `/marca` pra travar o sistema visual.
- **Logo:** embutir como **data URI base64** (single-file de verdade — sobrevive ao envio offline).
- Tipografia forte: hero do documento = nome do prospect + a promessa em 1 linha, corpo 16-17px, line-height 1.6, hierarquia clara h1>h2>corpo — pesos/famílias vindos do token.
- Whitespace generoso. Tabela limpa pra investimento (raio do token). **Zero clipart, zero emoji, zero ícone decorativo, zero stock.** A sobriedade É o premium.
- Rodapé: nome do operador + contato + data + "válida até [data]".

**Print CSS obrigatório:**
```css
@page { size: A4; margin: 18mm; }
@media print { body { font-size: 12pt; } .no-print { display: none; } }
section { break-inside: avoid; }
h2 { break-after: avoid; }
```
Container: `max-width: 760px; margin: 0 auto;` (lê bem na tela E no papel). Cada uma das 7 seções em `<section>` própria — quebra de página nunca corta seção no meio.

**PDF (opcional, com verificação + fallback):**
1. Testar: `npx playwright --version`. Se existir → `npx playwright pdf [arquivo].html [arquivo].pdf` (ou script mínimo com `page.pdf({format:'A4'})`).
2. Se Playwright não existir ou falhar: **NÃO travar.** Entregar o HTML e ensinar: "abre o arquivo no navegador → Cmd+P (Ctrl+P) → destino 'Salvar como PDF' → margens padrão. Sai idêntico — o CSS de impressão já está calibrado."

## Passo 5 — Versão WhatsApp (junto, sempre)

Criar `clientes/_propostas/[prospect-slug]/whatsapp.md` — a mensagem que ACOMPANHA o envio (não substitui o documento). Na voz do operador, 6-10 linhas:

```
[Nome], [gancho da conversa de Q3 — 1 linha pessoal].

Montei a proposta com base no que você me falou sobre [problema de Q2,
nas palavras dele]. Tá tudo lá: [a conta do que isso custa por mês /
como o [mecanismo™] resolve / investimento com a conta aberta / garantia].

[1 frase de escassez REAL, se houver: "segurei 1 das X vagas de [mês]
pra você até [data]."]

Dá uma lida e me fala o que fez sentido. Qualquer número que eu usei,
te mostro de onde veio.
```

Regras: zero link encurtado · zero "imperdível/última chance" · a frase final ("te mostro de onde veio") só entra se a fundação tem math real — no modo básico, cortar.

## Passo 6 — Gates anti-slop (rodar ANTES de salvar)

**1. Teste de substituição (dupla):** trocar o NICHO → a proposta tem que quebrar (linguagem de compra específica). Trocar o PROSPECT por outro do mesmo nicho → o diagnóstico e a conta têm que quebrar (caso dele, número dele). Se sobrevive às duas trocas, é template com nome trocado — refazer.

**2. Teste de voz alta:** ler o diagnóstico e o argumento de investimento em voz alta. Se soa como slide corporativo e não como o operador explicando numa mesa, reescrever com a voz de §OPERADOR.

**3. Ban-list (grep no output):**
- Guru: "transformação", "mindset", "sucesso" (vago), "elite", "destrave", "alavancar" (vago), "próximo nível", "imperdível"
- IA: "não é só X, é Y", "num mundo onde", "imagine...", "revolucione", "potencialize", "eleve seu negócio", "solução robusta/completa/inovadora"
- Hedge comercial: "pode ser", "talvez", "acreditamos que", "esperamos"

**4. Coerência de número:** preço, N da garantia, prazo, capacidade = idênticos ao `_constructs.md`. Custo de não agir = piso conservador, com origem declarada no documento.

**5. Filtro Nova Economia:** investimento apresentado como setup + recorrência (nunca hora) · IA na retaguarda (o prospect compra resultado, não "automação com IA") · escopo com borda (seção 4 protege a capacidade real).

**6. Escassez honesta:** vagas/validade só entram se derivadas de capacidade real de §PRICING. Sem capacidade registrada → validade entra (7 dias `[HEURÍSTICA]`), contagem de vagas NÃO.

## Passo 7 — Salvar + handoff (fecha o loop)

Salvar em `clientes/_propostas/[prospect-slug]/`:

```
clientes/_propostas/[prospect-slug]/
├── proposta-[AAAA-MM-DD].html   ← o documento (+ .pdf se Playwright rodou)
├── whatsapp.md                  ← mensagem de envio
└── registro.md                  ← INTERNO: prospect, origem (Q3), tier ofertado,
                                    marks de evidência usados, campos [OPERADOR]
                                    do modo básico, validade, status: ENVIADA?/
                                    RESPONDEU?/FECHOU?/RECUSOU? + campo de lições
```

Atualizar `clientes/_index.md`: linha do prospect com status `proposta enviada [data] · válida até [data]`.

**Abrir o artefato automaticamente (CALIBRATION-CORE §23 — materializar + abrir).** Assim que os 3 arquivos estão salvos, ABRIR o HTML da proposta no navegador — `open` (macOS) / `xdg-open` (Linux) / `start` (Windows) apontando pro `proposta-[AAAA-MM-DD].html`. Se o comando de abrir falhar, imprimir o **path ABSOLUTO** do arquivo pra ele abrir na mão ("proposta gerada em: /caminho/absoluto/.../proposta-[data].html — abre no navegador"). A proposta é o clímax visível: o operador VÊ o documento renderizado, nunca um path de `.md` cru que ninguém abre.

Mensagem final:

```
Proposta pronta: [prospect]
→ clientes/_propostas/[slug]/proposta-[data].html (já aberto no navegador;
  Cmd+P → PDF se quiser anexar)
→ whatsapp.md (a mensagem de envio, na sua voz)

Mandou? REGISTRA A RESPOSTA — me fala o que ele disse (ou edita o
registro.md). Cada resposta calibra a próxima: objeção de preço vira
insumo do /precificar, objeção de confiança vira prova a capturar.

Fechou? Rode /novo-cliente pra abrir o workspace dele.
Recusou? Me conta o motivo — vai pro registro e a próxima proposta sai mais afiada.
```

## Comportamentos especiais

**Segunda proposta pro MESMO prospect (contra-proposta / follow-up):** detectar pasta existente em `clientes/_propostas/[slug]/` → ler o `registro.md` ANTES de perguntar qualquer coisa. A nova versão nasce da resposta registrada: objeção de preço → NÃO desconta na proposta (desconto sem math destrói a âncora); reduzir ESCOPO pra caber no orçamento dele (tier abaixo, ou setup faseado) mantendo o preço/entrega proporcional de §PRICING. Salvar como novo arquivo datado, nunca sobrescrever — o histórico de versões é inteligência de venda.

**Validade venceu sem resposta:** se o usuário pedir reenvio após a data, NÃO renovar a validade silenciosamente (validade que sempre renova = urgência teatral). Gerar follow-up curto no whatsapp.md perguntando se o problema ainda está de pé; nova proposta só com nova data E nova conversa (Q2 pode ter mudado).

**Fundação instalada DEPOIS de uma proposta em modo básico:** ao rodar de novo com §PRICING/§OFERTA agora preenchidos, avisar: "sua fundação agora tem preço calculado (R$[X]) — a proposta anterior de [prospect] saiu com R$[Y] fornecido à mão. Quer regenerar com o math?" Se os números divergem, a diferença é DECISÃO do operador (registrar no registro.md), não ajuste silencioso.

**Prospect de nicho diferente do instalado:** se Q1 revelar segmento fora do nicho de §NICHO, dizer na lata: "sua fundação foi pesquisada pra [nicho]; pra [segmento do prospect] o hero pain e o custo da inação não se aplicam — sigo só com o que ELE me deu (modo caso-específico) ou você roda `/trocar-nicho`/`/mapear-mercado` se esse mercado virou prioridade." Nunca aplicar dor de um nicho a outro como se fosse dado.

## Quality gates (checklist final — se algum falhar, corrigir antes de salvar)

- [ ] `_constructs.md` lido INTEIRO + fundação DECLARADA na abertura (camadas reais, zero ✅ falso)
- [ ] §PRICING/§OFERTA vazios → aviso franco + 2 rotas oferecidas (nunca travou, nunca escondeu a degradação)
- [ ] ≤3 perguntas de intake, uma por vez, todas sobre o PROSPECT (zero pergunta cuja resposta já vive na fundação)
- [ ] Checkpoint de coautoria: espinha aprovada ANTES do render final
- [ ] Preço, tiers, garantia, mecanismo™ VERBATIM da fundação (zero mutação "pra fechar")
- [ ] Custo de não agir: piso conservador + origem declarada NO documento (número dele vs dado de mercado)
- [ ] Marks internos no registro.md; documento do prospect em linguagem honesta de gente
- [ ] Seção "o que NÃO está incluído" presente (protege o operador)
- [ ] Escassez/validade derivadas de capacidade real ou marcadas [HEURÍSTICA] — zero urgência teatral
- [ ] HTML single-file: zero request externo, print CSS A4, logo em base64 (se houver)
- [ ] Marca herdada (§25): cores/tipo/raio do HTML = valores do `brand-tokens.json` (precedência cliente > workspace, zero drift); sem tokens → estética do ARQUÉTIPO do nicho + nota no `registro.md` (nunca default neutro genérico)
- [ ] PDF: Playwright verificado antes de usar; fallback Cmd+P ensinado se falhou
- [ ] HTML aberto no navegador automaticamente (§23) ao concluir; fallback = path ABSOLUTO impresso se o `open`/`xdg-open`/`start` falhar
- [ ] Versão WhatsApp junto, na voz do operador, sem link encurtado
- [ ] Teste de substituição DUPLO passou (nicho E prospect) + voz alta + ban-list limpa
- [ ] 3 arquivos salvos + clientes/_index.md atualizado + handoff com loop de registro
