with final

    as (

		select 
			project_id,
            product_type,
            status,
            created_date,
            created_week,
            created_year

		from {{ ref('projects_audit_and_product_types_joined') }}

    )

select * from final