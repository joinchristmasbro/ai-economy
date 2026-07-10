---
name: novo-cliente
description: >
  Wizard robusto pra adicionar cliente novo. 6 blocos / 23 perguntas / ~28min.
  Cria workspace COMPLETO do cliente: CLAUDE.md específico ≤200 lin + voice DNA
  empírico (3 textos reais + 4 sliders NNG + arquétipo Jung) + ICP via StoryBrand
  + JTBD 4 Forces + positioning Dunford + brand tokens W3C + RACI matrix +
  compliance auto-detect (CFM/CRO/OAB/CRECI/CFC/CVM/LGPD). Use quando rodar
  /novo-cliente, fechar contrato novo, ou disser "novo cliente", "fechei",
  "entrou cliente", "instalar sistema no [empresa]".
---

# /novo-cliente — Instalar sistema operacional no cliente

Cliente = empresa que recebe sistema instalado. **Cada cliente vira workspace dentro do teu workspace** — com `CLAUDE.md` próprio, voice DNA empírico, brand tokens W3C, RACI, compliance customizada por nicho.

**Filosofia (Anthropic + Mailchimp + StoryBrand convergem):**
- Voice é PADRÃO observável, não declaração — pedir 3 textos reais > "qual seu tom"
- Hero é o cliente do cliente, NUNCA a empresa — StoryBrand BrandScript central
- Buying context > demographics — JTBD 4 Forces captura o gatilho real
- CLAUDE.md ≤200 linhas (adherence cai com tamanho — Anthropic explicit)
- Profundidade em arquivos irmãos lidos on-demand, não @imports

**Anti-pattern:** wizard >30min → 70% abandono (ALM Corp 2026). Mantém 28min com blocos opcionais skipáveis.

## Pré-requisitos

- Idealmente: 1 oferta estruturada em `ofertas/`. Se não tem:
```
Sem oferta estruturada o playbook fica genérico. Sugestão: rode /criar-oferta antes (10min).
Continuar mesmo assim? [s/n]
```

## Frameworks consultados (públicos)

| Framework | Fonte | Onde aplicado |
|-----------|-------|---------------|
| 4 Dimensions of Voice | Nielsen Norman Group (2016/2023) | Bloco B — sliders NNG |
| 12 Brand Archetypes | Mark & Pearson "Hero and Outlaw" (2001) | Bloco B — arquétipo Jung |
| StoryBrand BrandScript | Donald Miller (2017) | Bloco C — Hero's Journey |
| JTBD 4 Forces | Bob Moesta / Christensen | Bloco C — Push/Pull/Anxiety/Habit |
| Positioning 5+1 Components | April Dunford "Obviously Awesome" (2019) | Bloco A5 — competitive alternatives |
| W3C Design Tokens | W3C Community Group | Bloco D — brand-tokens.json |
| RACI Matrix | PMI standard | Bloco F — stakeholders.md |
| LGPD + CFM/CFO/OAB/CFC/COFECI/CVM | Lei 13.709 + resoluções | Bloco E — compliance |

---

## Wizard — 6 blocos / 23 perguntas / ~28min

### BLOCO A — Identidade & Posicionamento (5P) — ~5min

**A1) Nome da empresa**
> "Nome da empresa cliente:"

→ Vira slug (lowercase, hífens, sem acento, sem caracteres especiais).

**Validação anti-duplicata (Levenshtein < 3):**
```
Pra cada cliente existente em clientes/*/:
  distance = levenshtein(slug_novo, slug_existente)
  se distance < 3 → flag possível duplicata

Ex: "clinica-silva" vs "clinica-silva-2" (dist=2) → flag
    "joão-dental" vs "joao-dental" (dist=1, normalização acento) → flag

Se flagged:
  ╔══════════════════════════════════════════════╗
  ║ Cliente similar detectado:                   ║
  ║   clientes/[similar]/  (distância: N)        ║
  ║                                               ║
  ║ 1) Criar mesmo assim (clientes diferentes)   ║
  ║ 2) Continuar no existente                    ║
  ║ 3) Adicionar suffix -v2                      ║
  ║ 4) Cancelar                                  ║
  ╚══════════════════════════════════════════════╝
```

