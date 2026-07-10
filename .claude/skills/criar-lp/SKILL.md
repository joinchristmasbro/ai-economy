---
name: criar-lp
description: >
  Gera landing page como ATIVO COMERCIAL PREMIUM (não dossiê interno). Dispatcher de 3
  arquiteturas estratégicas (Diagnóstico/Auditoria · VSL/Treinamento · Oferta Direta/Fechamento)
  escolhida com JUSTIFICATIVA a partir do DNA. Separa copy-publica.md (limpa, vai pra página)
  de copy-notes.md (fontes, prova, compliance, auditoria — nunca vaza). Vende PERDA antes de
  componentes, PT-BR nativo, 3 variações de hero, herda os brand tokens do /marca, renderiza e
  abre preview.html. Output: 5 camadas em landing-pages/[slug]/. Use quando rodar /criar-lp ou
  disser "criar landing", "fazer LP", "preciso de página".
---

# /criar-lp — LP como ativo comercial premium (não dossiê)

Gera LP completa que **nasce vendendo**, não relatando. Cada camada editável independente. Output pronto pra colar em Next.js 15 + Tailwind 4 + shadcn/ui, + um `preview.html` que abre na hora.

**Anti-pattern combatido (o "cara de dossiê"):** notas/selos internos vazando na copy · estrutura feature-first (pilar 1, pilar 2…) · tradução literal de fórmula gringa · hero genérico. Esta skill mata os quatro: **copy pública separada das notas** (§15) · **vende PERDA antes de componentes** (§18) · **PT-BR nativo** (§16) · **hero premium + cadeia operacional + cenas concretas**.

## Pré-requisitos

- Oferta em `ofertas/[slug]/oferta.md` (do /criar-oferta) OU cliente em `clientes/[slug]/`.
- Idealmente: `_constructs.md` (NICHO + POSICIONAMENTO + OFERTA + PRICING), `nicho/market-map.md` (linguagem de compra verbatim), `marca/brand-tokens.json` (do /marca).
- Se faltar, listar o gap e perguntar se continua — degrada gracioso, nunca inventa dado.

## Passo 0 — Carga de contexto + regras

**Regras (CALIBRATION-CORE — obrigatório):** §8 drift de ICP · §12 garantia só no controlável · **§15 copy pública ≠ notas internas** · **§16 PT-BR nativo** · **§17 dispatcher de arquitetura** · **§18 vende PERDA antes de componentes** · **§19 UMA metáfora dominante** · §20 compliance · §23 materializar + abrir · **§25 herança de marca por arquétipo** · **§26 nunca citar nome real de referência** (usar codename/descrição do padrão) · **§27 hero outcome-first + integridade de métrica** · **§28 calibração de métrica de promessa por nicho** · **§29 vender o desfecho desejado + Promise Ladder (nada de defensivo na dobra)** · **§30 voz comercial / desfecho desejado** (H1 curto sem travessão/termo interno, subhead PT-BR natural, garantia positiva, ciclo de 90 dias, lexicon de substituição, preview com visual REAL) · **§31 polimento de copy comercial** (CTA principal vende GANHO, subhead natural 1-ideia, lexicon-2 anti-bastidor, "caminho" anti-muleta, garantia positiva-modelo, footer suave, painel ILUSTRATIVO) · **§32 render QA gate** (bug de render/copy REPROVA o preview: grudado/duplicado/placeholder/debug/markdown-cru/stub).

**Métrica de promessa (§28 — obrigatório se for usar número no H1/garantia):** ler `.claude/rules/outcome-metric-calibration.md` — dá a inteligência de QUAL número faz sentido por nicho (outcome unit + volume suitability + faixa de promessa + 4 tipos de número). §27 impede inventar número; §28 impede copiar número de outro nicho.

**🔴 Copy no-brainer BR (§31 — obrigatório antes de escrever qualquer copy):** ler `.claude/rules/br-copy-potency.md` — armas de copy PT-BR nativas (concreto-vence-abstrato · devices "X vira Y"/"Chega de"/tripla negação/fragmentado · ICP com sinal operacional). **§0 do ativo:** só os DEVICES transferem cross-modelo; a ESTRUTURA de evento/enterprise/marketplace NÃO se importa pro nosso modelo infra-nichada (dispatcher §17 Tipo 1).

**Marca visual — HERANÇA, não improviso (§25 — antes de qualquer token).** Precedência dura:
1. `clientes/[slug]/marca/brand-tokens.json` + `design-guide.md` (LP de cliente) — máxima.
2. `marca/brand-tokens.json` + `design-guide.md` (workspace) — fallback.
3. Gerar do zero — só se nenhum existir (e aí específico ao ARQUÉTIPO do nicho, nunca "tech-premium" default; marca provisório nas NOTAS internas).

Ao ler o `brand-tokens.json`, abrir o bloco `meta`: `market_design_archetype` · `provisional_status` · `rationale` · `anti_references` — governam TODA a estética.

**Conteúdo (fonte da copy):** `_constructs.md` (hero pain + linguagem de compra + mecanismo™ + vilão + pricing — VERBATIM) · `nicho/market-map.md` (pain/outcome words) · `nicho/posicionamento.md` (Old/New Game + fuga de categoria) · `ofertas/[slug]/oferta.md` (PROMISE/MECANISMO™/STACK/PRICING/GARANTIA/PROVA — zero drift de número) · `nicho/concorrencia.md` (THE GAP) · objeções pra FAQ.

## Passo 1 — 🎯 DISPATCHER DE ARQUITETURA (3 tipos) + JUSTIFICATIVA obrigatória

