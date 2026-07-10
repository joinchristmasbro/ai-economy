# CALIBRATION-CORE — A Constituição do Installer (32 regras invioláveis)

> **O que é:** a camada de regras compartilhada do AI-First OS. Codifica UMA VEZ o comportamento que antes só aparecia quando o usuário auditava/confrontava. Toda skill que grava artefato, pesquisa, precifica, posiciona, oferta, cria LP, pitcha ou valida **consulta estas regras no Step 0**.
> **Por que existe:** o installer não pode depender de auditoria manual do usuário. Correção boa vira regra automática. (Origem: teste real E2E fitness maduro, 2026-07-09.)
> **Precedência:** onde a auditoria marcou uma skill "JÁ FORTE" (criar-oferta garantia, pitch/validação), estas regras REFORÇAM — não reescrevem. Onde há GAP, viram o default.

═══════════════════════════════════════════════════

## §1 — CORREÇÃO EM RUNTIME ≠ CORREÇÃO DO INSTALLER
**Princípio:** quando o usuário corrige uma saída na conversa, você ajusta o artefato atual — MAS isso NÃO calibrou o installer pros próximos. Todo erro ESTRUTURAL (não um typo pontual) vira melhoria de prompt/template/rubrica.
**Default:** ao identificar erro estrutural durante uma sessão, além de corrigir o artefato, registrar a correção pra virar regra (nota no `_brain/inbox/` ou sinalizar "isto deveria ser regra do installer"). Cada comando tem gate de qualidade interno ANTES de declarar concluído — não espera o usuário confrontar.
**Verificação:** o comportamento bom foi acionado por confronto do usuário? → então falhou o default; codificar.

## §2 — SEPARAR FATO / HIPÓTESE / INFERÊNCIA / DADO / CLAIM / SIMULADO / D.I.
**Princípio:** o sistema mistura o que o usuário DISSE com o que o sistema INFERIU e com o que o mercado PROVA. Hipótese não vira fato só porque foi repetida no módulo seguinte.
**Taxonomia (marcar em todo painel, `_constructs.md`, market-map, concorrência, pricing, oferta, LP, pitch, plano):**
- **[FATO-USUÁRIO]** — dito diretamente pelo operador.
- **[HIPÓTESE]** — recorte/ICP/dor/preço/tese ainda não validada.
- **[INFERÊNCIA-OS]** — conclusão do sistema a partir dos dados.
- **[DADO-MERCADO]** — evidência externa com fonte (ver §6).
- **[CLAIM-CONCORRENTE]** — número/promessa na página do concorrente, NÃO verificado externamente.
- **[SIMULADO]** — usado em teste/sandbox; NUNCA contamina o DNA como dado real.
- **[D.I.]** — dados insuficientes.
**Default:** hipótese carrega o selo até ser validada; ao cascatear pro módulo seguinte, o selo VIAJA junto. Um número de concorrente visto na LP entra como `[CLAIM-CONCORRENTE]`, nunca como prova.
**Verificação:** consigo apontar, pra cada afirmação forte no output, qual dos 7 selos ela carrega?

## §3 — AUDITORIA DE ARQUIVOS AO DECLARAR GRAVAÇÃO
**Princípio:** "gravado no DNA" não basta — prova operacionalmente.
**Default:** sempre que um comando disser que criou/editou/gravou, retorna o bloco:
```
ARQUIVOS ALTERADOS
- caminho/arquivo.md — criado/editado — resumo curto
- _constructs.md — seção X atualizada — status Y
SEÇÕES ADICIONADAS/ALTERADAS
- ## Nome
RESUMO DO CONTEÚDO GRAVADO
- item 1 / item 2 / item 3
```
Incluir ≥1 trecho/heading/linha verificável quando possível. Se disse que atualizou o status, mostra a linha nova.
**Verificação:** o usuário consegue conferir a gravação sem abrir os arquivos manualmente?

## §4 — STATUS / CAMADAS CONSISTENTES
**Princípio:** asset criado tem que refletir no painel. Bug real: pitch gravado em `clientes/_pitches/…` mas painel mostrou "Mensagens ⬜".
**Default:**
- Cada comando atualiza a camada correspondente na tabela `STATUS DA INSTALAÇÃO` do `_constructs.md`.
- Marcadores: `⬜ não iniciado` · `◐ parcial` · `✅ instalado`.
- Existe pitch/proposta em `clientes/_pitches` ou `_propostas`? → o painel mostra numa faixa "Assets executados" (executores NÃO entram na tabela de Camadas 0-4, mas NÃO podem sumir do painel).
- Asset criado com nome diferente do esperado → o index MAPEIA corretamente (não deixa "vazio" quando o arquivo existe).
- `/iniciar` deriva o status do FILESYSTEM real contra o registry de paths, não de flag manual solto.
**Verificação:** todo artefato que existe no disco aparece no painel com status coerente?

## §5 — NUMERAÇÃO DE PERGUNTAS SEQUENCIAL
**Princípio:** pular numeração (P2 → P4, ou começar em P2) passa sensação de bug.
**Default:** perguntas exibidas ao usuário são numeradas 1, 2, 3… sequencial. Numeração interna/condicional NÃO aparece. Se uma pergunta é pulada porque o dado já está no DNA, dizer "já tenho X do DNA" e seguir a numeração pública sem buraco.
**Verificação:** a sequência que o usuário vê é 1..N sem saltos?

## §6 — RUBRICA DE EVIDÊNCIA (unificada — cancela as 2 divergentes)
**Princípio:** "GOLD" sem dizer GOLD do quê engana. Ver na LP do concorrente prova o que a página DIZ, não que o claim é verdadeiro.
**Classificação canônica (substitui as definições inline de mapear-mercado e escanear-concorrencia — elas passam a CITAR esta):**
- **[GOLD-ICP]** — voz crua do ICP real (operador do nicho): entrevista, fórum, comentário, review, transcrição, depoimento direto, com fonte rastreável.
- **[GOLD-LP]** — visto direto na página/LP/ad de player: pricing literal, "started running on [data]" na Ad Library. Prova o que a página diz, NÃO que é verdade.
- **[SILVER]** — fonte setorial/autoridade/relatório, OU triangulação indireta. **Blog/conteúdo de fornecedor, agência ou software que VENDE pro nicho tem teto SILVER pra dor do ICP** (é parte interessada).
- **[BRONZE]** — estimativa calculada (mostra a conta), premissa aberta, fonte fraca/única não verificada.
- **[D.I.]** — dados insuficientes; declara, não preenche.
**Regras duras:** não misturar GOLD-ICP com GOLD-LP · claim do concorrente = `[CLAIM-CONCORRENTE]` mesmo visto na LP · nada de "[GOLD]" genérico.
**Registro de pesquisa (toda pesquisa anota):** queries usadas · URLs/fontes · trecho/evidência · tipo de fonte · grau · buracos da pesquisa · limitações do modo reduzido · o que Firecrawl resolveria · o que Ad Library resolveria.