**A2) Site + IG + contato**
> "URL site + Instagram + contato principal:
>
> Formato: 'site.com.br · @insta · João Silva — sócio/CEO — WhatsApp +55 11 99999 — após 18h ok'"

**A3) ICP REAL (não teórico)**
> "Quem REALMENTE compra hoje? (não o ICP teórico — quem efetivamente paga)
>
> Ex: 'Pacientes 35-55, classe B, valorizam ortodontia premium e indicam pra família'"

**A4) Oferta + ticket**
> "Qual oferta tua esse cliente comprou (ou vai comprar)?
>
> Ofertas em workspace:
> [listar ofertas/_index.md]
>
> 1) [oferta 1]
> 2) [oferta 2]
> N) Outra (descreva)
>
> Ticket fechado:
> - Setup: R$ ___
> - Recorrência: R$ ___ /mês
> - Modelo: curso · serviço · SaaS · híbrido"

→ Salva slug. Cria link bidirecional em `ofertas/[slug]/_index.md` seção "Onde foi vendida".

**A5) Competitive alternative (Dunford 1º componente)**
> "Se sua oferta sumisse amanhã, o que esse cliente faria? (NÃO 'qual competidor' — o que ele FARIA)
>
> Ex: 'Voltaria a Instagram manual, contrataria estagiário, ou desistiria de prospectar online'"

→ `_contexto/posicionamento.md` campo `competitive_alternatives`.

---

### BLOCO B — Voice DNA Empírico (5P) — ~9min

> Mailchimp pattern: voz é PADRÃO observável derivado de exemplos. Não pedimos descrição — pedimos artefato.

**B1) Cole 2-3 textos REAIS do cliente** ⚠ MAIS CRÍTICO
> "Cole 2-3 textos que o cliente JÁ ESCREVEU (post IG, story, email vencedor, transcrição de áudio).
> 
> ⚠ Quanto mais real, melhor. Não invente.
> Limite: 2000 chars por amostra. Mín 1, ideal 3.
>
> --- AMOSTRA 1 ---
> [paste]
> --- AMOSTRA 2 ---
> [paste]
> --- AMOSTRA 3 ---
> [paste]"

**Truncate gracioso:**
```
Pra cada amostra:
  if len(amostra) > 2000:
    amostra = amostra[:1980] + "[...truncado em 2000 chars]"
    avisar usuário: "Amostra N truncada em 2000 chars. Cole versão mais curta se preferir."
```

→ Sistema extrai automaticamente:
- `signature_phrases` (frases recorrentes)
- `power_words` (vocabulário marcante)
- `avg_sentence_length`
- `aberturas/fechamentos típicos`
- `pontuação preferida` (CAPS, pontos exclamação, hífens, parênteses)

Salva em `marca/voice-dna.json`.

**B2) 4 sliders NNG (1-5)**
> "Onde a marca SOA em cada eixo? (escolhe nº 1-5)
>
> Formal (1) ←→ Casual (5):           ___
> Sério (1) ←→ Divertido (5):          ___
> Respeitoso (1) ←→ Irreverente (5):   ___
> Neutro (1) ←→ Entusiasmado (5):      ___
>
> Ex: clínica premium = 2/2/1/3 (formal, sério, respeitoso, levemente entusiasmado)
>     coach jovem = 4/4/3/5 (casual, divertido, levemente irreverente, super entusiasta)"

→ `voice-dna.json` campo `tone_dimensions: {formal_casual: N, serious_funny: N, respectful_irreverent: N, matter_enthusiastic: N}`.

**B3) Arquétipo Jung (Mark & Pearson)**
> "1 entre os 12 arquétipos descreve melhor a marca:
>
> Sage (autoridade técnica) · Hero (superação) · Outlaw (rebelde) · Magician (transformação)
> Lover (paixão) · Caregiver (cuidado) · Ruler (controle/elite) · Creator (criatividade)
> Innocent (simplicidade) · Explorer (aventura) · Jester (humor) · Everyman (acessível)
>
> Ex: clínica premium = Ruler. Coach pessoal = Hero. Agência criativa = Creator."

→ `marca/voice-guide.md` (humano-legível) + `voice-dna.json` campo `archetype`.

