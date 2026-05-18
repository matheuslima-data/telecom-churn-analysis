-- 1. Receita Mensal Perdida por Churn

SELECT
	ROUND(
      	SUM(monthly_charges),
      	2
      ) as receita_mensal_perdida
FROM Telco_customer_churn
WHERE churn_label = 'Yes';

-- 2. Receita Perdida por Tipo de Contrato

SELECT
    contract,
    ROUND(
        SUM(monthly_charges),
        2
    ) AS receita_perdida
FROM Telco_customer_churn
WHERE churn_label = 'Yes'
GROUP BY contract
ORDER BY receita_perdida DESC;

-- 3. CLTV Perdido por Churn

SELECT
    contract,
    ROUND(
        SUM(monthly_charges),
        2
    ) AS receita_perdida
FROM Telco_customer_churn
WHERE churn_label = 'Yes'
GROUP BY contract
ORDER BY receita_perdida DESC;

-- 4. Ranking das Cidades com Maior Receita Perdida

WITH receita_por_cidade AS (
select 
	city,
    ROUND(
	SUM(monthly_charges),
      2
    ) as receita_perdida
from Telco_customer_churn
WHERE churn_label = 'Yes'
GROUP BY city
)
  
  SELECT
    city,
    receita_perdida,
    RANK() OVER (
        ORDER BY receita_perdida DESC
    ) AS ranking
FROM receita_por_cidade
ORDER BY ranking;

-- 5. % de receita perdida por tempo de contrato

WITH receita_perdida_contrato AS (
select 
	contract,
    ROUND(
	SUM(monthly_charges),
      2
    ) as receita_perdida
from Telco_customer_churn
WHERE churn_label = 'Yes'
GROUP BY contract
)
  
  SELECT
    contract,
    receita_perdida,
    round(
      100.0 * receita_perdida / SUM(receita_perdida) OVER (),
        2
    ) AS percentual_perda
FROM receita_perdida_contrato
ORDER BY percentual_perda DESC;
