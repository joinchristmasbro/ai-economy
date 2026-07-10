---
title: "Ofertas — índice mestre"
type: ofertas/index
created: pendente
---

# Ofertas

Cada oferta estruturada via `/criar-oferta` vira uma pasta aqui. A oferta completa fica num único `oferta.md` — 7 seções, cada uma rastreável a uma seção do `_constructs.md` (frase sem rastro não entra). Template em `_modelo/oferta.md`.

## Lista de ofertas

| Slug | Mecanismo único | Status | Camada | Iniciada em |
|---|---|---|---|---|
| (vazio) | | | | |

## Status possíveis

- **rascunho** — oferta criada, ainda em refinamento
- **validando** — testando com 3-5 conversas reais
- **ativa** — vendendo pra clientes (registrar quais em [[../clientes/_index]])
- **pausada** — não vendendo no momento
- **descartada** — testou e não funcionou (mantém pra histórico)

## Como criar

```
/criar-oferta
```

A skill lê o `_constructs.md` inteiro (fundação já instalada), faz **no máximo 2 perguntas** (capacidade de entrega + prova real) e compila `oferta.md` com 7 seções traceáveis. O mecanismo vem do `/posicionar`, o preço do `/precificar` — a skill nunca pede pro operador inventar. Requer a cadeia `/mapear-mercado → /escanear-concorrencia → /posicionar → /precificar` completa.
