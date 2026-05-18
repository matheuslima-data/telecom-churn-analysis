-- 1. Cancelamento por Contrato

SELECT
    contract,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN churn_label = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_contract
FROM Telco_customer_churn
GROUP BY contract;

-- 2. Churn por Categoria de Risco

SELECT
    churn_risk,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN churn_label = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate
FROM Telco_customer_churn
GROUP BY churn_risk
ORDER BY churn_rate DESC;

-- 3. Churn por Quantidade de Serviços

SELECT
    total_services,
    COUNT(*) AS total_clientes,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN churn_label = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate
FROM Telco_customer_churn
GROUP BY total_services
ORDER BY total_services;
