---
title: "Scripts de Venda (humano)"
type: scripts-venda/index
created: pendente
---

# Scripts de Venda

Scripts pra **humanos** (SDR / closer / recall). Diferente de `funcionarios/` que são agentes IA. Aqui são roteiros pra time comercial humano usar em ligações e calls.

## Lista de scripts

| Slug | Tipo | Pra qual oferta | Status |
|---|---|---|---|
| (vazio) | | | |

## Tipos típicos

- **SDR / triage** — primeira ligação pro lead que entrou
- **Closer call** — call de fechamento (45-60 min)
- **Recall / follow-up** — reativação de leads que sumiram
- **Discovery** — primeira reunião B2B (consultoria/ROI)

## Como criar

Pode pedir ao Claude: "Cria script de [tipo] pra oferta {SLUG}".

Skill puxa `ofertas/[slug]/` + `nicho/03-objecoes.md` + `nicho/04-linguagem-tipica.md` e gera script estruturado.

## Diferença vs funcionarios/

| funcionarios/[VENDEDOR] | scripts-venda/closer-call |
|---|---|
| Agente IA executa autonomamente | Humano executa |
| 24/7 disponível | Horário comercial |
| Volume alto, valor baixo-médio | Volume baixo, valor alto |
| Qualifica + agenda | Fecha + onboarding |

Geralmente trabalham em conjunto: funcionário IA qualifica, closer humano fecha.
