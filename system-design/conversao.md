---
title: "Camada de Conversão"
type: system-design/conversao
created: pendente
status: pendente
---

# Camada de Conversão

Como o lead vira cliente pagante. Sistema entrega taxa de fechamento previsível.

## Componentes do sistema

### Pré-venda automatizada
- **Sequência de educação:** [3-5 mensagens antes da call]
- **Canal:** [WhatsApp + email] ou [só WhatsApp]
- **Conteúdo:** [casos + frequently asked + objeção principal]

### Agendamento qualificado
- **Plataforma:** [Calendly / Cal.com / GHL]
- **Slots úteis:** [duração + buffer]
- **Confirmação automática:** [WhatsApp/SMS + email]
- **Lembrete:** [24h antes + 1h antes]

### Vendedor IA (se aplicável)
- **Função:** qualificar antes de passar pro closer humano OU fechar 100% autônomo
- **Configuração:** referenciar `funcionarios/[VENDEDOR]/`
- **Handoff:** quando passa pro closer humano
- **Canais:** WhatsApp / chat / ligação

### Closer humano (se aplicável)
- **Script:** referenciar `scripts-venda/closer-call.md`
- **Biblioteca de objeções:** referenciar `nicho/03-objecoes.md`
- **Treinamento:** Loom + casos reais

### Follow-up multicanal
- **Não compareceu:** [sequência de reativação]
- **Não fechou:** [sequência de objeção tratada]
- **Janela:** [N dias de follow ativo]

### Recuperação de no-show
- **Triage script:** referenciar `scripts-venda/sdr-prospeccao.md`
- **SLA de resposta:** [≤ N min após no-show]

## Mecanismos IA aplicáveis

(referenciar `_contexto/framework-oferta.md`)

## KPIs desta camada

| Métrica | Alvo |
|---|---|
| Show-up rate | [X-Y%] |
| Close rate | [X-Y%] |
| Tempo de ciclo | [N dias] |
| Recuperação de no-show | [X% retornam] |

## Stack técnica

- **WhatsApp Business + automação:** [GHL / Twilio / Assistable]
- **Calendar:** [Cal.com / Calendly]
- **CRM:** [GHL / RD]
- **VSL hosting:** [Wistia / Vimeo / próprio]

## Anti-padrões

- Lead recebendo lembrete genérico (sem contexto)
- Closer sem biblioteca de objeção
- Sem follow-up automatizado pra no-show
- Vendedor IA com tom robótico (afasta)
