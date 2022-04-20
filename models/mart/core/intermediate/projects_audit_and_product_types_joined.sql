with base_lookup

    as (

		select 
			project_id,
            product_type

		from {{ ref('invite_project_carrier_producttype_lookup') }}
		group by 1, 2

    ),

    projects_audit

        as (

            select 
                project_id,
                status,
                created_date,
                created_week,
                created_year

            from {{ ref('stg_projects_audit') }}
            
        ),

    final

        as (

            select
                pa.project_id,
                product_type,
                status,
                created_date,
                created_week,
                created_year

            from base_lookup as bl
            left join projects_audit as pa
                on bl.project_id = pa.project_id

        )
 
select * from final