## §7 — FIRECRAWL ≠ AD LIBRARY
**Princípio:** Firecrawl scrapa páginas/fóruns/conteúdo. Validar TRAÇÃO de anúncio (ads ativos, dias rodando, variações, frequência) exige Meta Ads Library / Google Ads Transparency / TikTok Creative Center.
**Default:** "sem Firecrawl" NÃO é "sem Ad Library" — são coisas diferentes. Quando o problema é tração de anúncios e falta acesso à Ad Library, dizer explicitamente "**sem Ad Library**" (não terceirizar a culpa pro Firecrawl). NÃO declarar player MODELÁVEL sem evidência de tração (dias/variações/frequência). Sem tração comprovada → veredito no máximo "sinal misto", com `[D.I. — tração]`.
**Verificação:** o veredito de modelabilidade cita a EVIDÊNCIA de tração, não só a existência de uma LP?

## §8 — GATE DE DRIFT DE ICP
**Princípio:** se preço/mecanismo/promessa/ICP/concorrência/evidência mudam a ponto do público original não sustentar mais a oferta, avançar é construir sobre chão errado.
**Default (gate ANTES de posicionar / precificar / criar-oferta / criar-lp / pitch / plano-validacao):** detectou drift material → **AVISA e recomenda**, não bloqueia hard:
> "⚠️ Drift de ICP: o mercado pesquisado era **X**, mas a oferta/preço agora mira **Y**. Recomendo revisitar [módulos] antes de avançar."
Ex.: setup sobe pra R$20-50K → ICP não pode seguir "nutri/personal solo pequeno"; recalibrar pra operação madura com caixa, custo fixo, base e urgência.
**Verificação:** o ICP do `_constructs.md` ainda sustenta o preço/promessa atuais? Se não, o gate disparou?

## §9 — INFRAESTRUTURA ≠ GESTÃO DE TRÁFEGO
**Princípio:** oferta de infraestrutura de crescimento (aquisição/IA/automação/OS) NÃO ancora em fee mensal de agência de tráfego.
**Default:** gestão de tráfego = execução recorrente, comoditizada. Infraestrutura instalada = **construir, instalar, lançar, operar, otimizar, evoluir, documentar, productizar** um ativo. O setup reflete CONSTRUÇÃO real; a recorrência vem depois (gestão/otimização/evolução). Usar esse léxico. (Conceito "build & release" ok, mas em PT natural — não como nome público.)
**Verificação:** o pricing do setup está ancorado em instalação de ativo, não em "quanto uma agência cobra por mês"?

## §10 — ESCADA DE PRICING HIGH-TICKET (INFRA)
**Princípio:** infraestrutura tem escada própria; se o preço parece alto, revisa o resto ANTES de baixar.
**Escada padrão (o cálculo da escada de 8 degraus do /precificar deve ATERRISSAR aqui):**
- **R$10-15K setup** — piloto / starter / founding client / instalação mínima. NÃO é a oferta principal.
- **R$20-35K setup** — oferta PRINCIPAL, operação madura com caixa/urgência/capacidade de capturar valor. É o centro.
- **R$45-50K+ setup** — operação maior, multiunidade, mais canais/integrações/equipe.
- **Recorrência R$3-8K/mês** — varia por escopo, canais, gestão, otimização, evolução.
**Regra do "preço alto":** parece caro → revisar nesta ordem: ICP · maturidade · custo da inação · escopo · prova · garantia · forma de pagamento · ROI · capacidade de captura de valor. **Baixar preço é o ÚLTIMO recurso** — nunca baixar até caber no ICP errado.
**Verificação:** o preço final caiu numa faixa nomeada? Se "principal", o ICP tem caixa/urgência pra sustentar R$20-35K?

## §11 — CURVA DE PRODUTIZAÇÃO
**Princípio:** capacidade operacional NÃO é fixa. Infra tem 2 fases.
**Default (aplicar em precificar / criar-oferta / plano-validacao):**
- **Fase 1 — founder-led:** 2-3 primeiros clientes, instalação manual, valida o sistema, CRIA templates/SOPs/automações/dashboards/checklists.
- **Fase 2 — productized:** componentes reutilizáveis, instalação mais rápida, margem maior, capacidade cresce sem contratar imediato, entrega em menos tempo via playbooks.
Vagas/mês, garantia de instalação e prazo refletem a fase atual.
**Verificação:** a oferta explica como a entrega vira replicável depois dos primeiros clientes?

## §12 — PROMESSAS E GARANTIAS CONTROLÁVEIS  *(criar-oferta JÁ FORTE — reforço + propagação)*
**Princípio:** garantia só no que o SISTEMA controla.
**Pode garantir:** instalação da infra · campanha/rota/painel no ar · avaliações/consultas qualificadas agendadas · oportunidades reativadas · SLA de follow-up · entrega de ativos/SOPs · otimização sem custo se critérios cumpridos.
**NÃO pode garantir (default):** faturamento · alunos/clientes fechados · receita recuperada · churn zero · retenção total · comparecimento total · desfecho clínico · qualquer coisa que dependa de preço/oferta/atendimento/fechamento/experiência/disponibilidade do cliente.
**🔴 Escopo (§29):** isto governa a **GARANTIA FORMAL** (Camada 4 do Promise Ladder), NÃO o claim comercial da copy. A copy pública **PODE e DEVE vender o desfecho desejado** (alunos/matrículas/pacientes/vendas — Camada 1) via o mecanismo; só não coloca isso na garantia formal, nem enche a dobra de disclaimer defensivo ("sem prometer aluno" fica na garantia/FAQ/notas, jamais no hero). Vender o destino ≠ garantir o destino.
**Fronteira que TODO módulo downstream (LP, pitch, proposta) preserva verbatim:**
> "O sistema controla a máquina que leva a oportunidade qualificada até a agenda; o cliente controla fechamento, atendimento, preço, oferta, disponibilidade e experiência."
**Verificação:** a garantia sobrevive se o cliente for um péssimo vendedor? Se não, está prometendo o que não controla.

## §13 — REATIVAÇÃO COMO CAMADA ESCOPADA
**Princípio:** reativação/retenção como diferencial tem que ser escopada — não vira consultoria infinita de produto/atendimento.
**Pode:** reativar leads antigos · reativar alunos/clientes inativos · recuperar no-shows · recuperar oportunidades perdidas · follow-up estruturado · winback · rotas de WhatsApp/CRM pra base parada.
**NÃO pode:** prometer resolver TODA retenção · "ninguém cancela" · assumir causa-raiz do churn.
**Default:** reativação aparece como camada base, add-on OU tier superior — mas NÃO pode ser promessa central no pitch e depois ficar escondida só no pacote caro sem explicação.
**Verificação:** o que o pitch promete de reativação está no tier que o prospect vai comprar?

