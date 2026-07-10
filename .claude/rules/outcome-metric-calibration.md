# Outcome Metric Calibration — Framework do Installer (CALIBRATION-CORE §28)

> **§27 impede INVENTAR número. §28 dá a inteligência de QUAL número faz sentido por nicho.** "12 agendamentos/mês" pode ser forte em solar (ticket alto, ciclo longo, capacidade limitada) e fraco/estranho em odonto geral, fitness, jurídico, reforma ou B2B. O número certo é **calibrado** por nicho, ticket, volume operacional e economia da oferta — nunca copiado de outro nicho.
>
> **Aplica a:** `/mapear-mercado`, `/criar-oferta`, `/precificar`, `/criar-lp`. Rodar ANTES de usar número em headline, garantia, oferta ou LP.

═══════════════════════════════════════════════════

## 1. OUTCOME UNIT — a unidade certa do resultado

Antes de prometer número, definir a UNIDADE de valor. 🔴 **NUNCA usar "lead" como default** — cada nicho tem uma unidade diferente.

**Unidades possíveis:** lead qualificado · agendamento qualificado · consulta comparecida · orçamento solicitado · orçamento retomado · proposta enviada · reunião comercial · avaliação presencial · instalação vendida · paciente de tratamento específico · aluno matriculado · oportunidade reativada · carrinho recuperado · chamada de diagnóstico.

- **High-ticket / local service:** a unidade boa sobe na escada de compromisso — lead qualificado → agendamento → comparecimento → proposta/orçamento. Prometer o elo que o sistema CONTROLA e que ainda é desejável.
- **Oferta regulada:** evitar prometer o desfecho final que não controlamos (§12/§20) — a unidade fica no comercial/operacional (agendamento/comparecimento/orçamento), nunca no clínico.

## 2. VOLUME SUITABILITY — o número bom não é o maior

Estimar o PERFIL de volume antes de usar número: baixo-volume/alto-valor · médio/médio · alto-volume/baixo-valor · recorrente · sazonal · limitado por capacidade · por equipe · por território · por ciclo de venda · por agenda.

**Exemplos por nicho (ilustram o raciocínio, não são fórmula):**
- **Solar:** alto ticket · ciclo maior · instalação com capacidade limitada → **12 agendamentos qualificados/mês pode ser promessa FORTE**.
- **Dentista geral:** mais capacidade de consulta · várias cadeiras · ticket varia muito → **12 consultas/mês pode ser BAIXO se geral**, mas relevante se for tratamento de alto valor (implante/orto/estética).
- **Box/studio:** limite por turma/agenda/capacidade → avaliar vagas abertas/ocupação/churn/reativação; número = avaliações qualificadas/mês ou vagas preenchidas; **fechamento NÃO é totalmente controlado**.
- **Jurídico:** depende da área; volume alto é RUIM se o lead não for qualificado; unidade = consulta qualificada ou caso elegível.
- **Reformas/HVAC:** depende de equipe/ticket/região/capacidade; **orçamentos qualificados > leads**.

🔴 **REGRA: número bom = o número que** (a) cria desejo · (b) parece crível · (c) cabe na capacidade do cliente · (d) sustenta ROI · (e) não força promessa fora do controle · (f) não atrai lead ruim · (g) respeita o ciclo de venda. **NÃO é o maior número.**

## 3. PROMISE RANGE — faixa sugerida, não número solto

**Inputs (usar o que existir; marcar o que faltar):** ticket médio/AOV · margem · LTV · capacidade mensal · taxa de comparecimento · taxa de fechamento · ciclo de venda · oferta vendida · verba de mídia · CAC máximo aceitável · maturidade do ICP · histórico do cliente · benchmarks pesquisados.

**Output:**
- **Unidade recomendada**
- **Faixa conservadora**
- **Faixa agressiva**
- **Número público recomendado** (só se validado — §4)
- **Número proibido / arriscado**
- **Justificativa** (capacidade · ticket · SLA · verba · maturidade · ciclo)

