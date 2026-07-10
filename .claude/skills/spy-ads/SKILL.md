---
name: spy-ads
description: >
  DEPRECADA (2026-07-08). Use /escanear-concorrencia. Esta skill dependia da
  skill externa competitive-ads-extractor (não instalada no OS) e duplicava a
  coleta do /ad-library-scan.
---

# /spy-ads — DEPRECADA

**Use `/escanear-concorrencia`.** Ela faz tudo que esta skill prometia — e com dado verificado: coleta de ads ativos (mecânica do /ad-library-scan), score de modelabilidade em 3 sinais, THE GAP nomeado e swipe de mecanismos, atualizando o `_constructs.md`.

**Motivo da depreciação:** dependia de plugin não-instalado (`competitive-ads-extractor` + `customer-language-resonance`) — quebrava na primeira etapa — e duplicava a coleta que o `/ad-library-scan` já faz com Firecrawl.

Se você digitou `/spy-ads`, rode agora: `/escanear-concorrencia`