Escolher a arquitetura que VENDE aquela oferta, a partir de 7 sinais do DNA:
**estágio de consciência** · **prova (existe/em validação)** · **canal de tráfego** · **tem VSL?** · **pré-call / pós-call / ativo de diagnóstico** · **ticket + complexidade** · **tipo de oferta** (infraestrutura / consultoria / SaaS / serviço local).

### As 3 arquiteturas

| # | Tipo | Quando | Estrutura (ordem das seções) |
|---|---|---|---|
| **1** | **Diagnóstico / Auditoria Premium** 🔴 DEFAULT infra | high-ticket · infra instalada · IA/growth · consultivo · venda por call · **prova em validação** · problem-aware · pré-call ou pós-conversa | Hero (perda/oportunidade desperdiçada) → **cadeia operacional visual** → métricas/benchmarks (se houver) → convite pra auditoria/diagnóstico → problema em **cenas reais** → **diagnóstico antes da prescrição** → Old Way vs New Way → sistema/metodologia → escopo da entrega → garantia controlável → preço teaser/faixa (se fizer sentido) → FAQ → **CTA pra auditoria** |
| **2** | **VSL / Treinamento** | há vídeo/breakdown/treinamento · tráfego frio · mercado pouco consciente · educar antes da call | Hero (promessa clara) → VSL/vídeo → outcomes/cards → mecanismo em 3 partes → prova (ou prova alternativa) → formulário/aplicação → **thank-you page** → CTA pra call. **Gera 3 artefatos: LP + form/popup ou aplicação + thank-you.** |
| **3** | **Oferta Direta / Fechamento** | prospect já conversou · pediu proposta · etapa de decisão · revisar oferta/preço/escopo/garantia | Atenção pro ICP específico → promessa direta → "isso é pra você se…" → dores operacionais → protocolo/sistema → Old Way vs New Way → entregáveis → garantia → preço → For/Not For → FAQ → CTA de agendamento/fechamento |

(SaaS/Product Page arquivada — não é prioridade.)

**Default duro:** oferta de **infraestrutura high-ticket sem case maduro → Tipo 1 (Diagnóstico/Auditoria Premium).** Não deve parecer agência, SaaS nem template genérico.

**🔴 JUSTIFICATIVA obrigatória (ajuste do Bro):** antes de escrever qualquer copy, retornar um bloco:
```
ARQUITETURA ESCOLHIDA: [Tipo N — nome]
Por quê: [1-2 frases]
Sinais do DNA que levaram aqui: [ticket, prova, consciência, canal, etapa — o que pesou]
Tipo descartado + por quê: [ex: "Tipo 3 descartado — prospect ainda não conversou, é problem-aware, precisa diagnosticar antes de fechar"]
```
Esse bloco vai pro operador E pro `copy-notes.md` (nunca pra copy pública).

## Passo 2 — Contexto (cliente / oferta / workspace)

> "Pra qual contexto? 1) Cliente específico · 2) Oferta do workspace · 3) Marca do workspace"
Define qual `_contexto/` + `marca/` ler.

## Passo 3 — 🦸 HERO OUTCOME-FIRST: 5 variações + escolha justificada (§27)

O HERO vende o **DESFECHO DESEJADO** que o comprador QUER — **Camada 1 do Promise Ladder (§29)**: o que ele realmente compra (mais alunos · matrículas · turmas cheias · pacientes · vendas · deals · agenda previsível), via o mecanismo. NÃO o diagnóstico, NÃO só a métrica intermediária, NÃO um disclaimer. Em oferta comercial/high-ticket, o H1 é **outcome-first** (§27): **ICP + desfecho desejado + cadência + mecanismo/diferencial**, objeção na subheadline.
🔴 **NUNCA frase defensiva na dobra (§29):** "sem prometer faturamento/aluno", "não garantimos", "métricas operacionais não financeiras" — isso vive na seção de garantia / FAQ discreta / notas, JAMAIS no hero/subhead/microprova. Vender o destino ≠ garantir o destino (§12 governa a garantia, não o claim da copy).
A LP vende o destino no hero; a PERDA entra na PRIMEIRA seção PÓS-hero (§18), não no H1.

**🔴 Voz comercial do H1 (§30) — endurece o §27.** O H1 tem que soar como um VENDEDOR do desfecho, não como o OS narrando o próprio mecanismo. Regras duras do H1:
- **Curto · SEM travessão (—) · outcome-first · sem termo interno · SEM "rota" · SEM "instalada e operada" · sem frase que pareça framework.** Mecanismo NÃO entra no H1 (vai na subhead/seções).
- **Padrão vencedor = resultado desejado + ICP + cadência/movimento.** Ex. de FORMATO (nunca copiar literal — é de outro nicho): "Mais alunos para o seu box ou studio, todos os meses." · "Turmas mais cheias e agenda mais previsível para operações fitness maduras." · "Mais avaliações virando matrículas no seu box ou studio."
- **Anti-exemplo (o que a versão anterior fez de errado, NÃO repetir):** *"Mais alunos entrando todo mês no seu box ou studio — com uma máquina de aquisição e reativação instalada e operada."* → longo, travessão, "instalada e operada", mistura resultado + bastidor. Reescrever curto e limpo.

