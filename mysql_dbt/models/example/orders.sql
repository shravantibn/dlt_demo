with prepared_data as (
    SELECT 
        orderNumber,
        orderDate,
        customerName,
        orderLineNumber,
        productName,
        quantityOrdered,
        priceEach
    FROM
        {{ source('classic_models','orders') }}
    INNER JOIN {{ source('classic_models','orderdetails') }} 
        USING (orderNumber)
    INNER JOIN {{ source('classic_models','products') }} 
        USING (productCode)
    INNER JOIN {{ source('classic_models','customers')}} 
        USING (customerNumber)
    ORDER BY 
        orderNumber, 
        orderLineNumber
)
select * from prepared_data