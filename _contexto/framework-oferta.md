---
title: Framework de Oferta — Nova Economia da IA
type: contexto/framework
created: 2026-04-25
tags: [framework, oferta, criterios, mecanismos]
---

# Framework de Oferta

Este arquivo é a base de conhecimento que as skills `/criar-oferta`, `/mapear-mercado`, `/copiloto` e `/playbook-cliente` consultam antes de gerar output. Contém os critérios, frameworks e bibliotecas que calibram toda decisão técnica.

---

## 1. Modelo de negócio em 6 passos

```
1. Escolher nicho com fundamento financeiro forte
2. Isolar UM bottleneck claro de alta alavancagem
3. Mapear o bottleneck a um mecanismo de IA validado
4. Empacotar como infraestrutura com nome proprietário
5. Cobrar setup R$20-50K + recorrência R$2-6K/mês
6. Escalar via reinvestimento rápido do lucro
```

---

## 2. Critérios de qualificação de nicho

Skills só recomendam atacar nichos que atendem **TODOS** esses critérios:

| Critério | Limiar |
|---|---|
| Empresas ativas no Brasil | 30.000+ |
| Crescimento anual (CAGR) | 8%+ |
| Ticket médio (AOV) | R$1.500+ |
| LTV típico | R$30.000+ |
| Receita média anual por empresa | R$500.000+ |
| Targetable via paid ads | Sim (Meta/Google/LinkedIn) ou bases B2B |
| Dor financeira clara no bottleneck | Sim |

**Por que 30K+ empresas:** garante segmentação possível, filtragem por sub-nicho, campanhas de mídia paga rentáveis em larga escala.

**Por que LTV ≥ R$30K:** matemática de aquisição só fecha quando LTV ≥ 3x CAC. Com setup R$25K, LTV precisa ser pelo menos R$75K considerando recorrência por 12+ meses.

---

## 3. Análise de bottleneck (gap analysis)

Pra qualificar um problema como bottleneck atacável, 3 perguntas:

1. **Que processo manual/ineficiente o nicho usa hoje?**
2. **Quais são os efeitos de 1ª, 2ª e 3ª ordem de não resolver?**
3. **IA pode resolver de forma produtizada, validada e mensurável?**

Só prosseguir se:
- Problema é diretamente ligado a **receita ou rentabilidade**
- Solução entrega ROI em **15-30 dias**
- Resolver justifica **R$20K+ de investimento facilmente**
- Implementação core deploya em **menos de 1 hora**

**Bottlenecks típicos por categoria:**

| Bottleneck | Mecanismo IA | Justificativa ROI |
|---|---|---|
| Follow-up inconsistente com leads | Voice AI + WhatsApp/SMS automation | +15% conversão → ROI <30 dias |
| Falta de agendamentos qualificados | Auto-agendamento com IA + qualificação | -30% CAC → ROI sem time de vendas |
| Churn de clientes ativos | Onboarding workflows + KPI tracking | -25% churn → +R$30K LTV/cliente |
| Tarefas administrativas manuais | Make/N8N + integrações | -80% tempo admin → libera vendas |
| Falta de visibilidade em métricas | Dashboards automáticos | Decisões em tempo real → +performance |

---

## 4. Matriz ON/LIGHT/OFF por perfil de mercado

Use pra calibrar o peso de cada bloco da oferta conforme o perfil do nicho:

| Bloco / Ênfase | Saúde (Reguladas) | Consultorias B2B | Infoprodutores Digitais | Consumo Premium Local |
|---|---|---|---|---|
| Compliance (CFM/CRO/OAB/CONAR/LGPD) | **ON** | **ON** | **LIGHT** | **LIGHT** |
| Emoção/Objeções | **ON** (medo/confiança) | **LIGHT** (ROI) | **LIGHT** (ceticismo) | **LIGHT** (preço/experiência) |
| Resultados que vendem | **ON** (consultas/ocupação) | **ON** (reuniões/contratos) | **ON** (leads/vendas/LTV) | **ON** (reservas/visitas/frequência) |
| Setup de oferta | **ON** (funil/CRM/lembretes) | **ON** (funil edu/CRM pipeline) | **ON** (funil perpétuo/checkout) | **ON** (funil reservas/CRM fidelidade) |
| Recorrência | **ON** (remarketing/reativação) | **ON** (pipeline/reuniões) | **ON** (tráfego/upsell) | **ON** (sazonal/VIP) |
| Garantia condicional | **ON** | **ON** | **ON** | **ON** |
| Benchmarks críticos | show-up/close/CPL | close/CAC/ciclo | CPL/CTR/close/LTV | show-up/ticket médio |
| Go-to-Market inicial | avaliação | diagnóstico | isca/aula | reserva/teste |

