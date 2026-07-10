---
title: "Arquivo"
type: _arquivo/index
created: pendente
---

# Arquivo

Histórico de coisas que saíram do workspace ativo mas que vale guardar (não deletar).

## Tipos arquivados

### Nichos antigos
Pasta `nichos/[slug]-[data]/` — quando você roda `/trocar-nicho`, o nicho atual é movido pra cá com:
- `nicho/` completo daquele momento
- `ofertas/` daquele nicho
- `system-design/` daquele nicho
- `_meta.md` com data + razão da troca

Aluno pode voltar a um nicho arquivado movendo arquivos manualmente (skill `/voltar-nicho` fica pra v2).

### Ofertas descartadas
Pasta `ofertas/[slug]-descartada-[data]/` — ofertas que testou e não funcionaram. Mantém como histórico de aprendizado.

### Clientes encerrados
Pasta `clientes/[slug]-encerrado-[data]/` — clientes que terminaram contrato (não pausados). Histórico contábil + aprendizados.

## Lista de itens arquivados

| Tipo | Slug | Quando | Razão |
|---|---|---|---|
| (vazio) | | | |

## Política

- Nada é deletado, só arquivado
- Após 1 ano sem reativação, pode mover pra cold storage (Drive externo)
- LGPD: dados sensíveis de cliente seguem retenção legal aplicável
