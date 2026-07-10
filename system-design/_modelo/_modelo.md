---
type: system-design-modelo
---

# `system-design/_modelo/` — Estrutura de arquitetura

Sistema operacional do negócio do aluno organizado por **camada operacional**. Pra cada cliente, este modelo se replica em `clientes/[slug]/system-design/` (se aplicável).

## 4 camadas

```
system-design/
├── _index.md           ← MOC do system-design
├── aquisicao.md        ← como leads chegam (canais + métricas)
├── conversao.md        ← como leads viram cliente (funil + scripts)
├── operacao.md         ← como cliente é entregue/atendido
└── metricas.md         ← KPIs por camada + dashboard
```

## Camada 1 — Aquisição

**Documenta:**
- Canais ativos (orgânico/pago/indicação)
- Pra cada canal: gasto/mês, leads/mês, CPL, ROAS
- Stack: ferramentas (Meta Ads, Google Ads, RD, GHL)
- Conteúdo: tipos que produzem (vídeo, post, email, anúncio)

## Camada 2 — Conversão

**Documenta:**
- Funil: lead → MQL → SQL → cliente
- Stages com tempo médio em cada
- Scripts: SDR, prospecção, closer, recall
- Métricas: contact rate, show-up rate, close rate
- Stack: WhatsApp, Calendly, CRM

## Camada 3 — Operação

**Documenta:**
- Onboarding: fluxo após fechamento
- Entrega: o que cliente recebe e quando
- Suporte: como cliente acessa ajuda
- Renovação: gatilhos + processo
- Stack: Notion (cliente), Slack, comunidade

## Camada 4 — Métricas

**Documenta:**
- KPIs por camada com targets
- Dashboard atual (link OR descrição)
- Reporting cadence pro próprio aluno
- Reporting cadence pro cliente

## Skills que populam

- `/setup` cria templates iniciais
- `/criar-oferta` referencia camadas
- `/playbook-cliente` evolui camada de operação
- `/atualizar` detecta drift entre system-design e realidade

## Frontmatter

```yaml
---
type: system-design-[camada]
client: optional [slug]
last-update: ISO date
status: draft | active | obsolete
---
```
