with final

    as (

		select 
			id,
            projectid,
            carrierid,
            status,
            sold,
            producttypeid,
            createdat,
            updatedat

		from {{ ref('stg_invites') }}
		
    )
 
select * from final