**B4) DO/DON'T pareados com razão**
> "3 coisas que SOAM como ele + 3 que NUNCA dizer (com razão):
>
> SOA COMO ELE:
>   1) ___ (razão: ___)
>   2) ___ (razão: ___)
>   3) ___ (razão: ___)
>
> NUNCA DIZER:
>   1) ___ (razão: ___)
>   2) ___ (razão: ___)
>   3) ___ (razão: ___)
>
> Ex SOA: 'Sem firula' (porque cliente é prático)
>     NUNCA: 'jornada' (porque parece guru)"

→ `voice-dna.json` campos `do_pairs[]` e `dont_pairs[]` (com razão = trigger pra LLM).

**B5) Voz do cliente FINAL (cole 2 DMs/mensagens reais)** ⚠
> "Cole 2 mensagens REAIS de clientes finais que falam com a empresa (DM, WhatsApp, email).
> 
> ⚠ Captura como o CLIENTE DELE escreve — pra LP/copy ressoar com palavras dele.
> Limite: 1500 chars cada. Anonimizar nome se quiser.
>
> --- DM 1 ---
> [paste]
> --- DM 2 ---
> [paste]"

→ `marca/voice-customer.json` — palavras literais do cliente final (combustível pra copy não-genérico).

---

### BLOCO C — Hero's Journey & JTBD (4P) — ~6min

> StoryBrand BrandScript axiom: O HERO é o cliente, NUNCA a empresa. A empresa é o GUIDE.

**C1) Avatar primário em 1 frase**
> "1 cliente real do cliente — em 1 frase com 3-5 atributos concretos.
>
> Ex: 'Ana, 38, dentista, 2 filhos pequenos, fatura R$80K/mês, quer parar de atender pra escalar'"

**C2) Push (JTBD — Bob Moesta)**
> "Que SITUAÇÃO específica fez o último cliente comprar AGORA? (não 'queria X' — o gatilho)
>
> Ex: 'Mãe ficou doente e Ana percebeu que se ela parasse de atender 1 mês, faturamento iria a zero'"

→ Combustível principal pra LP — situação > desejo abstrato.

**C3) Anxiety + Villain (StoryBrand 4-layer problem)**
> "Maior MEDO antes de comprar (Anxiety) + quem ele CULPA pelo problema (Villain):
>
> Anxiety: 'E se eu investir e não der certo de novo?' (maior medo, ideal: literal de cliente)
> Villain: 'mercado saturado / outros gurus mentirosos / si mesmo / falta de tempo'"

→ `_contexto/icp.md` — sem isso, copy fica centrada na empresa, não no cliente. Erro mais caro em marketing (StoryBrand).

**C4) Transformação (Success state)**
> "De X → Y em 1 frase:
>
> ANTES (estado atual frustrado):  ___
> DEPOIS (estado pós-compra):      ___
>
> Ex: 'De atendendo 8h/dia preso na cadeira → faturando R$200K/mês com 2 dias de consultoria estratégica'"

→ `_contexto/icp.md` campo `transformation`. Combustível direto pra hero section da LP.

---

### BLOCO D — Visual & Brand Tokens (3P) — ~3min

**D1) Logo — sequência explícita**
> "Logo do cliente:
>
> P1: Tem logo definido?
>   1) Sim, tenho arquivo (SVG/PNG)
>   2) Sim, tem no site (vou fazer scrape)
>   3) Não tem definido (uso defaults neutros, refinamos depois)"

Se P1=1:
> "P2: Quais variantes você tem?
>   1) Dark + Light (ideal)
>   2) Apenas dark (fundo claro)
>   3) Apenas light (fundo escuro)
>   4) Versão única (qualquer fundo)
>
> P3: Cole path local OU URL do arquivo:"

Se P1=2:
> "P2: URL do site pra scrape: ___"
> → Firecrawl scrape (se MCP instalado). Extrai logo + cores dominantes (OKLCH) + tipografia detectada.

Se P1=3:
> Pula pra D2. Defaults neutros aplicados em `marca/brand-tokens.json`.

**D2) Cores principais**
> "3 cores em HEX (ou OKLCH):
>   - Primária: ___
>   - Secundária: ___
>   - Accent: ___
>
> Não sabe? Posso sugerir baseado no nicho + arquétipo (Bloco B3)."

→ Sistema converte HEX→OKLCH e gera paleta 10-grays variando L mantendo C/H.

