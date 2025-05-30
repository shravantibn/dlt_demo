
select
    orderNumber,
    {{ format_order_date('orderDate') }} as order_date_formatted,
    {{ extract_order_year('orderDate') }} as order_year,
    {{ days_since_order('orderDate', 'current_date') }} as days_since_order
from
    {{ source('classic_models', 'orders') }}