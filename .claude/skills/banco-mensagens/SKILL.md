---
name: banco-mensagens
description: >
  Compila o ARSENAL DE COMUNICAÇÃO do operador num único artefato de consulta
  permanente (ads/banco-mensagens.md): 10 ângulos, 20 hooks copiáveis, dores &
  desejos na linguagem verbatim do mercado, objeções com resposta pronta,
  frases de posicionamento (bio/headline/pitch) e 20 ideias de conteúdo
  mapeadas — tudo cascadeado do _constructs.md, zero pesquisa nova. Use quando
  rodar /banco-mensagens, disser "banco de mensagens", "arsenal de
  comunicação", "não sei o que postar", "me dá hooks", "cansei de improvisar
  a comunicação".
---

# /banco-mensagens — O arsenal: sua comunicação sai do improviso

Este módulo é um **COMPILADOR, não um pesquisador**. Ele não pesquisa nada novo — pega o que a SUA fundação já derivou (a dor eleita com evidência, o vilão nomeado, o mecanismo™, a garantia, os números calculados) e consolida num único arquivo de consulta permanente. Você abre, copia e usa. Toda vez que for escrever um post, responder uma objeção, atualizar a bio ou puxar assunto com um prospect — a resposta já está no banco, na sua voz, com a linguagem do seu mercado.

**O que ele faz:** compila `ads/banco-mensagens.md` com 6 seções de munição pronta.
**O que ele NÃO faz:** pesquisa nova (isso é `/mapear-mercado`) · publicar ou agendar · escrever a peça final de conteúdo (as ideias executam via `/post` ou `/carrossel`) · inventar case, número ou mecanismo que não existe na fundação.
**Ferramentas:** nenhuma externa. Síntese pura da fundação — funciona offline, zero dependência.

---

## Passo 0 — Ler a fundação e DECLARAR o que encontrou (obrigatório)

Ler, nesta ordem:

1. `_constructs.md` INTEIRO (raiz do workspace) — a fonte de verdade
2. `nicho/market-map.md` — evidência bruta das dores + linguagem de compra com marks
3. `nicho/posicionamento.md` — Old Game/vilão/New Game/mecanismo™ + bio/headline já forjadas
4. `ofertas/[slug]/oferta.md` — promise, garantia, pré-condições, math (slug via `ofertas/_index.md`; se houver 2+ ofertas ativas, perguntar QUAL — única pergunta permitida desta skill)
5. Se existirem: `marca/voice-dna.json` (voz) · `nicho/concorrencia.md` (THE GAP) · `nicho/03-objecoes.md` (legado)

Depois, abrir declarando o estado — 2-4 linhas, sem tabela:

```
Fundação detectada: Operador ✅ · Mercado ✅ · Posicionamento ✅ · Oferta ⬜ · Tração ⬜
O banco sai com: hero pain "[nome]" + linguagem de compra verbatim + vilão
"[nome]" + mecanismo™ "[nome]". Sem a Oferta, as respostas de objeção saem
sem garantia/preço; sem Tração, as objeções são derivadas (não ouvidas).
```

Adaptar ao que existe de verdade. Se o usuário passou argumento (ex: tema ou oferta), registrar e seguir.

## O que este compilador lê da fundação (progressive enhancement)

| Construct | SE EXISTE → | SE FALTA → |
|---|---|---|
| **OPERADOR** (voz: signature_phrases, power_words, ranço) | Hooks e frases saem na voz DELE | Tom neutro-direto + `[VOZ PENDENTE]`. Convite: "rode `/setup`" |
| **NICHO/MERCADO** (hero pain + dores secundárias + linguagem de compra + custo da inação) | Ângulos derivados da dor ELEITA · pain words verbatim nos hooks · seção Dores & Desejos completa com marks | Banco BÁSICO: só voz + estrutura vazia com aviso. Convite: "rode `/mapear-mercado` — sem ele o banco é esqueleto" |
| **POSICIONAMENTO** (vilão + mecanismo™ + New Game) | Ângulos contrarian · frases de posicionamento (bio/headline/pitch) · mecanismo™ verbatim nas respostas de objeção | Seção Posicionamento AUSENTE (com nota) — NUNCA inventar mecanismo. Convite: "rode `/posicionar`" |
| **OFERTA** (promise, garantia, stack, pré-condições) | Objeções respondidas com garantia/math verbatim · CTAs de aquisição com promise numerada | Objeções saem sem âncora de oferta · CTAs em modo conversa. Convite: "rode `/criar-oferta`" |
| **CONCORRÊNCIA** (THE GAP) | Desbloqueia ângulo "o que ninguém no mercado entrega" | Ângulo indisponível — segue com os demais |
| **TRAÇÃO** (objeções reais ouvidas + linguagem nova) | Objeções REAIS entram com resposta, marcadas [OUVIDA] — o banco fica mais afiado | Objeções só derivadas da oferta, marcadas [DERIVADA — pré-tração] |