---

## 5. Benchmarks setoriais (ranges de referência BR)

Use como ponto de partida em diagnósticos. Nunca como promessa.

### Saúde & Estética (Médica, Odonto, Estética, Dermato, Fertilidade)
- Show-up rate: 55-80%
- Close rate (avaliação → tratamento): 20-40%
- CPL médio: TBD (forte variação regional)
- ROI proxy: positivo quando LTV ≥ 3x CAC
- CTR médio: 0,8-2,5% (social), 2-5% (search)
- Ciclo de vendas: dias/semanas

### Consultorias & Serviços B2B (Consultorias, Jurídico, Contabilidade, Mentorias)
- Show-up rate (reuniões): 60-75%
- Close rate (reunião → contrato): 15-30%
- CPL médio: TBD
- ROI proxy: CAC recuperado em 1-2 meses típico
- Ciclo de vendas: semanas a meses
- LTV: alto (contratos recorrentes)

### Educação & Infoprodutos
- Show-up rate (aula gratuita): 35-60%
- Close rate (aula → compra): 5-15%
- CPL médio: TBD
- ROI proxy: CPA ≤ 30% do ticket é saudável
- Abandono de funil: 30-50% (lead → engajamento), 60-80% (checkout)

### Imóveis & Construção
- Show-up rate (visitas): 50-70%
- Close rate (visita → contrato): 5-12% residencial, até 20% alto padrão
- CPL médio: TBD
- ROI proxy: depende da comissão (3-6% do imóvel)
- Ciclo de vendas: meses

### Varejo Premium & Lifestyle (Restaurantes, Joalherias, Móveis, Hotéis)
- Show-up rate (leads → visitas): 40-65%
- Close rate (visita → compra): 20-35%
- LTV: médio-alto (retorno recorrente VIP)

### Pets (Veterinárias & Pet Premium)
- Show-up rate: 60-75%
- Close rate (avaliação → tratamento): 25-40%
- ROI proxy: alto (LTV elevado)
- Ciclo de vendas: dias

> **Nota metodológica:** benchmarks funcionam como ranges de referência, sempre ajustados por ticket, região, estrutura comercial e sazonalidade. Onde não há base sólida BR → marcar TBD.

---

## 6. Biblioteca de mecanismos IA por perfil

Cada mecanismo lista KPI principal que move + pré-requisito mínimo + armadilha típica.

### Saúde & Estética

| Mecanismo | KPI principal → secundário | Pré-requisito | Armadilha |
|---|---|---|---|
| Lembretes automáticos (WhatsApp/SMS) | Show-up → Close | Agenda integrada + SLA <15min | Frequência excessiva |
| Chatbot de triagem humanizado | Show-up → CPL | Script sensível + rotas de qualificação | Tom robótico |
| CRM com pipeline (lead→consulta→tratamento) | Close → ROI | Campos essenciais + tarefas automáticas | Time não usa CRM |
| Follow-up multicanal (voz/WA/email) | Close | Sequências por objeção | Mensagens genéricas |
| Scoring de lead (dor/ticket/urgência) | Close → CPL | Form com 3-5 perguntas chave | Score mal calibrado |
| Remarketing segmentado | Close → CPL | Pixel + listas atualizadas | Públicos misturados |
| Programas de fidelidade | LTV → ROI | Ofertas claras de manutenção | Benefício vago |
| Pré-consulta educativa | Show-up → Close | Biblioteca curta e objetiva | Conteúdo longo |

### B2B (Consultorias, Contabilidade, Jurídico, Mentoria Corporativa)

