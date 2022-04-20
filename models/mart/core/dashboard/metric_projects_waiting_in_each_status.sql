with final

    as (

		select 
            created_week,
            status,
            count(distinct project_id) as projects

		from {{ ref('projects_audit_and_product_types_joined') }}
        where created_date >= date_sub(created_year, interval 12 month)
		group by 1, 2

    )

select * from final