**Nunca travar por falta de fundação.** Só com a Camada 0 (voz), o compilador entrega um banco básico útil no dia 0 — e diz com franqueza o que cada módulo destravaria. **Quantidade cede à evidência:** menos fundação = menos itens. NUNCA completar as metas (10/20/20) com item genérico — 12 hooks específicos valem mais que 20 com enchimento.

---

## Passo 1 — Compilar o banco (6 seções, direto — sem wizard)

Compilador não entrevista. Depois da declaração do Passo 0 (e da escolha de oferta, se houve), compilar direto. Regra suprema em todas as seções: **zero drift** — números, mecanismo™, garantia, pain words entram VERBATIM do `_constructs.md`. Este executor CONSOME o DNA, não o edita.

### Seção 1 — 10 ÂNGULOS de comunicação

Cada ângulo = 1 linha de tese reutilizável em N peças. Formato: **nome curto** + tese em 1 frase + construct de origem + quando usar. Mapa de derivação (com fundação completa):

- **3-4 do hero pain:** dor crua (a segunda-feira de quem vive isso) · custo da inação (a conta aberta na frente do leitor, número verbatim) · sintoma→causa (o que o mercado acha que é o problema vs o que a evidência mostrou)
- **2-3 das dores secundárias:** 1 ângulo por dor, na linguagem de compra dela
- **1-2 do vilão:** contrarian direto ("o jeito que todo mundo faz é o que mantém o problema vivo") · New Game (o jogo novo que o mecanismo™ abre)
- **1 do THE GAP:** o que ninguém no mercado entrega (se §CONCORRÊNCIA existe)
- **1 da oferta:** a promise como tese pública (se §OFERTA existe)

Ângulo sem construct atrás **não entra** — a lista encolhe com honestidade.

### Seção 2 — 20 HOOKS prontos (copiáveis, 1 linha cada)

5 por tipo, na voz do operador, com pain words verbatim onde couber:

| Tipo | Esqueleto | Fonte |
|---|---|---|
| **Pergunta-diagnóstico** | Espelha o comportamento do ICP melhor que ele mesmo: "Você [comportamento verbatim da dor]?" — pergunta que só quem vive a dor responde sim | hero pain + linguagem de compra |
| **Contrarian** | "[Crença que o mercado repete] tá te custando [número]. E [razão pela qual ninguém conta]." | vilão + custo da inação |
| **Dado/número** | Abre com o número (verbatim + fonte): custo da inação, % em risco, benchmark do market-map | §NICHO + §DIAGNÓSTICO |
| **História** | Story-prime: "[Dia/hora]. [Cena com 1 número]. Foi aí que [gancho aberto]." | prova real da §OFERTA ou caso do operador |

🔴 **Hooks de história NUNCA inventam caso.** Se não há prova registrada nem caso contado pelo operador, o hook sai como esqueleto com `[SLOT: seu caso real aqui — cena + número]` e a nota "preencha com algo que aconteceu; história inventada destrói confiança quando descoberta". Melhor 3 hooks de história reais que 5 fabricados.

Cada hook: linha própria em blockquote (copiável) + tag `(tipo · ângulo Nº)` no fim.

### Seção 3 — DORES & DESEJOS (a linguagem exata do mercado)

Tabela verbatim, **preservando os marks de evidência** do market-map — é o glossário que impede o operador de traduzir a dor pro "idioma de consultor":

| Como o mercado FALA (verbatim) | Tipo | Dor/desejo por trás | Fonte + mark |
|---|---|---|---|

- Pain words e outcome words copiados de §NICHO/market-map SEM reescrever
- Custo da inação com número âncora + fonte
- Se a linguagem veio fraca ([BRONZE] ou menos), dizer: "linguagem com evidência fraca — as primeiras 10 conversas reais valem mais que este quadro; atualize via /plano-validacao"

### Seção 4 — OBJEÇÕES com resposta pronta

