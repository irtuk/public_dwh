# DIMENSIONAL UNIQUENESS CHECKER
# This tests that all dimensions meet the following rule:
# The count of distinct rows based on every column EXCEPT the primary key should be the same as the absolute count of rows
# the PK is excluded because then the numbers WILL match no matter how many duplicates you have.

use warnings;
use strict;

use lib 'c:\\UDWTesting';

use inc::tools::mod_table_compare qw(TABLECOMPARE);
use inc::tools::mod_dim_unique qw(DIMUNIQUE);
use inc::tools::mod_database qw(SIT UAT TESTDB);
use inc::tools::mod_dbtools qw(GET_DEBUGSTATE DBNAME);
use Data::Dumper;
use DateTime;
use DateTime::Format::MySQL;
use Switch;

our $date     = DateTime->now();



die "No target passed\n" unless $ARGV[0];
my $target = $ARGV[0];
our $dbHandle;
my $getSth;
my $sql;
my @row;
my @resultarray=();
our $dbname;
our $start = time;

 if ( $target eq 'UAT') {
 		$dbHandle = UDW(); 
 		$dbname = inc::tools::mod_dbtools::DBNAME($dbHandle)
 		}
 
 elsif ($target eq 'SIT') {
 		$dbHandle = SIT();
 		$dbname = inc::tools::mod_dbtools::DBNAME($dbHandle)
 		} 
	
 
 else {die "invalid target";} 
 
 $sql = "select table_schema, table_name from INFORMATION_SCHEMA.tables where table_name like 'DIM_%' and table_schema in ('tgt','dbo')";
 
 $getSth = $dbHandle->prepare($sql);
 $getSth->execute();
 
 
 while (@row = $getSth->fetchrow_array){
 	my $schema = $row[0];
 	my $dimension = $row[1];
 	my $sd = $schema."\.".$dimension;
 	my @resultrow = DIMUNIQUE($sd, $target );
 	print ".";
 	push @resultarray, \@resultrow;
	}
	
	
#connect to the test DB to write the results out:
	
my $testdbHandle = inc::tools::mod_database::TESTDB();

	 foreach ( @resultarray ){
	 	my $dim = @$_[0];
	 	my $res = @$_[1];
	 	my $resultSQL = "insert into dimension_test_results (datetime, targetdb, dimension, testresult) values ('" . $date . "','" . $dbname . "','" . $dim . "','". $res. "')";
	 	my $ressth = $testdbHandle->prepare($resultSQL);
	 	$ressth->execute || die "error inserting dimension test result\n" 
 	
	 }

$testdbHandle->disconnect;
$dbHandle->disconnect;


