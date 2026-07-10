---
type: lp-sections-spec
lp-type: vsl
arquitetura: "Tipo 2 — VSL / Treinamento"
---

# Sections — LP VSL / Treinamento (Tipo 2)

Página construída em torno de UM vídeo. Fluxo: dá play → assiste → aplica → thank-you. Gera 3 artefatos: **esta LP + form/aplicação + thank-you** (o thank-you usa o template `landing-pages/_modelo/obrigado/` — referenciar, não duplicar).

## Hierarquia visual

| Section | Altura aprox | Peso | Animation |
|---|---:|---|---|
| Hero (promessa + perda) | 55-70vh | Forte | fade-up no headline, stagger 80-160ms |
| VSL / player | 70-90vh | **Máximo** | player entra em foco; resto da página desaturado |
| Outcomes / cards | 40-60vh | Médio | scroll-driven fade-up por card |
| Mecanismo em 3 partes | 40-60vh | Médio | reveal on view, 1 parte por vez |
| Prova (ou alternativa) | 30-50vh | Médio | cards/quotes com hover state |
| Form / aplicação | 40-60vh | Forte | aparece/realça junto do CTA reveal |
| CTA pra call | 25-35vh | Forte | botão grande, glow sutil on view |
| Footer mínimo | 15-20vh | Faixa | – |

**Total:** ~4-6 viewport heights (a página não compete com o vídeo — é enxuta).

## Player de vídeo (hint técnico)

- Player **custom, chrome mínimo** — sem sidebar de vídeos relacionados, sem logos de plataforma pública de vídeo, nada que tire a pessoa da página.
- **Autoplay MUTADO** com botão "ativar som" grande e óbvio (autoplay com som é bloqueado e espanta), OU **gate "clique pra assistir"** com thumbnail forte.
- Barra de progresso discreta; sem menu de velocidade/qualidade competindo com o conteúdo.
- **Padrão de revelação do CTA** (definir no `copy-notes.md`):
  - **CTA atrasado** (treinamento longo): botão de aplicação aparece só depois de [N] min de vídeo.
  - **CTA visível** (vídeo curto): form/CTA já abaixo do player desde o início.
- **Legendas/CC embutidas + transcrição disponível** (A11y + quem assiste no mudo).
- `loading="lazy"` no embed; pôster leve; não deixar o vídeo bloquear o LCP.
- **Fallback:** se o player não carrega, mostrar thumbnail + link direto — nunca área vazia.

## Form gate (hint)

- **Dois formatos** (escolher no `copy-notes.md`):
  - **Lead form simples** (nome · WhatsApp · email) — inline abaixo do player OU popup pós-CTA.
  - **Aplicação qualificada** (multi-campo que filtra) — high-ticket; comunica seleção, não fila.
- **Momento de aparição:** casa com o player (visível OU atrasado).
- Validação inline, mensagens de erro claras, sem exigir campo que não vai usar.
- **Ao enviar → redireciona pra thank-you** (`landing-pages/_modelo/obrigado/`): confirmação + UM próximo passo (agendar a call · grupo · aguardar). Não duplicar aqui.
- Anti-atrito: quanto mais frio o tráfego, menos campos; qualificação pesada só faz sentido depois do vídeo.

## Animation principles

- Easing premium out-expo `cubic-bezier(0.16, 1, 0.3, 1)`; durations 0.45s / 0.7s / 1.2s; stagger 80-200ms.
- **Enquanto o vídeo toca, congelar as animações ao redor** — nada compete com o player.
- Scroll-driven CSS nativo (`animation-timeline: view()`) > libs JS de scroll.
- `prefers-reduced-motion` sempre respeitado — inclui não forçar autoplay agressivo.

## Componentes esperados (.tsx — Next.js 15 + Motion)

- `<VslHero>` (promessa + sub de perda + CTA "assistir")
- `<VideoPlayer>` (custom, chrome mínimo, CC, gate/autoplay-muted)
- `<OutcomeCards>` (3-4 cards de consequência)
- `<MechanismThreeParts>` (mecanismo™ em 3 partes)
- `<ProofBlock>` (case real OU garantia + origem-do-insight)
- `<ApplicationForm>` (lead simples OU aplicação qualificada) + `<ForNotFor>` opcional
- `<CallCTA>`
- `<FooterMinimal>`

## Acessibilidade

- **Vídeo:** legendas + transcrição textual; controles operáveis por teclado; sem autoplay com som.
- **Form:** `<label>` associado a cada campo, `aria-describedby` nos erros, foco visível custom.
- Ordem de foco lógica: hero → play → CTA/form.
- `role="status"` / `aria-live="polite"` na confirmação de envio (antes do redirect pro thank-you).
- Contraste AA; alvos de toque ≥44px.

## Padrões visuais de referência (por DESCRIÇÃO — §26, zero nome real)

- Estética de **plataforma de webinar/treinamento premium**: palco escuro focado no vídeo, UI ao redor discreta.
- Player no estilo de **VSL de oferta high-ticket**: sem distrações, CTA que emerge no tempo certo.
- Página de aplicação no estilo de **funil de seleção consultiva**: poucos campos, tom "vamos ver se faz sentido", não formulário burocrático.
- Herdar paleta / tipo / raio / motion do `marca/brand-tokens.json` conforme o arquétipo do nicho (§25) — nunca "tech-premium" default.