| Mecanismo | KPI principal | Pré-requisito | Armadilha |
|---|---|---|---|
| Agendamento automático de diagnóstico | Show-up (reunião) | Agenda sincronizada + slots úteis | Sobreposição/atrasos |
| Assistente de proposta (IA + ROI calc) | Close → Ciclo | Template base + casos reais | Proposta genérica |
| CRM com SLAs e tarefas automáticas | Ciclo → Close | Pipeline claro por etapa | Pipeline fantasma |
| Nutrição multicanal (email/LinkedIn) | Ciclo → Close | Sequência por dor/segmento | Conteúdo raso |
| Scoring firmográfico (porte/setor) | Close → CPL | ≥50 leads/mês | Base pequena distorce |
| Playbooks de objeção (IA sugere réplica) | Close | Biblioteca de objeções | Respostas copiadas |
| Webinars/workshops recorrentes | Show-up → Close | Calendário + CTA claro | Pitch cedo demais |
| Previsão de receita (IA) | ROI → Ciclo | Pipeline consistente | Forecast com dados velhos |

### Digital (Infoprodutos, Cursos, Mentorias)

| Mecanismo | KPI principal | Pré-requisito | Armadilha |
|---|---|---|---|
| Remarketing dinâmico (eventos) | Close → ROI | Pixel/eventos configurados | Segmento errado |
| Recuperação de carrinho/checkout | Close → CPL | Integração checkout + WA/email | Tom agressivo |
| Scoring por engajamento (aula/CTA) | Close | Tracking de eventos | Tracking falho |
| A/B de criativos e ofertas (IA) | CPL → ROI | Volume mínimo/semana | Teste sem escala |
| Sequências de conteúdo (IA) | Close → LTV | Copy alinhada à promessa | Repetição |
| Bot de suporte no curso | LTV → Abandono | Base de conhecimento enxuta | Respostas erradas |
| Upsell/downsell automatizados | LTV → ROI | Esteira clara | Upsell fora de timing |
| Comunidade/coorte | LTV | Moderação + rituais | Comunidade inerte |

### Consumo Local (Restaurantes, Varejo Luxo, Hotéis, Pet)

| Mecanismo | KPI principal | Pré-requisito | Armadilha |
|---|---|---|---|
| Reserva online + confirmação | Show-up | Agenda digital + UX simples | Fricção no fluxo |
| Programa VIP (pontos/benefícios) | LTV → Ticket médio | CRM básico + regras claras | Benefícios fracos |
| Remarketing por catálogo | Close → CPL | Catálogo atualizado | Catálogo desatualizado |
| Lembrete de reserva/pós-visita | Show-up → LTV | Janelas de tempo corretas | Excesso vira incômodo |
| Preferências do cliente (IA) | Close → LTV | Coleta leve (opt-in) | Perguntas invasivas |
| Campanhas sazonais automatizadas | Close → LTV | Calendário + segmentação | Repetição perde efeito |
| Feedback NPS automatizado | ROI → LTV | Canal de resposta/ação | Sem ação no feedback |
| Cross-sell em loja/showroom | Ticket médio | Treino equipe + prompts IA | Oferta fora de contexto |

### Conteúdo / Social / Orgânico (Social Media, Criadores, Serviço de Conteúdo)

Caso nº1 do ICP do produto (prestador que vive de social/conteúdo). Cada mecanismo é a máquina que roda a esteira — a IA fica na retaguarda, o cliente compra alcance/leads, não "postagens".

| Mecanismo | KPI principal → secundário | Pré-requisito | Armadilha |
|---|---|---|---|
| Esteira de Conteúdo (produção assistida por IA) | Alcance → Leads | Pilares + tese definidos + banco de ideias | Volume sem tese (postar por postar) |
| Calendário Editorial Curado (IA sugere pauta) | Frequência → Alcance | Eixos de conteúdo + histórico do que performou | Repetir formato até saturar |
| Captura via Direct/DM → CRM | Leads → CPL | Gatilho de resposta (palavra-chave) + integração CRM | Responde e ninguém puxa (SLA furado) |
| Vitrine de Prova (antes/depois com compliance) | Close → Alcance | Casos com consentimento + regra do conselho/CONAR | Antes/depois sem autorização (risco legal) |
| Reativação de Audiência Morna | Close → LTV | Segmento de seguidores engajados que não compraram | Broadcast genérico (queima a lista) |
| Roteirização de Reels/Shorts (hook + retenção) | Alcance → Engajamento | Biblioteca de hooks + edição rápida | Hook fraco (retenção despenca nos 3s) |

