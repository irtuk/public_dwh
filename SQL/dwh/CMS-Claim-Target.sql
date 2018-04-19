select 
	a.notified_date, 
	a.source_system_claim_ID, 
	a.claim_status_type, 
	Date_of_loss_from,
	cause_description, 
	Description, 
	Physical_Damage_Amt,
	Third_Party_Fees, 
	bodily_injury_amt
   FROM [tgt].[Dim_Claim] a
  join [tgt].[Fct_ClaimTransaction] b
  on a.Claim_Key = b.Claim_Key
  join
  tgt.Dim_ClaimTransactionType c
  on c.Claim_Transaction_Type_Key = b.Claim_Transaction_Type_Key
    where b.Source_System_Key = 4
	and Transaction_Type_Code = 'OS'
	and concat(month(date_of_loss_from),Year(date_of_loss_from)) = 12017