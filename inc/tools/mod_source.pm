# This is the stub file for MOD_SOURCE
# requirements ...
# MOD SOURCE needs to build the left side table for data comparisons
# functions wihtin it are called with parameters of SOURCE ( which database we are using ) and ENTITY
# First line of all our scripts needs to say where our libraries are....

use lib 'c:\\UDWTesting';
package inc::tools::mod_source;

#pickup the database connection module and setup imports
use inc::tools::mod_database qw(TCAS TESTDB);
use inc::tcas::mod_tcas_handler qw(TCAS_HANDLER);
use inc::tools::mod_dbtools qw(GET_DEBUGSTATE);
use inc::cms::mod_cms_handler qw(CMS_HANDLER);
 

use strict;
use warnings;
use Exporter qw(import);

# export the main function
our @EXPORT_OK = qw(PREPARE_TEST);

#set the debugstate
our $debug = GET_DEBUGSTATE();
if ( $debug == 1 ) { print "\n\n *** Debugging MOD SOURCE *** \n\n"; }

#get the parameters. Dan, Iain, note that within a subroutine or module use $_[0] not $ARGV[0]. ARGV applies only to the command line.
sub PREPARE_TEST{
my $source = $_[0];
my $target = $_[1];
my $entity = $_[2];

if ( $debug == 1 ) { print "\n\n *** MOD SOURCE HAS PARAMETERS SOURCE : " . $source . " Target : " . $target . " Entity : " . $entity . "*** \n\n"; }

# check what our instructions are and call the appropriate procedure
if ($source eq 'tcas') { TCAS_HANDLER($target, $entity); }
elsif ($source eq 'pp') { pp($target, $entity); }
elsif ($source eq 'cms') { CMS_HANDLER( $target, $entity ); }
elsif ($source eq 'stingray') { stingray($target, $entity); }
else  {die "Sorry I didnt get a valid source\n";}
}
1;