**D3) Tipografia**
> "Tipografia (digite 'padrão' se não definido):
>   - Display (títulos): ___ (default: Inter Variable)
>   - Body (texto): ___ (default: Inter Variable)
>   - Mono (código/destaque): ___ (default: Geist Mono)"

→ `marca/brand-tokens.json` em formato W3C 3-camadas (primitive/semantic/component). Importável em Tailwind/CSS-in-JS.

---

### BLOCO E — Compliance Auto-Detect (2P) — ~3min

**E1) Nicho/setor (auto-puxa checklist regulatório)**
> "Nicho do cliente:
>
> 1) Saúde - Médica (CFM Resolução 2.336/2023)
> 2) Saúde - Odontológica (CFO 196/2019 + 271/2025)
> 3) Saúde - Nutrição (CFN — Código de Ética e de Conduta do Nutricionista)
> 4) Saúde - Educação Física / Fitness / Personal (CONFEF — Código de Ética + normas de publicidade)
> 5) Saúde - Outras (psicologia/fisio/etc)
> 6) Advocacia (OAB Provimento 205/2021)
> 7) Contabilidade (CFC Código de Ética)
> 8) Imobiliário (COFECI Resolução 1.065/2007)
> 9) Financeiro (CVM Resolução 20/2021)
> 10) Educação
> 11) E-commerce / Varejo
> 12) Outro: ___"

→ Sistema **auto-puxa checklist regulatório** baseado na escolha:

```
Médica (CFM 2.336/2023):
- ✗ Sensacionalismo, autopromoção, "antes/depois"
- ✗ Atendimento via redes sociais, diagnóstico em comentários
- ✗ Fotos de pacientes identificáveis sem TCLE
- ✓ Disclaimer "consulte seu médico"
- Required: nº CRM por médico, especialidades registradas

Odontológica (CFO 196/2019 + 271/2025):
- ✓ Selfies com paciente (com TCLE)
- ✓ Antes/depois com consentimento explícito
- ✗ Vídeos do procedimento, identificação de equipamentos
- ✗ Telemarketing ativo, promessa de resultado
- Required: TCLE assinado, CRO no rodapé

Nutrição (CFN — Código de Ética e de Conduta do Nutricionista) — herda CALIBRATION-CORE §20:
- ✗ Prometer desfecho/emagrecimento garantido ("perca X kg em Y dias")
- ✗ Antes/depois sensacionalista ou imagem que garanta resultado
- ✗ Prescrição/diagnóstico nutricional por rede social ou comentário
- ✗ Autopromoção sensacionalista, concorrência desleal
- ✓ Conteúdo educativo + disclaimer "resultados variam; procure seu nutricionista"
- Required: nº CRN do nutricionista responsável, publicidade conforme o conselho

Educação Física / Fitness / Personal (CONFEF — Código de Ética + normas de publicidade) — herda CALIBRATION-CORE §20:
- ✗ Prometer resultado garantido de estética/desempenho ("corpo dos sonhos em X dias")
- ✗ Antes/depois enganoso ou promessa de desfecho físico garantido
- ✗ Prescrição de treino/avaliação por rede social sem acompanhamento
- ✗ Autopromoção sensacionalista, depreciação de colegas
- ✓ Conteúdo educativo + disclaimer "resultados variam por indivíduo; acompanhamento profissional necessário"
- Required: nº CREF do profissional responsável, publicidade conforme o conselho

Advocacia (OAB Provimento 205/2021):
- ✓ Conteúdo informativo/educativo, palestras, áreas de atuação
- ✓ Google Ads (sem mercantilização)
- ✗ Ostentação de bens, casos concretos, captação direta
- ✗ Promessa de resultado
- Required: nº OAB, comunicação aprovada por sócio

Contabilidade (CFC Código de Ética):
- ✓ Títulos, especializações, lista de clientes (com autorização)
- ✗ Depreciação de colegas, comparações, promoções
- Required: CRC do contador responsável

Imobiliário (COFECI 1.065/2007):
- Required: nº CRECI ≥25% do tamanho do nome em todo anúncio
- "corretor de imóveis"/"profissional liberal"
- Endereço completo

Financeiro (CVM 20/2021):
- Análise/recomendação só com analista certificado
- Required: certificações (CGA/CNPI/CFA)
- Disclosure de conflito de interesse

LGPD universal (Lei 13.709) — aplica em TODOS:
- Agência opera como OPERADORA — cliente é CONTROLADORA
- Contrato com escopo de tratamento delimitado
- Base legal por finalidade (consentimento renovado pra email mkt)
- Política de retenção
- Registro de consentimento
```

