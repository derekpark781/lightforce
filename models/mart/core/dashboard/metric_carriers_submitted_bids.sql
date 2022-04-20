with final

    as (

		select 
            created_week

		from {{ ref('invites_audit_and_carrier_joined') }}

    )

select * from final