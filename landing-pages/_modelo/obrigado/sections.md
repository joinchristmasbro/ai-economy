---
type: lp-sections-spec
lp-type: obrigado
---

# Sections — LP de Obrigado

Página curta, focada. **UM** próximo passo. Não desperdiçar atenção.

## Hierarquia visual

| Section | Altura | Peso | Animation |
|---------|-------:|------|-----------|
| Confirmação (H1 grande) | 40-50vh | Forte | fade-in + checkmark animado |
| Próximo passo (CTA primário) | 40-50vh | Forte | botão grande, hover state premium |
| (Opcional) VSL OU cases | 50-60vh | Médio | – |
| (Opcional) "Enquanto espera" | 30-40vh | Leve | – |
| Footer mínimo | 20vh | – | – |

**Total:** ~3-5 viewport heights (CURTA, focada).

## Animation principles

- Confirmação: checkmark com SVG animation (path-drawing 800ms ease-out)
- CTA primário: pulsing sutil OU glow on viewport (chamar atenção)
- Sem scroll-driven dramático — a página é curta

## Componentes esperados

Pra qualquer contexto pós-conversão:

- `<ConfirmationHero>` (com checkmark animado + data destacada se evento)
- `<NextStepCTA>` — UM dos seguintes baseado no contexto:
  - `<CalendlyEmbed>` (high-ticket / consultoria)
  - `<WhatsAppGroupCTA>` (eventos / grupos comunidade)
  - `<AddToCalendar>` (registro pra evento futuro)
  - `<AwaitingMessage>` (low-touch — apenas confirma)
- `<VSLBlock>` (opcional)
- `<TestimonialQuotes>` (opcional, 2-3 cards)
- `<WhileWaitingResources>` (opcional)
- `<FooterMinimal>`

## Acessibilidade

- Foco automático no botão primário ao carregar (com `prefers-reduced-motion` respeitado)
- ARIA labels em "Add to calendar" buttons
- Embed Calendly com `<iframe loading="lazy">`
- Confirmação tem `role="status"` + `aria-live="polite"`

## Padrões visuais de referência (por DESCRIÇÃO — §26, zero nome real)

- plataforma de webinar/treinamento de referência — pós-registro
- confirmação de agendamento minimalista
- padrão de pós-aplicação high-ticket
- onboarding de SaaS de referência — pós-signup
