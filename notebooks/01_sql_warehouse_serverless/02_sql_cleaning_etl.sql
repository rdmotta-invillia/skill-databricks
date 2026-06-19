-- Sugestão de prompt

-- MAGIC %md
-- MAGIC ## Prompt Copilot para construção do setup (Silver)
-- MAGIC No arquivo 02_sql_cleaning_etl, gerar SQL para criar a tabela silver_orders_clean a partir de bronze_orders_raw aplicando casts/normalização, filtros (quantity 1–100, unit_price 0.01–50000, status='completed'), deduplicação por order_id mantendo o mais recente, e calculando total_amount arredondado. Em seguida crie a tabela silver_customers_clean a partir de bronze_customers_raw contendo um campo is_valid_email com o Regex validando o campo.
-- MAGIC 

-- COMMAND ----------
