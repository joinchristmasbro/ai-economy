---
type: marca-moc
---

# `marca/` — Identidade visual + voz

Identidade do **seu próprio negócio** (workspace global). Cada cliente em `clientes/[slug]/marca/` tem sua própria identidade independente.

## Estrutura

```
marca/
├── _index.md              ← este arquivo
├── design-guide.md        ← gerado pelo /marca (brief do arquétipo escolhido)
├── voice-guide.md         ← gerado durante uso (refinado por skills)
├── voice-dna.json         ← machine-readable (signature/never-say/anti-tone)
├── brand-tokens.json      ← gerado pelo /marca (W3C tokens OKLCH/typo/raio/motion, herdados por todo asset)
├── prompts/               ← prompts de imagem gerados por /gerar-imagem
└── assets/                ← logo SVG/PNG + fontes baixadas
```

## Como popular

**`design-guide.md` + `brand-tokens.json` são GERADOS pelo `/marca`** — não preenchidos à mão nem pelo `/setup`. O `/marca` roda um **dispatcher de arquétipo visual** (Clinical Premium · Performance Operations · Local Specialist · AI Infrastructure) ANTES de gerar os tokens, pra que a estética bata o nicho/ICP/ticket/confiança/regulação/categoria-emocional (CALIBRATION-CORE §25) — nunca um "tech-premium" padrão pra todo mundo.

1. Rode `/marca` → ele deriva o arquétipo do `_constructs.md` e popula `brand-tokens.json` (OKLCH + tipo + raio + sombra + motion + density) + `design-guide.md` (brief humano do arquétipo).
2. Todo asset visual HERDA esses tokens (zero drift) — o valor OKLCH que sai no asset é o mesmo do JSON.

**`provisional_status`** (campo no bloco `meta` do JSON) carimba a origem:
- `defined` — marca real declarada (cores/tipografia/logo), capturada e formalizada em tokens.
- `provisional-v1` — sem marca definida, o `/marca` gera um design system provisório v1 **específico ao arquétipo** (não genérico), marcado como não-final. O selo de provisório vive nas notas internas do asset, nunca na copy pública (§15).

(`voice-guide.md` + `voice-dna.json` seguem à parte — gerados/refinados durante o uso pelas skills de voz.)

## Templates disponíveis em `_modelo/`

- `brand-tokens.json` — W3C design tokens 3-camadas (primitive/semantic/component)
- `voice-guide.md` — guia humano-legível (4 dimensões NN/G + arquétipo + tom-por-contexto)
- `voice-dna.json` — machine-readable pra skills consumirem

## Skills que consultam `marca/`

**Consumidores dos brand-tokens (herdam a estética via §25):** `/criar-lp` · `/proposta` · `/criar-oferta` · `/post` · `/carrossel` · `/gerar-imagem` — todo asset visual lê `brand-tokens.json` e aplica os valores VERBATIM (zero drift).

- `/criar-lp` lê `brand-tokens.json` + `voice-dna.json`
- `/proposta` lê `brand-tokens.json` (HTML A4 herda paleta/tipo)
- `/criar-oferta` lê `brand-tokens.json` (one-page render §24) + `voice-guide.md`
- `/post` + `/carrossel` leem `brand-tokens.json` (render PNG/HTML on-brand)
- `/gerar-imagem` lê `design-guide.md` + `brand-tokens.json`
- `/copiloto` lê tudo
