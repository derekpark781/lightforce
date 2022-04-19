with final

    as (

		select 
			id,
            name,
            created_at,
            updated_at

		from {{ ref('stg_carriers') }}
		
    )
 
select * from final