---
type: lp-sections-spec
lp-type: oferta-direta
arquitetura: "Tipo 3 — Oferta Direta / Fechamento (§17)"
---

# Sections — LP Oferta Direta / Fechamento (Tipo 3)

Página de DECISÃO. Quem chega já conversou — não precisa ser educado, precisa **relembrar a perda, ver o escopo, entender preço + garantia e fechar.** Foco, ritmo curto, uma metáfora dominante (§19). Ordem obrigatória: **PERDA antes de componentes (§18)** — dor operacional → protocolo → Old vs New → entregáveis.

## Hierarquia visual (ordem da arquitetura)

| # | Section | Altura aprox | Peso | Animation |
|---|---------|-------------:|------|-----------|
| 1 | Eyebrow — atenção pro ICP | 40-60px | Faixa fina | fade-in on load |
| 2 | Hero — promessa direta (+2 CTAs) | 70-90vh | Forte | fade-up headline (delay 100ms), 200ms entre elementos |
| 3 | "Isso é pra você se…" | 30-40vh | Médio | scroll-driven fade-up por bullet |
| 4 | **Dores operacionais — cenas (a PERDA)** | 55-75vh | **Forte** | reveal on view por cena, stagger 80-120ms |
| 5 | Protocolo/sistema + cadeia operacional | 50-70vh | Forte | faixa da cadeia anima da esquerda → direita |
| 6 | Old Way vs New Way | 45-60vh | Forte | 2 colunas revelam em contraste (Old esmaece, New acende) |
| 7 | Entregáveis (o que instala) | 50-70vh | Médio | grid de cards, scroll-driven fade-up |
| 8 | Garantia controlável | 35-50vh | Forte | card destacado, borda/glow sutil |
| 9 | Preço (investimento em infra) | 40-55vh | Forte | card de preço com hover state premium |
| 10 | **For / Not For** | 40-55vh | Forte | 2 colunas lado a lado (✅ / ❌) |
| 11 | FAQ | 40-60vh | Leve | accordion smooth |
| 12 | CTA de fechamento (faixa final) | 35-50vh | **Forte** | reveal on view + botão com destaque |
| — | Footer mínimo (+ compliance se regulado) | 20-30vh | Faixa | – |

**Total:** ~7-9 viewport heights. Curta o suficiente pra decidir sem cansar; densa o suficiente pra fechar.

## Cadeia operacional (faixa visual — aparece na section 5)

Diagrama horizontal, uma metáfora só. Renderizar como pill/etapas conectadas por seta:

> `{Anúncio/Interesse} → {Lead/Conversa} → {WhatsApp/Qualificação} → {Avaliação/Reunião agendada} → {Reativação da base}`

Cada etapa acende em sequência no scroll (respeitando `prefers-reduced-motion`). Sem misturar ícones de metáforas concorrentes (§19).

## For / Not For — anatomia

Bloco de contraste (section 10) — 2 colunas equilibradas, decisão honesta:

- **Coluna FOR (✅):** 3 condições do ICP certo — base/equipe/custo fixo, aceita processo/SLA, verba+maturidade pra infra. Cor semântica de "sim" (success token do `design-tokens.json`).
- **Coluna NOT FOR (❌):** 3 desqualificadores — quer gestor de tráfego barato, sem verba/oferta/agenda/time, quer terceirizar fechamento ou faturamento garantido. Cor semântica de "atenção/erro" (muted, nunca agressivo).
- Efeito: aumenta valor percebido e corta o prospect errado ANTES do preço morder. Não é bravo — é filtro.
- Mobile: colunas empilham (FOR em cima), nunca perdem o contraste visual.

## Componentes esperados

- `<Eyebrow>` — linha fina que nomeia o ICP
- `<HeroDireto>` — promessa direta + 2 CTAs (primário fecha, secundário ancora nos entregáveis)
- `<QualificaBullets>` — "isso é pra você se…" (3-5 bullets)
- `<CenasDaPerda>` — as dores operacionais em cenas (o coração da PERDA, §18)
- `<CadeiaOperacional>` — faixa de etapas conectadas (o mecanismo™ visual)
- `<ProtocoloParts>` — partes do sistema, cada uma com a consequência
- `<OldVsNew>` — tabela/2-colunas de contraste (fuga de categoria)
- `<EntregaveisGrid>` — o que fica instalado (cards)
- `<GarantiaCard>` — garantia controlável + fronteira do que NÃO se promete
- `<PrecoInfra>` — setup + recorrência + mídia à parte + capacidade
- `<ForNotFor>` — 2 colunas ✅/❌
- `<FAQ>` — accordion
- `<CTAFechamento>` — faixa final com um único próximo passo
- `<FooterMinimal>` — sitemap curto + compliance (se regulado, §20) + LGPD

## Animation principles

- **Easing premium:** `cubic-bezier(0.16, 1, 0.3, 1)` (out-expo) em entradas
- **Durations:** 0.45s (small), 0.7s (medium), 1.1s (hero)
- **Stagger:** 80-200ms entre elementos de uma mesma seção
- **Old vs New:** o "Old" entra dessaturado/menor, o "New" acende — reforça o contraste sem texto extra
- **Scroll-driven nativo CSS** (`animation-timeline: view()`) sempre que possível; libs JS só quando o efeito exigir
- **Sempre `prefers-reduced-motion`** — se o usuário pediu menos movimento, tudo vira fade simples ou estático

## Acessibilidade (A11y)

- HTML semântico: `<header>` `<main>` `<section>` `<footer>`; headings em ordem (um só `<h1>` = a promessa do hero)
- `focus-visible` custom em todos os CTAs e no accordion do FAQ; ordem de tab lógica (hero → qualificação → … → CTA final)
- FAQ accordion: `<button aria-expanded>` + `aria-controls`; painel com `role="region"`; navegável por teclado (Enter/Espaço)
- For/Not For: NÃO depender só de cor pra sinalizar sim/não — usar ícone + rótulo textual (✅ "É pra você" / ❌ "Não é pra você") pra daltônicos
- Cadeia operacional: se decorativa, `aria-hidden`; se informativa, dar `alt`/`aria-label` descrevendo as etapas em texto
- Contraste OKLCH ≥ 4.5:1 (texto normal) / ≥ 3:1 (texto grande e ícones) — validar contra o `design-tokens.json`
- Card de preço e garantia legíveis por leitor de tela na ordem correta (não esconder valor só em imagem)
- Botão de fechamento (CTA final) com rótulo de ação explícito, não "clique aqui"
- Respeitar `prefers-reduced-motion` em TODA animação (§ animation principles)
- Fundo nunca `#FFFFFF`/`#000000` puro — OKLCH sutil, mantendo contraste

## Padrões visuais de referência (por descrição — §26, nunca nome real)

- **Página de fechamento high-ticket:** hero direto que assume o contexto da conversa anterior, sem re-explicar o óbvio; ritmo de decisão, não de descoberta.
- **Contraste Old/New premium:** duas colunas onde a antiga esmaece e a nova acende — o design faz o argumento sem adjetivo.
- **Card de preço como investimento:** valor apresentado como instalação de ativo (setup + operação), não tabela de plano barato; whitespace generoso ao redor do número.
- **Filtro For/Not For confiante:** bloco que desqualifica de propósito, com calma — sinaliza autoridade e sobe o valor percebido.
- **Faixa de CTA final decidida:** um único próximo passo, texto de valor (não "saiba mais"), reforço de capacidade limitada real logo abaixo.

> §26 — descrever o PADRÃO, nunca a marca/produto/operador que a casa estudou. O mapa codename → referência real, se existir, vive fora do repo distribuído.
