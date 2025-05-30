WITH high_value_cust AS (
    SELECT DISTINCT
        customerNumber
    FROM
        {{ source('classic_models', 'orderdetails') }}
        INNER JOIN {{ source('classic_models', 'orders') }} 
            USING (orderNumber)
    GROUP BY 
        customerNumber,
        orderNumber
    HAVING 
        SUM(priceEach * quantityOrdered) > 60000
)

SELECT 
    cust.customerNumber,
    cust.customerName
FROM
    {{ source('classic_models', 'customers') }} cust
    INNER JOIN high_value_cust hvc
        ON cust.customerNumber = hvc.customerNumber
