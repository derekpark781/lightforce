with final

    as (
        
        select 
            id,
            invite_id,
            event,
            null as status,
            created_at,
            date(created_at) as created_date,
            date(date_trunc(created_at, week)) as created_week,
            date(date_trunc(created_at, year)) as created_year
        
        from {{ source('engineering_project', 'invites_audit') }}

    )
 
select * from final