### Mecanismos transversais (qualquer perfil)

| Mecanismo | KPI principal | Pré-requisito | Armadilha |
|---|---|---|---|
| Qualificação por perguntas (micro-form) | Close → CPL | 3-5 perguntas de valor | Form longo |
| Segmentação por intenção | Close | Eventos/UTMs | Listas misturadas |
| SLA de resposta com alarme | Show-up → Close | Meta de minutos + alertas | Sem ownership |
| Lead cleaning/enrichment (IA) | CPL → Close | Campos básicos | Dados ruins |
| Relatórios automáticos de funil | ROI | Dados confiáveis | Dash sem ação |

---

## 7. Stack técnica de referência (BR)

| Componente | Ferramenta sugerida | Função |
|---|---|---|
| CRM Central | GoHighLevel, RD Station, Leadster | Centraliza leads, workflows, automações |
| Voice AI | Synthflow | Follow-ups por voz |
| Messaging AI | Assistable, Twilio, WhatsApp Business API | SMS, email, WhatsApp |
| Workflow Automation | Make.com, N8N | Lógica e integrações |
| Dashboards | Looker Studio, Retool | Visualização de performance |
| Calendar | Google Calendar, Cal.com, Calendly | Agendamento integrado |
| Pagamentos | Stripe, Asaas, Pagar.me | Cobrança setup + recorrência |

---

## 8. Compliance & Guardrails

Aplicáveis conforme perfil do nicho:

- **Saúde/Estética médica:** CFM/CRM, CFO/CRO, CONAR. Sem promessas de resultado garantido. Sem "antes/depois" explícito sem consentimento.
- **B2B/Serviços:** OAB/CRC quando aplicável, LGPD, CONAR. Transparência em condições contratuais.
- **Digital/Infoprodutos:** CONAR, LGPD. Evitar promessas irreais. Disclaimer de resultados varia.
- **Consumo Local:** CONAR, LGPD. Sem alegações enganosas de rentabilidade/valorização.

**Guardrails universais:**
- Sem símbolos de moeda estrangeira ($) — sempre R$
- Sem mencionar EUA/Canadá em casos
- Tickets em R$ ou TBD
- KPIs em % ou TBD
- Tom consultivo/premium (sem promessas absolutas)

---

## 9. De onde vem cada campo da oferta (derivado, não perguntado)

`/criar-oferta` **NÃO é questionário.** A fundação (`/setup` → `/mapear-mercado` → `/escanear-concorrencia` → `/posicionar` → `/precificar`) já decidiu quase tudo COM DADO e gravou no `_constructs.md`. A skill LÊ o arquivo inteiro e DERIVA a oferta. Sobram **no máximo 2 perguntas** — só o que o operador conhece e o sistema não tem como saber.

Os 9 campos clássicos do diagnóstico e onde cada um vive AGORA:

| # | Campo | De onde vem agora | Perguntado? |
|---|---|---|---|
| 1 | Nicho específico | §NICHO/MERCADO (do `/mapear-mercado`) | Não — já mapeado |
| 2 | Dor principal e urgente | §NICHO hero pain, eleito de evidência real | Não — já eleito |
| 3 | Custo da inação | §NICHO custo da inação | Não — já pesquisado |
| 4 | Resultado final (Ponto B) | DERIVADO: inverso do hero pain na linguagem de compra → vira a PROMISE | Não — derivado |
| 5 | Mecanismo único | §POSICIONAMENTO verbatim (o `/posicionar` deriva dos dados) | Não — ninguém batiza no vácuo |
| 6 | Prova social | **Q2** — caso real com números (só o operador sabe) | **Sim** |
| 7 | Ticket / preço front-end | §PRICING CALCULADO (do `/precificar`) | Não — calculado, não escolhido de menu |
| 8 | Garantia | DERIVADA: ataca THE GAP de §CONCORRÊNCIA + margem de §PRICING | Não — derivada |
| 9 | Tom de voz | §OPERADOR (do `/setup`) + `_contexto/preferencias.md` | Não — já registrado |

**As 2 perguntas que sobram** (uma por vez, contextualizar antes, nunca travar a síntese):

