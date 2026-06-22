-- Databricks notebook source

-- Sugestão de prompt

-- MAGIC %md
-- MAGIC ## Prompt Copilot para construção do setup (Gold)
-- MAGIC No arquivo 03_sql_gold_validation, dentro do schema training_sql_serverless, com as tabelas silver criadas olhando para as tabelas "enriched" crie a tabela gold_daily_kpis com order_date, quantidade de pedidos, receita total e a média de ticket. Também crie outra tabela gold_top_categories com o ranking por receita e média da receita total. Por fim crie query para validações: quantidade de pedidos nulos por chave, de pedidos sem clientes correspondentes e percentual de e-mail invalidos.  

-- COMMAND ----------