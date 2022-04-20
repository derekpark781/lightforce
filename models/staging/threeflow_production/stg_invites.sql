with base

    as (
        
        select * from {{ source('engineering_project', 'invites') }}

    ),

    final

        as (

            select 
                id,
                projectid as project_id,
                carrierid as carrier_id,
                status,
                sold,
                producttypeid as product_type_id,
                createdat as created_at,
                date(createdat) as created_date,
                date(date_trunc(createdat, week)) as created_week,
                date(date_trunc(createdat, year)) as created_year,
                updatedat as updated_at

            from base
            
        )   

select * from final