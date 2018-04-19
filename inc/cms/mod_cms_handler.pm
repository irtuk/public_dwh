# Stub file for MOD_CMS
# requirements...
# MOD DB should:
#Run the CMS data and send it to an Oracle table

#directs script to loaction of .pm file
package inc::cms::mod_cms_handler;

#setup includes
use lib 'c:\\UDWTesting';

use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(CMS_HANDLER);
use DBI;
use DBD::ODBC;
use Data::Dumper;

my $forcedate = 1;

#no matter what Eclipse says this is not a bug
use inc::tools::mod_dbtools qw(ERRORLOG EXISTS_TABLE RANDOMGEN ROWCOUNT_TABLE GET_DEBUGSTATE STRINGCLEANER READSQL DBNAME);
use inc::tools::mod_database qw(SIT CMS UAT);
use inc::tools::mod_table_compare qw(TABLECOMPARE);
use inc::tools::mod_transform_rules qw(PRACLASS VALUECLEANER);
use inc::cms::premium::mod_cms_premium qw(CMS_PREMIUM);

# use inc::cms::Claim::mod_Claim qw(mod_Claim);
use inc::cms::rules::mod_cms_binding_name_rules qw(BINDRULE);



sub CMS_HANDLER {
	
#set the debugstate
my $debug = GET_DEBUGSTATE();
if ( $debug == 1 ) { print "\n\n *** Debugging MOD CMS HANDLER *** \n\n"; }

	my $target = $_[0];
	my $entity = $_[1];
	
	my $getsth;
	my $putsth;

	my $edate = "";
	my $idate = "";
	my $pnum  = "";
	my $pid   = "";

	my $Tclaim_notified_date         = "";
	my $Tclaim_SourceSystem_Claim_ID = "";
	my $Tclaim_status_type           = "";
	my $Tclaim_date_of_loss_from     = "";
	my $Tclaim_cause_description     = "";
	my $Tclaim_Description           = "";
	my $Tclaim_Physical_Damage_Amt   = "";
	my $Tclaim_Third_Party_Fees      = "";
	my $Tclaim_Bodily_Injury_Amt     = "";

	my $Sclaim_notified_date         = "";
	my $Sclaim_SourceSystem_Claim_ID = "";
	my $Sclaim_status_type           = "";
	my $Sclaim_date_of_loss_from     = "";
	my $Sclaim_cause_description     = "";
	my $Sclaim_Description           = "";
	my $Sclaim_Physical_Damage_Amt   = "";
	my $Sclaim_Third_Party_Fees      = "";
	my $Sclaim_Bodily_Injury_Amt     = "";

	my $Claimmvmt_claim_id        = "";
	my $Claimmvmt_accounting_date = "";
	my $ClaimmvmtPol_no           = "";
	my $ClaimmvmtPol_id           = "";
	my $insertSQL                 = "";
	
#get desired target and entity. source at this stage is obviously CMS

if ( $debug == 1 ) {	print "\n\n *** CMS DEBUG \t \t MOD CMS HANDLER HAS PARAMETERS Target : \t" . $target . " Entity : \t" . $entity . " *** \n\n"; }

if ( $debug == 1 ) {	print "\n\n *** CMS DEBUG \t \t Getting DB Handles for module *** \n\n"; }
our $dbHandleTARGET;

if ( $target eq 'sit' ) {
	if ( $debug == 1 ) {
		print "\n\n *** CMS DEBUG \t \t Getting SIT Handle for module *** \n\n";
	}
	$dbHandleTARGET = SIT();
	die "no Target database handle" unless $dbHandleTARGET;
}
elsif ( $target eq 'uat' ) {
	if ( $debug == 1 ) {
		print "\n\n *** CMS DEBUG \t \t Getting SIT Handle for module *** \n\n";
	}
	$dbHandleTARGET = UAT();
	die "no Target database handle" unless $dbHandleTARGET;
}
else { die "some sort of error getting the target db handle\n"; }

our $dbHandleSOURCE = CMS();
die "no Source database handle" unless $dbHandleSOURCE;

my $testDbHandleSOURCE = inc::tools::mod_database::TESTDB;
die "no Source Test database handle" unless $testDbHandleSOURCE;

my $testDbHandleTARGET = inc::tools::mod_database::TESTDB;
die "no Target Test database handle" unless $testDbHandleTARGET;	

	if ( $debug == 1 ) {
		print
"\n\n *** CMS DEBUG \t \t Entering main code block and setting variables *** \n\n";
	}	

	if ( $debug == 1 ) {
		print "\n\n *** CMS DEBUG \t \t Calling RANDOMGEN *** \n\n";
	}
	our $RanINT = RANDOMGEN();
	die unless $RanINT;
	if ( $debug == 1 ) {
		print "\n\n *** CMS DEBUG \t \t Got random value of " . $RanINT
		  . " *** \n\n";
	}

	die "No Entity Value Passed in\n" unless $entity;

	# get the target database
	my $testTarget = inc::tools::mod_dbtools::DBNAME($dbHandleTARGET);
	if ( $debug == 1 ) {
		print "\n\n *** CMS DEBUG \t \t Got Test Target "
		  . $testTarget
		  . " *** \n\n";
	}

############################## TABLE CLEANUP #####################################################

	#drops table if it exists for a selected table
	if ( $entity eq 'policy' ) {
		if ( $debug == 1 ) {
			print "\n\n *** CMS DEBUG \t \t Dropping TMP CMS POLICY *** \n\n";
		}
		my $dropTable = "drop table tmp_cms_policy";
		my $dropSth   = $testDbHandleSOURCE->prepare($dropTable);
		$dropSth->execute || die $DBI::errstr;
	}

	elsif ( $entity eq 'claim' ) {
		if ( $debug == 1 ) {
			print "\n\n *** CMS DEBUG \t \t Dropping TMP CMS CLAIM *** \n\n";
		}
		if ( EXISTS_TABLE( $testDbHandleTARGET, 'tmp_cms_claim_target' ) ) {
			if ( $debug == 1 ) {
				print
"\n\n *** CMS DEBUG \t \t Dropping TMP CMS CLAIM TARGET *** \n\n";
			}
			my $dropTable = "drop table tmp_cms_claim_target";
			my $dropSth   = $testDbHandleSOURCE->prepare($dropTable);
			$dropSth->execute || die $DBI::errstr;
		}
		if ( EXISTS_TABLE( $testDbHandleSOURCE, 'tmp_cms_claim_source' ) ) {
			if ( $debug == 1 ) {
				print
"\n\n *** CMS DEBUG \t \t Dropping TMP CMS CLAIM SOURCE *** \n\n";
			}
			my $dropTable = "drop table tmp_cms_claim_source";
			my $dropSth   = $testDbHandleSOURCE->prepare($dropTable);
			$dropSth->execute;
		}
	}

	elsif ( $entity eq 'premium' ) {
		if ( $debug == 1 ) {
			print "\n\n *** CMS DEBUG \t \t Dropping PREMIUM TABLES *** \n\n";
		}
		if ( EXISTS_TABLE( $testDbHandleTARGET, 'tmp_cms_premium_target' ) ) {
			if ( $debug == 1 ) {
				print
"\n\n *** CMS DEBUG \t \t Dropping TMP CMS PREM TARGET *** \n\n";
			}
			my $dropTable = "drop table tmp_cms_premium_target";
			my $dropSth   = $testDbHandleTARGET->prepare($dropTable);
			$dropSth->execute || die $DBI::errstr;
		}
		if ( EXISTS_TABLE( $testDbHandleSOURCE, 'tmp_cms_premium_source' ) ) {
			if ( $debug == 1 ) {
				print
"\n\n *** CMS DEBUG \t \t Dropping TMP CMS PREM SOURCE *** \n\n";
			}
			my $dropTable = "drop table tmp_cms_premium_source";
			my $dropSth   = $testDbHandleSOURCE->prepare($dropTable);
			$dropSth->execute;
		}
	}
	elsif ( $entity eq 'claimmvmt' ) {
		if ( $debug == 1 ) {
			print
"\n\n *** CMS DEBUG \t \t Dropping TMP CMS CLAIM MOVEMENT *** \n\n";
		}
		my $dropTable = "drop table tmp_cms_claimmvmt";
		my $dropSth   = $testDbHandleSOURCE->prepare($dropTable);

		#Dan - always put these die checks in. die unless it works
		$dropSth->execute || die $DBI::errstr;
	}

############################## END TABLE CLEANUP #####################################################

####################################### POLICY ##########################################################
	my $dimSQL = "";
	my $fctSQL = "";
	my $start  = time;

#creates a table in mysql, then pulls Policy data from CMS staging and inserts it in to the created table
	if ( $entity eq 'policy' ) {

		my $createLeftSQL =
"create table tmp_cms_policy \(expiry_date DATETIME, INCEPTION_DATE datetime, policy_number varchar\(255\), policy_id varchar\(255\) \)";

		$putsth = $testDbHandleSOURCE->prepare($createLeftSQL);
		$putsth->execute();

		$dimSQL =
"select distinct convert(datetime,(TRY_CAST([EXPIRY_DATE] as char(30))),103), convert(datetime,(TRY_CAST([INCEPTION_DATE] as char(30))),103), policy_number, policy_id from dbo.w_Policy";
		$getsth = $dbHandleSOURCE->prepare($dimSQL);
		$getsth->execute();
		print "Inserting CMS Policy Records\n";

		while ( my @row = $getsth->fetchrow_array ) {
			$edate = $row[0];
			$idate = $row[1];
			$pnum  = $row[2];
			$pid   = $row[3];
			$insertSQL =
"insert into tmp_cms_policy \(expiry_date, inception_date, policy_number, policy_id \) values \('"
			  . $edate . "'\,'"
			  . $idate . "'\,'"
			  . $pnum . "'\,'"
			  . $pid . "'\)";
			$putsth = $testDbHandleSOURCE->prepare($insertSQL);

			$putsth->execute()
			  or ERRORLOG( '', '', 'mod_cms.pm', $pid, 'Policy' );

		}
		print "Inserted CMS Policy Records\n";
		my $duration = time - $start;
		print "Execution time: $duration s\n";

	}

####################################### CLAIM  ##########################################################
#creates a table in mysql, then pulls claim data from CMS staging and inserts it in to the created table

	if ( $entity eq 'claim' ) {
		if ( $debug == 1 ) {
			print
"\n\n *** CMS DEBUG \t \t Redirecting to inc::cms::claim::mod_claim *** \n\n";
		}
		mod_Claim();

	}

####################################### PREMIUM ##########################################################

#creates a table in mysql, then pulls premium data from CMS staging and inserts it in to the created table
#target
	elsif ( $entity eq 'premium' ) {

		# redirect to the premium handler
		if ( $debug == 1 ) { print "\n\n *** CMS DEBUG \t \t Redirecting to inc::cms::premium::mod_premium *** \n\n";}

		# call the premium handler with SOURCE_DB_HANDLE #TARGET_DB_HANDLE

		inc::cms::premium::mod_cms_premium::CMS_PREMIUM( $dbHandleSOURCE, $testDbHandleSOURCE, $dbHandleTARGET,	$testDbHandleTARGET, $RanINT  )

	}

####################################### CLAIM MOVEMENT ##########################################################

#creates a table in mysql, then pulls claim movement data from CMS staging and inserts it in to the created table
	elsif ( $entity eq 'claimmvmt' ) {

		my $createLeftSQL =
"create table tmp_cms_claimmvmt \(CLAIM_ID varchar\(255\), ACCOUNTING_DATE datetime, policy_number varchar\(255\), policy_id varchar\(255\) \)";

		$putsth = $testDbHandleSOURCE->prepare($createLeftSQL);
		$putsth->execute();

		$dimSQL =
"select CLAIM_ID, convert(datetime, convert(varchar(30), ACCOUNTING_DATE), 103), policy_number, policy_id from dbo.ClaimDeclarations";
		$getsth = $dbHandleSOURCE->prepare($dimSQL);
		$getsth->execute();
		print "Inserting CMS Claimmvmt Records\n";
		while ( my @row = $getsth->fetchrow_array ) {
			$Claimmvmt_claim_id        = $row[0];
			$Claimmvmt_accounting_date = $row[1];
			$ClaimmvmtPol_no           = $row[2];
			$ClaimmvmtPol_id           = $row[3];
			$insertSQL =
"insert into tmp_cms_claimmvmt \(CLAIM_ID, ACCOUNTING_DATE, policy_number, policy_id \) values \('"
			  . $Claimmvmt_claim_id . "'\,'"
			  . $Claimmvmt_accounting_date . "'\,'"
			  . $ClaimmvmtPol_no . "'\,'"
			  . $ClaimmvmtPol_id . "'\)";
			$putsth = $testDbHandleSOURCE->prepare($insertSQL);

			$putsth->execute()
			  or ERRORLOG( '', '', 'mod_cms.pm', $pid, 'Claimmvmt' );
		}
		print "Inserted CMS Claimmvmt Records\n";
		my $duration = time - $start;
		print "Execution time: $duration s\n";
	}
	elsif ( $entity eq 'risk' ) {

		my $createLeftSQL =
"create table tmp_cms_risk \(CLAIM_ID varchar\(255\), ACCOUNTING_DATE datetime, policy_number varchar\(255\), policy_id varchar\(255\) \)";

		$putsth = $testDbHandleSOURCE->prepare($createLeftSQL);
		$putsth->execute();

		$dimSQL =
"select distinct CLAIM_ID, convert(datetime, convert(varchar(30), ACCOUNTING_DATE), 103), policy_number, policy_id from dbo.RiskDeclarations";
		$getsth = $dbHandleSOURCE->prepare($dimSQL);
		$getsth->execute();
		print "Inserting CMS risk Records\n";
		while ( my @row = $getsth->fetchrow_array ) {
			$Claimmvmt_claim_id        = $row[0];
			$Claimmvmt_accounting_date = $row[1];
			$ClaimmvmtPol_no           = $row[2];
			$ClaimmvmtPol_id           = $row[3];
			$insertSQL =
"insert into tmp_cms_risk \(CLAIM_ID, ACCOUNTING_DATE, policy_number, policy_id \) values \('"
			  . $Claimmvmt_claim_id . "'\,'"
			  . $Claimmvmt_accounting_date . "'\,'"
			  . $ClaimmvmtPol_no . "'\,'"
			  . $ClaimmvmtPol_id . "'\)";
			$putsth = $testDbHandleSOURCE->prepare($insertSQL);

			$putsth->execute()
			  or ERRORLOG( '', '', 'mod_cms.pm', $pid, 'Risk' );
		}
		print "Inserted CMS risk Records\n";
		my $duration = time - $start;
		print "Execution time: $duration s\n";
	}
	elsif ( $entity eq 'contracts' ) {

		my $createLeftSQL =
"create table tmp_cms_contracts \(CLAIM_ID varchar\(255\), ACCOUNTING_DATE datetime, policy_number varchar\(255\), policy_id varchar\(255\) \)";

		$putsth = $testDbHandleSOURCE->prepare($createLeftSQL);
		$putsth->execute();

		$dimSQL =
"select distinct CLAIM_ID, convert(datetime, convert(varchar(30), ACCOUNTING_DATE), 103), policy_number, policy_id from dbo.Contracts";
		$getsth = $dbHandleSOURCE->prepare($dimSQL);
		$getsth->execute();
		print "Inserting CMS contracts Records\n";
		while ( my @row = $getsth->fetchrow_array ) {
			$Claimmvmt_claim_id        = $row[0];
			$Claimmvmt_accounting_date = $row[1];
			$ClaimmvmtPol_no           = $row[2];
			$ClaimmvmtPol_id           = $row[3];
			$insertSQL =
"insert into tmp_cms_contracts \(CLAIM_ID, ACCOUNTING_DATE, policy_number, policy_id \) values \('"
			  . $Claimmvmt_claim_id . "'\,'"
			  . $Claimmvmt_accounting_date . "'\,'"
			  . $ClaimmvmtPol_no . "'\,'"
			  . $ClaimmvmtPol_id . "'\)";
			$putsth = $testDbHandleSOURCE->prepare($insertSQL);

			$putsth->execute()
			  or ERRORLOG( '', '', 'mod_cms.pm', $pid, 'Contracts' );
		}
		print "Inserted CMS contracts Records\n";
		my $duration = time - $start;
		print "Execution time: $duration s\n";
	}

}

