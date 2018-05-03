#setup includes
use lib 'c:\\UDWTesting';

use strict;
use warnings;
use Test::Simple tests =>104;

#bring some required tools in
use inc::tools::mod_dbtools qw( DBNAME READSQL);
use inc::tools::mod_database qw(SIT CMS TCAS TESTDB UAT);
use inc::tools::mod_transform_rules qw(PRACLASS);
use DateTime;
use DateTime::Format::MySQL;
use Switch;

my $date     = DateTime->now();
my $sourceDB = $ARGV[0];
my $targetDB = $ARGV[1];


#setup some vars in sensible groups
my ( $targetDatabase, $sourceDatabase );
my ( $testDBHandle, $targetDBHandle, $sourceDBHandle);
my ( $putsth,$getsth,$cleansth);
my ( $sourceSQL,$targetSQL,$resultSQL,$cleanSQL,$insertSourceSQL);

my (@row);


#check we got some params
die "invalid parameters to fast compare\n" unless ($sourceDB && $targetDB);

if ($sourceDB eq 'CMS'){
	$sourceDBHandle = inc::tools::mod_database::CMS();
	$sourceDatabase = inc::tools::mod_dbtools::DBNAME($sourceDBHandle);
	}
else {
	die "Fast compare only supports CMS at the moment\n"	
	}

if ($targetDB eq 'SIT'){
	 $targetDBHandle = inc::tools::mod_database::SIT();
	 $targetDatabase = inc::tools::mod_dbtools::DBNAME($targetDBHandle);
	}
elsif ($targetDB eq 'UAT'){
	$targetDBHandle = inc::tools::mod_database::UAT();
	$targetDatabase = inc::tools::mod_dbtools::DBNAME($targetDBHandle);
	}
else {
	die "Fast Compare only supports SIT and UAT at the moment\n";
	}

# Main code execution starts here. Specify list of tests

totalPremiums();
policyCounts();
disconnect();

#end main code block. 




