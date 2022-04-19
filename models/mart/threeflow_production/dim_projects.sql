with final

    as (

		select 
			id,
            status,
            createdat,
            updatedat

		from {{ ref('stg_projects') }}
		
    )
 
select * from final