- **Q1 — Escopo de entrega:** ecoa a capacidade já gravada em §PRICING ("mantém [N] vagas?") + o que o operador NÃO entrega (ex: rodar tráfego, atender fim de semana). Trava vagas, recorte do stack e responsabilidades do cliente.
- **Q2 — Prova real:** caso com números no formato `[quem] saiu de [antes] pra [depois] em [prazo]`. Sem caso → a seção sai `[DADOS INSUFICIENTES — em validação]`. Nunca inventar, inflar ou arredondar.

Se QUALQUER dependência dura do `_constructs.md` estiver vazia, a skill PARA e aponta o módulo dono (kill-boundary) — não improvisa oferta em cima de fundação furada.

---

## 10. Estrutura da oferta (`oferta.md` — 7 seções traceáveis)

Output final de `/criar-oferta`: um único arquivo `ofertas/[slug]/oferta.md`. Cada seção carrega uma linha de **trace** (`← _constructs.md §X`) — frase sem rastro = inventada = não entra. Persona e tom não são seções separadas: informam a promise, o stack e a voz por dentro.

1. **PROMISE** — `N + outcome + prazo`, garantia embutida (aparição 1 de 2). Pra quem, o que instala, por que agora (custo da inação como âncora). `← §NICHO + §PRICING`
2. **MECANISMO™** — nome verbatim + tagline + vilão que ele mata + componentes (ingredientes de UM mecanismo, nunca "soluções" rivais). `← §POSICIONAMENTO`
3. **STACK DE ENTREGÁVEIS** — Setup (instalação) × Recorrência (operação) × Do cliente (pré-condições que alimentam a garantia). `← §POSICIONAMENTO + framework §6 (biblioteca) + Q1`
4. **PRICING** — tiers + math que justifica + vagas/mês. Verbatim, calculado — a skill não arredonda "porque soa melhor". `← §PRICING`
5. **GARANTIA** — `número + prazo + verbo de reversão` (aparição 2 de 2), atacando exatamente THE GAP que os concorrentes prometem e não entregam. `← §CONCORRÊNCIA + §PRICING`
6. **PROVA** — caso real com números + mark de evidência, OU `[DADOS INSUFICIENTES — em validação]`. Nunca case inventado. `← Q2 + §NICHO`
7. **ARGUMENTO CENTRAL + CTA** — a frase (`vilão → mecanismo™ → promise`) + próximo passo do comprador (diagnóstico/avaliação/reserva, per GTM do nicho). `← §POSICIONAMENTO + §1`

**Invariantes do arquivo:** mecanismo™ verbatim em ≥3 âncoras (título + §2 + §7) · garantia exatamente 2x (§1 embutida + §5 completa) · zero número divergente entre seções (o N da promise = N da garantia = N do math). Template em `ofertas/_modelo/oferta.md`.

---

## 11. Princípios de naming de mecanismo

Mecanismo único é nome proprietário do sistema instalado. Funciona como branding.

**Princípios:**
- **Curto** — ≤ 3-4 palavras, fácil de lembrar e falar
- **Descreve o MECANISMO, não o status** — a palavra de função é sempre uma AÇÃO que o sistema executa (Frame A: Reativação, Qualificação, Agendamento) ou uma METÁFORA CONCRETA (Frame D: Ímã, Radar, Blindagem). NUNCA identidade/destino ("Pro", "Master", "Dono", "Expert") — isso nomeia quem o cliente vira, não o que a máquina faz
- **Derivado dos dados** — o nome nasce do hero pain + gap (o `/posicionar` deriva; ninguém batiza no vácuo)
- **Sufixos válidos:** Sistema, Motor, Máquina, Protocolo, Infraestrutura, Radar, Ímã, Método

**Exemplos de estilo (calibrar o TIPO, não copiar):**
- Blindagem de Agenda (blindagem = metáfora concreta contra no-show)
- Motor de Reativação de Pacientes (reativação = ação)
- Radar de Leads Qualificados (radar = metáfora concreta)
- Sistema de Agendamento Qualificado (agendamento = ação)

> **Importante:** mecanismo único = branding único. Cada oferta tem seu nome proprietário. Naming = positioning. Cria comparações irrelevantes com competidores commoditizados.
