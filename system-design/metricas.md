---
title: "Métricas e Inteligência de Dados"
type: system-design/metricas
created: pendente
status: pendente
---

# Métricas & Inteligência de Dados

KPIs trackados pelo sistema. Toda decisão é apoiada em dado, não em intuição. Cobre o card "Inteligência de dados" do modelo Nova Economia.

## KPIs por camada

### Aquisição
- CPL (Custo Por Lead)
- CPL qualificado (Custo Por Lead Qualificado)
- CTR (Click-through Rate)
- Taxa de qualificação inicial
- Volume de leads/dia

### Conversão
- Show-up rate
- Close rate
- Ticket médio
- Tempo de ciclo (lead → close)
- Recuperação de no-show

### Operação
- NPS
- Churn mensal
- Tempo médio de atendimento
- LTV
- MRR

### Financeiro consolidado
- CAC
- LTV/CAC ratio (alvo: ≥ 3)
- ROI por marco (mês 1, 3, 12)
- Margem operacional
- Break-even point

## Onde os dados vivem

| Sistema | O que mostra |
|---|---|
| **CRM (GHL/RD)** | Leads, pipeline, status |
| **Pixel + GA4** | Tráfego, conversões web |
| **Stripe/Asaas** | Pagamentos, MRR, churn |
| **Sheets / Looker** | Dashboard consolidado |
| **NPS tool** | Satisfação cliente final |

## Cadência de relatórios

### Diário (interno)
- Leads chegando
- Calls agendadas
- Closes do dia
- Notificações automáticas (Slack/Discord)

### Semanal
- Funil completo (cada estágio)
- Performance por criativo
- Aprendizados da semana
- Ajustes propostos

### Mensal (cliente final)
- Resultado entregue (outcomes)
- ROI mensurado
- Próximos passos

## Configuração de dashboards

### Dashboard 1: Funil em tempo real
- Visualiza leads por estágio
- Atualização automática
- Acessível a closer + cliente

### Dashboard 2: ROI consolidado
- CAC + LTV + Margem
- Comparação alvo vs real
- Acessível a cliente final + interno

### Dashboard 3: Performance criativos
- Por ad, por copy, por público
- Decisão: matar / escalar

## Anti-padrões

- Dashboard sem ação (teatro de dados)
- Relatórios manuais que ninguém lê
- Métrica vaidade sem ligação com receita
- Tracking incompleto (impossível otimizar)
