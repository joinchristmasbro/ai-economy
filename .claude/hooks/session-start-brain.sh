#!/bin/bash
# SessionStart hook — injeta a constituição do installer + alerta sobre estado do _brain/
# Detecta: inbox com volume, conceitos que devem ser promovidos, weekly brief pendente

# === CALIBRATION-CORE — constituição compacta (injetada em TODA sessão) ===
# Detalhe completo em .claude/rules/CALIBRATION-CORE.md — skills detail-heavy leem no Step 0.
if [ -f ".claude/rules/CALIBRATION-CORE.md" ]; then
  cat <<'EOF'
=== CALIBRATION-CORE (regras invioláveis do installer — detalhe em .claude/rules/CALIBRATION-CORE.md) ===
§1 correção em runtime ≠ correção do installer (erro estrutural vira regra, não só remendo do artefato)
§2 separar [FATO-USUÁRIO]/[HIPÓTESE]/[INFERÊNCIA-OS]/[DADO-MERCADO]/[CLAIM-CONCORRENTE]/[SIMULADO]/[D.I.] — o selo viaja no cascade; hipótese não vira fato por repetição
§3 ao gravar, retornar bloco de AUDITORIA (arquivos+seções+resumo+trecho verificável) — "gravado no DNA" não basta
§4 status/camadas coerentes: ⬜/◐/✅ · asset no disco aparece no painel · derivar do filesystem
§5 numeração de perguntas sequencial (1..N, sem saltos)
§6 evidência: [GOLD-ICP] voz crua ≠ [GOLD-LP] visto na página ≠ [CLAIM-CONCORRENTE]; blog/fornecedor/agência = teto SILVER
§7 Firecrawl ≠ Ad Library — "sem Firecrawl" não é "sem tração"; não declarar modelável sem tração (dias/variações)
§8 GATE de drift de ICP antes de posicionar/precificar/criar-oferta/criar-lp/pitch/validação (avisa, não bloqueia hard)
§9 infraestrutura instalada ≠ fee de gestão de tráfego (construir/instalar/lançar/operar, não "mensalidade de agência")
§10 escada high-ticket infra: R$10-15k piloto · R$20-35k principal · R$45-50k+ · recorrência R$3-8k/mês — preço alto → revisa ICP/escopo/prova ANTES de baixar
§11 curva de productização: fase 1 founder-led → fase 2 replicável
§12 garantia só no que o sistema CONTROLA (instalação/agendamento qualificado/reativação/SLA) — nunca faturamento/fechamento/desfecho clínico
§13 reativação escopada (camada/add-on/tier), não promessa central escondida no pacote caro
§14 prova em validação: não inventar case, não usar ICP antigo como prova; captura o 1º case
§15 copy pública ≠ notas internas (selos [GOLD]/[SILVER], compliance, auditoria NUNCA na copy)
§16 PT-BR nativo — não traduzir fórmula gringa ("Ajudando X a conseguir Y em Z" banido)
§17 LP escolhe 1 de 3 arquiteturas (Diagnóstico/Auditoria · VSL/Treinamento · Oferta Direta/Fechamento) COM justificativa; infra high-ticket sem case = Diagnóstico/Auditoria; copy-publica.md ≠ copy-notes.md; 3 heroes → escolhe 1
§18 LP vende PERDAS antes de componentes/pilares
§19 LP com UMA metáfora dominante
§20 compliance saúde/estética herda em oferta+LP+pitch (CFM/CFO/CFN/CONFEF/LGPD)
§21 validação quente-first (rede/indicação), cold é secundário; mede funil, não só "respondeu"
§22 oferta productizada (SOPs/templates/playbook) — entrega replicável
§23 materializar + ABRIR o artefato (LP e doc de oferta renderizam HTML e abrem no navegador)
§24 one-page offer é entregável renderizado (o clímax visível), não só markdown
§25 sistema visual por ARQUÉTIPO — asset herda marca/brand-tokens.json (não improvisa OKLCH); /marca roda dispatcher (Clinical Premium / Performance Operations / Local Specialist / AI Infrastructure) por nicho; sem marca = provisório-v1 específico ao nicho, nunca "tech-premium" default
§26 nomes reais de referência OCULTOS no OS — skills/templates/outputs usam codename/descrição do padrão, nunca o nome real (o usuário não deve rastrear a referência); ref-map privado só fora do repo distribuído
§27 HERO outcome-first (high-ticket): H1 = ICP + resultado desejado + mecanismo, objeção na subhead; 5 opções de H1 (diagnóstica não vence automático); NUNCA inventar número (só garantia/benchmark/case/meta/input — senão placeholder nas notas); perda/diagnóstico entra PÓS-hero, não no H1
§28 calibração de métrica de promessa (qual número POR NICHO — ver .claude/rules/outcome-metric-calibration.md): outcome unit (não "lead" default) + volume suitability (número bom ≠ maior) + promise range (faixa+público+proibido) + 4 tipos (só validado na pública); NUNCA copiar "12/mês" de um nicho pra outro
§29 vender o DESFECHO DESEJADO + Promise Ladder (não ficar defensivo): copy pública LIDERA com o que o comprador quer (alunos/matrículas/pacientes/vendas — Camada 1) via mecanismo; §12 governa a GARANTIA (Camada 4), não o claim da copy; BANIDO da dobra: "sem prometer aluno/faturamento"/"não garantimos" (vai pra garantia/FAQ/notas)
§30 VOZ comercial / desfecho desejado (endurece §27-29 na copy pública): H1 curto SEM travessão, SEM termo interno (rota/instalada e operada/vazamento), outcome-first; subhead PT-BR natural (BANIDO "da atenção até a matrícula"); lexicon: rota→sistema/estrutura, founder-led→implantação acompanhada, done-for-you→feito e operado por nós; ciclo de 90 dias como jornada (30 só = implantação inicial); garantia POSITIVA não-defensiva; preview.html com painel REAL (nunca placeholder textual) — aplica a criar-lp + proposta hero
§31 POLIMENTO de copy comercial (parece OFERTA premium, não doc do OS): CTA principal vende GANHO ("Construir minha agenda previsível"), perda vira CTA secundário/pós-hero; subhead natural 1-ideia; Lexicon-2 (métricas controláveis→indicadores acordados · SOPs→processos documentados · passagens→etapas · handoff→troca de responsabilidade · "máquina no ar/afinada"→"estrutura em operação/com consistência" · "responsabilidade pelo caminho inteiro"→"responsável pela estrutura"); "caminho" é MULETA (máx 1-2, alternar estrutura/sistema/processo/operação/agenda/fluxo; sinônimos-disfarce trajeto/percurso/jornada contam junto); garantia positiva-modelo + fronteira 1 frase; footer suave; painel ILUSTRATIVO ("exemplo de operação"/qualitativo — número não parece dado real). §31.8/§31.9: SUJEITO da entrega = SISTEMA/mecanismo, NUNCA "um time"/equipe/agência/gestor (drift de agência §9); mecanismo COMPLETO (atração→qualificação→conversão→reativação conectado), não a partezinha; subhead-âncora "Um sistema que conecta captação, WhatsApp, avaliações e reativação para transformar interessados em matrículas…"
§32 RENDER QA GATE (bug REPROVA o preview): palavra grudada ("o centroPrincipal") · bloco duplicado em sequência · placeholder/[visual/lorem/TODO · string de debug ({{ ${ undefined NaN) · markdown cru (** ## |---|) · visual stub → REPROVA; marquee-loop duplicado = exceção com aria-hidden. Achou bug → mostrar o gap CRU, não remendar à mão (§1)
EOF
  echo ""
fi

# Sair silenciosamente se não tem _brain/
[ ! -d "_brain" ] && exit 0

INBOX_COUNT=$(find _brain/inbox -maxdepth 1 -name "*.md" ! -name "README.md" 2>/dev/null | wc -l)
SEEDLINGS=$(grep -l "stage: seedling" _brain/conceitos/*.md 2>/dev/null | wc -l)

# Detectar se sexta-feira sem weekly brief (recomenda /intel-synthesis)
TODAY=$(date +%u)
HAS_WEEKLY_THIS_WEEK=$(find _brain/insights -maxdepth 1 -name "weekly-*.md" -mtime -7 2>/dev/null | wc -l)

# Detectar última /atualizar (ler git log)
LAST_ATUALIZAR_DAYS=$(git log --since="30 days ago" --grep="atualizar" --oneline 2>/dev/null | head -1 | awk '{print $0}' | grep -oP '\d+' | head -1 || echo "30+")

# Output mensagem se há sinais relevantes (não spammar todas sessões)
SHOW=0
[ "$INBOX_COUNT" -ge 5 ] && SHOW=1
[ "$TODAY" = "5" ] && [ "$HAS_WEEKLY_THIS_WEEK" = "0" ] && SHOW=1
[ "$INBOX_COUNT" -ge 10 ] && SHOW=1

if [ "$SHOW" = "1" ]; then
  echo "=== _BRAIN/ STATUS ==="
  [ "$INBOX_COUNT" -ge 5 ] && echo "📥 Inbox com $INBOX_COUNT capturas pendentes — considere /sintetizar"
  [ "$TODAY" = "5" ] && [ "$HAS_WEEKLY_THIS_WEEK" = "0" ] && echo "📊 Sexta-feira sem weekly brief — considere /intel-synthesis"
  [ "$SEEDLINGS" -ge 10 ] && echo "🌱 $SEEDLINGS conceitos em 'seedling' há tempo — /sintetizar pode promover"
  echo ""
fi
