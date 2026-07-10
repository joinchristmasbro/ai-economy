---
type: lp-diagnostico-notes
arquitetura: "Tipo 1 — Diagnóstico / Auditoria Premium"
slug: "{{SLUG}}"
visibilidade: "INTERNO — nunca vai pra página, nunca renderiza no preview.html"
---

# Notas internas — LP Diagnóstico / Auditoria Premium (Tipo 1)

> 🔴 Isto é BASTIDOR (§15). Fontes, selos de evidência, prova-em-validação, compliance, claims, riscos e auditoria vivem AQUI. NADA daqui pode vazar pra `copy-publica.md` nem pro `preview.html`.
> O gate de QA (Passo 4c) faz grep na copy pública contra tudo que está listado aqui.

---

## 1. FONTES (registro de pesquisa · §6)

> Guia: cada afirmação forte da copy rastreável a uma linha aqui.

| Afirmação na LP | Fonte / URL | Trecho-evidência | Tipo de fonte | Grau |
|---|---|---|---|---|
| {{claim}} | {{url}} | {{trecho}} | {{ICP / setorial / concorrente}} | {{[GOLD-ICP] / [GOLD-LP] / [SILVER] / [BRONZE] / [D.I.]}} |

**Buracos da pesquisa:** {{o que ficou sem cobertura}}
**Limitações do modo reduzido:** {{sem Firecrawl resolveria X · sem Ad Library resolveria Y (§7)}}

---

## 2. PROVA EM VALIDAÇÃO (§14)

- **Case real do ICP atual?** {{sim / não / em validação}}
- {{Se NÃO: como a copy pública compensa — garantia · transparência · escopo controlável · origem do insight · dados de mercado contextualizados. NUNCA vira headline ruim.}}
- **Case de ICP anterior usado?** {{só como HISTÓRICO DE APRENDIZADO, nunca como prova principal}}
- **Plano de captura do 1º case real:** {{gancho automático — quem, quando, como}}

---

## 3. COMPLIANCE / DISCLAIMERS (§20)

- **Nicho regulado?** {{saúde / estética / clínica / nutrição / odonto / emagrecimento / não}}
- **Órgão sinalizado:** {{CFM · CFO · CFN · CONFEF · CRP · CREFITO · CVM · OAB · COFECI · n/a}}
- **LGPD:** {{universal — link no footer}}
- **Disclaimer(s) pendente(s) de revisão regulatória:** {{texto · onde entra (footer/notas) · NÃO na headline}}
- Separar métrica comercial de desfecho clínico: {{como foi feito}}

---

## 4. CLAIMS CLASSIFICADOS (§2)

> Guia: todo número/promessa forte carrega um selo; o selo NÃO aparece na copy pública.

- **[DADO-MERCADO]** — {{número de mercado com fonte}}
- **[CLAIM-CONCORRENTE]** — {{número visto na LP/ad de player · NÃO verificado · descrever sem nomear (§26)}}
- **[INFERÊNCIA-OS]** — {{conclusão do sistema}}
- **[HIPÓTESE]** — {{recorte/preço/tese ainda não validado}}
- **[FATO-USUÁRIO]** — {{dito pelo operador}}
- **[BRONZE / estimativa]** — {{mostrar a conta}}

---

## 5. RISCOS

- {{Risco de overpromise → onde a garantia controlável corta (§12)}}
- {{Risco de drift de ICP entre pesquisa e preço atual (§8)}}
- {{Risco de metáfora concorrente poluindo a narrativa (§19)}}
- {{Risco regulatório pendente}}

---

## 6. JUSTIFICATIVA DO DISPATCHER (§17 · Passo 1)

```
ARQUITETURA ESCOLHIDA: Tipo 1 — Diagnóstico / Auditoria Premium
Por quê: {{1-2 frases}}
Sinais do DNA que levaram aqui: {{ticket · prova · consciência · canal · etapa · tipo de oferta}}
Tipo descartado + por quê: {{ex: Tipo 3 descartado — prospect ainda não conversou, é problem-aware, precisa diagnosticar antes de fechar}}
```

---

## 7. HEROES DESCARTADOS (§ Passo 3 — os 2 que não foram)

- **Descartado A ({{direto / diagnóstico / premium}}):** "{{hero}}"
  - Por que não venceu: {{motivo}} · candidato a A/B teste: {{sim/não}}
- **Descartado B ({{direto / diagnóstico / premium}}):** "{{hero}}"
  - Por que não venceu: {{motivo}} · candidato a A/B teste: {{sim/não}}

**Hero escolhido (o que foi pra copy pública):** "{{hero}}" — motivo: {{justificativa}}

---

## 8. AUDITORIA (gate de QA · Passo 4c)

- [ ] `copy-publica.md` sem selos `[GOLD]/[SILVER]/[BRONZE]/[D.I.]/[HIPÓTESE]` (§15)
- [ ] Sem "prova em validação" / "sem case inventado" / "dado não é resultado nosso" como headline (§14)
- [ ] Zero nome real de referência na pública, sections e README — só descrição do padrão (§26)
- [ ] Vende PERDA antes de componentes — 3 primeiras dobras (§18)
- [ ] UMA metáfora dominante, sem imagem concorrente (§19)
- [ ] PT-BR nativo, zero fórmula gringa traduzida (§16)
- [ ] Garantia só no controlável; fronteira preservada verbatim (§12)
- [ ] Preço lê como investimento em infra, não pacote de tráfego (§9/§10)
- [ ] ICP do `_constructs.md` ainda sustenta preço/promessa (§8 · sem drift)
- [ ] Compliance/disclaimer só aqui nas notas + footer, nunca na headline (§20/§15)