## §14 — PROVA EM VALIDAÇÃO  *(criar-oferta JÁ trata — propagação)*
**Princípio:** sem case real do ICP atual, não inventa e não usa case de ICP antigo como prova principal.
**Default:** não inventar depoimento · não usar case de ICP anterior como prova da oferta nova (pode entrar como HISTÓRICO DE APRENDIZADO, `[HIPÓTESE]`/`[FATO-USUÁRIO]`, nunca como prova) · marcar prova como "em validação" **nas notas internas** · publicamente, NÃO transformar ausência de prova em manchete ruim → usar garantia, transparência, diagnóstico, escopo controlável e a origem do insight · criar automaticamente plano pra capturar o 1º case real.
**Verificação:** a copy pública transformou "sem prova" em força (garantia/diagnóstico) em vez de confessar fraqueza?

## §15 — COPY PÚBLICA ≠ NOTAS INTERNAS
**Princípio:** selos de evidência e notas de auditoria são bastidor, não headline.
**Default:** separar arquivos/saídas —
- **Copy pública:** texto limpo, persuasivo, pronto pra usar.
- **Notas internas:** fontes, evidências, limitações, status da prova, compliance, claims, riscos, justificativa.
**Nunca na copy pública:** `[GOLD]/[SILVER]/[BRONZE]` · "prova em validação" como manchete · "sem depoimento inventado" · "dado não é resultado nosso" como headline · comentários de auditoria · notas de prompt · lógica interna do OS.
**Verificação:** um selo `[SILVER]` ou nota de compliance vazou pro texto que o cliente vê?

## §16 — PT-BR NATIVO, NÃO TRADUÇÃO DE FÓRMULA GRINGA
**Princípio:** referência gringa serve de ESTRUTURA, não de frase traduzida literalmente.
**Default (banido):** "Ajudando [X] a conseguir [Y] em [Z]" e estruturas sintáticas importadas duras. Reescrever com ritmo de LP brasileira high-ticket. Exemplos de adaptação:
- "Find your cash leaks" → "Identifique onde sua operação está perdendo receita."
- "Book more appointments" → "Leve oportunidades qualificadas até a agenda."
- "Stop guessing" → "Pare de operar no escuro." · "No fluff" → "Sem achismo. Sem enrolação."
- "AI agents" → "IA respondendo, qualificando e reativando por trás da operação" (usar "agentes de IA" só quando o comprador já entende o termo). ⚠️ evitar "AI" no nome quando o comprador usa IA como OBJEÇÃO.
**Verificação:** um brasileiro leria isso como copy nativa premium, ou sente cheiro de tradução?

## §17 — LP PRECISA DE DISPATCHER DE ARQUITETURA (3 tipos) + JUSTIFICATIVA
**Princípio:** "institucional long-form" não é template suficiente. Antes de escrever, escolher a arquitetura que VENDE aquela oferta, a partir de 7 sinais do DNA: estágio de consciência · prova (existe/em validação) · canal de tráfego · tem VSL? · pré-call/pós-call/ativo de diagnóstico · ticket + complexidade · tipo de oferta.
**Default (criar-lp escolhe 1 dos 3):**
- **1. Diagnóstico / Auditoria Premium** 🔴 DEFAULT infra — high-ticket, infra instalada, IA/growth, consultivo, venda por call, prova em validação, problem-aware, pré-call/pós-conversa. Estrutura: hero (perda/oportunidade desperdiçada) → cadeia operacional visual → métricas/benchmarks → convite pra auditoria → problema em cenas reais → diagnóstico antes da prescrição → Old Way vs New Way → sistema/metodologia → escopo → garantia controlável → preço teaser/faixa → FAQ → CTA pra auditoria.
- **2. VSL / Treinamento** — vídeo/treinamento, tráfego frio, mercado pouco consciente. Hero (promessa clara) → VSL → outcomes/cards → mecanismo em 3 partes → prova (ou alternativa) → formulário/aplicação → thank-you → CTA pra call. Gera **LP + form + thank-you**.
- **3. Oferta Direta / Fechamento** — prospect já conversou, pediu proposta, decisão. Atenção pro ICP → promessa direta → "isso é pra você se…" → dores operacionais → protocolo → Old vs New → entregáveis → garantia → preço → For/Not For → FAQ → CTA de fechamento.
- (SaaS/Product Page arquivada — fora de prioridade.)
**Default duro:** infra high-ticket SEM case maduro → **Tipo 1 (Diagnóstico/Auditoria Premium)**. Não deve parecer agência, SaaS nem template genérico.
**Justificativa obrigatória:** antes da copy, o dispatcher retorna — tipo escolhido + por quê + sinais do DNA que pesaram + tipo descartado e por quê (vai pro operador E pro copy-notes, nunca pra copy pública).
**Verificação:** o dispatcher declarou o tipo, a justificativa e o descartado, ANTES de escrever a copy?

## §18 — LP DE INFRA VENDE PERDAS ANTES DE COMPONENTES (mas o HERO é outcome-first §27)
**Princípio:** não começar explicando features/camadas. Vender a perda antes do componente. **Exceção do hero:** o H1 vende o DESTINO (outcome-first, §27); a PERDA começa na PRIMEIRA seção PÓS-hero.
**Default:** hero outcome-first → **1ª seção pós-hero = onde o dinheiro/agenda/ocupação/oportunidade escapa** → cenas concretas → custo da inação → por que soluções soltas não resolvem → por que sistema integrado é necessário → SÓ ENTÃO o mecanismo. Traduzir componente em consequência:
- "Pilar 1: Campanha" → "o lead certo entra."
- "Motor de Reativação" → "a base parada volta pra agenda."
- "Painel de Aprendizado" → "você vê onde a receita trava antes de comprar mais mídia."
**Verificação:** o H1 vende resultado (§27) e a PERDA vem logo depois, antes de qualquer feature?

## §19 — LP COM METÁFORA DOMINANTE ÚNICA
**Princípio:** a LP tem UMA narrativa/metáfora principal. Misturar metáforas de PERDA concorrentes (roleta + balde + vazamento + máquina + pipeline todas disputando a narrativa) polui.
**Default:** escolher UMA narrativa central por LP. Fitness maduro tende a "perdas/oportunidades escapando" ou "operação comprando pedaços". "Balde furado" pode virar, em copy premium: base parada · oportunidades que já custaram caro · receita escapando · demanda desperdiçada · agenda vazando.
**Nome de COMPONENTE/entregável é permitido (não conta como metáfora concorrente):** "Motor de Reativação", "Painel de Aprendizado", "Máquina de Vendas" são nomes do mecanismo/oferta — fazem parte do produto, não competem com a metáfora de perda dominante. O ban é sobre metáforas PRINCIPAIS brigando entre si na copy, não sobre o nome de um entregável.
**Verificação:** dá pra nomear a UMA metáfora de perda dominante da LP? Tem OUTRA metáfora de perda competindo com ela? (nome de componente não conta)

## §20 — COMPLIANCE SAÚDE/ESTÉTICA/CLÍNICA/NUTRIÇÃO
**Princípio:** nicho regulado → asset nasce marcado pra revisão regulatória, e a herança vale pra OFERTA, LP e PITCH (não só novo-cliente).
**Default (saúde/estética/clínica/nutrição/odonto/emagrecimento/áreas reguladas):** marcar pendente de revisão · não prometer desfecho clínico/tratamento/antes-e-depois/faturamento garantido · separar métrica comercial de desfecho clínico · disclaimer nas notas internas + footer quando aplicável · sinalizar órgão: **CFM** (médico) · **CFO** (odonto) · **CFN** (nutrição) · **CONFEF** (educação física) · CRP/CREFITO/CVM/OAB/COFECI conforme o caso · LGPD universal.
**Verificação:** oferta/LP/pitch de nicho regulado saíram com o disclaimer + órgão sinalizado nas notas internas?