**Gerar 5 opções de H1** (todas do DNA deste nicho — hero pain + linguagem de compra + mecanismo + promessa do `_constructs.md`, NUNCA de exemplo pronto):
1. **Desfecho desejado direto** — o que o comprador QUER (Camada 1 §29: mais alunos/matrículas/pacientes/vendas), específico pro ICP, movido pelo mecanismo.
2. **Resultado com número** — outcome + métrica (SÓ se houver número validado **E calibrado ao nicho** — ver Integridade + Calibração abaixo; senão fica NAS NOTAS como placeholder, não na pública).
3. **"Como [ICP] consegue [resultado] com [mecanismo/diferencial]"** — framing de prova/mecanismo.
4. **Objeção removida** — o resultado + a objeção-chave dissolvida ("sem contratar outro time de marketing", "sem depender só de indicação").
5. **Diagnóstico / perda** — nomeia o gargalo que o ICP reconhece (o estilo antigo).

**🔴 Escolha (§27): a diagnóstica NÃO vence automático.** Só vence se for CLARAMENTE mais forte que a promessa direta. Em **high-ticket**, a vencedora normalmente é **resultado específico + ICP + mecanismo/diferencial** (opção 1/2/3/4). A escolhida → `copy-publica.md`; as outras 4 → `copy-notes.md` (A/B).

**🔴 Integridade de métrica no H1 (§27) — nunca inventar número.** Só usar número específico no H1 se ele existir em UMA destas fontes: (a) garantia definida · (b) benchmark próprio · (c) case real · (d) meta operacional explícita da oferta · (e) input do usuário. Se NÃO houver número validado: **perguntar ao operador o número desejado/garantido**, OU usar promessa SEM número específico. Proibido cravar "12 avaliações/mês" / "25 leads/semana" sem base. Faltando número, a versão quantificada vira **placeholder interno no `copy-notes`** (ex: *"H1 quantificado possível após definir garantia: '12 avaliações qualificadas/mês para boxes e studios'"*) — NUNCA na copy pública.

**🔴 Calibração de métrica por nicho (§28) — o número certo NÃO é o maior.** Passar o §27 (o número EXISTE/é validado) não basta; antes de cravar no H1, rodar o checklist do `.claude/rules/outcome-metric-calibration.md`:
- **(a) atrativo pro nicho?** — cria desejo real no comprador daquele mercado.
- **(b) cabe na capacidade operacional?** — respeita agenda/equipe/turma/território/ciclo de venda do cliente (12/mês pode ser forte em solar e baixo/estranho em odonto geral ou fitness).
- **(c) crível?** — não parece mentira nem promessa grande demais.
- **(d) unidade certa?** — nunca "lead" genérico; usar a unidade de valor do nicho (agendamento qualificado · consulta comparecida · orçamento retomado · avaliação presencial · instalação vendida · matrícula · oportunidade reativada).
- **(e) controlável (§12)?** — o sistema controla a métrica; não depende de fechamento/atendimento/preço do cliente.

**Se qualquer item falhar → H1 outcome-first SEM número** (destino claro pro ICP; a versão quantificada vira faixa interna [D.I.] no `copy-notes`, nunca na pública). Anti-pattern morto: copiar "12 agendamentos/mês" (ou qualquer número bonito) de um nicho pra outro — solar ≠ odonto ≠ fitness ≠ jurídico; cada nicho calibra do zero (unidade + volume + economia).

**H1 não pode ser abstrato (§27):** não deixar o H1 carregado SÓ por palavra genérica (operação · oportunidade · vazamento · rota · sistema · receita escapando) sem dizer o RESULTADO concreto. Essas palavras podem aparecer, mas não sozinhas. Teste anti-genérico: se o H1 puder ser colado em qualquer nicho, refazer com o resultado + ICP deste DNA.

**Subheadline = mecanismo em PT-BR natural + aproximar o evento de conversão do DESFECHO (§29/§30) + objeção removida (NÃO defensiva):** escreve como um consultor BR fala, não como fórmula traduzida. Direções (adaptar ao nicho/maturidade): "Colocamos captação, WhatsApp, avaliações e reativação trabalhando juntos pra gerar mais oportunidades na agenda, recuperar contatos antigos e transformar mais interesse em matrícula." · "Uma estrutura de aquisição e reativação que conecta anúncios, WhatsApp, avaliações e base parada pra manter sua agenda em movimento." · "Mesmo que hoje você dependa de indicação e o WhatsApp só seja respondido no intervalo entre uma aula e outra." 🔴 **Objeção CONCRETA (§31.8):** nomeia a dependência REAL do nicho (recepção · recepcionista · quem tá dando aula · intervalo entre aulas · quem tá no balcão), NUNCA o abstrato "sem dono"/"sem responsável"/"WhatsApp órfão". 🔴 **BANIDO na subhead (§30):** "da atenção até a matrícula" / "levar mais gente certa da atenção à matrícula" (soa traduzido) · "instalada e operada" (termo interno) · travessão·"sem prometer faturamento/aluno"/"não garantimos" (isso é garantia/FAQ, nunca a dobra — §29).

(Ex. de ESTRUTURA — jamais traduzir literal nem reusar, é de outro nicho: *"Helping [ICP] get [X qualified appointments/month]"* → em PT-BR natural: *"Sua agenda dermatológica cheia de pacientes qualificados, todo mês."* / *"Avaliações qualificadas na agenda do seu box, todos os meses — sem depender só de indicação."*)

## Passo 4 — COPY: `copy-publica.md` + `copy-notes.md` (SEPARADOS)

### 4a. `copy-publica.md` — o que vai pra página (limpa, persuasiva)

