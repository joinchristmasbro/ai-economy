---
type: lp-modelo-readme
---

# `landing-pages/_modelo/` — arquiteturas de LP

Templates por **arquitetura estratégica**. O `/criar-lp` roda um dispatcher (CALIBRATION-CORE §17) que escolhe a arquitetura que VENDE aquela oferta, com justificativa — não pergunta "institucional ou obrigado".

## As 3 arquiteturas estratégicas (dispatcher §17)

| Template | Quando (o dispatcher escolhe) | Foco |
|------|-------------|------|
| **`diagnostico/`** 🔴 DEFAULT infra | high-ticket, infra instalada, IA/growth, consultivo, venda por call, prova em validação, problem-aware | Vende a PERDA → diagnóstico antes da prescrição → CTA pra auditoria |
| **`vsl/`** | vídeo/treinamento, tráfego frio, mercado pouco consciente | Educar via VSL → form/aplicação → thank-you (usa `obrigado/`) |
| **`oferta-direta/`** | prospect já conversou, pediu proposta, etapa de decisão | Promessa direta → for/not-for → CTA de fechamento |

`obrigado/` = página de agradecimento/pós-conversão (thank-you do funil VSL). `institucional/` = **legado** (o dispatcher de 3 tipos o substituiu; mantido só como referência).

## Cada arquitetura contém

- `copy-publica.md` — a copy da página (limpa, persuasiva, pronta pra usar). **É o que vira `preview.html`.**
- `copy-notes.md` — notas internas (fontes, prova em validação, compliance, claims, riscos, heroes descartados, justificativa do dispatcher). **NUNCA vai pra página (§15).**
- `sections.md` — hierarquia visual + animation principles + componentes esperados + cadeia operacional.

## Compartilhado (`_shared/`)

- `design-tokens.json` — W3C 3-camadas. **Herdado do `/marca` (§25)** — precedência `clientes/[slug]/marca/` > `marca/` (workspace); nunca paleta default.
- `components/` — componentes Next.js + shadcn/ui reusáveis.

## Stack ideal recomendado

- **Next.js 15** (App Router) + **Tailwind 4** + **shadcn/ui**
- **Motion** (ex-Framer Motion v11+) — gestures, layout, exit
- **Lenis** (smooth scroll com inércia suave)
- **CSS scroll-driven animations nativas** (substitui scroll libs JS)
- **OKLCH colors** pra consistência cross-asset (herdadas do `/marca`)

## Anti-patterns universais

❌ Verbos gringos: leverage, unlock, empower, harness, utilize, streamline, navigate, delve
❌ Adjetivos vazios: seamless, robust, comprehensive, innovative, pivotal, cutting-edge
❌ Fórmula gringa traduzida ("Ajudando X a conseguir Y em Z"), hero genérico ("We help businesses grow")
❌ Feature-first (pilar 1, pilar 2…) — vende a PERDA antes dos componentes (§18)
❌ Selos/auditoria/notas internas na copy pública (§15)
❌ Nome real de referência externa estudada (§26)
❌ `#FFFFFF`/`#000000` puro como background (OKLCH com sutileza)

## Princípios premium

✅ Linguagem específica do nicho (verbatim de `nicho/market-map.md`)
✅ PT-BR nativo, ritmo natural, frases curtas e densas (§16)
✅ Numbers concretos > adjetivos floreados · comparação concreta com a alternativa
✅ UMA metáfora dominante por LP (§19)
✅ White space generoso · variable fonts + fluid type · premium easing `cubic-bezier(0.16, 1, 0.3, 1)`
✅ `prefers-reduced-motion` respeitado · A11y baked (semantic + focus-visible + contrast OKLCH)
