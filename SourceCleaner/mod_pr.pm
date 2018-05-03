package SourceCleaner::mod_pr;

#setup includes

use lib 'c:\\UDWTesting\\';
use SourceCleaner::mod_CleaningRules qw(DOUBLESPACES);	

use strict;

use warnings;

use Exporter qw(import);

our @EXPORT_OK = qw(PREMRISKLINE);


sub PREMRISKLINE{

my $file = $_[0];
my $outfile = "CLEAN_".$file;


open (IN, "<$file") or die "Can't open infile: $! \n ";
open (OUT, ">$outfile") or die "Can't open outfile: $! \n ";
print OUT "Business_Team_ID|Policy_ID|Premium_ID|Transaction_ID|Carrier_ID|Carrier_Name|Binding_Authority_ID|Binding_Authority_Name|Year_Of_Account|Class|Policy_Number|Gross_Premium|Commission_Amount|Brokerage_Amount|Agency_Commission_Amount|IPT_Amount|Settlement_Amount|Bordereau_Type|Settlement_Type|Currency_Type|Accounting_Date|Account_Period|IPT_Pcntg|Doc_ID\n";

while (<IN>){
no warnings 'uninitialized';
next if /Business_Team_ID/i;
my $line = $_;
my ($Business_Team_ID,$Policy_ID,$Premium_ID,$Transaction_ID,$Carrier_ID,$Carrier_Name,$Binding_Authority_ID,$Binding_Authority_Name,$Year_Of_Account,$Class,$Policy_Number,$Gross_Premium,$Commission_Amount,$Brokerage_Amount,$Agency_Commission_Amount,$IPT_Amount,$Settlement_Amount,$Bordereau_Type,$Settlement_Type,$Currency_Type,$Accounting_Date,$Account_Period,$IPT_Pcntg,$Doc_ID) = split/\|/,$line;
$Binding_Authority_Name = SourceCleaner::mod_CleaningRules::DOUBLESPACES($Binding_Authority_Name);
print OUT $Business_Team_ID. "|" .$Policy_ID. "|" .$Premium_ID. "|" .$Transaction_ID. "|" .$Carrier_ID. "|" .$Carrier_Name. "|" .$Binding_Authority_ID. "|" .$Binding_Authority_Name. "|" .$Year_Of_Account. "|" .$Class. "|" .$Policy_Number. "|" .$Gross_Premium. "|" .$Commission_Amount. "|" .$Brokerage_Amount. "|" .$Agency_Commission_Amount. "|" .$IPT_Amount. "|" .$Settlement_Amount. "|" .$Bordereau_Type. "|" .$Settlement_Type. "|" .$Currency_Type. "|" .$Accounting_Date. "|" .$Account_Period. "|" .$IPT_Pcntg. "|" .$Doc_ID;
}

close IN;
close OUT;
unlink $file;
rename $outfile, $file;
}