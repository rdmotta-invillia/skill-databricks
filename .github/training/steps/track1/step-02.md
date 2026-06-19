## 🥈 Etapa 2 - Limpeza e Padronização (Silver SQL)

Agora que a Bronze está pronta, transforme os dados em uma camada Silver confiável.

Abra `notebooks/01_sql_warehouse_serverless/02_sql_cleaning_etl.sql`.

Neste arquivo você precisa implementar a consulta "TODO" para criar a tabela `silver_orders_clean` aplicando as seguintes regras:

### 🎯 O que implementar

- [ ] Criar `silver_orders_clean` com:
  - cast de tipos
  - filtro de registros inválidos (`quantity`, `unit_price`, `status`)
  - remoção de duplicados por `order_id` com `row_number()`
  - `total_amount` calculado
- [ ] Criar `silver_customers_clean` com:
  - email normalizado (`lower(trim(email))`)
  - `is_valid_email` via regex
- [ ] Criar `silver_orders_enriched` com join entre pedidos e clientes

### 💡 Prompt Copilot sugerido

> "Gerar SQL para criar silver_orders_clean a partir de bronze_orders_raw aplicando casts/normalização, filtros (quantity 1–100, unit_price 0.01–50000, status='completed'), deduplicação por order_id mantendo o mais recente, e calculando total_amount arredondado"

### ✅ Validação esperada

- Tabela `silver_orders_clean` com menos linhas que Bronze (devido a deduplicação e filtros)
- Tabela `silver_orders_enriched` com colunas de cliente preenchidas via join

### ▶️ Como avançar

```bash
git add notebooks/01_sql_warehouse_serverless/02_sql_cleaning_etl.sql
git commit -m "feat: track1 etapa 2 - silver sql etl"
git push origin main
```

> ⚡ O Actions vai postar a etapa de **Gold SQL + validações finais**.