**Exemplo de output:**
> Unidade recomendada: avaliação qualificada agendada · Faixa conservadora: 8–12/mês · Faixa agressiva: 15–25/mês · Número público recomendado: **12/mês SÓ se houver garantia operacional real** · Não usar: "50 avaliações/mês" sem capacidade/prova · Justificativa: capacidade + ticket + SLA + verba + maturidade + ciclo.

## 4. OS 4 TIPOS DE NÚMERO — classificar ANTES de usar

| Tipo | Fonte | Onde pode ir |
|---|---|---|
| **1. Validado** | case · garantia definida · histórico próprio · input confirmado | ✅ copy PÚBLICA (H1 / garantia / promessa direta) |
| **2. Estimado** | cálculo interno dos inputs | só NOTAS internas OU proposta com disclaimer — NUNCA headline pública |
| **3. Pesquisado** | pesquisa de mercado / benchmark externo | apoia o raciocínio — NÃO vira promessa sem validação |
| **4. Desejado** | meta comercial do fundador | orienta a oferta — NÃO vira promessa pública sem capacidade/prova |

🔴 **Só número VALIDADO vai pra H1, garantia ou promessa pública direta.** Os outros 3 ficam nas notas.

## 5. QUANDO NÃO HOUVER NÚMERO — perguntar melhor (não chutar)

Perguntar ao operador: Qual unidade você quer prometer? · Quantos [unidade] você consegue entregar com segurança? · Qual a capacidade mensal real do cliente? · Ticket médio da venda? · Fechamento médio esperado? · Verba de mídia mínima? · Qual número seria pequeno demais pra o comprador se importar? · Qual seria grande demais pra parecer mentira? · Qual número você aceita colocar em garantia operacional?

Se o operador não souber → o sistema **sugere uma faixa INTERNA** (do §3), marca **[D.I.]**, e NÃO usa publicamente.

## 6–9. INTEGRAÇÃO (por skill)

- **/mapear-mercado** — coletar sinais de volume: ticket médio · LTV · capacidade típica · ciclo de venda · frequência de compra · gargalo operacional · valor de UMA oportunidade · termos do mercado · **qual a unidade de valor** (lead/consulta/orçamento/matrícula/instalação/proposta). Não só achar dor — ajudar a definir a promessa numérica natural do nicho.
- **/criar-oferta** — seção **"Métrica de Promessa"**: outcome unit · número validado (se houver) · faixa interna sugerida · número público permitido · número proibido · garantia possível · inputs faltantes.
- **/precificar** — usar a métrica pra VALIDAR ROI: X [unidade]/mês → vendas potenciais → ticket → margem → capacidade do cliente → sustenta setup + recorrência? **Não copiar número bonito de outro nicho.**
- **/criar-lp** — só usar número no H1 se validado/garantia/input; + checar: o número é atrativo pro nicho? cabe na capacidade? crível? unidade certa? controlável? Se não passar → **H1 outcome-first SEM número**.

═══════════════════════════════════════════════════

## ANTI-PATTERN (o erro que esta regra mata)

🔴 **Copiar "12 appointments/mês" (ou qualquer número bonito) de um nicho pra outro.** Cada nicho calibra do zero: unidade + volume + economia. Solar ≠ odonto geral ≠ odonto de implante ≠ fitness ≠ jurídico ≠ reforma. Um número que é forte num é fraco, inatingível ou atrai-lead-ruim no outro.

## VERIFICAÇÃO

- [ ] Outcome unit definida (não "lead" por default)?
- [ ] Volume suitability estimado (perfil + o que limita)?
- [ ] Promise range (conservadora / agressiva / público / proibido) com justificativa?
- [ ] Número classificado (validado / estimado / pesquisado / desejado)? Só validado na pública?
- [ ] Número calibrado ao NICHO (capacidade/ticket/ciclo), NÃO copiado de outro nicho?
- [ ] Sem número validado → H1/promessa sem número + faixa interna [D.I.] nas notas?

═══════════════════════════════════════════════════

## Changelog
- **2026-07-09** — Criado na Rodada 4.3. Dá inteligência de QUAL número por nicho (§28), sobre a integridade-de-métrica da §27 (não inventar). Framework: Outcome Unit + Volume Suitability + Promise Range + 4 tipos de número + perguntas + integração nas 4 skills.
