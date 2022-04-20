with final

    as (

		select 
            created_week,
            sum(case
                when status = 'not_started' then projects
                else null
                end) as created,
            sum(case
                when status = 'closed' then projects
                else null 
                end) as finalized

		from {{ ref('metric_projects_waiting_in_each_status') }}
		group by 1
    )

select * from final