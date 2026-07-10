---
name: atualizar
description: >
  Varre estado real do workspace e detecta drift entre o que está
  documentado nos arquivos de contexto e o que aconteceu na prática.
  Propõe correções pra aprovação. Use quando o usuário rodar /atualizar,
  disser "atualiza contexto", "tá desatualizado", "valida o sistema",
  ao fim de uma sessão longa, ou periodicamente (a cada 14 dias).
---

# /atualizar — Auditoria de drift do workspace

Compara estado real (commits, projetos, status) com documentado (CLAUDE.md, _contexto/*). Aponta drift e propõe correções.

## Coleta de evidências

Em paralelo:

### 1. Estado real
- Pastas raiz existentes (excluir `.git`, `.claude`, `templates`, `dados`)
- Skills em `.claude/skills/*/`
- Sistemas em pastas Areas (`nicho/`, `ofertas/`, `clientes/`, `processos/`, etc)
- MCPs configurados (`.mcp.json` ou via `claude mcp list`)

### 2. Atividade recente (git)
- `git log --since="14 days ago" --pretty=format:"%h %s"` — atividade
- `git diff --name-only HEAD~10..HEAD` — arquivos tocados
- `git status --short` — pendências não commitadas

### 3. Estado interno dos sistemas
- Para cada `clientes/*/`: ler `_index.md` (status + fase)
- Para cada `ofertas/*/`: ler `_index.md` (status)
- Para cada `processos/*/`: ler `_index.md` (frequência + última execução)

### 4. Contexto documentado
- `CLAUDE.md`
- `_contexto/empresa.md`, `preferencias.md`, `estrategia.md`
- `marca/design-guide.md`

## Análise — 6 dimensões de drift

### Dimensão 1 — Atividade vs foco primário

A atividade dos últimos 14 dias está alinhada com o foco primário (em `estrategia.md`)?

- Se foco é "estruturar oferta" mas commits só tocam `_contexto/`: **drift de execução**
- Se foco é "mapear nicho" mas há 3 ofertas novas: **foco está atrasado em relação à execução**

### Dimensão 2 — Sistemas estagnados

- Cliente em `clientes/[X]/` sem commit há > 30 dias: **estagnado**
- Oferta em `ofertas/[Y]/` sem commit há > 60 dias: **provavelmente descartada — confirmar**

### Dimensão 3 — Receita vs registro

Receita atual em `empresa.md` ainda condiz?
- Se aluno mencionou em sessões recentes valor diferente: propor atualização
- Se fechou contratos novos (mencionados em commits): receita pode ter mudado de bracket

### Dimensão 4 — Objetivo 90 dias

Data registrada do objetivo passou?
- Passou e atingido → propor próximo objetivo
- Passou e não atingido → propor recalibrar
- Faltam < 30 dias → fase final (não mexer)

### Dimensão 5 — Skills/pastas vs documentação

- Skills criadas em `.claude/skills/` que não estão no CLAUDE.md: propor adicionar
- Pastas Areas novas que não estão no CLAUDE.md: propor adicionar
- Skills/pastas listadas que foram deletadas: propor remover do CLAUDE.md

### Dimensão 6 — Stack vs MCPs

- Stack declarada em `empresa.md` que ainda não tem MCP instalado: propor instalar
- MCP instalado que não está sendo usado em skills (últimos 30 dias): mencionar (pode desinstalar pra limpar)

## Output do diagnóstico

```
Diagnóstico de drift · [data]

[OK] (alinhado)
- [items que estão atualizados]

[Drift detectado]
- [Dimensão] · [arquivo] · [o que está] → [o que deveria ser]
- [Dimensão] · [...] → [...]

[Sistemas estagnados]
- [Sistema] · [N dias sem commit] · sugestão: [retomar / arquivar]

[Pendências]
- [items que precisam decisão do aluno]

Total: [N drift detected, N stagnant, N pendências]
```

Se tudo em ordem:
```
Workspace em sync. Sem drift detectado.

Próxima auditoria recomendada em 14 dias.
```

## Aplicação (com aprovação)

Pra cada item de drift, mostrar correção proposta:

```
1) empresa.md → atualizar receita: R$5-20K → R$20-50K (sessões mencionam ticket maior)
2) CLAUDE.md → adicionar projetos/saas-clinicas/ na lista
3) estrategia.md → recalibrar objetivo 90d (passou em 12 dias)

Aplico tudo?
[s]im / [n]ão / [u]m por um
```

- **s** → aplica todas, mostra resumo
- **n** → cancela
- **u** → revisa uma por uma

## Casos especiais

### Workspace recém-configurado (< 5 commits totais)
```
Sistema recém-configurado. Sem drift detectado — venha de volta após algumas sessões.
```

### Aluno acabou de rodar /atualizar (< 24h)
```
/atualizar rodou há [X] horas. Sem mudanças significativas desde então.
```

## Regras

- Nunca reescrever arquivo inteiro. Só editar linhas relevantes.
- Não inventar drift. Se evidência é fraca, marcar "[VERIFICAR]" e perguntar.
- Tom forense: descreve evidência → inferência → proposta. Sem dramatizar.
- "Drift" é o termo padrão da skill — usar consistentemente.
- Se aluno pediu pra rodar /atualizar mas não há nada a fazer, dizer e parar (não inventar trabalho).
