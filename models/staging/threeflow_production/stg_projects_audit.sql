with final

    as (
        
        select * from {{ source('engineering_project', 'projects_audit') }}

    )

select * from final