**E2) Restrições internas + claims proibidos**
> "Preencher:
> - Nº de registro: ___ (CRM/CRO/OAB/CFC/CRECI conforme nicho)
> - Claims PROIBIDOS específicos do escritório/clínica: ___
>   Ex: 'nunca dizer cura', 'nunca prometer X% de retorno'
> - TCLE de imagem dos clientes/pacientes? sim/não/parcial
> - Aprovador final de TODO conteúdo público: nome + canal"

→ Cria 2 arquivos:
- `_contexto/compliance.md` (humano-legível)
- `compliance-checklist.json` (triggers automáticos pré-publicação — usado por `/criar-lp`, `/escanear-concorrencia`, etc.)

---

### BLOCO F — Stack, RACI, Histórico (4P) — ~5min

**F1) Stack atual do cliente**
> "Ferramentas que o cliente usa hoje:
> - CRM: ___ (RD Station, GHL, HubSpot, planilha, nada)
> - Comunicação interna: ___ (WhatsApp, Slack, Teams, email)
> - Marketing automation: ___ (RD, GHL, Mailchimp, ActiveCampaign, nada)
> - Financeiro: ___ (Conta Azul, Omie, planilha)
> - Analytics: ___ (GA4, Meta Ads Manager, planilha, nada)
> - Outras: ___"

→ `_contexto/operacao.md`. `03-setup-tecnico.md` é customizado pelo stack.

**F2) Stakeholders (RACI mínimo)**
> "Pessoas envolvidas:
>
> - Decisor final (APROVA): nome + cargo + canal
> - Operador (EXECUTA do lado dele): nome + cargo + canal
> - Influenciadores (dão pitaco): [lista, opcional]
> - Bloqueadores conhecidos (podem dificultar): [lista, opcional]"

→ Cria `stakeholders.md` com matriz RACI estruturada (Responsible/Accountable/Consulted/Informed por categoria de tarefa: copy / ads / financeiro / técnico).

**F3) Cadence + canal por urgência (Claire HJ "Working with me")**
> "Comunicação:
> - Frequência check-in: semanal / quinzenal / mensal / sob-demanda
> - Canal URGENTE: WhatsApp / call / email
> - Canal ROTINA: email / Slack / WhatsApp
> - Canal ESTRATÉGICO: call agendada
> - Horário OK: ___ (ex: 'após 18h só urgência')"

→ `_contexto/relacionamento.md`.

**F4) Meta + 1 tentativa anterior**
> "Meta concreta com prazo:
> - O que o cliente quer ter conquistado em 90 dias? (1 frase com métrica concreta)
>   Ex: '30 leads qualificados/mês' / 'Fechar 5 contratos R$5K' / 'Reduzir CPL de R$80 → R$40'
> - Budget mensal pra investir: R$___
>
> 1 tentativa anterior em marketing que NÃO funcionou:
> - O que tentou: ___
> - Por que ele acha que não funcionou: ___
> - Investiu: R$___"

→ `_contexto/historico.md` campos `meta_90d`, `budget_mensal`, `tentativas_anteriores`.

---

## Geração da pasta `clientes/[slug]/`