**Frontmatter mínimo (§15) — zero lógica interna:** o `copy-publica.md` NÃO carrega no frontmatter (nem no corpo) rótulo de **arquitetura / goal / dispatcher / tipo de LP / justificativa**. Frontmatter só com campos neutros de arquivo (ex: `slug`, `oferta`). O rótulo do dispatcher + o goal + a justificativa vivem SÓ no `copy-notes.md`. `copy-publica` = texto público pronto pra virar página; nada de bastidor, nem no corpo, nem no frontmatter.

**Above-the-fold — ordem obrigatória (§27):** (1) eyebrow de categoria · (2) **H1 outcome-first** (o destino, vencedor do Passo 3 — NÃO o diagnóstico) · (3) subheadline com mecanismo + objeção removida · (4) CTA de valor · (5) CTA secundário · (6) microprova ou barra de métricas (só com número validado — §27; sem número validado, microprova qualitativa) · (7) visual do mecanismo. O diagnóstico/perda entra na PRIMEIRA seção PÓS-hero, não no H1.

**Promise Ladder (§29) — a copy pública LIDERA com o desfecho desejado:**
- **Camada 1 (desfecho desejado)** → hero + o fecho da LP vendem o que o comprador QUER (mais alunos/matrículas/pacientes/vendas).
- **Camadas 2-3 (evento de conversão + entregável controlado)** → o mecanismo/o-que-é-instalado explicam o CAMINHO ("atrai → responde → qualifica → agenda → reativa → transforma demanda em [desfecho]").
- **Camada 4 (garantia formal)** → SEÇÃO DE GARANTIA própria, elegante — o que se assina (instalação 30 dias / ciclo 90 dias / evento de conversão SE validado / "ou continuamos otimizando").
- 🔴 **Frase defensiva** ("sem prometer aluno/faturamento", "não garantimos", "métricas operacionais não financeiras") → SÓ na seção de garantia / FAQ discreta / footer / copy-notes. NUNCA no hero/subhead/microprova/dobra.

**🔴 §31 — Voz de OFERTA PREMIUM (a página não pode soar documento do OS):**
- **CTA principal vende GANHO, não perda.** A dobra vende o desfecho positivo. CTA principal = "Construir minha agenda previsível" · "Mapear meu plano de aquisição" · "Ver como encher minha agenda" · "Desenhar minha estrutura de aquisição". O "Ver onde estou perdendo aluno" é **CTA SECUNDÁRIO** ou seção diagnóstica PÓS-hero — nunca o principal.
- **Subhead natural, 1 ideia central + passa no NO-BRAINER (abaixo).** Sem framework, sem tradução literal, sem duas ideias competindo. Direção A (subhead APROVADA — sujeito = SISTEMA, funil conectado, §31.9): *"Um sistema que conecta captação, WhatsApp, avaliações e reativação para transformar interessados em matrículas e trazer oportunidades antigas de volta para a agenda."* Direção B (ICP): *"Para operações fitness que já têm estrutura, equipe e custo fixo, mas ainda dependem demais de indicação, improviso no WhatsApp e follow-up manual."*
- **🔴 TESTE DO NO-BRAINER + UMA ALTURA SÓ (§31.8 — o motor errou aqui 2×).** **(a) primeira leitura, palavra do dono** — é algo que o DONO falaria pro amigo e pega de PRIMEIRA (anúncio não "mídia"; aluno/matrícula não "conversão"; "agenda a avaliação" não "avaliações" solta). 🔴 REPROVA: *"O caminho entre a sua mídia e a sua turma tem pontos onde o aluno escapa."* ✅ *"Todo mês, gente que já clicou no seu anúncio some antes de virar aluno."* **(b) nada de lista flat de deliverables sob SUJEITO DE GENTE.** 🔴 REPROVA: *"Um time só responde por tudo: o anúncio, o WhatsApp, a avaliação, a base…"* ✅ (sistema + transformação): *"Um sistema que conecta captação, WhatsApp, avaliações e reativação para transformar interessados em matrículas."*
- **🔴 SUJEITO DA ENTREGA = SISTEMA, NUNCA "UM TIME" (§31.9 — mecanismo COMPLETO, funil conectado).** Sujeito público = **o sistema · a estrutura · a máquina · o mecanismo · a infraestrutura**. NUNCA "um time"/"nossa equipe"/"pessoas operando"/"agência"/"gestor" (reenquadra como agência = drift §9). Vender o **mecanismo COMPLETO** (atração → qualificação → conversão → reativação, CONECTADO), não a partezinha — a gente cobre o problema inteiro (vs agência-só-tráfego / comercial-só-venda), mesmo quando a dor principal é 1 etapa. 🔴 Errado: *"Um time só responde por tudo…"* · ✅ Certo: *"Um sistema que conecta captação, WhatsApp, avaliações e reativação para transformar interessados em matrículas…"*
- **"caminho" é MULETA — máx 1-2 na página.** "rota" saiu (§30); não deixar "caminho" ocupar o vazio. Alternar: estrutura · sistema · processo · operação · aquisição · agenda · esteira · fluxo · pontos de conversão. Narrativa = **agenda previsível + turmas mais cheias + reativação + menos indicação** (não "caminho" repetido). 🔴 **Sinônimos-disfarce contam junto: "trajeto"/"percurso"/"jornada"/"rota"** — não driblar o grep trocando a palavra; a regra é sobre a ABSTRAÇÃO. Grep no QA §32 deve pegar "trajeto"/"percurso" também.
- **Footer protege sem matar venda:** *"Resultados comerciais dependem da oferta, atendimento, capacidade e experiência de cada operação. Comunicação sem promessa de desfecho físico, clínico ou de saúde. Tratamento de dados conforme a LGPD."* NÃO "as métricas de compromisso são operacionais, não faturamento/matrículas".

