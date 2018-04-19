# This is the stub for the MOD_TEST_RUNNER
# Requirements ...
#
# MOD TEST_RUNNER SHOULD:
#	Create an output file for the test run in the location c:\UDWTestResults
#	Timestamp this file
#	List all the input parameters
#
#	Take input parameters of
#		The Entity under Test ( policy , premium, claim, claim movement )
#		The Source System that we wish to test ( CMS, TCAS, PP, STINGRAY )
#		The Target Database to Validate ( SIT, UAT, DEV )
# 	call the LEFT and RIGHT table builders 
#	call the RULES
# 	write the RESULTS


#setup includes
use lib 'c:\\UDWTesting';

use warnings;
use strict;
use POSIX;
use Getopt::Long;
use constant DATETIME => strftime("%Y-%m-%d_%H-%M-%S", localtime);

use inc::tools::mod_dbtools qw(GET_DEBUGSTATE);
use inc::tools::mod_source qw(PREPARE_TEST);

#set the debugstate
my $debug = inc::tools::mod_dbtools::GET_DEBUGSTATE();
if ( $debug == 1 ) { print "\n\n *** Debugging MOD HANDLER *** \n\n"; }


#check that we have valid parameters for the run. Die if we dont have 3 parameters
# now we know we have at least 3 take the first 3, ignore anything else 
my $source;
my $target;
my $entity;

#if ( $debug == 1 ) { print "\n\n *** MOD HANDLER HAS SOURCE : " . $source . " TARGET : " . $target . " ENTITY : " . $entity ." *** \n\n"; }

## Clean them, drop leading and trailing spaces (chomp) and lowercase them (lc) 
#chomp $source; 
#$source = lc ($source);
#chomp $target; 
#$target = lc ($target);
#chomp $entity; 
#$entity = lc ($entity);
#
##now compare them to the acceptable list of params we can handle and die with a usage message if we have been sent garbage
#if( $source ~~ ['tcas', 'cms', 'pp', 'stingray'] ) { } else  {die "Unknown source " , $source, "\n";}
#if( $target ~~ ['sit', 'uat'] ) { }  else {die "Unknown target " , $target, "\n";}
#if( $entity ~~ ['policy', 'premium', 'claim', 'claimmvmt', 'risk', 'contracts'] ) { } else {die "Unknown entity ", $entity, "\n";}


GetOptions(
	#source system options
	'tcas' => sub {$source = 'tcas';},
	'cms' => sub {$source = 'cms';},
	'pp' => sub {$source = 'pp';},
	'stingray' => sub {$source = 'stingray';},
	
	#target system options	
	'sit' => sub {$target = 'sit';},
	'uat' => sub {$target = 'uat';},
	
	#entity options
	'policy' => sub {$entity = 'policy';},	
	'premium' => sub {$entity = 'premium';},
	'claim' => sub {$entity = 'claim';},
	'claimmvmt' => sub {$entity = 'claimmvmt';},
	'risk' => sub {$entity = 'risk';},
	'contracts' => sub {$entity = 'contracts';},		
	'rowcounts' => sub {$entity = 'rowcounts';}		
	);

die "USAGE -- mod_handler.pl --[TCAS CMS PP Stingray] --[SIT UAT] --[policy premium claim claimMvmt]\n"  unless defined ($source && $target && $entity);


inc::tools::mod_source::PREPARE_TEST($source, $target, $entity);




