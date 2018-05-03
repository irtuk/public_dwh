package SourceCleaner::mod_c;

#setup includes

use lib 'c:\\UDWTesting\\';
use SourceCleaner::mod_CleaningRules qw(DOUBLESPACES);


use strict;

use warnings;

use Exporter qw(import);

our @EXPORT_OK = qw(CLAIMLINE);

sub CLAIMLINE{


my $file = $_[0];
my $outfile = "CLEAN_".$file;


open (IN, "<$file") or die "Can't open infile: $! \n ";
open (OUT, ">$outfile") or die "Can't open outfile: $! \n ";
print OUT "Business_Team_ID|Year_Of_Account|Carrier_Name|Binding_Authority_ID|Binding_Authority_Name|Policy_ID|System_Claim_ID|Policy_Number|Policy_Inception_Date|Cause_Type|Cause_Type_Descr|Cedent_Reinsurence_Claim_Ref|Claim_Closed_Date|Claim_Descr|Claim_Name|Claim_Remark|Claim_Status_Sub_Type_Descr|Claim_Status_Type|Claim_Trade_Code_Type|Claim_within_ELTO|Claim_Trade_Code_Type_Descr|Claimant_Addl_Info|Claimant_DOB|Claimant_Name|Claimant_Rep|Claimant_SSN|Class_Type|Commodity_Type|Commodity_Type_Descr|Component_Failure_Type|Component_Failure_Type_Descr|Conveyed_By_Ambulance|Damage_Type|Damage_Type_Descr|ECO|Expert|Initial_Report_Date|Injury_Descr|Injury_Type|Injury_Type_Descr|Insured_Name|Loss_Detail_Type_Descr|Loss_End|Loss_Location|Loss_Post_Code|Loss_Start|Packaging_Type|Packaging_Type_Descr|Potential_Recovery_Type|Potential_Recovery_Type_Descr|Req_Prior_Approval|Salvage_Subrogation|Taken_To_Hospital|Transport_Type|Transport_Type_Descr|UW_Contacted|UW_Extended_Loss|XPL|Misc_Expert\n";

while (<IN>){
no warnings 'uninitialized';	
next if /Business_Team_ID/i;
my $line = $_;
my ($Business_Team_ID,$Year_Of_Account,$Carrier_Name,$Binding_Authority_ID,$Binding_Authority_Name,$Policy_ID,$System_Claim_ID,$Policy_Number,$Policy_Inception_Date,$Cause_Type,$Cause_Type_Descr,$Cedent_Reinsurence_Claim_Ref,$Claim_Closed_Date,$Claim_Descr,$Claim_Name,$Claim_Remark,$Claim_Status_Sub_Type_Descr,$Claim_Status_Type,$Claim_Trade_Code_Type,$Claim_within_ELTO,$Claim_Trade_Code_Type_Descr,$Claimant_Addl_Info,$Claimant_DOB,$Claimant_Name,$Claimant_Rep,$Claimant_SSN,$Class_Type,$Commodity_Type,$Commodity_Type_Descr,$Component_Failure_Type,$Component_Failure_Type_Descr,$Conveyed_By_Ambulance,$Damage_Type,$Damage_Type_Descr,$ECO,$Expert,$Initial_Report_Date,$Injury_Descr,$Injury_Type,$Injury_Type_Descr,$Insured_Name,$Loss_Detail_Type_Descr,$Loss_End,$Loss_Location,$Loss_Post_Code,$Loss_Start,$Packaging_Type,$Packaging_Type_Descr,$Potential_Recovery_Type,$Potential_Recovery_Type_Descr,$Req_Prior_Approval,$Salvage_Subrogation,$Taken_To_Hospital,$Transport_Type,$Transport_Type_Descr,$UW_Contacted,$UW_Extended_Loss,$XPL,$Misc_Expert) = split/\|/,$line;
$Binding_Authority_Name = SourceCleaner::mod_CleaningRules::DOUBLESPACES($Binding_Authority_Name);
print OUT 	$Business_Team_ID. "|" . $Year_Of_Account. "|" . $Carrier_Name. "|" . $Binding_Authority_ID. "|" . $Binding_Authority_Name. "|" . $Policy_ID. "|" . $System_Claim_ID. "|" . $Policy_Number. "|" . $Policy_Inception_Date. "|" . $Cause_Type. "|" . $Cause_Type_Descr. "|" . $Cedent_Reinsurence_Claim_Ref. "|" . $Claim_Closed_Date. "|" . $Claim_Descr. "|" . $Claim_Name. "|" . $Claim_Remark. "|" . $Claim_Status_Sub_Type_Descr. "|" . $Claim_Status_Type. "|" . $Claim_Trade_Code_Type. "|" . $Claim_within_ELTO. "|" . $Claim_Trade_Code_Type_Descr. "|" . $Claimant_Addl_Info. "|" . $Claimant_DOB. "|" . $Claimant_Name. "|" . $Claimant_Rep. "|" . $Claimant_SSN. "|" . $Class_Type. "|" . $Commodity_Type. "|" . $Commodity_Type_Descr. "|" . $Component_Failure_Type. "|" . $Component_Failure_Type_Descr. "|" . $Conveyed_By_Ambulance. "|" . $Damage_Type. "|" . $Damage_Type_Descr. "|" . $ECO. "|" . $Expert. "|" . $Initial_Report_Date. "|" . $Injury_Descr. "|" . $Injury_Type. "|" . $Injury_Type_Descr. "|" . $Insured_Name. "|" . $Loss_Detail_Type_Descr. "|" . $Loss_End. "|" . $Loss_Location. "|" . $Loss_Post_Code. "|" . $Loss_Start. "|" . $Packaging_Type. "|" . $Packaging_Type_Descr. "|" . $Potential_Recovery_Type. "|" . $Potential_Recovery_Type_Descr. "|" . $Req_Prior_Approval. "|" . $Salvage_Subrogation. "|" . $Taken_To_Hospital. "|" . $Transport_Type. "|" . $Transport_Type_Descr. "|" . $UW_Contacted. "|" . $UW_Extended_Loss. "|" . $XPL. "|" . $Misc_Expert;
}
close IN;
close OUT;

unlink $file;
rename $outfile, $file;


}