**🔴 Lexicon de substituição (§30) — aplicar na copy pública INTEIRA, não só na dobra:**
| Termo interno (banir da copy pública) | Trocar por |
|---|---|
| **rota** (HARD ban — zero na copy pública) | sistema · estrutura · máquina · operação · esteira · infraestrutura · fluxo |
| **instalada e operada** no H1/subhead/dobra | NÃO usar na dobra (pode aparecer **1×** numa seção de mecanismo, com cuidado) |
| **da atenção até a matrícula** | do primeiro contato à avaliação · da avaliação à matrícula · da base parada de volta à agenda |
| **vazamento** (repetido) | oportunidades perdidas · demanda desperdiçada · agenda que não captura · contatos parados |
| **emendas** (repetido) | etapas · pontos do processo · troca de mão (NÃO "passagens" — banido no §31) |
| **founder-led** | implantação acompanhada de perto |
| **done-for-you** | feito e operado por nós |
"vazamento"/"emendas" não é ban de 1 uso — o ban é a REPETIÇÃO (viram tique); varia. "rota" e as traduções gringas = ban seco em qualquer seção pública.

**🔴 Lexicon-2 (§31) — termo de BASTIDOR → público (soma ao §30):**
| Bastidor (banir da pública) | Trocar por |
|---|---|
| **métricas controláveis** | indicadores acordados · indicadores da estrutura |
| **uma responsabilidade pelo caminho inteiro** | um responsável pela estrutura de aquisição · operação conectada do primeiro contato à agenda |
| **passagens** | etapas · pontos do processo |
| **handoff** | troca de responsabilidade (ou remover) |
| **SOPs** | processos documentados · scripts e automações documentadas |
| **máquina rodar afinada** | estrutura funcionando com consistência |
| **máquina entra no ar** | estrutura entra em operação |
Sofisticação operacional OK; documentação interna NÃO.

**🔴 Ciclo de 90 dias como jornada principal (§30).** A promessa de tempo é o CICLO de 90 dias (construção, lançamento, dados, ajuste, otimização), não os 30 dias. A microprova/dobra pode trazer **"Ciclo de implantação e otimização em 90 dias"**; os 30 dias entram só como detalhe ("implantação inicial nos primeiros 30 dias") na seção de garantia. Nunca fazer parecer que o RESULTADO final vem em 30 dias.

Escreve a copy na ordem da arquitetura escolhida, aplicando:
- **Vende PERDA antes de componentes (§18) — mas o HERO é outcome-first (§27).** O H1 vende o DESTINO; a PERDA/diagnóstico começa na PRIMEIRA seção PÓS-hero (não no H1) e vem ANTES de qualquer feature. Nas seções de perda: mostrar onde a receita/agenda/oportunidade ESCAPA, NÃO features. Traduzir componente → consequência: "Pilar 1 — Campanha" → *"o lead certo entra."* · "Motor de Reativação" → *"a base parada volta pra agenda."* · "Painel de Aprendizado" → *"você vê onde a receita trava antes de comprar mais mídia."*
- **Cenas concretas da dor** (não conceitos) — alimentam a seção de problema + o "isso é pra você se". Ex. (fitness maduro): o lead chega no WhatsApp e ninguém responde enquanto a intenção tá quente · a avaliação é marcada mas o no-show não entra numa esteira de recuperação · o aluno some 20 dias e só vira preocupação quando já cancelou · a turma tem 4 quando cabem 8 · o dono compra anúncio novo com a base antiga parada · a equipe responde no intervalo entre aula/recepção/cobrança · o software tem reativação mas ninguém opera.
- **Cadeia operacional visual** cedo (§ ver Passo 6) — ex: Anúncio → Lead → WhatsApp → Qualificação → Avaliação → Reativação.
- **Diagnóstico antes da prescrição** (Tipo 1) — a tese: *"a maioria vende campanha/software/consultoria antes de entender onde a operação perde oportunidade. O primeiro passo é diagnosticar: captação · resposta · qualificação · agendamento · no-show · base parada · reativação · trocas de responsabilidade sem dono."* O diagnóstico é o primeiro passo da OFERTA — mas o CTA PRINCIPAL da dobra vende GANHO (§31); o CTA de diagnóstico/perda é secundário.
- **Old Way vs New Way (obrigatório em infra)** — a fuga de categoria: Old = agência gera lead · software dá ferramenta · consultoria orienta · dono costura tudo · ninguém responde pela operação inteira. New = sistema instalado · aquisição+qualificação+agendamento · camada de reativação · indicadores acordados · feito e operado por nós · preço e garantia claros. Vende "comprar pedaços" vs "instalar uma máquina única".
- **For / Not For (obrigatório em high-ticket)** — FOR: quem tem base/equipe/custo fixo, já vende e quer previsibilidade, aceita processo, responde no SLA, tem verba e maturidade. NOT FOR: quem quer gestor de tráfego barato, sem verba, sem oferta clara, quer terceirizar fechamento, sem agenda/base/time, quer faturamento garantido.
- **Garantia elegante e POSITIVA-first (§12 + §30)** — a seção ABRE com o compromisso positivo: a estrutura que leva a oportunidade até a agenda (captação, resposta, qualificação, avaliação, reativação) · em quanto tempo (**ciclo de 90 dias**; implantação inicial em 30) · o que o sistema controla (avaliações qualificadas agendadas, oportunidades reativadas) · "ou continuamos otimizando". A ressalva do que depende do cliente (fechamento/atendimento/preço/oferta/experiência) vem **DEPOIS, em 1 frase discreta** — nunca abrindo a seção. 🔴 **BANIDO como abertura/headline da garantia (§30):** "não prometemos faturamento" · "sem aluno garantido" · "métricas operacionais, não financeiras". §12 continua valendo (nunca garante faturamento/fechamento/churn zero/retenção total/desfecho clínico/comparecimento total) — mas a VOZ é positiva, a ressalva é discreta e vem por último, não defensiva.
  - **§31 — modelo positivo da garantia (usar como base):** *"O compromisso é com a estrutura que coloca oportunidades certas na agenda. Em 90 dias, sua operação passa por diagnóstico, implantação, lançamento, leitura de dados e otimização da estrutura de aquisição e reativação. Se os combinados forem cumpridos e os indicadores acordados não forem alcançados, seguimos otimizando sem custo adicional até a estrutura atingir o padrão definido no diagnóstico. A venda final continua dependendo da oferta, atendimento e experiência da sua operação."* Use **"indicadores acordados"**, não "métricas controláveis" (lexicon-2 §31).
