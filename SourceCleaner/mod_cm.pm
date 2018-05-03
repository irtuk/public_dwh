package SourceCleaner::mod_cm;

#setup includes

use lib 'c:\\UDWTesting\\';

use SourceCleaner::mod_CleaningRules qw(DOUBLESPACES);


use strict;

use warnings;

use Exporter qw(import);

our @EXPORT_OK = qw(CLAIMMOVEMENTLINE);


sub CLAIMMOVEMENTLINE{

my $file = $_[0];
my $outfile = "CLEAN_".$file;


open (IN, "<$file") or die "Can't open infile: $! \n ";
open (OUT, ">$outfile") or die "Can't open outfile: $! \n ";
print OUT "Business_Team_ID|YOA|Policy_ID|Binding_Authority_ID|Class|Bordereau_ID|Alternative_Accommodation|Bedrooms_Rated|Building_In_Flood_Area|Building_Or_House_Number|Address_Line_1|Construction_Roof_Type_Code|Construction_Roof_Type_Description|Construction_Wall_Type_Code|Construction_Wall_Type_Description|Buildings_Premium|Contents_Premium|Date_Of_Birth|Earnings_Profile_Code|Effective_Date|Employer_Reference_Number_ERN|Employers_Liability|ERN_Exempt|Escape_Of_Water_Exclusion|Escape_Water_Excess|Expiry_Date|Flat_Roof_Pct|FLEA_Cover_Only|Flood_Excess|Flood_Exclusion|Flood_Peril|Full_T_Cover|Inception_Date|Ins_Name|Is_Insured_Company_A_Parent_Company|Legal_Expenses|Total_Buildings_Limit|Total_Employer_Liability_EL_Limit|Total_Credit_Cards_Limit|Total_Public_Liability_PL_Limit|Total_Contents_Limit|Total_Freezer_Contents_Limit|Total_BI_Limit|Total_Specified_Items_Limit_In_Home|Total_Specified_Items_Limit_Away_From_Home|Total_Money_Limit|Total_Unspecified_Items_Limit|Total_GIT_Limit|Total_Other_Limit|Total_Buildings_AD_Limit|Total_Buildings_Vol_Excess|Total_Buildings_NCD|Buildings_NCD_Pct|Total_Contents_AD_Limit|Total_Contents_Vol_Excess|Total_Contents_NCD|Contents_NCD_Pct|Loss_Of_Rent_Of_Contents_SI|New_Renewal|Number_Of_Years_At_This_Address|Number_Of_Bedrooms|Non_Standard_Construction_Details|Number_Of_Risks_Locations|Occupancy_Level|Occupancy_Description|Trade|Trade_Detailed_Description|Other_Wageroll|Pedal_Cycles_Details|Policy_Number|Post_Code|CURR|Premium_Payment_Frequency|Total_Prem_excl_IPT|Property_Type|Restrictions_Exclusions_Applied|Product|Security_Protections_Installed|Std_Construction|Storm_Excess|Storm_Exclusion|Subsidence_Excess|Subsidence_Exclusion|Survey_Fees|T_BI_Premium|T_Premium|Turnover_Last_12_Months|Turnover_Next_12_Months|Underwriting_Comments|Unoccupied|Year_Property_Was_Built|Zone|Contract_Status_Type\n";
while (<IN>){
no warnings 'uninitialized';	
next if /Business_Team_ID/i;
my $line = $_;
my ($Business_Team_ID,$Carrier_ID,$Carrier_Name,$Binding_Authority_ID,$Binding_Authority_Name,$Policy_ID,$Year_Of_Account,$Policy_Number,$Claim_ID,$LAE,$Loss,$Loss_LAE,$Claim_Transaction_Type,$Claim_Transaction_Group_ID,$Claim_Transaction_Ccy,$Accounting_Date) = split/\|/,$line;
$Binding_Authority_Name = SourceCleaner::mod_CleaningRules::DOUBLESPACES($Binding_Authority_Name);
print OUT $Business_Team_ID. "|" .$Carrier_ID. "|" .$Carrier_Name. "|" .$Binding_Authority_ID. "|" .$Binding_Authority_Name. "|" .$Policy_ID. "|" .$Year_Of_Account. "|" .$Policy_Number. "|" .$Claim_ID. "|" .$LAE. "|" .$Loss. "|" .$Loss_LAE. "|" .$Claim_Transaction_Type. "|" .$Claim_Transaction_Group_ID. "|" .$Claim_Transaction_Ccy. "|" .$Accounting_Date;
}

close IN;
close OUT;
unlink $file;
rename $outfile, $file;
}



