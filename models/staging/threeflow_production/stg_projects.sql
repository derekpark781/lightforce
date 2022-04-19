with final

    as (
        
        select * from {{ source('engineering_project', 'projects') }}

    )

select * from final