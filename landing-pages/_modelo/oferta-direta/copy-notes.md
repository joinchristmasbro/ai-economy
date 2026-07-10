---
type: lp-notas-internas
arquitetura: "Tipo 3 — Oferta Direta / Fechamento (§17)"
slug: "{SLUG}"
client: "{CLIENT-SLUG}"        # opcional
visibility: "INTERNO — nunca renderiza no preview.html, nunca vai pra página (§15)"
---

# Notas Internas — LP Oferta Direta / Fechamento (Tipo 3)

> **NUNCA vaza pra copy pública nem pro `preview.html` (§15).** Aqui moram as fontes, a prova, o compliance, os claims classificados, a justificativa do dispatcher e os heroes descartados. O `preview.html` renderiza EXCLUSIVAMENTE `copy-publica.md`.

---

## 1. Justificativa do dispatcher (§17 — obrigatória, do Passo 1)

```
ARQUITETURA ESCOLHIDA: Tipo 3 — Oferta Direta / Fechamento
Por quê: {1-2 frases — o prospect JÁ conversou / pediu proposta / está na decisão; a página revisa oferta, preço, escopo e garantia pra fechar, não pra educar do zero}
Sinais do DNA que levaram aqui: {estágio de consciência = solution/most-aware · etapa = pós-conversa/pedido de proposta · ticket + complexidade · prova = {existe/em validação} · canal = {indicação/warm/resposta a interesse}}
Tipo descartado + por quê:
  - Tipo 1 (Diagnóstico/Auditoria) descartado — {ex: o prospect JÁ passou pelo diagnóstico; não precisa ser convidado a auditar de novo, precisa decidir}
  - Tipo 2 (VSL/Treinamento) descartado — {ex: não é tráfego frio; não precisa de vídeo educando o mercado antes da call}
```

## 2. Heroes descartados (§ Passo 3 — os 2 que NÃO foram pra pública)

[Gerar 3 variações de hero, escolher 1 pra copy-publica, guardar as outras 2 aqui pra A/B teste.]

- **Hero ESCOLHIDO (foi pra pública):** `{texto}` — por quê: {justificativa}
- **Hero alternativo A (Direto):** `{texto}` — testar contra o escolhido em {situação}
- **Hero alternativo B (Diagnóstico/Premium):** `{texto}` — testar se {hipótese}

## 3. Prova — status real (§14)

[Onde a prova de verdade está. Se não há case maduro do ICP atual, declarar AQUI — na pública isso vira garantia/transparência/origem do insight, nunca "sem case".]

- Case real do ICP atual? {sim/não/em validação}
- Se em validação: {o que existe} — marcado **em validação**, NÃO usado como manchete pública.
- Case de ICP anterior existe? → só como HISTÓRICO DE APRENDIZADO (`[FATO-USUÁRIO]`/`[HIPÓTESE]`), NUNCA como prova da oferta nova.
- Plano de captura do 1º case real: {qual — normalmente sai no `/plano-validacao`}.
- Depoimentos/logos inventados? **NÃO** (regra dura). Vazio > falso.

## 4. Claims classificados (§2 / §6 — taxonomia dos 7 selos)

[Todo número/afirmação forte da copy pública mapeado ao selo de origem. Prova operacional de que a página não afirma o que não sustenta.]

| Afirmação na copy | Selo | Fonte / evidência |
|---|---|---|
| {ex: custo da inação} | [BRONZE] / [INFERÊNCIA-OS] | {conta aberta / premissa} |
| {ex: benchmark de mercado} | [SILVER] | {fonte setorial} |
| {ex: número que o concorrente anuncia} | [CLAIM-CONCORRENTE] | {LP do player — prova o que a página DIZ, não que é verdade} |
| {ex: dor verbatim do ICP} | [GOLD-ICP] | {fórum/entrevista/review rastreável} |
| {ex: preço do setup} | [FATO-USUÁRIO] | {definido no /precificar} |

> Regra dura: não misturar GOLD-ICP com GOLD-LP · nada de "[GOLD]" genérico · claim de concorrente = `[CLAIM-CONCORRENTE]` mesmo visto na LP.

## 5. Compliance (§20 — se nicho regulado)

[Preencher SÓ se saúde/estética/clínica/nutrição/odonto/emagrecimento/área regulada. Disclaimer fica aqui + no footer; NUNCA vira manchete.]

- Nicho regulado? {sim/não} — órgão: {CFM / CFO / CFN / CONFEF / CRP / CREFITO / CVM / OAB / COFECI}
- Pendente de revisão regulatória: {sim/não}
- Não prometer: desfecho clínico · tratamento · antes-e-depois · faturamento garantido.
- Separar métrica comercial (agendamento/oportunidade) de desfecho clínico.
- LGPD: {universal — link no footer}.
- Disclaimer sugerido (footer): `{texto}`

## 6. Drift de ICP (§8 — gate antes de finalizar)

[O ICP do §NICHO ainda sustenta o preço/promessa que a LP anuncia? Se o preço subiu, o público original ainda banca?]

- ICP pesquisado (market-map): {X}
- ICP que esta oferta/preço mira: {Y}
- Há drift material? {não / sim — aviso ao operador}: {recomendação, ex "revisitar /precificar antes de publicar"}

## 7. Garantia — auditoria da fronteira (§12)

[Confirmar que TUDO que a copy pública garante é controlável pelo sistema.]

- Cada item de garantia da §8 da pública passa no teste: "sobrevive se o cliente for um péssimo vendedor?" {sim, item a item}
- Algo prometido que depende de fechamento/atendimento/preço/experiência do cliente? {NÃO — se sim, reescrever}

## 8. Metáfora dominante escolhida (§19)

- Metáfora central da LP: {ex: "oportunidades que já custaram caro e continuam escapando"}
- Metáforas concorrentes EVITADAS nesta página: {balde furado / roleta / máquina / motor — listar as que ficaram de fora pra manter 1 só}

## 9. Registro de pesquisa (§6)

- Queries usadas: {…}
- URLs/fontes: {…}
- Tipo de fonte + grau: {…}
- Buracos da pesquisa / limitações do modo reduzido: {…}
- O que Firecrawl resolveria: {…} · O que Ad Library resolveria (tração): {…} (§7)

## 10. Insumos faltando (degradação graciosa)

[Se algum insumo do DNA não existe, registrar aqui + o que foi assumido/pedido ao operador. Nunca inventar pra preencher.]

- Faltou: {§X do _constructs.md / market-map / oferta.md} → {como foi tratado — perguntado / marcado [D.I.] / pausado}

## 11. §26 — checagem de nomes reais

- Grep no `copy-publica.md` + `sections.md` por nome real de referência externa (plataforma/agência/operador/produto estudado) = {zero — confirmado}. O que descreve padrão está codinomado.

---

## Gate de QA (rodar antes de finalizar — §15)

- [ ] `copy-publica.md` sem selos `[GOLD/SILVER/BRONZE/D.I./HIPÓTESE]`
- [ ] Sem "prova em validação" / "sem case inventado" / "dado de mercado, não nosso" como headline na pública
- [ ] Sem comentário de auditoria / raciocínio interno / nota de prompt na pública
- [ ] Justificativa do dispatcher preenchida (seção 1)
- [ ] 2 heroes descartados guardados (seção 2)
- [ ] Garantia 100% controlável (seção 7)
- [ ] Drift de ICP checado (seção 6)
- [ ] Compliance sinalizado se nicho regulado (seção 5)
- [ ] §26: zero nome real de referência em qualquer output do usuário (seção 11)
