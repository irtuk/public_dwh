select DISTINCT a.Policy_Number
		      ,a.Source_System_Policy_ID
		      ,a.system_Binding_Authority_ID
		      ,a.Premium_Amt
		      ,a.PRA_Class
		      ,concat(a.Accounting_Month,a.Accounting_Year) as Month_Year
		      ,a.Premium_Type
		from (
			SELECT 
		      e.Policy_Number
		      ,e.Source_System_Policy_ID
		      ,h.system_Binding_Authority_ID
		      ,a.Premium_Amt
		      ,g.PRA_Class
		      ,Year(f.Bdx_Received_Date) as 'Accounting_Year'
		      ,month(f.Bdx_Received_Date) as 'Accounting_Month'
		      ,f.Bordereau_Key
		      ,pt.Premium_Type
		      FROM [tgt].[Fct_Premium] a
		      JOIN tgt.Dim_PremiumTransaction AS b ON a.Premium_Transaction_Key = b.Premium_Transaction_Key
		      JOIN tgt.Fct_PremiumInstance AS c ON b.Premium_Instance_Key = c.Premium_Instance_Key
		      JOIN tgt.Dim_Policy AS e ON c.Policy_Key = e.Policy_Key
		      JOIN tgt.Dim_Bordereau f on f.Bordereau_Key = c.Bordereau_Key
		      JOIN tgt.Dim_PRAClass g on c.PRA_Class_Key = g.PRA_Class_Key
		      join tgt.Dim_BindingAuthority h on c.Binding_authority_key = h.binding_authority_key
		      join tgt.Dim_PolicyAction i on i.Policy_Action_Key = c.Policy_Action_Key
		      join tgt.Dim_PremiumType pt on pt.Premium_Type_Key = a.Premium_Type_Key
		      WHERE Source_System_Key = 4 and a.Premium_Amt <> 0 ) a
		      where concat(a.Accounting_Month,a.Accounting_Year) =  