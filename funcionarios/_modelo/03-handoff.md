---
title: "Handoff — {NOME-DO-FUNCIONARIO}"
type: funcionario/handoff
slug: "{SLUG}"
---

# Handoff pra humano

Critérios e processo pro agente passar a conversa/tarefa pra humano.

## Quando passar pra humano

### Sinais que disparam handoff automático

- Cliente pede explicitamente "falar com humano"
- Tópico fora do escopo do agente (referenciar [[00-perfil]])
- Objeção fora da biblioteca (referenciar `nicho/03-objecoes.md`)
- Sentimento detectado: frustração / raiva / urgência grave
- Solicitação de exceção (desconto, prazo, condição especial)
- Risco de compliance detectado

### Sinais que NÃO disparam handoff

- Pergunta repetida ou óbvia
- Cliente curioso (pode tratar com FAQ)
- Pergunta de processo (agente sabe responder)

## Como o handoff acontece

### Mensagem ao cliente

"[exemplo de mensagem ao cliente] — vou conectar você com {nome do humano}, ele vai te responder em até {tempo}."

### Notificação interna

- **Canal:** [Slack/Discord/CRM]
- **Conteúdo:** resumo da conversa + sentimento + tópico + urgência
- **Quem recebe:** [pessoa ou time]

### Continuidade

- Conversa fica visível pro humano (não recomeça do zero)
- Histórico salvo em CRM (referenciar [[02-tools]])

## SLAs de resposta humana

| Urgência | SLA |
|---|---|
| Alta (cliente bravo) | ≤ 15 min |
| Média (objeção) | ≤ 1 hora |
| Baixa (curiosidade) | ≤ 4 horas |

## Aprendizado pós-handoff

Quando humano resolveu algo que o agente deveria ter resolvido sozinho, atualizar:
- [[01-prompt]] — adicionar resposta no scope
- `nicho/03-objecoes.md` — adicionar nova objeção
- `nicho/04-linguagem-tipica.md` — capturar nova linguagem

Esse loop melhora o agente ao longo do tempo.