## §21 — VALIDAÇÃO SEM COLD OUTREACH PESADO  *(plano-validacao JÁ FORTE — reforço)*
**Princípio:** validação usa a rede que existe, não constrói audiência do zero nem spam frio em massa.
**Default:** prioriza rede quente · indicações · clientes atuais · parceiros · comunidades · eventos · conteúdo estratégico · conversas consultivas · diagnóstico. Cold é secundário, baixa escala, altamente personalizado — nunca o GTM principal.
**Métricas (funil, não só "respondeu"):** contatos quentes ativados · respostas · diagnósticos agendados · diagnósticos realizados · propostas solicitadas · propostas enviadas · objeções reais · intenção de compra · 1º cliente/case.
**Verificação:** o plano mede o funil quente→diagnóstico→proposta→case, ou só volume de mensagem?

## §22 — OFERTA PRODUCTIZADA (entrega replicável)
**Princípio:** toda oferta de infra inclui plano de productização pra que, depois dos 2-3 primeiros clientes, cada novo seja instalado com muito menos esforço.
**Default (incluir na oferta):** templates reutilizáveis · SOPs · checklists · automações · prompts evergreen · CRM blueprint · dashboard template · onboarding form · checklist de materiais · scripts de WhatsApp · critérios de qualificação · playbook de instalação · biblioteca de campanhas · biblioteca de reativação. O sistema EXPLICA como transformar a entrega em produto replicável.
**Verificação:** a oferta descreve o caminho de founder-led → productized (§11)?

## §23 — MATERIALIZAR + ABRIR O ARTEFATO
**Princípio:** artefato que o usuário não VÊ parece que não foi gerado. LP e documento de oferta são o clímax visível — têm que renderizar e ABRIR.
**Default:** ao concluir, `criar-lp` e `criar-oferta` renderizam um HTML visualizável e ABREM no navegador (`open`/`xdg-open`), como precedente do `carrossel` (Playwright) e `proposta` (HTML A4). Não terminar em "leia o README" / path de `.md` cru sem materializar. O handoff aponta pro arquivo aberto, não pra um caminho que ninguém abre.
**Verificação:** ao fim da skill, o Bro VÊ a LP/oferta renderizada no browser, sem passo manual?

## §24 — ONE-PAGE OFFER É ENTREGÁVEL RENDERIZADO
**Princípio:** `criar-oferta` hoje para no markdown; a fundação merece o entregável premium renderizado (decisão do doc 09 §4.5 que nunca virou skill).
**Default:** `criar-oferta` ganha o Passo de render — as 7 seções do `oferta.md` + a inteligência que a sustenta (mecanismo, contexto de mercado, math do pricing, posicionamento) numa página web premium (naipe AI Economy, com SCORE tipo Raio-X Index), salva em `ofertas/[slug]/oferta.html` e aberta (§23). Fundando → moldura de HIPÓTESE ("v1 a validar"); já atuando → números do `/raio-x`.
**Verificação:** ao fim do `criar-oferta`, existe `oferta.html` renderizado e aberto — não só o `.md`?

## §25 — SISTEMA VISUAL POR ARQUÉTIPO (marca herda, não improvisa)
**Princípio:** a estética cascateia igual a voz. Cada nicho merece um design system condizente — clínica não parece box de crossfit, agência de IA não parece HVAC. Nada de default fixo "tech-premium" pra todos.
**Default:**
- Existe `marca/brand-tokens.json` → todo asset visual (LP, proposta, one-page offer, post, carrossel, HTML/PDF renderizado) **HERDA** os tokens (paleta OKLCH, tipo, raio, sombra, motion, density) — NÃO improvisa do zero. Precedência: `clientes/[slug]/marca/` > `marca/` (workspace) > gerar-do-zero.
- **Dispatcher de arquétipo (o `/marca` roda ANTES de gerar tokens):** escolhe a direção visual a partir de 7 sinais — mercado · ICP · tipo de confiança · ticket · sofisticação · regulação · categoria emocional. Arquétipos canônicos: **Clinical Premium / Trust & Precision** · **Performance Operations / Command Center** · **Local Specialist / Reliability & Compliance** · **AI Infrastructure / Revenue Intelligence** (ou derivado próprio). Ex. travado: Fitness Acquisition OS = Performance Operations, NUNCA fitness motivacional/SaaS genérico/clínica hospitalar/agência.
- **Provisório:** sem marca definida, o `/marca` gera design system **PROVISÓRIO v1 ESPECÍFICO ao nicho/arquétipo** (`provisional_status`), nunca genérico. Nunca tratado como branding definitivo; o selo de provisório vai nas **notas internas** do asset (§15), nunca na copy pública.
**Verificação:** o asset renderizado usa os valores OKLCH/tipo/raio do `brand-tokens.json` (zero drift)? O arquétipo bate o nicho? Provisório está sinalizado (interno, não na copy)?

## §26 — NOMES REAIS DE REFERÊNCIA FICAM OCULTOS NO OS
**Princípio:** o installer é distribuído pro usuário final. Nome real de referência externa (plataforma, agência, operador, LP, produto que a gente estudou) em skill/template/output permite que o usuário rastreie a referência. Isso não pode.
**Default:**
- **Skills, templates, commands e QUALQUER output do usuário** (copy, sections, README, preview): usam **codename ou descrição do padrão** — nunca o nome real. Ex: "a referência de linguagem PT-BR premium da casa" (não o nome), "um operador de ofertas de referência" (não a pessoa), "uma agência do nicho de referência" (não a marca).
- **Manutenibilidade permitida:** pode existir UM arquivo de calibração/referências PRIVADO mapeando codename → referência real, DESDE QUE (a) fique **fora do repo distribuído** (no workspace-mãe, não em `aifirst-os/repo/`), (b) nunca seja lido em output do usuário, (c) nunca apareça em copy pública.
- No nosso chat interno (Bro ↔ OS) os nomes reais são livres — a regra é só sobre o que entra nos ARQUIVOS do produto.
- **Distinção que importa (não over-scrub):** §26 esconde **REFERÊNCIA ESTUDADA** — fonte de design/copy/estratégia/oferta que a gente modelou e o usuário não deve rastrear (ex: "inspiração: um SaaS premium de referência" · "visual reference: uma plataforma de webinar de referência" · "padrão de oferta de uma plataforma de referência"). NÃO se aplica a **FERRAMENTA FUNCIONAL** que o operador realmente usa/integra (Calendly/Cal.com pra agendar, Notion/Linear MCP, Stripe/Asaas pra pagamento, Next.js/Tailwind na stack) — nomeá-las AJUDA o produto e não vaza referência nenhuma. Regra prática: é "inspiração/referência" (esconde) ou "integração/ferramenta que o operador usa" (mantém)?
**Verificação:** grep nos skills/templates/outputs por nome real de REFERÊNCIA ESTUDADA = zero? (ferramenta funcional pode ficar) O que era referência está codinomado/descrito?