```
clientes/[slug]/
├── CLAUDE.md                  ← ≤200 lin (Anthropic spec) — sempre em contexto aqui
├── _index.md                  ← MOC + fase ativa + roadmap 90d
├── _contexto/
│   ├── posicionamento.md      ← A1-A5 (identidade + Dunford competitive alternatives)
│   ├── icp.md                 ← C1-C4 (StoryBrand BrandScript + JTBD 4 Forces)
│   ├── operacao.md            ← F1 stack + KPIs
│   ├── relacionamento.md      ← F3 cadence + canais (Claire HJ)
│   ├── compliance.md          ← E1-E2 (auto-detect por nicho + claims proibidos)
│   └── historico.md           ← F4 meta + budget + tentativas anteriores
├── marca/
│   ├── voice-guide.md         ← humano-legível (NNG sliders + arquétipo + tom-por-contexto)
│   ├── voice-dna.json         ← machine-readable (signature_phrases / never_say / DO-DON'T pairs)
│   ├── voice-customer.json    ← B5 — palavras literais do cliente final
│   ├── brand-tokens.json      ← W3C design tokens (color OKLCH / typo / spacing / motion)
│   └── assets/                ← logo SVG/PNG variants + fontes
├── stakeholders.md            ← F2 RACI matrix + 1 página/stakeholder
├── compliance-checklist.json  ← triggers automáticos pré-publicação
├── 00-perfil.md               ← snapshot resumido (1 página leitura rápida)
├── 01-onboarding.md           ← Fase 1 customizado pelo stack/compliance
├── 02-criacao-oferta.md       ← Fase 2 (oferta-source pré-rascunhada)
├── 03-setup-tecnico.md        ← Fase 3 (lista MCPs/integrações pelo stack)
├── 04-lancamento-roi.md       ← Fase 4 template
├── 05-consolidacao.md         ← Fase 5 template
└── 06-escala.md               ← Fase 6 template
```

### CLAUDE.md específico do cliente (template ≤200 lin)

```markdown
# [Nome Cliente] — Workspace

Workspace dedicado a [Nome Cliente]. Sistema operacional AI-First instalado.

## Contexto base (carga automática quando trabalho aqui)

Toda operação aqui carrega antes:

1. `_contexto/posicionamento.md` — quem é, o que vende, ICP real, competitive alternatives
2. `_contexto/icp.md` — Hero's Journey (StoryBrand) + JTBD (Push/Anxiety/Villain/Transformation)
3. `_contexto/operacao.md` — stack, KPIs
4. `_contexto/relacionamento.md` — cadence, canais por urgência
5. `_contexto/compliance.md` — regulamentações + claims proibidos
6. `_contexto/historico.md` — meta 90d + budget + tentativas anteriores
7. `marca/voice-guide.md` + `voice-dna.json` — voz da marca (4 dim NNG + arquétipo)
8. `marca/voice-customer.json` — palavras literais do cliente final
9. `marca/brand-tokens.json` — design tokens W3C
10. `stakeholders.md` — RACI + perfis
11. `compliance-checklist.json` — triggers pré-publicação

## Identidade

- **Nome:** [Nome Cliente]
- **Site/IG:** [...]
- **Oferta vendida:** [mecanismo único]
- **Ticket:** Setup R$X + R$Y/mês
- **Meta 90d:** [meta concreta]
- **Stage:** [pre-launch / launch / scale / sustain]

## Voz em 1 parágrafo

[Resumo de NNG sliders + arquétipo Jung + 3 DO + 3 DON'T — gerado automaticamente do Bloco B]

## Hero's Journey (StoryBrand)

- **Hero:** [C1 avatar]
- **Push (gatilho):** [C2]
- **Villain:** [C3]
- **Anxiety:** [C3]
- **Transformação:** [C4 — De X → Y]

## Compliance (auto-detect por nicho)

- **Setor:** [E1]
- **Registro:** [nº CRM/CRO/OAB/etc]
- **Aprovador final:** [nome + canal]
- **Claims proibidos:** [lista]

## Princípios operacionais

- Voice DNA é fonte da verdade — nunca inventar tom/palavras
- Compliance check OBRIGATÓRIO antes de publicar (skill consulta `compliance-checklist.json`)
- Hero é o cliente DELE, não a empresa (StoryBrand axiom)
- Aprovação dual pra ticket alto: Decisor + Operador
- KPIs reportados na cadence definida em `relacionamento.md`

## Skills no contexto deste cliente

Quando rodar `/criar-lp`, `/gerar-imagem`, `/criar-oferta`, `/escanear-concorrencia` aqui:
- Consulta `marca/voice-dna.json` antes de QUALQUER copy
- Consulta `marca/voice-customer.json` pra ressoar com cliente final
- Consulta `marca/brand-tokens.json` antes de QUALQUER visual
- Consulta `_contexto/compliance.md` antes de publicar
- Consulta `stakeholders.md` antes de definir fluxo de aprovação

## Fase ativa

[fase atual baseada em status — em-progresso]
```

