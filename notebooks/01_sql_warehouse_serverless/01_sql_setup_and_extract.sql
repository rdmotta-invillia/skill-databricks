-- Sugestão de prompt

-- MAGIC %md
-- MAGIC ## Prompt Copilot para construção do setup (Bronze)
-- MAGIC No arquivo 01_sql_setup_and_extract.sql, crie o schema "training_sql_serverless" atentando para validar se ele não existe antes. Em seguida, crie um volume de entrada ("workspace.training_sql_serverless.raw_files") para os arquivos CSV dentro do schema criado. Por fim, dentro desse schema, crie duas tabelas Bronze usando a função read_files como sugestão use "bronze_orders_raw" e "bronze_customers_raw" contendo o nome das colunas existentes nos arquivos CSV de pedidos e clientes com o uso do parâmetro InferSchema, adicione colunas de metadados para timestamp de ingestão e nome do arquivo de origem (_ingestion_timestamp e _source_file).
-- MAGIC 

-- COMMAND ----------
