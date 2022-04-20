with base

    as (
        
        select * from {{ source('engineering_project', 'projects_audit') }}

    ),

    parse_json

        as (

            select 
                id,
                project_id,
                event,
                split(changeset, '"')[offset(7)] as status,
                timestamp(created_at) as created_at

            from base
            
        ),

    final 

        as (

            select 
                id,
                project_id,
                event,
                status,
                created_at,
                date(created_at) as created_date,
                date(date_trunc(created_at, week)) as created_week,
                date(date_trunc(created_at, year)) as created_year

            from parse_json

    )

select * from final