---
title: "Catálogo de MCPs e Skills externas"
type: templates/ferramentas
---

# Catálogo de MCPs e Skills externas

Lista referência de tools que combinam com `aifirst-os`. Setup auto-instala as obrigatórias e oferece as opcionais com base na stack que você declarou.

---

## MCPs nativos do Claude Code (já vem com o sistema)

### filesystem
- **O quê:** leitura/escrita de arquivos locais
- **Quando precisa:** sempre — já ativo

### web-search
- **O quê:** busca na web em tempo real
- **Quando precisa:** `/mapear-mercado`, `/escanear-concorrencia`, `/raio-x`, pesquisa em geral — é a PRIMÁRIA (e o fallback universal) de todo módulo
- **Como ativar:** `/mcp` no Claude Code → ativar web-search

### web-fetch
- **O quê:** pega conteúdo de URL específica
- **Quando precisa:** análise de site competidor, scrape de LP, leitura de artigo
- **Como ativar:** ativo por padrão

---

## MCPs da cadeia de instalação (instalados + TESTADOS pelo /setup)

Só ferramentas que EXISTEM e que os módulos usam de fato. Fallback chain universal: falhou → WebSearch → `[DADOS INSUFICIENTES]`, nunca inventa.

### firecrawl
- **O quê:** scrape estruturado de páginas (LPs, fóruns, Meta Ad Library)
- **Usado por:** `/escanear-concorrencia`, `/ad-library-scan`, `/mapear-mercado`
- **Custo:** free 500 créditos/mês (chave em firecrawl.dev)
- **Instalar:** `claude mcp add firecrawl --env FIRECRAWL_API_KEY=...`

### youtube-data
- **O quê:** busca vídeos/canais + metadata (quota Google gratuita)
- **Usado por:** `/mapear-mercado`, `/youtube-intel`
- **Instalar:** `claude mcp add youtube-data --env YOUTUBE_API_KEY=...`

### youtube-transcript
- **O quê:** transcrição de vídeos — a voz verbatim de quem vive o nicho
- **Usado por:** `/mapear-mercado`, `/youtube-intel`
- **Instalar:** `claude mcp add youtube-transcript`

---

## Skills externas opcionais (dão mais profundidade)

### startup-skill
- **O quê:** módulos de positioning, competitor battle cards, offer building
- **Usado por:** `/copiloto`, `/criar-oferta` (refinamento)
- **Custo:** $200-500/ano (verificar)
- **Instalar:** `/plugin install startup-skill`

### pm-skills (phuryn)
- **O quê:** skills de PM — positioning ideas, value proposition, JTBD
- **Usado por:** `/copiloto` (modo positioning)
- **Custo:** free
- **Instalar:** `/plugin install pm-skills`

---

## MCPs por stack do cliente (auto-detectados em /setup)

### Notion MCP
- **O quê:** ler/escrever páginas do Notion
- **Quando precisa:** cliente usa Notion pra gestão; integração com docs
- **Instalar:** `claude mcp add notion -- npx -y @notionhq/notion-mcp-server`

### Google Workspace MCP
- **O quê:** Google Sheets, Drive, Docs, Calendar
- **Quando precisa:** análise de dados em Sheets, criação de docs
- **Instalar:** `claude mcp add google-workspace -- ...`

### Slack MCP
- **O quê:** postar mensagens, ler canais
- **Quando precisa:** notificações automáticas pro time, comunicação interna
- **Instalar:** `claude mcp add slack -- ...`

### Linear MCP
- **O quê:** criar/atualizar tickets
- **Quando precisa:** gestão de tarefas técnicas do projeto
- **Instalar:** `claude mcp add linear -- ...`

### GitHub MCP (default)
- **O quê:** operações git avançadas, PRs, issues
- **Quando precisa:** sempre que usar `/syncar` (já vem default)

---

## Comandos pra instalar

### Via plugin marketplace (skills)
```
/plugin
```

(Lista plugins disponíveis. Selecionar e instalar interativamente.)

### Via comando direto (MCPs)
```bash
claude mcp add <nome> -- <comando-de-instalação>
```

Após instalar, reinicia o Claude Code.

### Auto-instalação durante /setup
Setup detecta stack que você declarou (P12 Trilha A / B8 Trilha B) e oferece instalar os MCPs relevantes com aprovação.

Pra cada MCP:
1. Skill mostra: "Detectei [ferramenta]. Instalar [MCP correspondente]?"
2. Aluno aprova/rejeita
3. Se aprovou: roda `claude mcp add` com confirmação
4. Se rejeitou: salva comando em `_contexto/mcps-pendentes.md`

---

## Quando NÃO instalar MCP

- Se não vai usar nas próximas 4 semanas: não instala (MCPs adicionam contexto)
- Se já tem alternativa nativa: não duplica
- Se MCP é beta/instável: espera versão estável

---

## Como adicionar ferramenta nova ao catálogo

Esse arquivo cresce conforme você descobre MCPs úteis. Adiciona linha com:
- Nome
- O quê faz
- Quando precisa (caso de uso concreto)
- Como instalar

---

## Plugins via /plugin

Claude Code tem marketplace nativo. Pra explorar:
```
/plugin
```

Skills recomendadas pra fluxo do `aifirst-os`:
- **deep-research** — pesquisa profunda multi-fonte (alternativa a `/mapear-mercado` quando precisa de mais profundidade)
- **video-to-skill** — transforma vídeo em skill executável (útil pra absorver YouTube de operadores top)
- **git-helper** — workflows git avançados (branches por sistema, PRs estruturados)
