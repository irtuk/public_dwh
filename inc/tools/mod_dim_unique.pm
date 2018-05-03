# MOD DIM_UNIQUE
# Rules engine got a bit too complex to run on its own so I am moving the individual rules into their own modules.
# This rule checks that all records in a dimension supplied to it are actually unique
#

use lib 'c:\\UDWTesting';
package inc::tools::mod_dim_unique;

use inc::tools::mod_database qw(TESTDB SIT UAT);
use inc::tools::mod_dbtools qw(COLNAMES REPORT GET_DEBUGSTATE);
use strict;
use warnings;
use Exporter qw(import);
use Data::Dumper;

# export the main function
our @EXPORT_OK = qw(DIMUNIQUE);

our $debug = inc::tools::mod_dbtools::GET_DEBUGSTATE();


sub DIMUNIQUE{
my ($dimName, $target, $dbHandle);
my @resultarray;
#did we get a dimension and a target

die "Dim Unique should be passed a dimension to test and the target database SIT or UAT" unless ( $_[0] && $_[1] );
$dimName = $_[0];
$target = $_[1];

#check what the target is and get the appropriate handle
if ( $target eq 'UDW' ) { $dbHandle = UDW();}
elsif ( $target eq 'SIT') { $dbHandle = SIT();}
else { die "Error getting the DB handle for the " . $target . " database\n";}

#Get the non key columns from the specific dimension
my $colsql = "select column_name FROM information_schema.columns where CONCAT(table_schema, '.', table_name) =  '" . $dimName . "'  AND COLUMN_NAME != CONCAT(substring(TABLE_NAME,5,LEN(TABLE_NAME)),'_KEY')";
my $getSth;
my @columns;

$getSth = $dbHandle->prepare($colsql);
$getSth->execute();
while (my @row = $getSth->fetchrow_array){
	my $value = $row[0];
	push(@columns, $value)
	}

#ok now build the dimensional comparator
my $dimUniqueSQL = "SELECT CASE WHEN LRCNT = RRCNT THEN 'PASSED' ELSE 'FAILED - Absolute count is ' + convert(varchar,RRCNT) + ' & distinct count is ' + convert(varchar,LRCNT) END AS RESULT FROM ( SELECT 'JOINME' as JC, COUNT(*) as LRCNT FROM ( SELECT DISTINCT ";

#set up the variables to be able to walk the array until the last record
my $index = 0;
my $arraysize =  scalar @columns;

while ( $index <= $arraysize - 2){
	$dimUniqueSQL = $dimUniqueSQL . $columns[$index] . " , ";
	$index++;
	}
#last element has no comma	
$dimUniqueSQL = $dimUniqueSQL . $columns[$index];


#then the from, where and join which are always consistent in this rule
$dimUniqueSQL = $dimUniqueSQL . " FROM " . $dimName  . " ) T1 ) T2 left join (SELECT 'JOINME' as JC, COUNT(*) as RRCNT FROM " . $dimName  . ") T3 on t2.JC = T3.JC";

#now run the rule not forgetting to clean up the @row array
$getSth = $dbHandle->prepare($dimUniqueSQL);

if ($dimUniqueSQL =~ /coinsurer/i) {print "\n\n".$dimUniqueSQL."\n\n";}

$getSth->execute();

while (my @row = $getSth->fetchrow_array){
	my @resultrow = ();
	my $value = $row[0];
	push @resultrow,  $dimName;
	push @resultrow,  $value ;
	push @resultarray, @resultrow;
	}

if ($debug == 1){
	print "\n\n *** DEBUG MOD DIMUNIQUE : Dumping current content of resultarray ***\n\n";
	print Data::Dumper->Dump(\@resultarray);
	}
return @resultarray;
}



