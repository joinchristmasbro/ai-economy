---
name: trocar-nicho
description: >
  Arquiva o nicho atual (com toda inteligência acumulada) e configura
  workspace pra um nicho novo. Mantém preferências, marca, funcionários,
  processos. Use quando o usuário rodar /trocar-nicho [novo-nicho], ou
  disser "quero pivotar de nicho", "vou trocar de mercado", "esse nicho
  não funcionou".
---

# /trocar-nicho — Pivot pra novo nicho

Workspace é dedicado a 1 nicho. Quando aluno decide pivotar (nicho atual não funcionou ou ele quer mudar foco), essa skill arquiva tudo do nicho antigo e configura tudo do novo, mantendo preferências e configurações que continuam válidas.

## Quando usar (vs alternativas)

| Situação | Skill |
|---|---|
| Pivot completo (desistiu do nicho) | `/trocar-nicho` |
| Adicionar 2º nicho mantendo o 1º | Criar segundo workspace separado |
| Refinar sub-nicho do mesmo nicho | `/mapear-mercado` (não é troca, é aprofundamento) |
| Reset por erro de setup | `/atualizar` |

## Confirmação inicial

```
/trocar-nicho [novo-nicho]
```

Sem argumento: skill pergunta o novo nicho.

```
Você está pra arquivar o nicho atual ([nicho-atual]) e configurar workspace pra [novo-nicho].

O QUE VAI PARA ARQUIVO (mantém histórico):
- nicho/ inteiro (cérebro do nicho atual)
- ofertas/ (todas as ofertas estruturadas)
- system-design/ (arquitetura específica do nicho atual)

O QUE FICA INTACTO:
- _contexto/empresa.md (perfil aluno — só atualiza nicho)
- _contexto/preferencias.md (tom, estilo)
- _contexto/estrategia.md (objetivo 90d — pode ajustar depois)
- _contexto/modelo-nova-economia.md
- _contexto/framework-oferta.md
- marca/ (identidade visual)
- funcionarios/ (templates reusáveis)
- processos/ (workflows do aluno)
- templates/ (recursos)
- _arquivo/ (histórico)

QUESTÃO IMPORTANTE — clientes/:
Você tem [N] clientes ativos do nicho [nicho-atual]. O que fazer?
1) Manter clientes/ como está (clientes do nicho antigo continuam ativos pra recorrência)
2) Arquivar clientes junto (se vai parar de atender o nicho antigo)
3) Decidir caso a caso (mostrar lista, escolher)

Qual?
```

## Processo de arquivamento

Após confirmação:

### 1. Criar snapshot
```bash
mkdir -p _arquivo/nichos/[nicho-antigo-slug]-[YYYY-MM-DD]
```

### 2. Mover pastas atuais pro snapshot
```bash
mv nicho _arquivo/nichos/[slug]-[data]/
mv ofertas _arquivo/nichos/[slug]-[data]/
mv system-design _arquivo/nichos/[slug]-[data]/
```

(opcional: mover `clientes/` se aluno escolheu opção 2)

### 3. Criar `_arquivo/nichos/[slug]-[data]/_meta.md`
```markdown
---
title: "Nicho arquivado: [nome]"
arquivado-em: [data]
razao: [razão do aluno]
ativo-de: [data inicial]
ativo-ate: [data atual]
---

# [Nome do nicho antigo]

## Snapshot

Estado do nicho no momento do arquivamento:
- Ofertas estruturadas: [N]
- Clientes que atendia: [N]
- Receita gerada com esse nicho: [estimativa se aluno informar]
- Última atividade: [data]

## Razão da troca

[razão dada pelo aluno]

## Aprendizados que valem manter

[3-5 lições aprendidas — ajuda em futuros nichos ou em retornar a este]

## Como restaurar (se quiser voltar futuramente)

1. Criar pasta nicho/, ofertas/, system-design/ vazias na raiz
2. Mover arquivos de _arquivo/nichos/[slug]-[data]/ pra raiz
3. Atualizar _contexto/empresa.md campo nicho
4. Rodar /atualizar pra reconciliar contexto
```

### 4. Criar pastas vazias do novo nicho
```bash
mkdir nicho ofertas/_modelo system-design
```
Copiar templates de `_arquivo/templates/` (se mantemos cópia) ou re-criar baseado nas estruturas conhecidas.

### 5. Atualizar contexto

`_contexto/empresa.md`:
- Campo `nicho` → novo nicho
- Adicionar nota sobre troca (data + nicho anterior)

`_contexto/estrategia.md`:
- Foco primário → "estudar mercado novo nicho"
- Objetivo 90d → perguntar se mantém ou muda

`CLAUDE.md`:
- Atualizar campos relativos ao nicho

### 6. Rodar pesquisa inicial do novo nicho
Igual à pesquisa inicial do `/setup`:
- 3 WebSearch sobre o novo nicho
- Reddit MCP pra dores
- Top atuadores
- Popular `nicho/01-dores.md`, `04-linguagem-tipica.md`, `06-atuadores.md` com seed inicial

### 7. Atualizar `_arquivo/_index.md`
Adicionar linha do nicho arquivado.

## Mensagem final

```
Nicho trocado.

Arquivado: _arquivo/nichos/[slug-antigo]-[data]/
Novo nicho: [nome do novo nicho] (workspace agora dedicado a ele)

Pesquisa inicial rodou (top dores e atuadores em nicho/).

Próximo passo: /mapear-mercado pra aprofundar o novo nicho

Os clientes anteriores: [resumo da decisão tomada — mantidos / arquivados / etc]
```

## Comportamentos especiais

### Aluno mudou de ideia depois do arquivamento
Pode restaurar manualmente. Instruções ficam em `_arquivo/nichos/[slug]/_meta.md`. Skill `/voltar-nicho` automatizada fica pra v2.

### Workspace não tem nicho atual definido
Se `_contexto/empresa.md` não tem nicho ainda (workspace recém-configurado mas aluno trocou logo de cara), `/trocar-nicho` vira basicamente um `/setup` parcial — só atualiza nicho.

### Múltiplas trocas em curto período
Se aluno troca de nicho 2x em < 30 dias, skill alerta:
```
⚠ Você trocou de nicho 2x recentemente. Trocas frequentes derrotam a tese de especialização ("workspace = 1 nicho").

Confirma que essa decisão é estratégica e não impulsiva?

Sugestão alternativa: se você tá explorando múltiplos nichos pra escolher, considere abrir workspaces paralelos (1 por nicho candidato) e foque o esforço de pesquisa em todos antes de matar nenhum.

Continuar com a troca? [s/n]
```

## Regras

- **Nada é deletado** — sempre arquiva pra _arquivo/.
- **Confirmação dupla** antes de arquivar (operação significativa).
- **Snapshot completo do estado** — aluno pode voltar.
- **Mantém o que continua válido** (preferências, marca, funcionários, processos).
- **Pesquisa inicial do novo nicho roda automaticamente** pra workspace não ficar vazio.
- **Atualiza CLAUDE.md** + `_index.md` de pastas relevantes.
- **Loga a troca** em `_arquivo/_index.md` pra histórico de pivots.
