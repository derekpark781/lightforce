with final

    as (
        
        select * from {{ source('engineering_project', 'invites_audit') }}

    )

select * from final