- **Preço high-ticket (não tabela barata)** — vem DEPOIS de criar valor. Contextualiza: setup = construção/instalação/lançamento da infra · mensalidade = operação/otimização/evolução · verba de mídia separada · capacidade limitada real · faixa por maturidade/escopo. Faixas: R$10-15K piloto/founding · R$20-35K principal · R$45-50K+ escala · recorrência R$3-8K/mês. A copy lê como **investimento em infraestrutura**, não pacote de tráfego.
- **UMA metáfora dominante (§19)** — a LP tem UMA narrativa/metáfora principal; não misturar metáforas de PERDA concorrentes disputando a narrativa (balde + roleta + vazamento + máquina + pipeline). Fitness maduro: preferir "oportunidades escapando" / "operação comprando pedaços" / "base parada" / "receita vazando". **Nome de COMPONENTE/oferta é permitido** ("Motor de Reativação", "Painel de Aprendizado") — é parte do mecanismo/entregável, NÃO uma metáfora de perda concorrente. O ban é sobre metáforas PRINCIPAIS brigando entre si, não sobre nome de entregável. ("Balde furado" só pontual, nunca dominante numa LP premium.)
- **Origem do insight / autoridade sem case** — quando não há case forte, seção curta "Por que vimos isso" (ex: *"depois de operar tráfego no mercado fitness, ficou claro que o problema raramente era o anúncio — o anúncio cria atenção; o que faltava era uma estrutura instalada pra transformar atenção em avaliação e recuperar o que já estava na base."*). Sem parecer guru, sem inventar autoridade, sem depoimento falso.
- **CTA principal vende GANHO (§31)** — *"Construir minha agenda previsível"* / *"Mapear meu plano de aquisição"* / *"Ver como encher minha agenda"* / *"Desenhar minha estrutura de aquisição"*. Os CTAs de PERDA/diagnóstico (*"Ver onde estou perdendo aluno"* / *"Diagnosticar minha agenda"*) são **secundários** ou vivem na seção diagnóstica pós-hero — NUNCA o CTA principal da dobra. "Agendar diagnóstico" = texto secundário.

### 4b. `copy-notes.md` — as notas internas (NUNCA vão pra página)
Fontes · limitações · **prova em validação** (ausência de case maduro) · compliance/disclaimers · claims classificados (mercado / concorrente / estimativa) · riscos · justificativa estratégica · a justificativa do dispatcher (Passo 1) · os 2 heroes descartados (Passo 3) · auditoria.

### 4c. 🔴 Gate de QA da copy pública (antes de finalizar)
Grep no `copy-publica.md` — REJEITA se aparecer: `[GOLD]`/`[SILVER]`/`[BRONZE]`/`[D.I.]`/`[HIPÓTESE]` etc · "prova em validação" como headline · "sem case inventado" · "dado de mercado, não resultado nosso" como título · comentários de auditoria · raciocínio interno do OS · notas de prompt · **rótulo de dispatcher/arquitetura/goal/tipo no frontmatter ou corpo** (§15). **🔴 E no HERO/SUBHEAD/MICROPROVA (dobra):** REJEITA frase defensiva (§29) — "sem prometer faturamento/aluno", "não prometemos", "não garantimos", "métricas operacionais não financeiras", "resultado clínico não garantido". Se achar na dobra → mover pra seção de garantia/FAQ/notas. Se o hero vender só a métrica intermediária (Camada 2) em vez do desfecho desejado (Camada 1) → reescrever pra vender o que o comprador quer (§29). Se achar qualquer um → corrigir antes de finalizar.

**🔴 Gate de VOZ COMERCIAL (§30) — grep adicional antes de finalizar:**
- **H1:** grep travessão (`—`) no H1 → REJEITA. Grep "rota" / "instalada e operada" no H1 → REJEITA. H1 longo/com mecanismo demais → reescrever curto (resultado desejado + ICP + cadência).
- **Copy inteira:** grep **"rota"** em `copy-publica.md` → REJEITA (hard ban §30, trocar por sistema/estrutura/esteira/fluxo). Grep "da atenção até a matrícula" / "da atenção à matrícula" → REJEITA (trocar por PT-BR natural). Grep "founder-led" / "done-for-you" → REJEITA. "vazamento"/"emendas" repetidos (>2×) → variar.
- **Dobra:** "instalada e operada" no hero/subhead/microprova → REJEITA. Placeholder visual textual ("[ visual:…", "diagrama…" como texto) no `preview.html` → REJEITA (renderizar painel real).
- **Ciclo de 90 dias:** confirmar que aparece (dobra OU garantia). Se só "30 dias" e nada de 90 → adicionar o ciclo.
- **Garantia:** a seção ABRE positiva? Se abrir com "não prometemos/sem garantir" → mover a ressalva pra depois, em 1 frase discreta.