## §27 — HERO OUTCOME-FIRST + INTEGRIDADE DE MÉTRICA (above-the-fold que converte)
**Princípio:** em oferta comercial/high-ticket, o HERO vende o DESTINO, não o diagnóstico. Copy diagnóstica abstrata ("você perde oportunidade entre X e Y") é mais inteligente que a LP genérica, mas não é headline de VENDA. O H1 tem que bater no desejo do comprador.
**Default:**
- **H1 outcome-first:** comunica ICP + resultado desejado + cadência (quando fizer sentido) + mecanismo/diferencial. Objeção removida na subheadline.
- **Gerar 5 opções de H1** (resultado direto · resultado com número · "como [ICP] consegue [resultado] com [mecanismo]" · objeção removida · diagnóstico/perda). A **diagnóstica NÃO vence automático** — só se for claramente mais forte. Em high-ticket a vencedora normalmente = resultado específico + ICP + mecanismo. As 4 não-escolhidas vão pro `copy-notes`.
- **Integridade de métrica — NUNCA inventar número.** Número específico no H1 só se vier de: garantia definida · benchmark próprio · case real · meta operacional explícita · input do usuário. Faltando número → perguntar ao operador OU promessa sem número; a versão quantificada vira placeholder INTERNO no `copy-notes`, nunca na copy pública.
- **H1 não pode ser abstrato:** palavra genérica (operação/oportunidade/vazamento/rota/sistema/receita escapando) não carrega o H1 sozinha — tem que dizer o RESULTADO concreto + ICP.
- **Above-the-fold (ordem):** eyebrow → H1 outcome-first → subheadline (mecanismo + objeção) → CTA de valor → CTA secundário → microprova/barra de métricas (número só se validado) → visual do mecanismo. **A PERDA/diagnóstico entra na 1ª seção PÓS-hero** (§18), não no H1.
- **Subheadline remove objeção** ("mesmo sem time de marketing", "mesmo se hoje depende de indicação", "sem prometer faturamento — a entrega é [métrica controlável]").
**Verificação:** o H1 diz ICP + resultado desejado (não só diagnóstico abstrato)? Tem número só se validado? A copy pública ficou sem número inventado? Poderia ser colado em outro nicho (= genérico, refazer)?

## §28 — CALIBRAÇÃO DE MÉTRICA DE PROMESSA (qual número faz sentido POR NICHO)
**Princípio:** §27 impede INVENTAR número; §28 dá a inteligência de QUAL número por nicho. "12 agendamentos/mês" é forte em solar (ticket alto, ciclo longo, capacidade limitada) e fraco/estranho em odonto geral/fitness/jurídico. Calibrar por nicho + ticket + volume operacional + economia — NUNCA copiar de outro nicho. **Framework detalhado: `.claude/rules/outcome-metric-calibration.md`.**
**Default:**
- **Outcome unit primeiro** — nunca "lead" por default; cada nicho tem sua unidade (agendamento qualificado · consulta comparecida · orçamento retomado · instalação vendida · avaliação · matrícula · oportunidade reativada…). Regulado: não prometer desfecho clínico.
- **Volume suitability** — número bom = cria desejo + crível + cabe na capacidade + sustenta ROI + não atrai lead ruim + respeita o ciclo. NÃO é o maior.
- **Promise range** — unidade + faixa conservadora/agressiva + número público + número proibido + justificativa. Faixa, não número solto.
- **4 tipos de número:** validado / estimado / pesquisado / desejado — **só VALIDADO** vai pra H1/garantia/promessa pública; os outros 3 ficam nas notas.
- Falta número → perguntar melhor (unidade, capacidade, ticket, fechamento, número-de-garantia); senão faixa interna [D.I.], não pública.
- **Integra:** /mapear-mercado (coleta sinais + unidade) · /criar-oferta (seção "Métrica de Promessa") · /precificar (valida ROI da promessa) · /criar-lp (número no H1 só validado + nicho-apropriado).
**Anti-pattern:** copiar número bonito de outro nicho. Solar ≠ odonto ≠ fitness ≠ jurídico.
**Verificação:** outcome unit definida (não "lead")? número classificado (só validado na pública)? número calibrado ao nicho (não copiado)?

## §29 — VENDER O DESFECHO DESEJADO + PROMISE LADDER (não ficar defensivo)
**Princípio:** a copy pública vende o DESFECHO que o comprador QUER (alunos · pacientes · matrículas · vendas · deals · receita · agenda cheia), via o mecanismo. **§12 governa a GARANTIA FORMAL (contrato), NÃO o claim comercial da copy.** O erro que o motor cometeu: confundir "não garantir X" com "não poder falar de X" — e encher a dobra de disclaimer defensivo. Claim comercial ≠ garantia formal.
**Promise Ladder (4 camadas):**
- **Camada 1 — Desfecho desejado:** o que o comprador quer (alunos/matrículas/turmas cheias/pacientes/vendas/deals/pipeline). 🔴 **A LP LIDERA aqui.**
- **Camada 2 — Evento de conversão:** o elo intermediário que impulsiona (avaliação qualificada · consulta · orçamento · visita técnica · reunião) — é a outcome unit do §28.
- **Camada 3 — Entregável controlado:** o que o sistema controla (aquisição · resposta · qualificação · agendamento · reativação · follow-up · painel · automações · scripts). **A OFERTA explica 2 e 3.**
- **Camada 4 — Garantia formal:** o que se assina (instalação 30 dias · ciclo 90 dias · X do evento de conversão SE validado · "ou continuamos otimizando"). **A GARANTIA formaliza aqui (§12).**
**Default:**
- A LP LIDERA com Camada 1 (desfecho desejado) + o mecanismo (Camadas 2-3) explicando o caminho: *"instalamos a estrutura que atrai, responde, qualifica, agenda e reativa pra transformar demanda em [desfecho desejado]"*.
- 🔴 **BANIDO da dobra principal (hero/subhead/microprova):** "sem prometer faturamento" · "sem prometer aluno fechado" · "não prometemos" · "não garantimos" · "métricas operacionais, não financeiras" · "resultado clínico não garantido". Frase defensiva NUNCA lidera.
- Essas ressalvas vivem em: **seção de garantia própria (elegante) · FAQ discreta · contrato · compliance · footer jurídico · copy-notes** — nunca na dobra.
- **Subheadline** aproxima o evento de conversão do desfecho ("…pra levar mais gente certa da atenção até a matrícula").
- Sem número validado (§27/§28): vende o desfecho SEM número ("mais alunos entrando todo mês"), não com disclaimer defensivo.
**Verificação:** o hero vende o que o comprador QUER (Camada 1), ou só a métrica intermediária/defensiva? Tem frase defensiva na dobra (= reprovar)? A garantia (Camada 4) está em seção própria, não na headline?

