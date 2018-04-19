SELECT 

	SUM(MQ.GrossPremium) AS TOTAL_PREMIUM
	,MQ.InsuredItemDeclarationBusinessClassName
	,MQ.Month_Year
	,MQ.Premium_type



FROM (

select distinct 
	a.InsuredItemDeclarationPolicyReference
	,a.InsuredItemDeclarationPolicy_Id
	,a.System_Binding_Authority_ID 
	,a.GrossPremium
	,a.InsuredItemDeclarationBusinessClassName
	,a.InsuredItemDeclarationPolicyTypeName
	,concat(a.Accounting_Month,a.Accounting_Year) as Month_Year
	,'Gross Booked Premium' as Premium_type
	,A.IsDeleted
	from	(
		SELECT 
		
		f.InsuredItemDeclarationPolicyReference
		,f.InsuredItemDeclarationPolicy_Id,
		CONVERT(varchar(1000),CONVERT(varchar,f.InsuredItemDeclarationCoverholderName)  + '~' + CONVERT(varchar,f.InsuredItemDeclarationContractYear)   + '~' +  
		CONVERT(varchar,ContractUMR)     + '~' + CONVERT(varchar,ContractName))  as Binding_Authority_Name  ,
		CONVERT(varchar(1000), CONVERT(varchar,f.InsuredItemDeclarationCoverholderName)    + '~' +     CONVERT(varchar,f.InsuredItemDeclarationContractYear)   + '~' +   
		CONVERT(varchar,ContractUMR)  + '~' + CONVERT(varchar,ContractName)) as System_Binding_Authority_ID
		,f.GrossPremium
		,f.InsuredItemDeclarationBusinessClassName
		,f.InsuredItemDeclarationPolicyTypeName		  
		,Year(f.InsuredItemDeclarationSubmissionDate) as Accounting_Year
		,month(f.InsuredItemDeclarationSubmissionDate) as Accounting_Month
		,TradingPartnerName
		,SectionDescription	
		,c.islead
		,C.IsDeleted
		
		FROM dbo.PremiumDeclarations f
		INNER JOIN 
		[dbo].[Contracts] C      
		ON  F.InsuredItemDeclarationContractYear = c.ContractYear AND  			
		F.InsuredItemDeclarationContractUMR = c.ContractUMR
		where 1=1 
			and GrossPremium <> 0
	and TradingPartnerName in ('Argo Direct Limited (ADL)','Argo Managing Agency Ltd (Syndicate 1200 AMA)','Markel International (LIRMA: T3902)','Argo','Markel','Faraday') 
	and SectionDescription IN  ('Employers Liability', 'Public and Products Liability', 'Commercial Property', 'Professional Indemnity', 'Personal Accident',  'Property') 
	and islead = 1 

		) a
	
	UNION ALL 
	
	select distinct 
	a.InsuredItemDeclarationPolicyReference
	,a.InsuredItemDeclarationPolicy_Id
	,a.System_Binding_Authority_ID 
	,a.GrossPremium
	,a.InsuredItemDeclarationBusinessClassName
	,a.InsuredItemDeclarationPolicyTypeName
	,concat(a.Accounting_Month,a.Accounting_Year) as Month_Year
	,'Gross Written Premium' as Premium_type
	,A.IsDeleted
	from	(
		SELECT 
		
		f.InsuredItemDeclarationPolicyReference
		,f.InsuredItemDeclarationPolicy_Id,
		CONVERT(varchar(1000),CONVERT(varchar,f.InsuredItemDeclarationCoverholderName)  + '~' + CONVERT(varchar,f.InsuredItemDeclarationContractYear)   + '~' +  
		CONVERT(varchar,ContractUMR)     + '~' + CONVERT(varchar,ContractName))  as Binding_Authority_Name  ,
		CONVERT(varchar(1000), CONVERT(varchar,f.InsuredItemDeclarationCoverholderName)    + '~' +     CONVERT(varchar,f.InsuredItemDeclarationContractYear)   + '~' +   
		CONVERT(varchar,ContractUMR)  + '~' + CONVERT(varchar,ContractName)) as System_Binding_Authority_ID
		,f.GrossPremium
		,f.InsuredItemDeclarationBusinessClassName
		,f.InsuredItemDeclarationPolicyTypeName		  
		,Year(f.InsuredItemDeclarationSubmissionDate) as Accounting_Year
		,month(f.InsuredItemDeclarationSubmissionDate) as Accounting_Month
		,TradingPartnerName
		,SectionDescription	
		,c.islead
		,C.IsDeleted
		
		FROM dbo.RiskDeclarations f
		INNER JOIN 
		[dbo].[Contracts] C      
		ON  F.InsuredItemDeclarationContractYear = c.ContractYear AND  			
		F.InsuredItemDeclarationContractUMR = c.ContractUMR
		where 1=1 
			and GrossPremium <> 0
	and TradingPartnerName in ('Argo Direct Limited (ADL)','Argo Managing Agency Ltd (Syndicate 1200 AMA)','Markel International (LIRMA: T3902)','Argo','Markel','Faraday') 
	and SectionDescription IN  ('Employers Liability', 'Public and Products Liability', 'Commercial Property', 'Professional Indemnity', 'Personal Accident',  'Property') 
	and islead = 1 
		) a ) MQ
	
where 1=1

group by
	MQ.InsuredItemDeclarationBusinessClassName
	,MQ.Month_Year
	,MQ.Premium_type

