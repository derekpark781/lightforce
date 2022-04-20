with base_lookup

    as (

		select 
			carrier_name,
            invite_id

		from {{ ref('invite_project_carrier_producttype_lookup') }}
		group by 1, 2

    ),

    invites_audit

        as (

            select 
                invite_id,
                status,
                created_date,
                created_week,
                created_year

            from {{ ref('stg_invites_audit') }}
            
        ),

    final

        as (

            select
                ia.invite_id,
                carrier_name,
                status,
                created_date,
                created_week,
                created_year

            from base_lookup as bl
            left join invites_audit as ia
                on bl.invite_id = ia.invite_id

        )
 
select * from final