# TOTAL PREMS
sub totalPremiums{
	#local variables
	my ( $totalPremium, $praclass, $monthyear, $premiumType);
		print "Fast comparing Premium values Gross Written and Gross Booked between source " . $sourceDB . " and target " . $targetDB . "\n";
	#----------------------------------------------------------------------------------------#
	#    First fast compare check - measures GWP and GBP between specified source and target #
	#----------------------------------------------------------------------------------------#
	
	#setup variables to hold the test status for TAP.
	my $PublicLiability=1;
	my $CommercialProperty=1;
	my $PersonalLinesProperty=1;
	my $ProfessionalIndemnity=1;
	my $PersonalAccident=1;
	my $PropertyOwnersLiability=1;
	my $EmployersLiability=1;
	my $Terrorism=1;
		
	
	
	
	$testDBHandle = inc::tools::mod_database::TESTDB();
	$sourceSQL = inc::tools::mod_dbtools::READSQL('c:\\udwtesting\\SQL\\fastchecks\\cms_premiums_high_level_comparison.sql') || die "Source SQL file read error\n";
	$targetSQL = inc::tools::mod_dbtools::READSQL('c:\\udwtesting\\SQL\\fastchecks\\dwh_premiums_high_level_comparison.sql') || die "Target SQL file read error\n";
	$resultSQL = inc::tools::mod_dbtools::READSQL('c:\\udwtesting\\SQL\\fastchecks\\premiums_high_level_comparison_results.sql') || die "Target SQL file read error\n";
	
	#clean out tables
	$cleanSQL = "truncate table gwp_gbp_fast_compare_source";
	$cleansth = $testDBHandle->prepare($cleanSQL);
	$cleansth->execute();
	
	$cleanSQL = "truncate table gwp_gbp_fast_compare_target";
	$cleansth = $testDBHandle->prepare($cleanSQL);
	$cleansth->execute();
	
	$cleanSQL = "truncate table gwp_gbp_fast_compare_result";
	$cleansth = $testDBHandle->prepare($cleanSQL);
	$cleansth->execute();
	
	#prepare the two table inserts
	$getsth = $sourceDBHandle->prepare($sourceSQL);
	$getsth->execute();
	while (my @row = $getsth->fetchrow_array){ 
		$totalPremium = $row[0];
		
		# call the PRA CLASS RULES
		$praclass = inc::tools::mod_transform_rules::PRACLASS($row[1]);
		
		$monthyear = $row[2];
		$premiumType = $row[3];	
		$insertSourceSQL = "insert into gwp_gbp_fast_compare_source (date, sourcedb, total_premium, pra_class, monthyear, premium_type) values ('" . $date . "','". $sourceDatabase ."','". $totalPremium ."','". $praclass ."','". $monthyear ."','". $premiumType  . "')";                      
		my $putsth = $testDBHandle->prepare($insertSourceSQL);
		$putsth->execute() || die "error inserting a source record into the quick compare source table";
		}
	
	
	$getsth = $targetDBHandle->prepare($targetSQL);
	$getsth->execute();
	while (@row = $getsth->fetchrow_array){ 
		$totalPremium = $row[0];
	
		# call the PRA CLASS RULES
		$praclass = inc::tools::mod_transform_rules::PRACLASS($row[1]);
		
		$monthyear = $row[2];
		$premiumType = $row[3];	
		$insertSourceSQL = "insert into gwp_gbp_fast_compare_target (date, targetdb, total_premium, pra_class, monthyear, premium_type) values ('" . $date . "','". $targetDatabase ."','". $totalPremium ."','". $praclass ."','". $monthyear ."','". $premiumType  . "')";                      
		$putsth = $testDBHandle->prepare($insertSourceSQL);
		$putsth->execute() || die "error inserting a source record into the quick compare target table";
		}
	
	my $resultsth=$testDBHandle->prepare($resultSQL);
	$resultsth->execute() || die "error inserting result records into the quick compare result table";

	my $printSQL = "select * from gwp_gbp_fast_compare_result where result not like '%deviance%'";	
	my $printsth = $testDBHandle->prepare($printSQL);
	$printsth->execute() || die "error reading result records from the quick compare result table";


	while (my @row = $printsth->fetchrow_array){
		
		if (@row) {
					#if we have a row its an error so print it
					my $sourcedb = $row[0];
					my $targetdb = $row[1];
					my $praclass = $row[2];
					my $monthyear = $row[3];
					my $premiumtype = $row[4];
					my $sourcep = $row[5];
					my $targetp = $row[6];
					my $delta = $row[7];	
					my $result = $row[8];
					
					
					#find out what PRA class this row represented and set the test fail state
					if ($praclass eq 'Public Liability') {$PublicLiability=0}
					if ($praclass eq 'Commercial Property') {$CommercialProperty=0}
					if ($praclass eq 'Personal Lines Property') {$PersonalLinesProperty=0}
					if ($praclass eq 'Professional Indemnity') {$ProfessionalIndemnity=0}
					if ($praclass eq 'Personal Accident') {$PersonalAccident=0}
					if ($praclass eq 'Property Owners Liability') {$PropertyOwnersLiability=0}
					if ($praclass eq 'Employers Liability') {$EmployersLiability=0}
					if ($praclass eq 'Terrorism') {$Terrorism=0}
					
					#now run the tests with Test::Simple
					if ( ok($PublicLiability == 1) ){
						print "Test Sucess in the Public Liability Source <> Target reconciliation\n";	
						}
					else
						{
						print "Failure in the Public Liability Source <> Target reconciliation\n";
						print "Target Database " . $targetdb . " has "	. $result . " for " . $premiumtype . " with PRA CLASS " . $praclass . " in month / year " . $monthyear . "\n";
						}
					
					if ( ok($CommercialProperty == 1) ) {
						print "Test Sucess in the Commercial Property Source <> Target reconciliation\n";	
						}
					else
						{
						print "Failure in the Commercial Property Source <> Target reconciliation\n";
						print "Target Database " . $targetdb . " has "	. $result . " for " . $premiumtype . " with PRA CLASS " . $praclass . " in month / year " . $monthyear . "\n";

						}						
					
					if (ok($PersonalLinesProperty == 1) ) {
						print "Test Sucess in the Personal Lines Source <> Target reconciliation\n";
						}
					else{
						print "Failure in the Personal Lines Source <> Target reconciliation\n";
						print "Target Database " . $targetdb . " has "	. $result . " for " . $premiumtype . " with PRA CLASS " . $praclass . " in month / year " . $monthyear . "\n";						
					}
					
					if ( ok($ProfessionalIndemnity == 1) ) {
						print "Test Sucess in the Professional Indemnity Source <> Target reconciliation\n";
						}
					else {
						print "Failure in the Professional Indemnity Source <> Target reconciliation\n";
						print "Target Database " . $targetdb . " has "	. $result . " for " . $premiumtype . " with PRA CLASS " . $praclass . " in month / year " . $monthyear . "\n";						
					}
					
					if ( ok($PersonalAccident == 1) ) {
						print "Test Sucess in the Personal Accident Source <> Target reconciliation\n";
						}
					else {
						print "Failure in the Personal Accident Source <> Target reconciliation\n";
						print "Target Database " . $targetdb . " has "	. $result . " for " . $premiumtype . " with PRA CLASS " . $praclass . " in month / year " . $monthyear . "\n";						
					}
					
					if (ok($PropertyOwnersLiability == 1) ) {
						print "Test Sucess in the Property Owners Liability Source <> Target reconciliation\n";
						}
					else {
						print "Failure in the Property Owners Liability Source <> Target reconciliation\n";
						print "Target Database " . $targetdb . " has "	. $result . " for " . $premiumtype . " with PRA CLASS " . $praclass . " in month / year " . $monthyear . "\n";						
					}
					
					if ( ok($EmployersLiability == 1) ) {
						print "Test Sucess in the Employers Liability Source <> Target reconciliation\n";
						}
					else {
						print "Failure in the Employers Liability Source <> Target reconciliation\n";
						print "Target Database " . $targetdb . " has "	. $result . " for " . $premiumtype . " with PRA CLASS " . $praclass . " in month / year " . $monthyear . "\n";						
					}
					
					if ( ok($Terrorism == 1) ) {
						print "Test Sucess in the Terrorism Source Source <> Target reconciliation\n";
						}
					else {
						print "Failure in the Terrorism Source <> Target reconciliation\n";
						print "Target Database " . $targetdb . " has "	. $result . " for " . $premiumtype . " with PRA CLASS " . $praclass . " in month / year " . $monthyear . "\n";						
						}

	    			}
	    else
	    	{
	    		print "Premium values PASSED\n";
	    	}
	}

}

