---
title: "_modelo — template de oferta"
type: oferta/modelo
created: pendente
---

# Modelo de oferta

> **Modelo canônico:** [[oferta]] — arquivo único de 7 seções traceáveis, é o output real de `/criar-oferta`.

Ao rodar `/criar-oferta`, a skill cria `ofertas/[slug]/oferta.md` diretamente (deriva cada campo do `_constructs.md`, faz no máx. 2 perguntas). Este `_modelo/` serve como referência da estrutura — ver [[oferta]].

## Registros por oferta (opcionais, ao lado do `oferta.md`)

Cada pasta `ofertas/[slug]/` pode manter:

- **Decisões e iterações** — cada ajuste relevante vira uma linha (registro de evolução)
- **Onde foi vendida** — lista de [[../../clientes/_index|clientes]] que compraram (atualizar ao fechar contrato)

## [LEGADO — não usar como modelo novo]

Os arquivos numerados abaixo descrevem o formato ANTIGO (Briefing de 4 seções, fluxo de 5 perguntas). `/criar-oferta` agora gera `oferta.md` único de 7 seções — ver [[oferta]]. Mantidos só como histórico:

- [[01-oferta-o-que]] · [[02-estrutura-o-como]] · [[03-persona-o-quem]] · [[04-marca-o-tom]]
