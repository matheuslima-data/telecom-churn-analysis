-- 1. Distribuição de Clientes por Contrato

SELECT
    contract,
    COUNT(*) AS clientes_contrato
FROM Telco_customer_churn
GROUP BY contract;


-- 2. Clientes por Gênero

SELECT
    gender,
    COUNT(*) AS total_clientes
FROM Telco_customer_churn
GROUP BY gender;


-- 3. Média de Serviços por Tipo de Contrato

SELECT
    contract,
    ROUND(
        AVG(total_services),
        2
    ) AS media_servicos
FROM Telco_customer_churn
GROUP BY contract
ORDER BY media_servicos DESC;