**🔴 Gate de POLIMENTO + RENDER QA (§31/§32) — antes de entregar:**
- **CTA principal vende GANHO:** grep os CTAs da dobra. Se o CTA PRINCIPAL for de PERDA ("ver onde você perde", "vazando", "perdendo alunos") → REJEITA e troca por CTA de GANHO (§31); a perda vira secundário/pós-hero.
- **Lexicon-2:** grep "métricas controláveis" · "SOPs" · "passagens" · "handoff" · "máquina rodar afinada" · "máquina entra no ar" · "responsabilidade pelo caminho inteiro" → REJEITA (trocar pelo público, §31).
- **"caminho" muleta:** contar "caminho" na copy pública. **>2 → reescrever** alternando (estrutura/sistema/processo/operação/agenda/fluxo).
- **Garantia/footer:** garantia abre positiva (modelo §31)? Footer = modelo suave (§31.6), NÃO "as métricas de compromisso são operacionais, não faturamento"?
- **Painel ILUSTRATIVO (§31.7):** se o preview usa número no painel, tem marca discreta ("exemplo de operação"/"painel ilustrativo") OU usa estados sem número? Senão → REJEITA (parece dado real inventado).
- **🔴 RENDER QA (§32) — grep no `preview.html` + leitura visual, REPROVA se achar:** palavra grudada / label colado (ex "o centroPrincipal", texto sem espaço entre spans adjacentes) · bloco duplicado em sequência (fora de marquee) · placeholder ("[ visual"/"lorem"/"TODO"/"xxx") · string de debug (`{{`/`${`/`undefined`/`NaN`/`console.`/`[object`) · markdown cru renderizando (`**`/`##`/`|---|`) · visual stub. **Marquee-loop duplicado = exceção COM `aria-hidden="true"` na cópia.** Achou bug → **mostra o gap CRU** (não remenda à mão sem avisar — §1).

### Prova em validação com elegância (§14)
Sem case real do ICP: não inventar depoimento/logo, não usar case de ICP antigo como prova principal, não escrever "sem case inventado" na página. **Publicamente:** garantia operacional · transparência · escopo controlável · origem do insight · dados de mercado bem contextualizados · processo de diagnóstico · critérios de aderência · capacidade limitada real. **Interno (copy-notes):** prova em validação + o que é claim de mercado/concorrente/estimativa.

## Passo 5 — Camada 2: `design-tokens.json` (herança §25)

Tokens EXISTEM → copiar OKLCH EXATO (zero drift, não regenerar). AUSENTES → gerar específico ao arquétipo do nicho + marcar provisório nas notas. Estrutura W3C 3-camadas (primitive→semantic→component): OKLCH palette, variable fonts, fluid type clamp(), spacing 8px, easing premium, shadow/radius/motion.

## Passo 6 — Camada 3 (`sections.md`) + cadeia operacional + Camada 4 (componentes)

**`sections.md`** — anatomia da arquitetura escolhida: hierarquia visual (peso por seção), animation hint (scroll-driven CSS), componentes esperados, A11y notes. **Descrever padrões visuais por descrição, NUNCA citar nome real de referência (§26).**

**Cadeia operacional visual** — pra infra, gerar uma faixa (aparece cedo): `Anúncio → Lead → WhatsApp → Qualificação → Avaliação → Reativação` (ou `Interesse → Conversa → Avaliação agendada → Base reativada` · `Captação → Agendamento → Reativação → Medição`).

**Camada 4** — componentes `.tsx` standalone (Next.js 15 + Motion), preenchidos com a copy literal de `copy-publica.md`. Princípios: `prefers-reduced-motion`, semantic HTML, focus-visible custom, imagens lazy + AVIF→WebP→JPEG, variable fonts `font-display: swap`, `content-visibility: auto` below-the-fold, scroll-driven CSS nativo > libs.

## Passo 7 — Camada 5: `preview.html` (renderiza SÓ a copy pública · §23)

Renderizar `preview.html` — HTML single-file autossuficiente, CSS inline derivado do `design-tokens.json` (OKLCH → variáveis), **preenchido EXCLUSIVAMENTE com `copy-publica.md`** na ordem do `sections.md` (NUNCA com `copy-notes.md`). Abrir: `open` (macOS) / `xdg-open` (Linux) / `start` (Windows); se falhar, dar o path absoluto — mas SEMPRE renderizar.

**🔴 Visual REAL, nunca placeholder (§30/§23).** O hero-visual e qualquer visual de mecanismo são **desenhados de verdade em HTML/CSS** — nunca "[ visual: diagrama… ]" textual. Pro arquétipo Command Center / Performance Operations: um **painel real** (grid de cards conectados: agenda da semana · fila de WhatsApp · avaliações marcadas · no-show · base parada · reativação · matrículas), com números de exemplo plausíveis do estado da operação e o caminho da oportunidade desenhado como linhas/nós. Herda os tokens do `design-tokens.json` (cores de status: agenda/dados/recuperação). Se o visual ficar como texto entre colchetes = REJEITA e desenha.

