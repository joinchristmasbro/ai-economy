---
title: "System Design"
type: system-design/index
created: pendente
---

# System Design

Arquitetura do sistema de growth do nicho. 3 camadas + 1 arquivo de métricas.

## Mapa

- [[aquisicao]] — como o cliente atrai os certos
- [[conversao]] — como o lead vira cliente pagante
- [[operacao]] — como o serviço é entregue continuamente
- [[metricas]] — KPIs trackados, dashboards, cadência de relatórios

## Como usar

Esse design é a **arquitetura mestre** do sistema. Cada cliente em `clientes/[nome]/` é uma **instância** desse design, com customizações específicas. Quando você descobre algo novo aplicando em um cliente, atualiza aqui pra que próximos clientes herdem.
