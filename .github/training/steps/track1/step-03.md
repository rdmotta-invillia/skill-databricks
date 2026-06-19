## 🥇 Etapa 3 - Gold SQL e KPI Analítico

Com Silver pronta, crie uma camada Gold para consumo em BI.

Abra `notebooks/01_sql_warehouse_serverless/03_sql_gold_validation.sql`.

### 🎯 O que implementar

- [ ] Criar `gold_daily_kpis` com:
  - `order_date`
  - quantidade de pedidos
  - receita total
  - ticket médio
- [ ] Criar `gold_top_categories` com ranking por receita
- [ ] Criar query de validação de qualidade dos dados:
  - nulos em chaves
  - pedidos sem cliente correspondente
  - percentual de emails inválidos

### 💡 Prompt Copilot sugerido

> "Gere SQL para tabela Gold com KPIs diários (orders_count, revenue_total, avg_ticket) a partir de silver_orders_enriched, agrupando por date(order_date)."

### ▶️ Finalizar trilha

```bash
git add notebooks/01_sql_warehouse_serverless/03_sql_gold_validation.sql
git commit -m "feat: track1 etapa 3 - gold sql concluida"
git push origin main
```

> ⚡ O Actions detecta o commit e fecha a issue da trilha automaticamente.
