with final

    as (

		select 
			project_id,
            created_year,
            count(distinct product_type) as number_of_product_types
            


		from {{ ref('projects_audit_and_product_types_joined') }}
        where status = 'sent_to_market'
		group by 1, 2

    )

select * from final