-- 1. Total Clientes

SELECT COUNT(*) AS total_clientes
FROM Telco_customer_churn;

-- 2. Quantidade de Clientes em Churn

SELECT COUNT(*) AS clientes_churn
FROM Telco_customer_churn
WHERE churn_label = 'Yes';

-- 3. % de clientes que cancelaram

SELECT
    ROUND(
        100.0 * SUM(
            CASE
                WHEN churn_label = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate
FROM Telco_customer_churn;

-- 4. Receita Total

SELECT
    ROUND(
        SUM(monthly_charges),
        2
    ) AS receita_total
FROM Telco_customer_churn;

-- 5. Ticket Médio

SELECT
    ROUND(
        AVG(monthly_charges),
        2
    ) AS ticket_medio
FROM Telco_customer_churn