with final

    as (
        
        select * from {{ source('engineering_project', 'product_types') }}

    )

select * from final