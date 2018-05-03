# Stub file for MOD_CMS_BINDING_NAME_RULE
# requirements...
# Should change the names inbound from CMS data and convert them to the anticipated DWH Key
#
	

#directs script to loaction of .pm file
package inc::cms::rules::mod_cms_binding_name_rules;

#setup includes
use lib 'c:\\UDWTesting';
use inc::tools::mod_dbtools qw(GET_DEBUGSTATE);




use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(BINDRULE);

my $debug = inc::tools::mod_dbtools::GET_DEBUGSTATE();

#force debug on just this module
$debug = 0;
if ($debug == 1 ) { print "\n\n *** Debug : ARRIVED IN MOD CMS NAME REPLACEMENT TOOL  *** \n\n";}


sub BINDRULE {
	my $inbound_name = $_[0] || die "no inbound name supplied to BINDRULE\n";
	my $inbound_name_ORIGINAL = $_[1] || die "no clean name supplied to BINDRULE\n";;
	my $outbound_name = $inbound_name;
	
	
	#Note to any Github reviewers. This was a large block of rules for specific rename and data cleansing operations
	#I have removed all these rules because there were some names in there, nothing that would surprise anyone, insurance company names etc 
	#but in the spirit of GDPR etc I have taken these out. you can see what it was supposed to do anyway...
	
	my $rulefired = 0;
	if ( $inbound_name eq 'SOME INBOUND NAME' ) { $rulefired = 1; $outbound_name = 'SOME OUTBOUND NAME' ;}

	
	if ($debug == 1 and $rulefired == 1){print "\n\n *** Debug :  MOD CMS NAME REPLACEMENT TOOL FIRED!! *** \n\n";}
	
	if ($debug == 1 ) { print "\n\n *** Debug BINDNAME : GOT INBOUND_NAME " . $inbound_name . " OUTBOUND " . $outbound_name . " CLEAN NAME " . $inbound_name_ORIGINAL . "  *** \n\n";}
	
	if ($rulefired == 1){
			if ($debug == 1 ) { print "\n\n *** Debug BINDNAME : rule fired so returning" . $outbound_name . "  *** \n\n";}
			return $outbound_name;
		}
			
	else {
		if ($debug == 1 ) { print "\n\n *** Debug BINDNAME : rule NOT fired so returning" . $inbound_name_ORIGINAL . "  *** \n\n";}
		return $inbound_name_ORIGINAL;
		}

}

1;