## §30 — VOZ COMERCIAL / ENQUADRAMENTO NO DESFECHO DESEJADO (a copy pública VENDE, não explica o próprio framework)
**Princípio:** §27 põe o desfecho no H1, §28 calibra o número, §29 proíbe o defensivo na dobra. **§30 endurece a VOZ:** a copy pública tem que soar como um vendedor do desfecho falando com o comprador — **não como o OS narrando o próprio mecanismo.** O que sobra depois das 27-29, e que a §30 mata: (a) termo interno vazando na página ("rota", "vazamento", "emendas", "instalada e operada", "da atenção até a matrícula"), (b) travessão + mecanismo demais no H1, (c) subhead que soa traduzida, (d) garantia que ainda mata desejo, (e) o ciclo de 90 dias ausente.
**Aplica a:** `criar-lp` (dobra + copy inteira + preview) e QUALQUER copy PÚBLICA comercial (`proposta` hero, one-page offer hero). Vale pra `copy-publica`; NÃO pra `copy-notes`/contrato/FAQ jurídica/footer.

**1. H1 comercial (endurece §27).** Curto · **sem travessão** · outcome-first · sem termo interno · **sem "rota"** · **sem "instalada e operada"** · sem frase que pareça framework. Padrão = **resultado desejado + ICP + cadência/movimento** (ex: "Mais alunos para o seu box ou studio, todos os meses."). O mecanismo NÃO entra no H1 — vai na subhead/seções. Gera 5, escolhe 1 (as 4 → `copy-notes`).

**2. Subhead em PT-BR natural (endurece §16).** Escreve como um consultor BR fala, não como fórmula traduzida. 🔴 **BANIDO:** "da atenção até a matrícula" · "levar mais gente certa da atenção à matrícula" · "instalada e operada" na dobra. O mecanismo aparece em linguagem natural aproximando aquisição → avaliação → matrícula → reativação (ex: *"Colocamos captação, WhatsApp, avaliações e reativação trabalhando juntos pra gerar mais oportunidades na agenda, recuperar contatos antigos e transformar mais interesse em matrícula."*).

**3. Lexicon de substituição — banir da copy pública.**
| Termo interno | Trocar por |
|---|---|
| **rota** (HARD ban — zero na copy pública) | sistema · estrutura · máquina · operação · esteira · infraestrutura |
| **instalada e operada** (no H1/subhead/dobra) | NÃO usar na dobra (pode aparecer **1×** em seção de mecanismo, com cuidado) |
| **da atenção até a matrícula** | do primeiro contato à avaliação · da avaliação à matrícula · da base parada de volta à agenda |
| **vazamento** VAGO (não o concreto) | oportunidades perdidas · demanda desperdiçada · agenda que não captura · contatos parados. **Refinado (br-copy-potency §1):** "vazamento/escapar" LIBERADO quando ANCORADO num concreto (R$/número/ponto/estado do painel); banido só quando VAGO/repetido-solto |
| **emendas** (repetido) | passagens · etapas · pontos do processo · troca de mão |
| **founder-led** | implantação acompanhada de perto |
| **done-for-you** | feito e operado por nós |
"vazamento"/"emendas" não é ban de 1 uso — o ban é a **REPETIÇÃO** (viram tique). Varia. "rota" e as traduções gringas = ban seco.

**4. Ciclo de 90 dias como jornada (não 30).** 30 dias = implantação inicial · **90 dias = construção, lançamento, dados, ajuste e otimização.** A dobra pode trazer **"Ciclo de implantação e otimização em 90 dias"**; 30 dias só como detalhe ("implantação inicial nos primeiros 30 dias"). 🔴 Nunca fazer parecer que o RESULTADO final vem em 30 dias.

**5. Garantia elegante, não defensiva (a voz da §29 na seção de garantia).** Escreve positivo — o compromisso é com a **estrutura que leva oportunidade até a agenda** (captação, resposta, qualificação, avaliação, reativação); os indicadores formais são definidos no diagnóstico conforme maturidade/capacidade/verba. Depois, 1 frase discreta (*"fechamento, atendimento, preço, oferta e experiência seguem dependendo da operação do cliente"*) + footer jurídico suave. 🔴 **BANIDO como abertura/headline da garantia:** "não prometemos faturamento" · "sem aluno garantido" · "métricas operacionais, não financeiras". A ressalva existe, mas discreta e DEPOIS do compromisso positivo — nunca liderando.

**6. Dobra esperada (checklist).** eyebrow (categoria) → **H1 curto outcome-first** (regra 1) → **subhead natural** (regra 2) → CTA de valor → CTA secundário → **microprova** (ciclo 90 dias · aquisição+WhatsApp+avaliações+reativação · poucas operações por vez · verba de mídia separada) → **visual REAL** do painel. 🔴 **BANIDO na dobra:** travessão no H1 · rota · instalada e operada · vazamento · da atenção até a matrícula · "sem prometer/não prometemos" · "métricas operacionais não financeiras" · founder-led · done-for-you · **placeholder visual textual**.

**7. Visual real (não placeholder).** `preview.html` renderiza um **painel real** (command center: agenda · WhatsApp · avaliações · no-show · base parada · reativação · matrículas, cards conectados) herdando os tokens do arquétipo (§25). NUNCA "[ visual: diagrama… ]" textual.

**Verificação:** H1 curto, sem travessão, sem termo interno (rota/instalada e operada)? Subhead soa BR nativa (sem "da atenção até a matrícula")? Lexicon aplicado na copy INTEIRA (zero "rota")? Ciclo de 90 dias aparece? Garantia abre positiva (defensivo só discreto e depois, nunca liderando)? Dobra sem nenhum banido? `preview.html` com painel real (não placeholder textual)?

## §31 — POLIMENTO DE COPY COMERCIAL (a LP parece OFERTA PREMIUM, não documento do OS)
**Princípio:** §27-30 acertam estrutura e desfecho; **§31 lapida a VOZ** pra soar oferta premium, não documentação interna. O motor acerta a estratégia mas ainda vaza: (a) CTA principal negativo/acusatório, (b) subhead longa/framework, (c) termo de bastidor, (d) "caminho" como muleta, (e) garantia/footer defensivos, (f) painel que parece dado real inventado. §31 mata os seis.
**Aplica a:** `criar-lp` (dobra + copy inteira + preview) + `proposta` hero.

**1. CTA principal vende GANHO — a perda é diagnóstico DEPOIS.** A dobra vende o desfecho positivo; o CTA principal = construir/mapear/desenhar o ganho. "Ver onde você perde aluno" vira **CTA secundário** ou seção diagnóstica pós-hero, NUNCA o CTA principal.
- ✅ Principal: "Construir minha agenda previsível" · "Mapear meu plano de aquisição" · "Ver como encher minha agenda" · "Desenhar minha estrutura de aquisição".
- ✅ Secundário/diagnóstico: "Ver onde estou perdendo aluno".