Fontes, nesta ordem de prioridade:
1. **§TRAÇÃO — objeções reais ouvidas** (quando existirem) → entram VERBATIM, marcadas `[OUVIDA — validação]`. São ouro: resposta afiada com garantia/math.
2. **Derivadas da oferta** → preço ("por que custa X" — responder com o math verbatim do §PRICING) · confiança ("por que acreditar" — garantia verbatim + por-que-podemos-garantir da oferta.md §5) · tempo/esforço ("não tenho tempo" — pré-condições do cliente + o que o setup entrega) · "já tentei algo assim" (vilão: por que o jeito antigo falhou não é culpa dele). Marcadas `[DERIVADA — pré-tração]`.
3. `nicho/03-objecoes.md` (legado), se existir e tiver conteúdo real.

Formato por objeção: **a objeção** (como o cliente fala) → **resposta pronta** (2-4 frases na voz do operador, com construct verbatim) → **âncora usada** (garantia/math/mecanismo/gap). Sem §OFERTA: respostas saem sem âncora de garantia/preço + aviso.

### Seção 5 — FRASES DE POSICIONAMENTO (mecanismo™ verbatim)

Só compila se §POSICIONAMENTO existe (senão: seção ausente + convite ao `/posicionar`). Partir do que `nicho/posicionamento.md` JÁ forjou — variar, não re-derivar:

- **Bio (IG/LinkedIn):** 2 variações — [o que instala] pra [perfil] via [mecanismo™] · versão curta pro limite de caracteres
- **Headline:** 2 variações — a do posicionamento.md verbatim + 1 variação de ênfase (dor-primeiro vs outcome-primeiro)
- **Pitch de 1 linha:** 2-3 variações do argumento central — [vilão] → [mecanismo™] → [promise] · versão pra "o que você faz?" em conversa · versão pra assinatura de proposta
- Mecanismo™ SEMPRE verbatim (zero paráfrase, zero tradução). Frame check herdado: se o nome passou no /posicionar, não re-julgar aqui.

### Seção 6 — 20 IDEIAS DE CONTEÚDO (mapeadas, executáveis)

Cada ideia aponta pro executor que a produz — é a ponte banco → produção:

| # | Ideia (título de trabalho) | Ângulo | Formato sugerido | CTA | Executa via |
|---|---|---|---|---|---|
| 1 | [específica do nicho, não "5 dicas de X"] | Nº [1-10] | post IG / post LinkedIn / reels / thread/carta / carrossel | autoridade / aquisição / nutrição | /post ou /carrossel |

- Distribuir: toda ideia rastreia um ângulo da Seção 1 · mix de formatos (nem tudo é reels) · mix de CTA (regra prática: mais autoridade/nutrição que aquisição — quem só pede, cansa `[HEURÍSTICA]`)
- Título de trabalho já carrega o específico (número, pain word, vilão) — "por que [crença do vilão] te custa [número]" e não "a importância de inovar"
- 20 é a meta com fundação completa; com fundação parcial, listar menos e dizer o porquê

## Passo 2 — Craft gates (rodar TODOS antes de salvar)

1. **Teste de substituição POR SEÇÃO:** troque o nicho por outro qualquer. A seção ainda funciona? → tá genérica, REFAZER com pain words verbatim e números do nicho. Rodar seção a seção, não só no todo.
2. **Teste de voz alta (hooks e respostas de objeção):** leia como se fosse o operador num áudio de WhatsApp. Soa como ele ou como IA? Se IA → reescrever. Se OPERADOR vazio → checar só naturalidade.
3. **Ban-list de cacoetes de IA** (refusal automático — reescrever com substituto específico): "desbloqueie" · "eleve seu jogo" · "potencialize" · "alavancar" (fora de contexto financeiro real) · "revolucionário" · "transformador" · "game-changer" · "imperdível" · "não perca" · "num mundo cada vez mais..." · "a verdade que ninguém te conta" (como fórmula) · "segredo" · emoji em cascata (🚀🔥💥) · travessão em excesso na prosa · tríades retóricas artificiais mais de 1× por seção.
4. **Ranço do operador:** grep contra a lista `never_say`/`ranço` do voice DNA — 1 ocorrência = reescrever a frase.
5. **Zero drift de número:** todo número do banco VERBATIM do `_constructs.md`/oferta.md (custo da inação, promise, % em risco, preço no math da objeção). Número sem fonte na fundação = `[SEM EVIDÊNCIA]` ou cortar.
6. **Marks preservados:** Seção 3 mantém [GOLD/SILVER/BRONZE] originais do market-map — compilar não é lavar evidência.
7. **Zero invenção:** nenhum case, quote de cliente ou objeção "ouvida" que não esteja registrada na fundação. Derivado ≠ ouvido — a marcação distingue.
8. **1 CTA por ideia** na Seção 6 — ideia com dois CTAs = nenhum.

