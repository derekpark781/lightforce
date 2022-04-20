with invites

    as (

		select 
            invite_id,
			project_id,
            carrier_id,
            product_type_id

		from {{ ref('stg_invites') }}
		group by 1, 2, 3, 4

    ),

    carriers

        as (

            select 
                id,
                name

            from {{ ref('stg_carriers') }}
            
        ),

    product_types

        as (

            select
                id,
                name

            from {{ ref('stg_product_types') }} 

        ),
    
    final

        as (

            select 
                invite_id,
                project_id,
                c.name as carrier_name,
                pt.name as product_type

            from invites as i
            left join carriers as c
                on carrier_id = c.id
            left join product_types as pt
                on product_type_id = pt.id
        )
 
select * from final