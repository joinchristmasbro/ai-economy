---
name: playbook-cliente
description: >
  Guia o aluno pelas 6 fases de implantação do sistema num cliente.
  Cada fase tem checklist + outputs esperados + ações concretas.
  Lê fase atual do clientes/[slug]/_index.md e foca no que precisa
  ser feito agora. Use quando o usuário rodar /playbook-cliente [slug],
  ou após /novo-cliente, ou quando precisar avançar fase de cliente.
---

# /playbook-cliente — Guia 6 fases de implantação

Cliente novo passa por 6 fases (10+ dias). Cada fase tem propósito + checklist + outputs. Skill foca na fase ativa e ajuda aluno a completar.

## Pré-requisitos

- Pasta `clientes/[slug]/` criada (via `/novo-cliente`)
- `00-perfil.md` preenchido (cliente identificado)
- Idealmente: oferta vendida referenciada em `ofertas/[slug-oferta]/`

## Uso

```
/playbook-cliente [slug-do-cliente]
```

Sem slug: skill lista clientes ativos e pergunta qual.

## Carregamento de contexto

Ao iniciar:

1. Ler `clientes/[slug]/_index.md` (estado atual + fase ativa)
2. Ler `clientes/[slug]/00-perfil.md` (perfil do cliente)
3. Ler `ofertas/[slug-oferta]/` (oferta que esse cliente comprou)
4. Ler `nicho/` (contexto do nicho)
5. Ler arquivo da fase atual `clientes/[slug]/0X-fase.md`

## Comportamento por fase

### Fase 1 — Onboarding & Diagnóstico (Dias 1-2)

**Objetivo:** acessos liberados + diagnóstico baseline.

Skill apresenta:
```
Fase 1 — Onboarding & Diagnóstico

[Cliente]: [Nome]
[Oferta]: [Mecanismo único]
[Tempo desde fechamento]: [N dias]

Checklist atual (do template clientes/[slug]/01-onboarding.md):

[lista os items, marca o que já está checkado]

Próximas ações concretas:
1. [ação 1 priorizada]
2. [ação 2]
3. [ação 3]

Por onde começar? [responder com número ou descrever]
```

Conforme aluno avança, skill:
- Marca checkboxes no `01-onboarding.md`
- Atualiza `_index.md` com progresso
- Sugere quando avançar pra Fase 2 (todos os checkboxes essenciais marcados)

### Fase 2 — Clareza & Criação da Oferta (Dias 2-3)

**Objetivo:** customizar a oferta padrão pra esse cliente específico.

Skill:
- Compara oferta padrão (`ofertas/[slug]/`) com perfil do cliente
- Sugere customizações (mecanismo, headline com números do cliente, pricing fechado, garantia específica)
- Atualiza `02-criacao-oferta.md` com customizações
- Confirma com aluno antes de "fechar" a versão pra esse cliente

### Fase 3 — Setup Técnico & Criativos (Dias 4-6)

**Objetivo:** infraestrutura técnica rodando + criativos validados.

Skill:
- Lista componentes a montar baseado em camada(s) da oferta
- Cruza com stack do cliente (de `00-perfil.md`)
- Sugere ordem de execução (CRM primeiro → integrações → criativos → warm-up)
- Marca progresso em `03-setup-tecnico.md`
- Pra criativos: aluno pode pedir ao Claude pra gerar copy/storyboard usando `ofertas/[slug]/` + `nicho/` como contexto

### Fase 4 — Lançamento & Validação ROI (Dias 7-9)

**Objetivo:** ads no ar, leads chegando, ROI mensurável.

Skill:
- Verifica se setup está completo (Fase 3 fechada)
- Apresenta plano de lançamento (orçamento inicial, públicos, criativos)
- Acompanha métricas (aluno reporta CPL, show-up, close)
- Atualiza `04-lancamento-roi.md` com dados reais
- Identifica ajustes (qual creative matar, qual escalar)

### Fase 5 — Founder-off & Consolidação

**Objetivo:** founder do cliente fora do comercial, sistema rodando.

Skill:
- Verifica condições pra transição (volume de leads suficiente pra justificar closer)
- Ajuda a estruturar contratação ou treinamento de closer
- Documenta SOPs pra closer não dependa de você
- Atualiza `05-consolidacao.md` com snapshot de "after state"

### Fase 6 — Escala & Sustentação

**Objetivo:** crescimento sustentável com margem.

Skill:
- Analisa ROAS atual e propõe estratégia de escala
- Sugere documentação (SOPs) pra processo replicável
- Discute multiplicação (replicar em outro nicho — novo workspace) ou expansão (adicionar camada na mesma base)
- Atualiza `06-escala.md`

## Avanço de fase

Skill nunca avança automaticamente. Quando todos os checkboxes essenciais da fase atual estão marcados:

```
Fase [N] completa.

Outputs gerados:
- [output 1]
- [output 2]

Pronto pra Fase [N+1]? [s/n]
```

Se sim → atualizar `_index.md` (fase-status fase atual = "completa", próxima fase = "em-progresso") + abrir `0X-proxima-fase.md`.

## Comportamentos especiais

### Cliente parado há > 7 dias
Detectar via última modificação dos arquivos da fase atual. Skill alerta:

```
⚠ Cliente [X] parado na Fase [N] há [Y] dias.

Razão típica nessa fase: [contexto inferido]

Opções:
1) Retomar — me diz onde travou
2) Pular fase (registrar como "skip")
3) Pausar cliente formalmente
4) Encerrar cliente (move pra _arquivo/clientes/)

Qual?
```

### Pular fase
Permitido. Marcar fase como "skipped" no `_index.md` com razão. Avança pra próxima.

### Voltar fase
Permitido se aluno descobre algo que invalidou trabalho anterior. Marca fase atual como "revisitada", abre fase anterior pra correção.

### Cliente quer customização não prevista
Aluno pode pedir customização fora dos templates. Skill cria arquivo extra `clientes/[slug]/[XX-extra-X].md` com naming flexível.

## Atualizações de contexto upstream

Ao terminar Fase 5 ou 6, perguntar:

```
Esse cliente terminou a fase [N] com [aprendizado X].

Vale propagar esse aprendizado pra:
- ofertas/[slug-oferta]/ (refinar a oferta padrão)?
- system-design/ (ajustar arquitetura mestre)?
- nicho/03-objecoes.md (adicionar nova objeção)?

Atualizar quais? (números ou "nenhum")
```

Esse loop melhora o sistema ao longo do tempo. Cliente vira fonte de aprendizado.

## Regras

- Foca SEMPRE na fase ativa (não dispersa pra outras fases)
- Checkboxes representam progresso real — não marcar sem aluno confirmar
- Quando aluno reporta números reais (CPL, close, etc), salvar em `04-lancamento-roi.md` ou `05-consolidacao.md`
- Sugere sempre próxima ação CONCRETA (não "talvez você queira X")
- Tom: gestor de projeto técnico — coordena, não vende
- Ao final da sessão, sempre commitar (`/syncar` automático ou sugerido)
