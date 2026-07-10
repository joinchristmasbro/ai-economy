---
title: "Clientes ativos"
type: clientes/index
created: pendente
---

# Clientes

Cada cliente que você vende sistema vira uma pasta aqui. Um cliente = uma empresa do nicho. A pasta tem 6 arquivos numerados que correspondem às 6 fases de implantação.

## Lista de clientes

| Cliente | Status | Oferta vendida | Iniciado em | Receita atual |
|---|---|---|---|---|
| (vazio) | | | | |

## Status possíveis

- **prospect** — em conversa, ainda sem contrato
- **proposta-enviada** — proposta formal enviada
- **fechado-onboarding** — contrato fechado, fase 1 do playbook
- **ativo-implantando** — fases 2-3 do playbook (criação oferta + setup)
- **ativo-rodando** — fases 4-5 (lançamento + consolidação)
- **ativo-escalando** — fase 6 (escala)
- **pausado** — em pausa temporária
- **encerrado** — contrato terminou

## Como adicionar cliente novo

```
/novo-cliente
```

Faz mini-wizard de 5 perguntas e cria pasta com template das 6 fases. Use `/playbook-cliente` pra rodar a implantação.

## Cliente ≠ Oferta

Cada cliente recebe **uma oferta** (referenciada em `00-perfil.md`). A mesma oferta de `ofertas/` pode ser instalada em múltiplos clientes — isso é o coração do modelo "construa uma vez, instale em N empresas".