## Passo 3 — Gravar o artefato + atualizar STATUS

### 3a. Salvar `ads/banco-mensagens.md`

Organizado pra ABRIR E USAR — cada hook copiável em linha própria, seções navegáveis:

```markdown
---
tipo: banco-mensagens
compilado_em: [AAAA-MM-DD]
versao: 1
fundacao: [Operador ✅ · Mercado ✅ · Posicionamento ✅ · Oferta ⬜ · Tração ⬜]
oferta_base: [slug ou —]
constructs_usados: [hero pain ✓ · vilão ✓ · mecanismo™ ✓ · garantia ✗ · tração ✗]
---

# Banco de Mensagens — [nicho/mecanismo™]

> Seu arsenal de comunicação. Abra antes de escrever QUALQUER coisa —
> post, resposta, bio, DM. Copie o hook, não reinvente. Atualize rodando
> /banco-mensagens de novo depois do /plano-validacao (objeções e
> linguagem REAIS deixam este banco mais afiado).
> [Se fundação incompleta: "⚠️ Compilado com fundação parcial — falta
> [X]. Rode [módulo] e recompile."]

## 1. Ângulos (10) — as teses que você repete sem repetir
## 2. Hooks prontos (20) — copie a linha, cole no rascunho
## 3. Dores & desejos — fale a língua deles (verbatim, com fonte)
## 4. Objeções — resposta pronta ([OUVIDA] vale mais que [DERIVADA])
## 5. Posicionamento — bio, headline, pitch de 1 linha
## 6. Ideias de conteúdo (20) — cada uma executa via /post ou /carrossel
```

(Conteúdo completo das seções conforme Passo 1. Criar a pasta `ads/` se não existir.)

### 3b. Atualizar `_constructs.md` — SÓ a tabela STATUS

Linha `3 — Mensagens | /banco-mensagens` → ✅ instalada + data. **NÃO criar seção nova no `_constructs.md`** — o banco vive no artefato, não no DNA. (O DNA gera o banco; o banco não gera nada de volta.)

### 3c. Modo ATUALIZAR (se `ads/banco-mensagens.md` já existe)

Não recompilar do zero: ler o banco atual + o delta da fundação (§TRAÇÃO nova, constructs alterados) → incorporar objeções/linguagem REAIS ouvidas (promovê-las: [DERIVADA] que se confirmou vira [OUVIDA]) → marcar entradas novas/alteradas com data → `versao: +1` no frontmatter. Hooks que o operador já usa não somem — o banco cresce, não reseta.

## Passo 4 — Handoff (funil interno)

```
═══════════════════════════════════════════════
  ARSENAL COMPILADO: banco de mensagens v[N]
═══════════════════════════════════════════════

OUTPUT
  ✓ ads/banco-mensagens.md ([N] ângulos · [N] hooks · [N] objeções
    respondidas · [N] ideias mapeadas)

FUNDAÇÃO USADA
  ✓ [constructs que entraram verbatim + o que ficou de fora e por quê]

CRAFT GATES
  ✓ Substituição por seção · voz alta · ban-list · zero drift · marks
    preservados · zero invenção

PRÓXIMO PASSO
  Arsenal pronto. Ideias 1-20 executam via /post ou /carrossel.
  Próximo: /plano-validacao — colocar a oferta em movimento.
  (Depois da validação, rode /banco-mensagens de novo: objeção e
  linguagem REAIS de cliente afiam o banco mais que qualquer pesquisa.)
```

## Regras

- Compilador, não pesquisador: ZERO pesquisa nova, zero ferramenta externa. Tudo vem da fundação.
- Constructs propagam VERBATIM — mecanismo™, hero pain, garantia, números. Zero paráfrase, zero drift. Executor consome o DNA, não o edita.
- Nunca inventar case, quote, objeção "ouvida" ou número. Derivado é marcado como derivado.
- Nunca travar por fundação incompleta — degradar com franqueza (banco básico no dia 0) + convite ao módulo dono de cada lacuna.
- Quantidade cede à evidência: metas 10/20/20 só com fundação completa; nunca encher com genérico.
- No máximo 1 pergunta (qual oferta, se houver 2+). O resto é compilação direta.
- Zero exposição de mecânica no artefato: o banco fala com o operador, não sobre "o sistema que o gerou".
- Na Accelera 360, este banco vira calendário, criativos, campanhas e aquisição rodando.
