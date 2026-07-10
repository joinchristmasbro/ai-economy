---
title: "Camada de Aquisição"
type: system-design/aquisicao
created: pendente
status: pendente
---

# Camada de Aquisição

Como o cliente atrai os certos. Sistema entrega leads qualificados ou inbound consistente.

## Componentes do sistema

### Tráfego pago
- **Plataforma principal:** [Meta / Google / TikTok / LinkedIn]
- **Estrutura de campanha:** [warm-up → escala horizontal → escala vertical]
- **Públicos:** [interesses + lookalike + retargeting]

### Captura
- **LP:** referenciar pasta `landing-pages/`
- **Form:** [3-5 perguntas qualificadoras]
- **Pixel + eventos:** [PageView, Lead, Schedule, Purchase]

### Qualificação inicial
- **Funcionário IA:** referenciar `funcionarios/` (vendedor de qualificação)
- **Critérios:** [poder de compra, urgência, fit]
- **Output:** lead → "qualificado" ou "não qualificado"

### Conteúdo orgânico de apoio (opcional)
- **Frequência:** [N posts/semana]
- **Plataformas:** [Instagram + LinkedIn ou outros]
- **Tema:** [educação sobre o problema, casos, autoridade]

## Mecanismos IA aplicáveis

(referenciar `_contexto/framework-oferta.md` Camada de Mecanismos IA pro perfil de mercado)

## KPIs desta camada

| Métrica | Alvo |
|---|---|
| CPL | [R$ X-Y] |
| CTR ads | [X-Y%] |
| Taxa de qualificação | [X-Y%] |
| Custo por lead qualificado | [R$ X-Y] |

## Stack técnica

- **CRM:** [GHL / RD / Pipedrive]
- **Ads platform:** [Meta Business + Google Ads]
- **LP host:** [próprio / Cartpanda / Lovable]
- **Tracking:** [Pixel + UTMs + GA4]

## Anti-padrões a evitar

- Tráfego sem qualificação automática
- LP sem captura integrada ao CRM
- Sem pixel/tracking (impossível otimizar)
- Mensagem genérica em ads (CPL alto, leads ruins)
