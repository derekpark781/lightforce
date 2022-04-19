with final

    as (
        
        select * from {{ source('engineering_project', 'invites') }}

    )

select * from final