(Resto fica em arquivos irmãos — Claude lê via Read on-demand. NÃO usar @import aqui pra preservar context window.)

---

## Atualizações cruzadas

- `clientes/_index.md` — adiciona linha do cliente
- `ofertas/[slug-oferta]/_index.md` — adiciona em "Onde foi vendida"
- `_contexto/empresa.md` (workspace global) — atualiza `active_clients_count`
- `_brain/insights/` — se 3+ clientes mesmo nicho/gargalo → sugere insight cross-cliente

## Mensagem final

```
═══════════════════════════════════════════════
  CLIENTE INSTALADO: [Nome]
═══════════════════════════════════════════════

WORKSPACE     clientes/[slug]/
NICHO         [setor] · compliance: [registro]
OFERTA        [mecanismo único]
TICKET        Setup R$X + R$Y/mês
META 90D      [meta concreta com métrica]

CRIADO
  ✓ CLAUDE.md específico (≤200 lin, Anthropic spec)
  ✓ Voice DNA empírico (3 textos + sliders NNG + arquétipo Jung)
  ✓ Voice CLIENTE FINAL (2 DMs reais — combustível pra LP)
  ✓ Hero's Journey (StoryBrand) + JTBD 4 Forces
  ✓ Positioning (Dunford competitive alternatives)
  ✓ Brand tokens W3C (OKLCH 10-gray + typo + spacing)
  ✓ RACI matrix com [N] stakeholders
  ✓ Compliance auto-puxado ([nicho] — [resolução])
  ✓ Roadmap 90d alinhado com meta

PRÓXIMOS PASSOS
  1. /playbook-cliente [slug]   — fase atual + checklist
  2. (semana 1) refinar voice-dna com 1ª entrega real
  3. (semana 2) conectar Google Analytics + Meta Ads → baseline auto

> /playbook-cliente [slug]
```

---

## Comportamentos especiais

### Cliente que comprou múltiplas ofertas
Permitir múltiplas ofertas em A4 (escolha múltipla). Pasta referencia ambas.

### Voice DNA com poucas amostras
Se aluno fornecer apenas 1 amostra (mín):
- Sistema extrai DNA mas marca `confidence: low`
- CLAUDE.md inclui aviso: "Voice DNA baseado em 1 amostra — refinar após 1ª entrega real"
- Skill `/atualizar` lembra de coletar mais textos

### Atualização passiva (FASE 2 — enrichment automático)

Após primeira entrega real:
- `/atualizar` detecta drift no voice-dna comparando output aprovado com baseline
- Pergunta: "Refinar voice baseado em [output X que ficou bom]?"
- Permite recalibração contínua sem repetir wizard

Quando aluno conectar acessos do cliente (GA4, Meta Ads, CRM):
- Sistema gera `baseline.md` automaticamente (últimos 90d performance)
- Não pede ao cliente — descobre via dados

### Cliente sem oferta estruturada (skip mode rápido)
Se aluno apenas QUER cadastrar prospect sem rodar wizard completo:
- Modo rápido (5 perguntas / 5min): A1, A2, A3, A4, F4 (apenas meta)
- Marca cliente como `stage: prospect-incomplete`
- Skill `/atualizar` lembra de completar quando virar fechado

---

## Regras

- Slug normalizado sempre (lowercase, hífen, sem acento, sem caracteres especiais)
- Levenshtein < 3 entre slugs novo e existente → flag possível duplicata (3 opções)
- Frontmatter YAML em TODOS os arquivos criados
- Wiki-links em `_index.md` (Obsidian-friendly)
- CLAUDE.md específico ≤ 200 linhas (Anthropic adherence spec)
- ZERO @imports no CLAUDE.md (preserva context window — Claude lê irmãos via Read on-demand)
- Auto-detect compliance pelo nicho (NÃO perguntar manualmente)
- Voice DNA é semente — sempre refinará com entregas reais
- Brand tokens em formato W3C standard (importável em Tailwind/CSS-in-JS)
- Truncate gracioso de inputs longos (>2000 chars amostra B1, >1500 chars DMs B5)
- Após criar, sempre sugerir `/playbook-cliente [slug]` como próximo passo
