#directs script to loaction of .pm file
package inc::cms::basics::mod_cms_rowcounts;

#setup includes
use lib 'c:\\UDWTesting';
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(CMS_ROWCOUNTS);
use DBI;
use DBD::ODBC;
use Data::Dumper;
use inc::tools::mod_dbtools qw(DBNAME);
use DateTime;
use DateTime::Format::MySQL;

our $sourceDBHandle=$_[0];
our $targetDBHandle=$_[1];


sub CMS_ROWCOUNTS{
	
	
}