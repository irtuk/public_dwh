# MOD_TABLECOMPARE
# Rules engine got a bit too complex to run on its own so I am moving the individual rules into their own modules.

# Table compare will directly compare two tables with a full outer join ( essentially a left outer and a right outer with a UNION because mySQL does not support FULL OUTER )
# column by column and return any rows that dont have  matching row on the other side. It does this using a composite key consisting of ALL columns
# so we DONT pass integer key values in. Find a set of natural keys for your source to target mapping and use those. Columns in same order please, for now.


use lib 'c:\\UDWTesting';
package inc::tools::mod_table_compare;

use inc::tools::mod_database qw(TESTDB);
use inc::tools::mod_dbtools qw(COLNAMES GET_DEBUGSTATE);
use strict;
use warnings;
use Exporter qw(import);

# export the main function
our @EXPORT_OK = qw(TABLECOMPARE);

my $debug = GET_DEBUGSTATE();

sub TABLECOMPARE{
print "\nExecuting Table Compare\n"; 
my $start = time();

#can we connect to the test database 
my $testDBHandle = inc::tools::mod_database::TESTDB;

#check for a valid init.
die "Table compare requires two tables, left and right, from the test database" unless ($_[0] && $_[1]);

#get our two tables
my $leftTable = $_[0];
my $rightTable = $_[1];

if ($debug == 1){print "\n\n *** MOD TC DEBUG \t \t Got LEFT TABLE : " . $leftTable . " RIGHT TABLE : " . $rightTable . " *** \n\n";}
#the maximum number of missing rows that the return array will contain..
my $maxrows = 10;

#an array for the results.
my @resultArray = ();

# a string that will hold the whole error row in the result array
my $rowErrorString="";

#get column names array from left table. both tables have to be the same structurally. for now..
my @columnnames = inc::tools::mod_dbtools::COLNAMES($testDBHandle, $leftTable);

#turn the array into an array reference to pass to a subroutine
my $column_name_array_ref = \@columnnames;

#build the code for rule 1
my $ruleSQL = buildSQL($column_name_array_ref, $leftTable, $rightTable);

if ($debug == 1){print "\n\n *** MOD TC DEBUG \t \t SQL : " . $ruleSQL .  " *** \n\n";}

#declare a variable for the statement handle
my $test_sth;

$test_sth = $testDBHandle->prepare($ruleSQL);
$test_sth->execute() || die $DBI::errstr;
my @row;

while (@row = $test_sth->fetchrow_array){
	
	no warnings 'uninitialized';
	foreach my $rowitem (@row){
		$rowErrorString = $rowErrorString . $rowitem . " | ";
		}	
	push @resultArray, $rowErrorString;
	}

#tidy up
$testDBHandle ->disconnect;
my $duration = time() - $start;
print "Table Compare Complete\n";
print "Execution time: " . $duration . " s";

#create a reference to the array	
my $resultArray = \@resultArray	;
#and return it

return $resultArray;
}

sub buildSQL{

#take inputs
my $arrayref = $_[0];
my $leftTable = $_[1];
my $rightTable = $_[2];

#dereference the array
my @array = @{ $arrayref };

#set some vars
my $index = 0;
my $arraysize =  scalar @array;

# now for the sexy bit..

my $ruleSQL = "select * from ". $leftTable . " L left outer join " . $rightTable . " R on 1 = 1 ";

#do the join clause. a full outer to fund unmatched records on either side.
foreach my $jcol (@array) {
	$ruleSQL = $ruleSQL . " AND L.". $jcol . "=R." . $jcol;
	}
#do the where clause
$ruleSQL = $ruleSQL . " WHERE 1 = 1 AND ";

while ( $index <= $arraysize - 2){
	$ruleSQL = $ruleSQL . "( L." . $array[$index] . " IS NULL OR R.". $array[$index] . " IS NULL ) OR ";
	$index++;
	}
#last element must not have the trailing OR
$ruleSQL = $ruleSQL . "( L." . $array[$index] . " IS NULL OR R.". $array[$index] . " IS NULL )";	

#now do it all again as MySQL does not have a full outer join... we take exactly the same statement and build a UNION
$ruleSQL = $ruleSQL . " UNION select * from ". $leftTable . " L right outer join " . $rightTable . " R on 1 = 1 ";

#reset index
$index = 0;

#do the join clause. a full outer to fund unmatched records on either side.
foreach my $jcol (@array) {
	$ruleSQL = $ruleSQL . " AND L.". $jcol . "=R." . $jcol;
	}
#do the where clause
$ruleSQL = $ruleSQL . " WHERE 1 = 1 AND ";

while ( $index <= $arraysize - 2){
	$ruleSQL = $ruleSQL . "( L." . $array[$index] . " IS NULL OR R.". $array[$index] . " IS NULL ) OR ";
	$index++;
	}
#last element must not have the trailing OR
$ruleSQL = $ruleSQL . "( L." . $array[$index] . " IS NULL OR R.". $array[$index] . " IS NULL )";	

return $ruleSQL;
}