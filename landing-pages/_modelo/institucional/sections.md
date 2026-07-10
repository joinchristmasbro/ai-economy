---
type: lp-sections-spec
lp-type: institucional
---

# Sections — LP Institucional

Arquitetura visual de uma página homepage de empresa/clínica/escritório.

## Hierarquia visual

| Section | Altura aprox | Peso | Animation |
|---------|-------------:|------|-----------|
| Nav | 64-80px | Sticky com glassmorphism `backdrop-blur(20px)` | fade-in on load |
| Hero | 80-100vh | Forte | fade-up no headline (delay 100ms), 200ms entre elementos |
| Logo bar | 80-120px | Faixa fina | grayscale → color on hover |
| Pillar features | 50-70vh | Médio | scroll-driven fade-up por card |
| Storytelling | 40-60vh | Médio | reveal on view (CSS `animation-timeline: view()`) |
| Use cases | 50-70vh | Médio | tab/carousel se >3 |
| Prova social | 50-70vh | Forte | testimonial cards com hover state |
| Pricing teaser | 30-40vh | Leve | – |
| FAQ | 40-60vh | Leve | accordion smooth (Motion `<AnimatePresence>`) |
| Footer CTA | 30-40vh | Médio | reveal on view |
| Footer | 40-50vh | Faixa | – |

**Total:** ~6-8 viewport heights de scroll.

## Animation principles

- **Easing premium:** `cubic-bezier(0.16, 1, 0.3, 1)` (out-expo) em entradas
- **Durations:** 0.45s (small), 0.7s (medium), 1.2s (hero)
- **Stagger entre elementos:** 80-200ms
- **Sempre `prefers-reduced-motion`** — animação só se OK do usuário
- **Scroll-driven nativo CSS** sempre que possível (substitui scroll libs JS)

## Componentes esperados

- `<Nav>`
- `<Hero>` (com 2 CTAs + visual)
- `<LogoBar>`
- `<FeatureBento>` ou `<FeatureGrid>`
- `<Story>` (texto + imagem alternados)
- `<UseCasesTabs>` ou `<UseCasesGrid>`
- `<TestimonialGrid>` (3 colunas desktop, 1 mobile)
- `<PricingTeaser>`
- `<FAQ>` (accordion)
- `<FooterCTA>`
- `<Footer>`

## Padrões visuais de referência (por DESCRIÇÃO — §26, zero nome real)

- SaaS premium — minimalismo + UI shots
- fintech premium — clareza + whitespace
- produto institucional premium — confiança institucional
- agência BR de referência — prova + presença local