**2. Subhead natural premium.** Curta · natural · **1 ideia central** · sem framework · sem tradução literal · **passa no §31.8 (uma altura só)**. 🔴 Bane: "da atenção até a matrícula" · "rota instalada" · "instalada e operada" · duas ideias competindo · **lista que mistura altura** (aquisição/WhatsApp/avaliação/reativação juntos = diagrama; ver §31.8).
- Direção A (subhead APROVADA pelo Bro — sujeito = SISTEMA, funil conectado, §31.9): "Um sistema que conecta captação, WhatsApp, avaliações e reativação para transformar interessados em matrículas e trazer oportunidades antigas de volta para a agenda."
- Direção B (ICP): "Para operações fitness que já têm estrutura, equipe e custo fixo, mas ainda dependem demais de indicação, improviso no WhatsApp e follow-up manual pra preencher a agenda."

**3. Lexicon-2 — termo de bastidor → público (soma ao lexicon do §30).**
| Bastidor (banir da pública) | Público |
|---|---|
| métricas controláveis | indicadores acordados · indicadores da estrutura |
| uma responsabilidade pelo caminho inteiro | um responsável pela estrutura de aquisição · uma operação conectada do primeiro contato à agenda |
| passagens | etapas · pontos do processo |
| handoff | troca de responsabilidade (ou remover) |
| SOPs | processos documentados · scripts e automações documentadas |
| máquina rodar afinada | estrutura funcionando com consistência |
| máquina entra no ar | estrutura entra em operação |
Sofisticação operacional OK; documentação interna NÃO.

**4. "caminho" é MULETA — não repetir.** "rota" saiu (§30); "caminho" não pode ocupar o vazio. Máx **1-2 pontual** na página; alternar com **estrutura · sistema · processo · operação · aquisição · agenda · esteira · fluxo · pontos de conversão**. A narrativa principal é **agenda previsível + turmas mais cheias + reativação da base + menos dependência de indicação** — não "caminho" repetido o tempo todo. 🔴 **Os SINÔNIMOS-disfarce contam junto: "trajeto" · "percurso" · "jornada" · "rota".** Não driblar o grep trocando a palavra — a regra é sobre a ABSTRAÇÃO ("a oportunidade percorre um trajeto só" = mesmo problema que "caminho"). Fala a coisa concreta (o anúncio traz → a resposta no WhatsApp → a avaliação → a matrícula), não a metáfora do "trajeto".

**5. Garantia positiva (não fronteira-como-bloco-defensivo).** Abre com o compromisso + a jornada de 90 dias + o "seguimos otimizando sem custo até o padrão do diagnóstico". A fronteira (venda final depende da operação) = **1 frase discreta**. Modelo:
> "O compromisso é com a estrutura que coloca oportunidades certas na agenda. Em 90 dias, sua operação passa por diagnóstico, implantação, lançamento, leitura de dados e otimização da estrutura de aquisição e reativação. Se os combinados forem cumpridos e os indicadores acordados não forem alcançados, seguimos otimizando sem custo adicional até a estrutura atingir o padrão definido no diagnóstico. A venda final continua dependendo da oferta, atendimento e experiência da sua operação."
🔴 Bane como centro emocional: "não prometemos" · "não garantimos" · "métricas operacionais, não financeiras" · "não faturamento/matrículas fechadas".

**6. Footer protege sem matar venda.** Modelo:
> "Resultados comerciais dependem da oferta, atendimento, capacidade e experiência de cada operação. Comunicação sem promessa de desfecho físico, clínico ou de saúde. Tratamento de dados conforme a LGPD."

**7. Painel ILUSTRATIVO — número não pode parecer dado real inventado.** Se o preview usar número no painel, marcar discreto: **"exemplo de operação"** OU **"painel ilustrativo"**. OU usar **estados sem número** (avaliações marcadas · leads aguardando resposta · no-shows sem recuperação · contatos antigos · reativação em andamento · matrículas em acompanhamento). Nunca parecer dado real sem fonte (§27 integridade estende ao visual).

**8. 🔴 TESTE DO NO-BRAINER + UMA ALTURA SÓ (a regra que faltava — o motor errou aqui 2×; anti-exemplos cravados).** Toda frase pública passa em 2 gates:
- **(a) Primeira leitura, palavra do dono.** É uma coisa que o DONO falaria pro amigo, e que ele pega de PRIMEIRA, sem decodificar? Substantivo vago que exige pergunta ("que mídia?", "que caminho?") → reescreve com a coisa concreta. Palavra do dono: **anúncio** (não "mídia"/"aquisição") · **aluno/matrícula/turma** (não "conversão") · **avaliação grudada num verbo** ("agenda a avaliação", nunca "avaliações" solta numa lista) · **quem sumiu / base parada** (não "reativação" solta).
  - 🔴 REPROVA: *"O caminho entre a sua mídia e a sua turma tem pontos onde o aluno escapa."* (vago + metáfora que decodifica).
  - ✅ *"Todo mês, gente que já clicou no seu anúncio some antes de virar aluno. Sempre nos mesmos lugares: o WhatsApp que demora, a avaliação que ninguém remarca e a base que parou de aparecer."*
- **(b) Nada de lista flat de deliverables SOB SUJEITO DE GENTE.** 🔴 REPROVA: *"Aquisição + WhatsApp + avaliações + reativação sob uma responsabilidade só."* · *"Um time só responde por tudo: o anúncio, o WhatsApp, a avaliação, a base…"* (sujeito = time + enumeração flat = diagrama de agência). ✅ A forma APROVADA lista as etapas do funil SOB SUJEITO-SISTEMA + transformação (§31.9): *"Um sistema que conecta captação, WhatsApp, avaliações e reativação para transformar interessados em matrículas."* — aí a lista = as etapas que o sistema CONECTA (a conexão é o mecanismo), não deliverables soltos.
- Termo de sistema (aquisição · reativação · estrutura · fluxo) pode ser o NOME do que se vende / as etapas que o sistema conecta, mas NÃO item de lista flat sob sujeito de gente.

**9. 🔴 SUJEITO DA ENTREGA = SISTEMA/MECANISMO, NUNCA "UM TIME" (mecanismo COMPLETO, funil conectado).** O achado comercial do Bro (10/07): chamar a entrega de "um time" reenquadra a oferta como AGÊNCIA/gente/manual — drift vs §9 (infra instalada ≠ mensalidade de agência). O Fitness Acquisition OS (e todo produto do OS) soa como um **SISTEMA/mecanismo de aquisição e reativação instalado**, não como equipe de prestação de serviço.
- **Sujeito público da entrega:** o sistema · a estrutura · a máquina · o mecanismo · a infraestrutura. 🔴 **NUNCA como sujeito principal:** "um time" · "nossa equipe" · "pessoas operando tudo" · "agência" · "gestor".
- **Mecanismo COMPLETO (não a partezinha):** o sistema cobre o funil INTEIRO — **atração → qualificação → conversão → reativação** — CONECTANDO as etapas. O diferencial é a conexão ponta a ponta: a agência só faz tráfego, o comercial só faz venda; a gente cobre o problema inteiro e gera o resultado. **Mesmo quando a dor principal é UMA etapa** (ex.: comercial pós-lead em clínica), vende-se o mecanismo COMPLETO — nunca "você já roda tráfego, instalo um negocinho depois". Posicionar como "instalo a infraestrutura que atrai, qualifica e converte, conectada".
- 🔴 **Errado:** *"Um time só responde por tudo: o anúncio que traz, a resposta no WhatsApp, a avaliação agendada e a base parada de volta pra turma."*
- ✅ **Certo (subhead APROVADA):** *"Um sistema que conecta captação, WhatsApp, avaliações e reativação para transformar interessados em matrículas e trazer oportunidades antigas de volta para a agenda."*

