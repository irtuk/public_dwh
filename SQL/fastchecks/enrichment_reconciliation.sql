select 
	convert(date,Create_Datetime,103),
	table_name, 
	count(*) as FAIL_WARNINGS 
from UDW_Reconciliation where status = 'Fail'
group by convert(date,Create_Datetime,103),table_name