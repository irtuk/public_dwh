INSERT INTO gwp_gbp_fast_compare_result (

select sourcedb, case when isnull (targetdb) then 'Unknown' else targetdb end as targetdb , pra_class, monthyear, premium_type, source_premium, target_premium ,  ( (source_premium - target_premium) / source_premium ) * 100 as delta,

CASE 
	WHEN ( (source_premium - target_premium) / source_premium ) * 100  < 5 then 'Less than 5% deviance'
	WHEN ( (source_premium - target_premium) / source_premium ) * 100  > 5 then 'premium Delta Out of 5% tolerance'
    WHEN targetdb is null then concat( 'no premiums for '  , pra_class , ' in ' , monthyear )
END AS RESULT


FROM ( 

select sourcedb, targetdb, s.pra_class , s.monthyear, s.premium_type, s.total_premium as source_premium, t.total_premium as target_premium  
from gwp_gbp_fast_compare_source s left outer join gwp_gbp_fast_compare_target t on s.pra_class = t.pra_class and s.monthyear = t.monthyear and s.premium_type = t.premium_type

union all

select sourcedb, targetdb, t.pra_class , t.monthyear, t.premium_type, t.total_premium as source_premium, t.total_premium as target_premium  
from gwp_gbp_fast_compare_source s right outer join gwp_gbp_fast_compare_target t on s.pra_class = t.pra_class and s.monthyear = t.monthyear and s.premium_type = t.premium_type ) alias

order by monthyear asc, pra_class asc, premium_type asc ) 