sub policyCounts{
#----------------------------------------------------------------------------------------------------------------------#
#    Second fast compare check - Count Policy ID's based on specific Class grouped by GBP and GWP in source and target #
#----------------------------------------------------------------------------------------------------------------------#
print "Fast comparing Policy counts between source " . $sourceDB . " and target " . $targetDB . "\n";
my $PolCount= "";
my $gbpgwp = "";
my $Class = "";
$sourceSQL = inc::tools::mod_dbtools::READSQL('c:\\udwtesting\\SQL\\fastchecks\\Source_Claim_Policy_ID_Count_On_Class.sql') || die "Source SQL file read error\n";
$targetSQL = inc::tools::mod_dbtools::READSQL('c:\\udwtesting\\SQL\\fastchecks\\Target_Claim_Policy_ID_Count_On_Class.sql') || die "Target SQL file read error\n";

#clean out tables
$cleanSQL = "truncate table gwp_gbp_pol_count_on_class_fast_compare_source";
$cleansth = $testDBHandle->prepare($cleanSQL);
$cleansth->execute();

$cleanSQL = "truncate table gwp_gbp_pol_count_on_class_fast_compare_target";
$cleansth = $testDBHandle->prepare($cleanSQL);
$cleansth->execute();

#prepare the two table inserts

$getsth = $sourceDBHandle->prepare($sourceSQL);
$getsth->execute();
while (@row = $getsth->fetchrow_array){ 
	$PolCount = $row[0];
	$gbpgwp = $row[1];
	$Class = $row[2];
	$insertSourceSQL = "insert into gwp_gbp_pol_count_on_class_fast_compare_source (Policy_Count, Premium_Type, PRA_Class) values ('" . $PolCount . "','". $gbpgwp ."','". $Class ."')";                      
	$putsth = $testDBHandle->prepare($insertSourceSQL);
	$putsth->execute() || die "error inserting a source record into the quick compare source table";
}


$getsth = $targetDBHandle->prepare($targetSQL);
$getsth->execute();
while (@row = $getsth->fetchrow_array){ 
	$PolCount = $row[0];
	$gbpgwp = $row[1];
	$Class = $row[2];
	$insertSourceSQL = "insert into gwp_gbp_pol_count_on_class_fast_compare_target (Policy_Count, Premium_Type, PRA_Class) values ('" . $PolCount . "','". $gbpgwp ."','". $Class ."')";                      
	$putsth = $testDBHandle->prepare($insertSourceSQL);
	$putsth->execute() || die "error inserting a source record into the quick compare target table";
	}
	
	# TODO - Execute a comparison between rowcount tables.
	
	
}	


sub reconcile{
#----------------------------------------------------------------------------------------------------------------------#
#                  Checking the reconciliation results from the reporting and enrichment tables.					   #
#----------------------------------------------------------------------------------------------------------------------#
print "Fast check on self-reconciliation failures\n";


$targetSQL = inc::tools::mod_dbtools::READSQL('c:\\udwtesting\\SQL\\fastchecks\\enrichment_reconciliation.sql') || die "Target SQL file read error\n";



$getsth = $targetDBHandle->prepare($targetSQL);
$getsth->execute();
while (@row = $getsth->fetchrow_array){ 
	# process the error rows and .. dunno. alert someone maybe?
	}
}





sub disconnect{
	$sourceDBHandle->disconnect;
	$targetDBHandle->disconnect;
	$testDBHandle->disconnect;
	}
	
