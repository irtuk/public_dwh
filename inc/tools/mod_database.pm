# Stub file for MOD_DATABASE
# requirements...
# MOD DB should:
#
#	Supply database connections to the targets SIT and UAT
#	Supply database connections to the sources CMS TCAS and STINGRAY
#	PP is a text based system and will be handled differently.
#	

#directs script to loaction of .pm file
package inc::tools::mod_database;

use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(UAT SIT CMS TCAS TESTDB);
use DBI;
use DBD::ODBC;


sub UAT{
my $DBCON = DBI-> connect('dbi:ODBC:UDW_UAT') || die "Cannot connect to DB";
return $DBCON;
}

sub SIT{
my $DBCON = DBI-> connect('dbi:ODBC:UDW_SIT') || die "Cannot connect to DB";
return $DBCON;
}

sub CMS{
my $DBCON = DBI-> connect('dbi:ODBC:CMS_Source') || die "Cannot connect to DB";
return $DBCON;
}

sub TCAS{
my $DBCON = DBI-> connect('dbi:ODBC:TCAS_Source') || die "Cannot connect to DB";
return $DBCON;
}

sub TESTDB{
my $DBCON = DBI-> connect('dbi:ODBC:Test_DB') || die "Cannot connect to DB";
return $DBCON;
}