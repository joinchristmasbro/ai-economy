---
title: "Camada de Operação"
type: system-design/operacao
created: pendente
status: pendente
---

# Camada de Operação

Como o serviço é entregue continuamente. Sistema entrega resultado contínuo sem operação manual diária.

## Componentes do sistema

### Onboarding automatizado
- **Sequência:** [N steps automáticos pós-fechamento]
- **Outputs:** [acessos liberados + materiais entregues + primeira reunião]
- **Tempo total:** [≤ X dias]

### Atendimento contínuo
- **Funcionário IA Atendente:** referenciar `funcionarios/[ATENDENTE]/`
- **FAQ + escalonamento:** [tópicos auto-respondidos + escalonamento pra humano]
- **Canais:** [WhatsApp / chat]

### Gestão de tarefas
- **Plataforma:** [ClickUp / Notion / Asana]
- **Workflows automáticos:** [criação automática + atribuição + lembretes]

### Relatórios automáticos
- **Funcionário IA Relatório:** referenciar `funcionarios/[RELATORIO]/`
- **Cadência:** [semanal / mensal]
- **Destinatário:** [cliente / interno]
- **Conteúdo:** [KPIs + insights + ações sugeridas]

### Recall e retenção
- **Programa de retenção:** [pontos / VIP / acompanhamento]
- **Reativação de inativos:** [janela + sequência]
- **NPS automatizado:** [pós-entrega + ação no feedback]

## Mecanismos IA aplicáveis

(referenciar `_contexto/framework-oferta.md`)

## KPIs desta camada

| Métrica | Alvo |
|---|---|
| Tempo de onboarding | [≤ X dias] |
| NPS | [≥ X] |
| Churn mensal | [≤ X%] |
| Tempo de resposta atendimento | [≤ X min] |
| LTV | [R$ X-Y] |

## Stack técnica

- **Automação central:** [Make.com / N8N]
- **Atendimento:** [GHL / Twilio + IA]
- **Tasks:** [ClickUp / Notion]
- **NPS:** [Typeform / nativo CRM]

## Anti-padrões

- Operação dependente de você responder dúvidas todo dia (não é sistema)
- Onboarding sem checklist (cliente perde no início)
- Relatórios manuais (não escala)
- Sem ação no feedback NPS (irrita cliente)
