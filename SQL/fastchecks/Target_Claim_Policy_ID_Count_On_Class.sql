
  select count(e.Source_System_Policy_ID) as 'Pol-ID-Count-Based-On-PRA_Class', pt.Premium_Type,g.PRA_Class from [tgt].[Fct_Premium] a
  JOIN tgt.Dim_PremiumTransaction AS b ON a.Premium_Transaction_Key = b.Premium_Transaction_Key
  JOIN tgt.Fct_PremiumInstance AS c ON b.Premium_Instance_Key = c.Premium_Instance_Key
  JOIN tgt.Dim_Policy AS e ON c.Policy_Key = e.Policy_Key
  JOIN tgt.Dim_Bordereau f on f.Bordereau_Key = c.Bordereau_Key
  JOIN tgt.Dim_PRAClass g on c.PRA_Class_Key = g.PRA_Class_Key
  join tgt.Dim_BindingAuthority h on c.Binding_authority_key = h.binding_authority_key
  join tgt.Dim_PolicyAction i on i.Policy_Action_Key = c.Policy_Action_Key
  join tgt.Dim_PremiumType pt on pt.Premium_Type_Key = a.Premium_Type_Key
  where Source_System_Key = 4
  group by pt.Premium_Type,g.PRA_Class
  order by g.PRA_Class