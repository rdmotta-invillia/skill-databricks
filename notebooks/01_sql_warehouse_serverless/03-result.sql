-- Databricks notebook source
-- MAGIC %md
-- MAGIC # 03 - Gold SQL e Validacoes
-- MAGIC
-- MAGIC **Objetivo:** gerar tabelas analiticas Gold para consumo em BI.

-- COMMAND ----------

USE training_sql_serverless;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Gold 1: KPIs diarios

-- COMMAND ----------

CREATE OR REPLACE TABLE gold_daily_kpis AS
SELECT
  order_date,
  COUNT(DISTINCT order_id) AS orders_count,
  ROUND(SUM(total_amount), 2) AS revenue_total,
  ROUND(AVG(total_amount), 2) AS avg_ticket
FROM silver_orders_enriched
GROUP BY order_date
ORDER BY order_date;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Gold 2: ranking por categoria

-- COMMAND ----------

CREATE OR REPLACE TABLE gold_top_categories AS
WITH category_agg AS (
  SELECT
    product_category,
    COUNT(DISTINCT order_id) AS orders_count,
    ROUND(SUM(total_amount), 2) AS revenue_total,
    ROUND(AVG(total_amount), 2) AS avg_ticket
  FROM silver_orders_enriched
  GROUP BY product_category
),
ranked AS (
  SELECT
    product_category,
    orders_count,
    revenue_total,
    avg_ticket,
    DENSE_RANK() OVER (ORDER BY revenue_total DESC) AS revenue_rank
  FROM category_agg
)
SELECT *
FROM ranked
ORDER BY revenue_rank, product_category;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Validacao de qualidade dos dados

-- COMMAND ----------

SELECT
  SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
  SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
  SUM(CASE WHEN order_id IS NOT NULL AND customer_name IS NULL THEN 1 ELSE 0 END) AS orders_without_matching_customer,
  ROUND(
    100.0 * SUM(CASE WHEN COALESCE(is_valid_email, false) = false THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS invalid_email_pct
FROM silver_orders_enriched;

-- COMMAND ----------

-- Visualizacao rapida para BI
SELECT * FROM gold_daily_kpis ORDER BY order_date DESC LIMIT 30;

-- COMMAND ----------

SELECT * FROM gold_top_categories ORDER BY revenue_rank, product_category LIMIT 20;