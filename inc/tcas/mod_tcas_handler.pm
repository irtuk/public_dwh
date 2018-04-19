# Stub file for MOD_TCAS
# requirements...
# MOD DB should:
#
#	Run the TCAS data and send it to an Oracle table
#	

#directs script to loaction of .pm file
package inc::tcas::mod_tcas_handler;
use lib 'c:\\UDWTesting';

use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(TCAS_HANDLER);
use DBI;
use DBD::ODBC;
use inc::tools::mod_dbtools qw(ERRORLOG GET_DEBUGSTATE);

our $sourceDbHandle = inc::tools::mod_database::TCAS();
die "no source database handle" unless $sourceDbHandle;

our $testDbHandle = inc::tools::mod_database::TESTDB;			
die "no Test database handle" unless $testDbHandle;


sub TCAS_HANDLER{
	
#set the debugstate
my $debug = GET_DEBUGSTATE();
if ( $debug == 1 ) { print "\n\n *** Debugging MOD TCAS HANDLER *** \n\n"; }

my $target = $_[0];
my $entity = $_[1];

if ( $debug == 1 ) { print "\n\n *** \t TCAS HANDLER HAS ENTITY ". $entity . " and Target ". $target ." *** \n\n"; }


my $getsth;
my $putsth;

my $edate = ""; 
my $idate = "";
my $pnum = "";
my $pid = "";

my $claim_closed_date = "";
my $claims_created_date = "";
my $claimPol_no = "";
my $claimPol_id = "";

my $Premium_created_date = "";
my $premium_accounting_date = "";
my $PremPol_no = "";
my $PremPol_id = "";

my $Claimmvmt_claim_id = "";
my $Claimmvmt_accounting_date = "";
my $ClaimmvmtPol_no = "";
my $ClaimmvmtPol_id = "";

my $insertSQL = "";

die "No Entity Value Passed in\n" unless $entity;





#####################################
#									#
#		PREPARE AND CLEAN UP		#
#									#
#####################################

if ($entity eq 'policy'){
	my $dropTable = "truncate table tmp_tcas_policy";
	my $dropSth = $testDbHandle->prepare($dropTable);
	$dropSth->execute;
	}
	
elsif ($entity eq 'claim'){
	my $dropTable = "truncate table tmp_tcas_claim";
	my $dropSth = $testDbHandle->prepare($dropTable);
	$dropSth->execute;
	}
	
elsif ($entity eq 'premium'){
	my $dropTable = "truncate table tmp_tcas_premium";
	my $dropSth = $testDbHandle->prepare($dropTable);
	$dropSth->execute;
	}
	
elsif ($entity eq 'claimmvmt'){
	my $dropTable = "truncate table tmp_tcas_claimmvmt";
	my $dropSth = $testDbHandle->prepare($dropTable);
	$dropSth->execute;
}

elsif ($entity eq 'rowcounts'){
	my $dropTable = "truncate table tmp_source_rowcount";
	my $dropSth = $testDbHandle->prepare($dropTable);
	$dropSth->execute;
	$dropTable = "truncate table tmp_target_rowcount";
	$dropSth = $testDbHandle->prepare($dropTable);
	$dropSth->execute;	
}


my $dimSQL = "";
my $fctSQL = "";
my $start = time;



#####################################
#									#
#		TCAS POLICY CODE			#
#									#
#####################################
if ($entity eq 'policy') {

		
		}
		
		
		
		
#####################################
#									#
#		TCAS CLAIM CODE				#
#									#
#####################################		
elsif ($entity eq 'claim') {
	
		}




#####################################
#									#
#		TCAS PREMIUM CODE			#
#									#
#####################################		
elsif ($entity eq 'premium') {
		
		}
 
 
 
 
#####################################
#									#
#		TCAS CLAIM MVMT CODE		#
#									#
#####################################	 
elsif ($entity eq 'claimmvmt') {

		}
		
		


#####################################
#									#
#		TCAS BASIC COUNT CODE		#
#									#
#####################################	 
elsif ($entity eq 'rowcounts') {
	#open file
	my$sqlfile = 'c:\\udwtesting\\sql\\tcas\\rowcounts.sql';
	open(SQLFILE, '<', $sqlfile) or die "Could not open ". $sqlfile ." for reading";
	foreach my $line (<SQLFILE>)
		{
		my $getsql = $line;
		my $getsth = $sourceDbHandle->prepare($getsql);
		$getsth->execute;
		
		}

	}



#####################################
#									#
#		    BAILOUT CODE			#
#									#
#####################################	
else {die ("\nSomehow a bad entity was passed to mod_tcas_handler that we did not know how to process. this should not really happen\n");}		

}


