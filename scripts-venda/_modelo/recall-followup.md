---
title: "Script Recall / Follow-up"
type: script-venda/recall
slug: "{SLUG}"
---

# Script Recall — Reativação

## Contexto

Lead que entrou no funil mas:
- Não fechou na call
- Não respondeu sequência de nutrição
- Sumiu há 30/60/90 dias

Objetivo: trazer de volta ao processo sem ser invasivo.

## Abertura (15 segundos)

```
"Oi, {NOME}! Aqui é o {QUEM} do {EMPRESA}. Tudo bem?

Lembra que a gente conversou sobre {DOR/CONTEXTO} há [N] semanas? Vi que você não retornou e quis te ligar pra entender se ainda faz sentido a gente conversar."
```

(tom curioso, não cobrador)

## Perguntas-chave

### "Você resolveu?"
"Você acabou resolvendo essa questão de [DOR]?"

- **Se sim:** "Que ótimo! Posso te perguntar como?"
  → ouvir → eventualmente: "Se em algum momento [VARIAÇÃO DA DOR], a gente tá aqui."
  
- **Se não:** "Faz sentido. O que aconteceu pra você não seguir naquele momento?"
  → ouvir objeção real
  → propor próximo passo: nova call / material novo / contexto novo

### Triggers que justificam reabertura

- Você lançou nova versão da oferta
- Cliente similar fechou case nos últimos 30 dias (pode citar)
- Mudança de mercado / regulação relevante
- Nova garantia / bônus / preço

## Não fazer

- "Por que você sumiu?" (acusatório)
- "Vou te mandar de novo o link" (sem motivo)
- "Última chance" (fake scarcity)
- Repetir o mesmo pitch da call original

## Onde registrar

- CRM: status do lead (recall_attempt_1, _2, _3)
- Resposta no campo de "última interação"
- Agendar próxima tentativa apenas se cliente sinalizou abertura

## Aprendizados pós-recall

Quando recall traz lead de volta, registrar:
- O que mudou pra ele (timing? confiança? nova dor?)
- Que objeção real bloqueava antes
- Atualizar `nicho/03-objecoes.md` se for objeção nova