**🔴 PREMIUM RENDER STANDARD (§31/§32 · design aprovado 2026-07-10) — o preview parece OFERTA premium, não wireframe:**
- **Tipografia REAL** — embutir a fonte como `@font-face` data-URI (woff2 base64; ex: display Sora + corpo Manrope, ou par condizente com o arquétipo). NUNCA depender só de `font-family` com fallback system-ui — é o que deixa a página "crua/sem vida". Escala fluida `clamp()`, eyebrows mono tracejadas, H2 grandes.
- **Movimento deliberado** — stagger de entrada no herói · reveal on-scroll (IntersectionObserver) · pulse "ao vivo" no painel · hover/glow nos CTAs · marquee de verdades operacionais. Tudo dentro de `@media (prefers-reduced-motion: reduce)`.
- **Profundidade** — glow do acento, sombras em camada, CTAs pill, cards com borda sutil, ritmo vertical generoso.
- **Painel ILUSTRATIVO (§31.7)** — o command-center é real em HTML/CSS, mas os números levam marca discreta **"exemplo de operação"** (ou estados sem número). Nunca parecer dado real sem fonte.
- **Passa o §32 RENDER QA** antes de entregar (zero grudado/duplicado/placeholder/debug/markdown-cru/stub; marquee com `aria-hidden` na cópia).

## Passo 8 — Output + STATUS

```
landing-pages/[slug]/
├── copy-publica.md      ← a copy da página (limpa)
├── copy-notes.md        ← notas internas (fontes/prova/compliance/heroes descartados/dispatcher)
├── design-tokens.json   ← herdado do /marca (zero drift)
├── sections.md          ← anatomia + cadeia operacional
├── components/          ← .tsx Next.js + shadcn/ui (+ form + thank-you se Tipo 2)
├── README.md            ← implementação
└── preview.html         ← renderizado da copy-publica + ABERTO no navegador
```

```
═══════════════════════════════════════════════
  LP CRIADA: [Tipo N — arquitetura] · [slug]
═══════════════════════════════════════════════
DISPATCHER  [Tipo escolhido] · descartado: [Tipo X — motivo]
HERO        [variação escolhida: direto/diagnóstico/premium] (+2 alternativas em copy-notes)
OUTPUT      ✓ copy-publica.md ✓ copy-notes.md ✓ design-tokens.json (herdado) ✓ sections.md
            ✓ components/ ✓ preview.html → ABERTO ✅
GATE        ✓ copy-publica sem selos/auditoria/raciocínio interno (§15)
            ✓ vende PERDA antes de componentes (§18) · 1 metáfora dominante (§19)
            ✓ PT-BR nativo (§16) · zero nome real de referência (§26)
            ✓ voz comercial (§30): H1 curto sem travessão/rota/instalada-e-operada · subhead PT-BR natural
            ✓ zero "rota" na copy · ciclo 90 dias presente · garantia positiva · preview com visual REAL
            ✓ polimento (§31): CTA principal vende GANHO · zero termo bastidor (lexicon-2) · "caminho" ≤2 · footer suave · painel ILUSTRATIVO
            ✓ render QA (§32): preview sem grudado/duplicado/placeholder/debug/markdown-cru/stub · fonte real embutida
COMPLIANCE  ✓ disclaimers só nas notas internas (§20/§15)
PRÓXIMO     1. Confere a preview.html  2. README pra produção  3. /plano-validacao
```
Atualizar `_constructs.md` STATUS: `3 — Growth Assets | /criar-lp` → ✅ (só a própria linha).

## Regras

- **Dispatcher 3 tipos ANTES da copy + JUSTIFICATIVA (§17)** — infra high-ticket sem case = Tipo 1. Nunca institucional-dossiê por default.
- **copy-publica ≠ copy-notes (§15)** — selos/auditoria/raciocínio jamais na pública; gate de grep antes de finalizar; `preview.html` renderiza só da pública.
- **3 heroes → escolhe 1 com justificativa** (2 descartados vão pra copy-notes).
- **Vende PERDA antes de componentes (§18)** · **1 metáfora dominante (§19)** · **PT-BR nativo, zero fórmula gringa traduzida (§16)**.
- **Voz comercial / desfecho desejado (§30)** — H1 curto, sem travessão, sem termo interno (rota/instalada e operada); subhead PT-BR natural (sem "da atenção até a matrícula"); lexicon de substituição aplicado na copy inteira (zero "rota"); ciclo de 90 dias como jornada; garantia positiva não-defensiva; `preview.html` com painel REAL, nunca placeholder textual.
- **Polimento de copy comercial (§31)** — CTA principal vende GANHO (perda = secundário/pós-hero); subhead natural 1-ideia; Lexicon-2 anti-bastidor (métricas controláveis→indicadores acordados · SOPs→processos documentados · passagens→etapas · handoff→troca de responsabilidade · "máquina no ar/afinada"→"estrutura em operação/com consistência"); "caminho" ≤1-2 (anti-muleta); garantia positiva-modelo + fronteira 1 frase; footer suave-modelo; painel ILUSTRATIVO ("exemplo de operação"/qualitativo).
- **Render QA gate (§32)** — o `preview.html` REPROVA com bug: palavra grudada/label colado · bloco duplicado (fora de marquee) · placeholder · string de debug · markdown cru · visual stub. Premium render standard: fonte real embutida (data-URI), movimento, profundidade. Achou bug → mostra o gap CRU (não remenda à mão — §1).
- **Herda os brand tokens do /marca (§25)** — zero drift; sem marca = específico ao arquétipo + provisório nas notas.
- **§26 — nenhum nome real de referência** em copy, sections, README ou qualquer output; usar codename/descrição do padrão.
- Compliance (§20) só nas notas internas · garantia controlável (§12) · A11y baked · variable fonts · OKLCH > HEX.
