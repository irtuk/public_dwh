# Stub file for MOD_CMS_BINDING_NAME_RULE
# requirements...
# Should change the names inbound from CMS data and convert them to the anticipated DWH Key
#
	

#directs script to loaction of .pm file
package inc::cms::rules::mod_cms_binding_class_rules;

#setup includes
use lib 'c:\\UDWTesting';
use inc::tools::mod_dbtools qw(GET_DEBUGSTATE);

use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(CLASSRULE);

my $debug = inc::tools::mod_dbtools::GET_DEBUGSTATE();

#force debug on this module only
$debug =0;

if ($debug == 1 ) { print "\n\n *** Debug : ARRIVED IN MOD CMS CLASS REPLACEMENT TOOL  *** \n\n";}


sub CLASSRULE {
	my $inbound_name = $_[0];
	my $inbound_class = $_[1];
	my $outbound_name = $inbound_name;
	my $rulefired = 0;
	
	if ($debug == 1 ) { print "\n\n *** Debug : CLASS TOOL GOT INBOUND NAME ". $inbound_name . " AND CLASS " . $inbound_class . "  *** \n\n";}

	
	if ( $inbound_class eq 'Commercial Combined' or $inbound_class eq'Commercial Property' ) { 
		$rulefired = 1; 
		$outbound_name = $inbound_name . '~CP' ;
		if ($debug == 1 ) { print "\n\n *** Debug : DID A CP REPLACE  *** \n\n";}
		}

	
	if ( $inbound_class eq 'Personal Accident'  or $inbound_class eq 'Personal Accident (Rural Only)' ) { 
		$rulefired = 1; 
		$outbound_name = $inbound_name . '~PA' ;
		if ($debug == 1 ) { print "\n\n *** Debug : DID A PA REPLACE  *** \n\n";}
		}

	if ( $inbound_class eq 'Professional Indemnity' ) { 
		$rulefired = 1; 
		$outbound_name = $inbound_name . '~PI' ;
		if ($debug == 1 ) { print "\n\n *** Debug : DID A PI REPLACE  *** \n\n";}		
		}


	if ( $inbound_class eq 'Public & Products Liability'  or $inbound_class eq 'Public and Products Liability' or $inbound_class = 'Public Liability') { 
		$rulefired = 1; 
		$outbound_name = $inbound_name . '~PL' ;
		if ($debug == 1 ) { print "\n\n *** Debug : DID A PL REPLACE  *** \n\n";}		
		}


	if ( $inbound_class eq 'Property'   ) { 
		$rulefired = 1; 
		$outbound_name = $inbound_name . '~PLP' ;
		if ($debug == 1 ) { print "\n\n *** Debug : DID A PLP REPLACE  *** \n\n";}		
		}

	if ( $inbound_class eq 'Employers Liability' or $inbound_class eq 'UK Employers Liability'   ) { 
		$rulefired = 1; 
		$outbound_name = $inbound_name . '~EL' ;
		if ($debug == 1 ) { print "\n\n *** Debug : DID AN EL REPLACE  *** \n\n";}		
		}		

return $outbound_name;
}
1;
