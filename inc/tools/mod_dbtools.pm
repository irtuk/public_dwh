# This is the stub file for MOD_DBTOOLS
# Requirements...
# DBTOOLS just provides some helper functions for database work, first one will be a list of column names
# DBTOOLS does not provide database connections (except for error logging and reporting ) and MUST be given them ....

use lib 'c:\\UDWTesting';
package inc::tools::mod_dbtools;
use strict;
use warnings;
use Path::Tiny;
use Math::Round;
use inc::tools::mod_database qw(TESTDB);


use Exporter qw(import);
# export the main functions
our @EXPORT_OK = qw( COLNAMES ERRORLOG REPORT EXISTS_TABLE RANDOMGEN ROWCOUNT_TABLE GET_DEBUGSTATE STRINGCLEANER READSQL VALUECLEANER DBNAME);

my $debug = GET_DEBUGSTATE();

#force debug on this module only.
$debug = 0;
1;


#-----------------------------------------------------------------------------------------------------------#

sub COLNAMES{
#returns a list of column names from a table and dbconnection passed to it
	my @colnames;
	#colnames requires a database connection handle and a table name
	die "Colnames requires a database handle and a table to work on\n" unless ($_[0] and $_[1]);
	# ok got them
	my $dbHandle = $_[0];
	my $tableName = $_[1];
	#prep SQL statement and fire it off
	my $colNamesSQL = "select * from " . $tableName . " where 1=0";
	my $sth = $dbHandle->prepare($colNamesSQL);
	$sth->execute() || die $DBI::errstr;
	my $names = $sth->{NAME}; 
	#took about two hours ... referencing and dereferencing arrays. note the bloody @$ structure
	@colnames = @{ $names };
	return @colnames;
}


#-----------------------------------------------------------------------------------------------------------#

sub ERRORLOG{
	#inserts records into the errorlog table. Needs a bit of work to direct messages to specific tables.
my $module = $_[0]; # the calling module
my $entity = $_[1]; # the object if we have it
my $etype = $_[2];  # the object type ie premium etc
my $errorText = $_[3]; # long text value
my $testDbHandle = inc::tools::mod_database::TESTDB();	
my $testTarget = $_[4];		
die "no Test database handle" unless $testDbHandle;
my $errorSQL = "insert into errorlog (Date, Time, module, entityID, entityType, errortext, testTarget) values (CURDATE(),CURTIME(),'" . $module . "','" . $entity . "','" . $etype . "','" . $errorText . "','" . $testTarget  . "')";                     
#if ($debug == 1){print "\t\tSQL Statement in ERRORLOG\n", $errorSQL;}

my $sth = $testDbHandle->prepare($errorSQL);
$sth->execute() || die $DBI::errstr;
}

#-----------------------------------------------------------------------------------------------------------#

sub BUGLOG{
# writes a bug directly into bugzilla and assigns it to Prabu.

}


#-----------------------------------------------------------------------------------------------------------#

sub REPORT{
my $source = $_[0];
my $target = $_[1];
my $entity = $_[2];
my $test = $_[3];
my $result = $_[4];
my $failtext = $_[5];
my $testDbHandle = inc::tools::mod_database::TESTDB();
my $reportSQL = "insert into automated_test_results (Date, Time, source, target_db, entity, test, result, failtext) values (CURDATE(),CURTIME(),'" . $source . "','" . $target . "','" . $entity . "','" . $test . "','" . $result . "','" . $failtext . "')";
my $sth = $testDbHandle->prepare($reportSQL);
$sth->execute() || die $DBI::errstr;
}

#-----------------------------------------------------------------------------------------------------------#

sub DBNAME{
	# returns the name of the server and database associated with a dbhandle passed to it.
my $dbname;
my $dbHandle = $_[0];
my $sql = "select CONCAT( \@\@Servername, '\\', DB_NAME() ) as db";
my $sth = $dbHandle->prepare($sql);
$sth->execute() || die $DBI::errstr;
while (my @row = $sth->fetchrow_array){
	$dbname = $row[0];
	}
$dbname =~ s/\\/\\\\/g  ;
$dbname =~ s/\_/-/g  ;

if ($debug == 1){print "*** DBTOOLS DEBUG\t\tTestTarget Name changed to ", $dbname ."\t\t***\n";}

return $dbname;
}

