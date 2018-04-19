package inc::cms::Claim::mod_Claim;

#setup includes
use lib 'c:\\UDWTesting\\';

use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(mod_Claim);
use DBI;
use DBD::ODBC;
use Data::Dumper;
use inc::tools::mod_dbtools qw(ERRORLOG EXISTS_TABLE RANDOMGEN ROWCOUNT_TABLE GET_DEBUGSTATE STRINGCLEANER READSQL);
use inc::tools::mod_database qw(SIT CMS);
use inc::tools::mod_table_compare qw(TABLECOMPARE);
use inc::tools::mod_transform_rules qw(PRACLASS VALUECLEANER);
use inc::tools::mod_source qw(PREPARE_TEST);

sub mod_Claim{

my $debug = GET_DEBUGSTATE();
if ($debug == 1){print "\n\n *** Debugging MOD CMS *** \n\n";}
	
	
	if ($debug == 1){print "\n\n *** CMS DEBUG \t \t Getting DB Handles for module *** \n\n";}
my $sourceDbHandleTARGET = SIT();
die "no Target database handle" unless $sourceDbHandleTARGET;

my $sourceDbHandleSOURCE = CMS();
die "no Source database handle" unless $sourceDbHandleSOURCE;

my $testDbHandleSOURCE = inc::tools::mod_database::TESTDB;			
die "no Source Test database handle" unless $testDbHandleSOURCE;

my $testDbHandleTARGET = inc::tools::mod_database::TESTDB;			
die "no Target Test database handle" unless $testDbHandleTARGET;	
	
my $entity = $_[0];
my $getsth;
my $putsth;

my $edate = ""; 
my $idate = "";
my $pnum = "";
my $pid = "";
	
my $Tclaim_notified_date = "";
my $Tclaim_SourceSystem_Claim_ID = "";
my $Tclaim_status_type = "";
my $Tclaim_date_of_loss_from = "";
my $Tclaim_cause_description = "";
my $Tclaim_Description = "";
my $Tclaim_Physical_Damage_Amt = "";
my $Tclaim_Third_Party_Fees = "";
my $Tclaim_Bodily_Injury_Amt = "";

my $Sclaim_notified_date = "";
my $Sclaim_SourceSystem_Claim_ID = "";
my $Sclaim_status_type = "";
my $Sclaim_date_of_loss_from = "";
my $Sclaim_cause_description = "";
my $Sclaim_Description = "";
my $Sclaim_Physical_Damage_Amt = "";
my $Sclaim_Third_Party_Fees = "";
my $Sclaim_Bodily_Injury_Amt = "";

my $dimSQL = "";
my $fctSQL = "";
my $start = time;


if ($debug == 1){print "\n\n *** CMS DEBUG \t \t Calling RANDOMGEN *** \n\n";}
my $RanINT = RANDOMGEN();
die unless $RanINT;
if ($debug == 1){print "\n\n *** CMS DEBUG \t \t Got random value of " . $RanINT . " *** \n\n";}


die "No Entity Value Passed in\n" unless $entity;

# get the target database
my $testTarget = inc::tools::mod_dbtools::DBNAME($sourceDbHandleTARGET);
	if ($debug == 1){print "\n\n *** CMS DEBUG \t \t Got Test Target " . $testTarget . " *** \n\n";}	
	if ($debug == 1){print "\n\n *** CMS DEBUG \t \t Entering the main CMS Claim block *** \n\n";}
	if ($debug == 1){print "\n\n *** CMS DEBUG \t \t Creating the Claim target table *** \n\n";}		
	my $createRightSQL="create table tmp_cms_claim_target \(Notified_Date DATE, Source_System_Claim_ID varchar\(255\), Claim_Status varchar\(255\), Date_Of_Loss_From DATE, Cause_Description varchar\(255\), Description varchar\(255\), Physical_Damage_Amount varchar\(225\), Third_Party_Fees varchar\(225\), Bodily_Injury_Amount varchar\(225\) \)";
	$putsth = $testDbHandleTARGET->prepare($createRightSQL);
	$putsth->execute()  || die $DBI::errstr;
	if ($debug == 1){print "\n\n *** CMS DEBUG \t \t Entering CMS TARGET SELECT Block RANDOM INT is currently  ". $RanINT . " *** \n\n";}	

	my $sourceSQLfile = 'c:\\udwtesting\\SQL\\dwh\\CMS-Claim-Target.sql';
	$dimSQL = inc::tools::mod_dbtools::READSQL($sourceSQLfile);
	#$dimSQL = $dimSQL . $RanINT ;
		      
	$getsth = $sourceDbHandleTARGET->prepare($dimSQL);
	$getsth->execute()  || die $DBI::errstr;
	
	if ($debug == 1){print "\n\n *** CMS DEBUG \t \t Entering the CMS TARGET INSERT block *** \n\n";}
	print "\nInserting CMS Claim Target Records \n";
	while (my @row = $getsth->fetchrow_array){
		#some data cleaning here
		
		$Tclaim_notified_date = ($row[0]);
		
		$Tclaim_SourceSystem_Claim_ID = $row[1];
		
		$Tclaim_status_type = $row[2];
		
		$Tclaim_date_of_loss_from = $row[3];
		
		$Tclaim_cause_description = $row[4];
		
		$Tclaim_Description = $row[5];
		# clean leading and trailing space
		$Tclaim_Description = inc::tools::mod_dbtools::STRINGCLEANER($Tclaim_Description);
		
		#round all of these to 4dp
		$Tclaim_Physical_Damage_Amt = $row[6];
		$Tclaim_Physical_Damage_Amt = inc::tools::mod_dbtools::VALUECLEANER($Tclaim_Physical_Damage_Amt);
		
		$Tclaim_Third_Party_Fees = $row[7];
		$Tclaim_Physical_Damage_Amt = inc::tools::mod_dbtools::VALUECLEANER($Tclaim_Physical_Damage_Amt);
		
		$Tclaim_Bodily_Injury_Amt = $row[8];
		$Tclaim_Physical_Damage_Amt = inc::tools::mod_dbtools::VALUECLEANER($Tclaim_Physical_Damage_Amt);
		
		#now do the insert
		my $insertSQL = "insert into tmp_cms_claim_target \(Notified_Date, Source_System_Claim_ID, Claim_Status, Date_Of_Loss_From, Cause_Description, Description, Physical_Damage_Amount, Third_Party_Fees, Bodily_Injury_Amount \) values \('" . $Tclaim_notified_date . "'\,'" . $Tclaim_SourceSystem_Claim_ID . "'\,'" . $Tclaim_status_type . "'\,'" . $Tclaim_date_of_loss_from . "'\,'".$Tclaim_cause_description."'\,'" . $Tclaim_Description . "'\,
																																																									 '" . $Tclaim_Physical_Damage_Amt . "'\, '" . $Tclaim_Third_Party_Fees . "'\, '" . $Tclaim_Bodily_Injury_Amt . "'\)";
		$putsth = $testDbHandleTARGET->prepare($insertSQL);
		$putsth->execute()|| ERRORLOG('','','mod_cms.pm', $Tclaim_SourceSystem_Claim_ID , 'Claim');
		}
	print "Inserted CMS Target Claim Records for Random Date " . $RanINT . "\n";
	if ($debug == 1){ my $insertedTargetRowCount = ROWCOUNT_TABLE($testDbHandleTARGET, 'tmp_cms_claim_target');
		print "\n\n *** CMS DEBUG \t \t We think we inserted " . $insertedTargetRowCount . " TARGET records *** \n\n";
		}
	
	my $duration = time - $start;
	print "Execution time: $duration s\n";	
		
	#Source
	if ($debug == 1){print "\n\n *** CMS DEBUG \t \t Entering the CMS SOURCE INSERT block *** \n\n";}	
	
	my $createLeftSQL="create table tmp_cms_claim_source \(Notified_Date DATE, Source_System_Claim_ID varchar\(255\), Claim_Status varchar\(255\), Date_Of_Loss_From DATE, Cause_Description varchar\(255\), Description varchar\(255\), Physical_Damage_Amount varchar\(255\), Third_Party_Fees varchar\(255\), Bodily_Injury_Amount varchar\(255\)  \)";		
	$putsth = $testDbHandleSOURCE->prepare($createLeftSQL);
	$putsth->execute() || die $DBI::errstr;

	if ($debug==1){print "\n\n *** CMS DEBUG \t \t Preparing Source select statement *** \n\n";}
	
	$sourceSQLfile = 'c:\\udwtesting\\SQL\\cms\\CMS-Claim-Source.sql';
	$dimSQL = inc::tools::mod_dbtools::READSQL($sourceSQLfile);
	#$dimSQL = $dimSQL . $RanINT ; #need to add this in the where clause when we have more CMS Claims Data ---> " . $RanINT . "";

	if ($debug ==1){print "\n\n *** CMS DEBUG \t \t Executing Source select statement *** \n\n";}
	
	$getsth = $sourceDbHandleSOURCE->prepare($dimSQL);
	$getsth->execute() || die $DBI::errstr;
	print "\nInserting CMS claim Source Records \n";

	if ($debug==1){print "\n\n *** CMS DEBUG \t \t Inserting SOURCE records *** \n\n";}	
	while (my @row = $getsth->fetchrow_array){
		
		$Sclaim_notified_date = inc::tools::mod_dbtools::STRINGCLEANER($row[0]);
		
		$Sclaim_SourceSystem_Claim_ID = inc::tools::mod_dbtools::STRINGCLEANER($row[1]);
		
		$Sclaim_status_type = inc::tools::mod_dbtools::STRINGCLEANER($row[2]);
		
		$Sclaim_date_of_loss_from = inc::tools::mod_dbtools::STRINGCLEANER($row[3]);
		
		$Sclaim_cause_description = inc::tools::mod_dbtools::STRINGCLEANER($row[4]);
		
		$Sclaim_Description = inc::tools::mod_dbtools::STRINGCLEANER($row[5]);
		
		$Sclaim_Physical_Damage_Amt = inc::tools::mod_dbtools::VALUECLEANER($row[6]);
		
		$Sclaim_Third_Party_Fees = inc::tools::mod_dbtools::VALUECLEANER($row[7]);
		
		$Sclaim_Bodily_Injury_Amt = inc::tools::mod_dbtools::VALUECLEANER($row[8]);
		
		
		
		
	my $insertSQL = "insert into tmp_cms_claim_source \(Notified_Date, Source_System_Claim_ID, Claim_Status, Date_Of_Loss_From, Cause_Description, Description, Physical_Damage_Amount, Third_Party_Fees, Bodily_Injury_Amount \) values \('" . $Sclaim_notified_date . "'\,'" . $Sclaim_SourceSystem_Claim_ID . "'\,'" . $Sclaim_status_type . "'\,'" . $Sclaim_date_of_loss_from . "'\,'".$Sclaim_cause_description."'\,'" . $Sclaim_Description . "'\,
																																																												 '" . $Sclaim_Physical_Damage_Amt . "'\, '" . $Sclaim_Third_Party_Fees . "'\, '" . $Sclaim_Bodily_Injury_Amt . "'\)";
	my $putsth = $testDbHandleSOURCE->prepare($insertSQL);				
	$putsth->execute()or ERRORLOG('','','mod_cms.pm', $Sclaim_SourceSystem_Claim_ID , 'Premium');

	}
	if ($debug == 1){ my $insertedTargetRowCount = ROWCOUNT_TABLE($testDbHandleSOURCE, 'tmp_cms_claim_source');
		print "\n\n *** CMS DEBUG \t \t We think we inserted " . $insertedTargetRowCount . " SOURCE records *** \n\n";
		}	
	print "Inserted CMS source claim Records for " . $RanINT . "\n";
	$duration = time - $start;
	print "Execution time: $duration s\n";
	
	
### Target and source tables should be present and populated now. lets try table compare, oh and get the SOURCE AND TARGET the right fucking way round.
my $results = TABLECOMPARE('tmp_cms_claim_source','tmp_cms_claim_target');

#dereference the fucking array already
foreach my $result (@{ $results }){
	ERRORLOG('MOD_CMS', 'N/A', 'claim', $result, $testTarget);
	}
if ($debug==1){print "\n\n *** CMS DEBUG \t \t CMS claim COMPLETE *** \n\n";}
return($putsth, $getsth);
}
