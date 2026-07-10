---
type: lp-sections-spec
lp-type: diagnostico
arquitetura: "Tipo 1 — Diagnóstico / Auditoria Premium"
---

# Sections — LP Diagnóstico / Auditoria Premium (Tipo 1)

Anatomia de uma LP high-ticket de infra que VENDE UMA AUDITORIA — não a solução direta.
A perda lidera (§18), UMA metáfora dominante governa a página (§19), o mecanismo só aparece na metade de baixo.

> **§26:** referências visuais descritas por PADRÃO, nunca por nome real (plataforma/produto/site).

## Hierarquia visual

| Section | Altura aprox | Peso | Animation |
|---------|-------------:|------|-----------|
| Nav (sticky, glass sutil) | 64-80px | Leve | fade-in on load |
| **1. Hero — a perda** | 85-100vh | **Forte** | fade-up no headline (delay 100ms), stagger 120-200ms |
| **2. Cadeia operacional** | 30-50vh | **Forte** | elos revelam em sequência scroll-driven; elo de vazamento pulsa |
| 3. Métricas / benchmarks (se houver) | 30-45vh | Médio | count-up on view (números sobem) |
| **4. Convite pra auditoria** | 40-55vh | **Forte** | reveal on view + CTA com glow sutil |
| 5. Problema em cenas reais | 50-70vh | Médio | cada cena fade-up on view (stagger por card) |
| 6. Diagnóstico antes da prescrição | 40-55vh | Médio | reveal on view; checklist dos pontos examinados anima em cascata |
| 7. Old Way vs New Way | 45-60vh | Forte | 2 colunas entram de lados opostos; New Way com peso maior |
| 8. Sistema / metodologia | 50-70vh | Médio | 3 partes revelam em sequência (o mecanismo só AGORA) |
| 9. Escopo da entrega | 40-60vh | Médio | lista scroll-driven fade-up |
| 10. Garantia controlável | 35-50vh | Forte | card destacado, borda/selo animado sutil |
| 11. Preço teaser / faixa | 30-45vh | Médio | reveal on view |
| 12. FAQ | 40-60vh | Leve | accordion smooth (`AnimatePresence`) |
| 13. CTA final + For/Not For | 35-50vh | Forte | reveal on view + CTA repetido do hero |
| Footer (denso, compliance) | 40-50vh | Faixa | – |

**Total:** ~8-11 viewport heights (long-form premium).

## Cadeia operacional visual (a espinha — aparece CEDO, §18/§19)

Faixa horizontal, logo após o hero. É a metáfora dominante materializada — mostra o caminho INTEIRO da oportunidade e MARCA onde ela vaza hoje (handoff sem dono).

```
Anúncio → Lead → WhatsApp → Qualificação → Avaliação → Reativação
                    ▲ aqui vaza          ▲ aqui vaza        ▲ base parada
```

Variações por nicho (escolher UMA e manter):
- `Interesse → Conversa → Avaliação agendada → Base reativada`
- `Captação → Agendamento → Reativação → Medição`

Guia de design: elos como nós conectados; o(s) elo(s) de vazamento em cor de alerta + micro-pulse. Mobile → vertical (stack), setas viram divisores. Nunca misturar com outra metáfora (balde/roleta/motor) na mesma página (§19).

## Animation principles

- **Easing premium:** `cubic-bezier(0.16, 1, 0.3, 1)` (out-expo) nas entradas
- **Durations:** 0.45s (small), 0.7s (medium), 1.2s (hero)
- **Stagger entre elementos:** 80-200ms
- **Scroll-driven nativo CSS** (`animation-timeline: view()`) sempre que possível — substitui scroll libs JS
- **Números:** count-up só quando entram na viewport (não on-load)
- **`prefers-reduced-motion` respeitado em TODA animação** — sem exceção
- Cadeia operacional e Old/New Way são os 2 momentos de "peso" — o resto é sóbrio (LP premium, não parque de animação)

## Componentes esperados

- `<Nav>` (sticky glass)
- `<HeroPerda>` (pré-headline + headline-perda + sub + 2 CTAs + visual)
- `<CadeiaOperacional>` (faixa de elos + marcadores de vazamento)
- `<MetricasBenchmark>` (opcional — count-up)
- `<ConviteAuditoria>` (bloco de CTA da oferta real da página)
- `<CenasReais>` (grid/stack de 4-6 cenas concretas)
- `<DiagnosticoAntesPrescricao>` (tese + checklist dos pontos examinados)
- `<OldNewWay>` (tabela/2-colunas)
- `<SistemaMetodologia>` (mecanismo™ em 3 partes)
- `<EscopoEntrega>` (o que instala)
- `<GarantiaControlavel>` (card destacado)
- `<PrecoFaixa>` (teaser por maturidade)
- `<FAQ>` (accordion)
- `<CTAFinal>` + `<ForNotFor>`
- `<FooterCompliance>` (LGPD + registro profissional quando aplicável)

## Acessibilidade (baked)

- Semantic HTML (`<section>`, `<h1>` único, hierarquia de heading correta)
- `focus-visible` custom em todo CTA e item de FAQ
- Cadeia operacional: `role="list"` + `aria-label` descrevendo o fluxo (não depende só de cor pra marcar vazamento — usar ícone/texto também)
- FAQ accordion com `aria-expanded` + navegação por teclado
- Contraste OKLCH AA+ (§25 — herda tokens; nunca #000/#FFF puro)
- `prefers-reduced-motion`: animações viram fade simples ou estático
- Imagens `loading="lazy"` + `alt` real; `content-visibility: auto` below-the-fold

## Herança visual (§25)

Tokens (OKLCH, variable fonts, fluid clamp, raio, sombra, motion) vêm do `design-tokens.json` herdado do `/marca` — bloco `meta.market_design_archetype` governa a direção. Zero improviso, zero drift. Sem marca definida → arquétipo do nicho + provisório nas notas internas (nunca na copy).

## Referências visuais (por PADRÃO — §26, nunca por nome)

- Padrão SaaS-institucional minimalista: whitespace generoso, UI shots, tipografia forte
- Padrão de página de aplicação high-ticket: hero-perda + qualificação por For/Not For
- Padrão de dashboard/command-center premium: a cadeia operacional lê como diagrama de sistema, não como infográfico de marketing