#-----------------------------------------------------------------------------------------------------------#

#chooses a random month and year
sub RANDOMGEN{
use POSIX qw(strftime);
my $year = strftime "%Y", localtime;
my $month = strftime "%m", localtime;

my @MonthArray = ("1","2","3","4","5","6","7","8","9","10" ,"11","12");
my @YearArray = ("2017", "2018");

my $RanMonth = $MonthArray[rand @MonthArray];
my $RanYear = $YearArray[rand @YearArray];

if ($RanYear eq $year && $RanMonth le $month)
	{
	return $RanMonth.$RanYear;
	}
elsif ($RanYear lt $year && $RanMonth ge $month)
	{
	return $RanMonth.$RanYear;
	}
elsif ($RanYear lt $year && $RanMonth le $month)
	{
	return $RanMonth.$RanYear;
	}
else
	{
		my $editMonth = $month -=2;
		return ($editMonth.$year);
	}
}


#-----------------------------------------------------------------------------------------------------------#

sub EXISTS_TABLE{
my $dbHandle = $_[0];
my $tableName = $_[1];

die "invalid params passed to EXISTS_TABLE" unless ($dbHandle && $tableName);

my $exists ;
my $sql = "select table_name from INFORMATION_SCHEMA.TABLES where TABLE_NAME = '" . $tableName ."'";
my $sth = $dbHandle->prepare($sql);
$sth->execute() || die $DBI::errstr;
while (my @row = $sth->fetchrow_array){
	if ( defined $row[0]){
		$exists = "true";
		}
	else{
		$exists = undef;
		}
	}
return $exists;
}

#-----------------------------------------------------------------------------------------------------------#

sub ROWCOUNT_TABLE{
my $dbHandle = $_[0];
my $tableName = $_[1];
die "invalid params passed to ROWCOUNT_TABLE" unless ($dbHandle && $tableName);
my $count ;
my $sql = "select count(*) FROM " . $tableName ;
my $sth = $dbHandle->prepare($sql);
$sth->execute() || die $DBI::errstr;
while (my @row = $sth->fetchrow_array){
	if ( defined $row[0]){
		$count = $row[0];
		}
	else{
		$count = undef;
		}
	}
return $count;
}

#-----------------------------------------------------------------------------------------------------------#

sub GET_DEBUGSTATE{
my $debugstate = 0; #assume no
my $dbHandle = inc::tools::mod_database::TESTDB();
my $tableName = 'debugstate';
my $sql = "select debugstate from debugstate";
my $sth = $dbHandle->prepare($sql);
$sth->execute() || die $DBI::errstr;
while (my @row = $sth->fetchrow_array){ $debugstate = $row[0] }
return $debugstate;
}

#-----------------------------------------------------------------------------------------------------------#

sub STRINGCLEANER{
	my $string = $_[0];
	trim($string);
	chomp($string);
	return $string;
}

#-----------------------------------------------------------------------------------------------------------#

sub trim {
    (my $s = $_[0]) =~ s/^\s+|\s+$//g;
    return $s;
}


#-----------------------------------------------------------------------------------------------------------#

sub READSQL{
	# reads in a file from the /SQL directory and returns its contents as a SQL string for execution. 
	my $filepath = path($_[0]);
	my $sql = $filepath->slurp;
	return $sql;
}

#-----------------------------------------------------------------------------------------------------------#

sub VALUECLEANER{
	# RULE 2 : round all values to 4dp.

	my $value = $_[0];
	if ($debug == 1) {print "ValueCleaner got a value of : " . $value ;}
	my $rounded = sprintf "%.2f", $value;
	if ($debug == 1) {print " Cleaned it up to be " . $rounded . "\n";}

	return $rounded;
	}

#-----------------------------------------------------------------------------------------------------------#

1;
