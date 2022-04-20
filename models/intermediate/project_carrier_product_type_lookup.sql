with final

    as (

		select 
			project_id,
            carrier_id,
            product_type_id

		from {{ ref('stg_invites') }}
        group by 1, 2, 3
		
    )
 
select * from final