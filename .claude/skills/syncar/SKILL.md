---
name: syncar
description: >
  Salva o estado do workspace no GitHub (commit + push). Configura
  remote na primeira vez. Use quando o usuário rodar /syncar, ao final
  de uma sessão produtiva, ou disser "salva no github", "faz commit",
  "manda pro git", "backup".
---

# /syncar — GitHub commit + push

## Verificação inicial

Em paralelo:
```bash
git rev-parse --git-dir 2>/dev/null
git remote get-url origin 2>/dev/null
git status --short
```

3 cenários: sem git, sem remote, ou pronto pra publicar.

## Cenário 1 — Sem repositório git

`git rev-parse` falhou. Inicializar:

```bash
git init
git branch -m main
```

→ Continuar pro Cenário 2.

## Cenário 2 — Sem remote configurado

```
Workspace ainda não conectado a um repo no GitHub.

Pra conectar:
1) Cria repo em github.com/new
2) Recomendo PRIVADO (vai ter dados do teu negócio + clientes)
3) Nome sugerido: meu-aieconomy ou nome-do-nicho
4) NÃO inicialize com README (deixa vazio)
5) Cola o link aqui (ex: https://github.com/seunome/repo)
```

Após receber link:

```bash
git remote add origin [link]
git add -A
git commit -m "init: aifirst-os configurado"
git push -u origin main
```

Confirmar:
```
Conectado. [N arquivos] sincronizados em [link]

Próximas /syncar fazem commit+push automático.
```

## Cenário 3 — Pronto pra sincronizar

Se há mudanças (`git status --short` retorna linhas):

**Inferir mensagem de commit a partir da sessão atual:**

| O que mudou | Commit message |
|---|---|
| Skills rodadas (logs no contexto) | "rodou: [skill1, skill2]" |
| `nicho/` modificado | "atualiza: nicho ([arquivos modificados])" |
| `ofertas/[novo]/` criado | "nova oferta: [slug]" |
| `clientes/[novo]/` criado | "novo cliente: [nome]" |
| `clientes/[X]/0Y-fase.md` modificado | "[X]: fase [Y] em andamento" |
| `_contexto/` modificado | "ajuste de contexto" |
| Misto | "sync: [data] — [N arquivos]" |

Default fallback: `sync: [YYYY-MM-DD HH:MM]`

Executar:
```bash
git add -A
git commit -m "[mensagem inferida]"
git push
```

Confirmar:
```
Sincronizado. [N arquivos] · [URL]
```

Se sem mudanças:
```
Sem mudanças pra sincronizar. Workspace está em sync.
```

## Falhas comuns

### Push rejeitado (remote tem commits que local não tem)

```
Conflito: remote tem mudanças que tua máquina não tem.

Provável: você editou pelo GitHub web ou em outro device.

Opções:
1) Puxar e mesclar (git pull --rebase + push)
2) Ver as diferenças primeiro

Qual?
```

### Sem credenciais GitHub

```
Push falhou — autenticação não configurada.

Opções:
1) Token via gh CLI (gh auth login)
2) SSH key (ssh-keygen + adicionar no GitHub)
3) Token PAT manual (settings > developer > tokens)

Qual prefere? Te guio passo a passo.
```

### Sem internet

```
Sem conexão com github.com.

Tuas mudanças estão commitadas localmente. Roda /syncar de novo quando voltar a conexão.
```

## Regras

- Nunca commitar `.env`, `.env.local`, `*.key`, `credentials.json`, `dados/*` (já no `.gitignore`)
- Mensagem de commit é inferida automaticamente — não pergunta ao aluno
- Confirmação curta: 1 linha + URL
- Em caso de erro, sempre dizer o próximo passo (não só o erro)
- Se aluno tá em workspace recém-configurado, lembrar de criar repo private antes do primeiro push (dados do negócio + clientes)
