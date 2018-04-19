select 
	claimdateadvised, 
	claim_id, 
	ClaimClaimStatusName, 
	claimdateoflossfrom, 
	claimlosscause, 
	claimlossdescription,
	outstandingphysicaldamage, 
	outstandingthirdpartyfees, 
	outstandingbodilyinjury 
from [dbo].[ClaimDeclarations] f
INNER JOIN 
		[dbo].[Contracts] C      
		ON  F.ClaimDeclarationContractYear = c.ContractYear AND  			
		F.ClaimDeclarationContractUMR = c.ContractUMR
		and c.ContractName = f.ClaimDeclarationContractName   
		and c.SectionName = f.ClaimDeclarationSectionName 
where concat(month(claimdeclarationpolicyinception),Year(claimdeclarationpolicyinception)) = 12017
	and TradingPartnerName in ('Argo Direct Limited (ADL)','Argo Managing Agency Ltd (Syndicate 1200 AMA)','Markel International (LIRMA: T3902)','Argo','Markel','Faraday') 
	and SectionDescription IN  ('Employers Liability', 'Public and Products Liability', 'Commercial Property', 'Professional Indemnity', 'Personal Accident',  'Property') 
	and islead = 1