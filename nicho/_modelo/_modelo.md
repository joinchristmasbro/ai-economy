---
type: nicho-modelo-readme
---

# `nicho/_modelo/` — Template do nicho

Estrutura de referência usada por `/trocar-nicho` quando arquiva nicho atual + cria novo.

## Os 12 arquivos do cérebro do nicho

```
00-perfil-cliente-alvo.md     ← ICP do nicho (quem é a empresa-target)
01-dores.md                   ← top 5 dores (populadas pelo /setup multi-agent)
02-custo-inacao.md            ← o que acontece se o nicho NÃO resolver
03-objecoes.md                ← objeções recorrentes pra contornar
04-linguagem-tipica.md        ← top 20 termos do nicho (capturado real)
05-resultados-vendaveis.md    ← outcomes que o nicho compra
06-atuadores.md               ← 3-5 players principais com pricing
07-tendencias.md              ← swipe file (LPs, ads, posts) + padrões
08-benchmarks.md              ← métricas de mercado (CPL, close rate, ticket)
09-tamanho-mercado.md         ← TAM/SAM/SOM estimados
10-headlines.md               ← 10-15 headlines de copy ranqueadas
11-riscos-compliance.md       ← regulamentações + restrições do nicho
```

## Quem popula

- `/setup` (multi-agent) → popula 01, 04, 06, 07, 09 com pesquisa inicial
- `/mapear-mercado` → aprofunda os 12 arquivos
- `/escanear-concorrencia` → atualiza 07
- `/copiloto` → refina 03, 05, 10 baseado em conversas

## Frontmatter obrigatório em cada arquivo

```yaml
---
type: nicho-[X]
last-update: ISO date
sources:
  - "[scout-name]:url"
  - "[scout-name]:url"
confidence: gold | silver | bronze
---
```

## Source marking nos claims

Todo claim em arquivos do nicho/ deve ter source inline:
- `[GOLD]` — 2+ scouts independentes apoiam
- `[SILVER]` — 1 fonte autoritativa OR 2 secundárias
- `[BRONZE]` — 1 fonte única, sem corroboração

Exemplo:
```markdown
- [GOLD] CPL médio do nicho odonto: R$80-120 [Reddit r/dental_marketing | webSearch:abnt]
- [BRONZE] Close rate em call >60% [estimativa empresa-x.com]
```

## Cadence de atualização

- `/setup` cria seed inicial
- `/mapear-mercado` aprofunda (ad-hoc, ~30min cada vez)
- Refresh trimestral recomendado (mercado muda)
- `/atualizar` detecta drift se conteúdo >90d sem update