**Verificação:** CTA principal vende ganho (perda = secundário/pós-hero)? Subhead 1 ideia natural? Zero termo de bastidor (lexicon-2)? "caminho" ≤1-2 (não muleta)? **Sujeito da entrega = SISTEMA/mecanismo (nunca "um time"/equipe/agência/gestor — §31.9)? Mecanismo vendido é COMPLETO (atração→qualificação→conversão→reativação conectado), não só a partezinha?** Nada de lista flat de deliverables sob sujeito de gente (a forma "o sistema conecta [etapas] para transformar X em Y" é a aprovada)? Garantia abre positiva + fronteira em 1 frase? Footer suave? Painel marcado ilustrativo (ou qualitativo)?

## §32 — RENDER QA GATE (bug visual/textual REPROVA o preview)
**Princípio:** preview premium com bug de render/copy mata percepção. Antes de entregar o `preview.html`, **escanear (grep + leitura visual) e REPROVAR** se achar:
- **palavras grudadas / labels colados** — ex: "o centroPrincipal", "PrincipalR$", texto sem espaço entre spans adjacentes.
- **blocos duplicados em sequência / repetição acidental de frase** — mesmo bloco 2× fora de marquee intencional.
- **placeholder** — "[ visual", "lorem", "TODO", "xxx", colchete de stub.
- **string de debug** — `console.`, `{{`, `${`, `undefined`, `NaN`, `%s`, `[object`.
- **markdown quebrado** — `**`, `##`, `|---|` renderizando cru no HTML.
- **visual stub** — div vazia no lugar do painel, "diagrama:" textual.
**Exceção documentada:** marquee com faixa duplicada pro loop CSS é intencional → marcar a cópia `aria-hidden="true"` e tratar como 1 faixa lógica (não conta como bug de duplicação).
**Regra:** qualquer um → **REPROVA o preview** (não entrega). Se saiu com bug, **mostrar o gap cru** (§1: corrigir a REGRA/skill, não remendar o artefato à mão sem avisar).
**Verificação:** rodou o scan? zero grudado/duplicado/placeholder/debug/markdown-cru/stub? marquee com `aria-hidden` na cópia?

═══════════════════════════════════════════════════

## Como as skills consomem isto (Step 0)
Skills detail-heavy leem o CORE inteiro no Step 0: `escanear-concorrencia` (§6,§7) · `precificar` (§8,§9,§10,§11,§28) · `criar-oferta` (§8,§9,§11,§12,§13,§14,§22,§24,§28) · `criar-lp` (§8,§12,§15,§16,§17,§18,§19,§20,§23,§25,§26,§27,§28,§29,§30,§31,§32) · `proposta` (§16,§27,§29,§30,§31) · `posicionar` (§8,§9,§16) · `pitch` (§12,§13,§20) · `plano-validacao` (§11,§21) · `mapear-mercado` (§2,§6,§28) · `raio-x`/`setup`/`sistematizar` (§3,§5). Todas: §1,§2,§3,§5,§15.
Regras com framework detalhado próprio: §25/§26 (naming/marca — ver `semantic-frame-audit` no workspace-mãe), **§28 (`.claude/rules/outcome-metric-calibration.md`)**, **§31 (`.claude/rules/br-copy-potency.md` — armas de copy no-brainer PT-BR nativas; escopo §0: só devices transferem, estrutura de evento/enterprise/marketplace NÃO)**.
A constituição compacta (os 32 títulos) é injetada em toda sessão pelo SessionStart hook.

## Changelog
- **2026-07-09 v1** — Criado. Codifica as 22 regras do teste real E2E + 2 (auto-open R23, one-page render R24). Camada de regras nova do installer (antes inexistente). Ver `CALIBRATION_PLAN.md`.
- **2026-07-09 R4.5** — **§30 (Voz comercial / enquadramento no desfecho desejado)** adicionado. Endurece §27/§28/§29 na VOZ da copy pública: H1 curto sem travessão/termo interno, subhead PT-BR natural (mata "da atenção até a matrícula"), lexicon de substituição (rota→sistema/estrutura, founder-led/done-for-you), ciclo de 90 dias como jornada, garantia positiva não-defensiva, dobra sem banidos, `preview.html` com visual REAL. Consumido por `criar-lp` + `proposta`. Ver `_RODADA-4.5-SPEC-commercial-copy.md`.
- **2026-07-10 R4.6** — **§31 (Polimento de copy comercial)** + **§32 (Render QA Gate)** adicionados. §31: CTA principal vende GANHO (perda = secundário/pós-hero), subhead natural 1-ideia, Lexicon-2 (métricas controláveis→indicadores acordados · SOPs→processos documentados · passagens→etapas · "máquina no ar"→"estrutura em operação"), "caminho" anti-muleta, garantia positiva-modelo, footer suave-modelo, painel ILUSTRATIVO (marcar "exemplo de operação"/qualitativo — número não parece dado real). §32: preview reprovado por palavra grudada ("o centroPrincipal") · bloco duplicado · placeholder · string de debug · markdown cru · visual stub (marquee-loop é exceção com aria-hidden). + premium render standard no Passo 7 do `criar-lp` (fonte real embutida, movimento, painel real). Ver `_RODADA-4.6-SPEC-copy-polish-render-qa.md`.
- **2026-07-10 R4.6.1 (correção pós-auditoria)** — **§31.8 endurecido + §31.9 novo (SUJEITO DA ENTREGA = SISTEMA, nunca "um time")**: o achado comercial do Bro — "um time" reenquadra a oferta como agência/gente (drift §9). Sujeito público = sistema/estrutura/máquina/mecanismo/infraestrutura; banido "um time"/equipe/agência/gestor. Mecanismo vendido é COMPLETO (atração→qualificação→conversão→reativação conectado), não a partezinha. Subhead APROVADA cravada como exemplo-âncora: *"Um sistema que conecta captação, WhatsApp, avaliações e reativação para transformar interessados em matrículas…"*. §31.8(b) reconciliado (a lista de etapas do funil é OK sob sujeito-sistema + transformação). + **§26 scrub**: menção literal a uma plataforma de oferta de referência removida do CORE (:206) → descritivo. + título "22+2"→"32". + `br-copy-potency.md` (armas de copy no-brainer PT-BR nativas, §26-clean). Consumido por `criar-lp` + `proposta`. Backlog pós-release: query-log em pesquisa · matriz concorrencial 11-col · step de drift de ICP · fixture de marca 3-camadas.
