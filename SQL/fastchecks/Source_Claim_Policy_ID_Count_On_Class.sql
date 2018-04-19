
select 
a.[Pol-ID-Count-Based-On-SectionDescription], 
a.Premium_Type, 
case 
	when a.SectionDescription = 'Commercial Property' then 'Commercial Property'
	when a.SectionDescription = 'Employers Liability' then 'Employers Liability'
	when a.SectionDescription = 'Personal Accident' then 'Personal Accident'
	when a.SectionDescription = 'Professional Indemnity' then 'Professional Indemnity'
	when a.SectionDescription = 'Public and Products Liability' then 'Public Liability'
	when a.SectionDescription = 'Property' then 'Personal Lines Property' 
	else 'Unknown'
	end 
as SectionDescription 

from (
select count(InsuredItemDeclarationPolicy_Id) as 'Pol-ID-Count-Based-On-SectionDescription','Gross Booked Premium' as Premium_Type, SectionDescription from [dbo].[PremiumDeclarations] f
INNER JOIN 
		[dbo].[Contracts] C      
		ON  F.InsuredItemDeclarationContractYear = c.ContractYear AND  			
		F.InsuredItemDeclarationContractUMR = c.ContractUMR
where TradingPartnerName in ('Argo Direct Limited (ADL)','Argo Managing Agency Ltd (Syndicate 1200 AMA)','Markel International (LIRMA: T3902)','Argo','Markel','Faraday') 
	and SectionDescription IN  ('Employers Liability', 'Public and Products Liability', 'Commercial Property', 'Professional Indemnity', 'Personal Accident',  'Property') 
	and islead = 1 
group by SectionDescription
union
select count(InsuredItemDeclarationPolicy_Id) as 'Pol-ID-Count-Based-On-SectionDescription','Gross Written Premium' as Premium_Type, SectionDescription from [dbo].[RiskDeclarations] f
INNER JOIN 
		[dbo].[Contracts] C      
		ON  F.InsuredItemDeclarationContractYear = c.ContractYear AND  			
		F.InsuredItemDeclarationContractUMR = c.ContractUMR
where TradingPartnerName in ('Argo Direct Limited (ADL)','Argo Managing Agency Ltd (Syndicate 1200 AMA)','Markel International (LIRMA: T3902)','Argo','Markel','Faraday') 
	and SectionDescription IN  ('Employers Liability', 'Public and Products Liability', 'Commercial Property', 'Professional Indemnity', 'Personal Accident',  'Property') 
	and islead = 1 
group by SectionDescription) a
order by SectionDescription