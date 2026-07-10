---
type: inbox-readme
---

# inbox — drop zone

Joga aqui qualquer coisa que aprendeu, leu, ouviu, anotou. Sem se preocupar com formato.

## Formatos aceitos

- Texto solto em `.md` com nome livre
- Link copiado (URL + 1 frase de contexto)
- Quote literal (com fonte)
- Foto/screenshot com legenda

## Comportamento

- **Não organize aqui.** Inbox é fluxo. Organização é responsabilidade do `/sintetizar`.
- `/sintetizar` lê esta pasta, classifica cada nota:
  - É um conceito recorrente? → vai pra `conceitos/`
  - É uma fonte específica? → vai pra `fontes/[tipo]/`
  - É um padrão cross-cliente? → vai pra `insights/`
- Após processada, nota é movida da inbox.

## Frontmatter mínimo (opcional, mas ajuda)

```yaml
---
captured: 2026-04-25
source: youtube.com/watch?v=xxx OR reddit OR conversa
stage: seedling
---
```

Se não preencher, `/sintetizar` infere.
