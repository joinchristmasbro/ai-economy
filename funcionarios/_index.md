---
title: "Funcionários IA"
type: funcionarios/index
created: pendente
---

# Funcionários IA

Agentes especializados que operam funções específicas no negócio (do aluno ou do cliente). Cada agente é uma pasta com perfil + prompt + tools + handoff.

## Lista de funcionários ativos

| Slug | Role | Operando para | Canal | Status |
|---|---|---|---|---|
| (vazio) | | | | |

## Roles típicos

- **vendedor** — qualifica leads, trata objeções, agenda calls (24/7 WhatsApp/chat/ligação)
- **pesquisador** — coleta info de mercado, monitora competidores, cria relatórios
- **atendente** — atende dúvidas pós-venda, escalonamento pra humano
- **follow-up** — sequência de reativação de leads/clientes
- **relatorio** — gera reports periódicos (semanal/mensal)
- **sdr** — prospecção ativa B2B (LinkedIn/email)
- **outro** — definir papel customizado

## Como criar funcionário novo

```
Pode pedir ao Claude: "Crie um funcionário IA vendedor pra WhatsApp pra cliente X"
```

Skill copia `_modelo/`, preenche com perfil + prompt + tools + handoff baseado nas perguntas do Claude. Cada funcionário em pasta própria.

## Reusabilidade

Funcionário pode ser:
- **Interno do aluno** — opera o negócio do aluno (ex: pesquisador de mercado pra atualizar `nicho/`)
- **Pra cliente específico** — opera no negócio de um cliente (ex: vendedor WhatsApp pra cliente X)
- **Template replicável** — versão genérica que customiza pra múltiplos clientes do mesmo perfil
