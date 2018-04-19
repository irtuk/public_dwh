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
	
	my $rulefired = 0;
	if ( $inbound_name eq '~2017~B0312G90200117~OC0006517~CP' ) { $rulefired = 1; $outbound_name = 'BDB Combined CP 2017 ~ 4310525' ;}
	if ( $inbound_name eq '~2017~B0312G90200117~OC0006517~EL' ) { $rulefired = 1; $outbound_name = 'BDB Combined 2017 ~ 4302942' ;}
	if ( $inbound_name eq '~2017~B0312G90200117~OC0006517~PL' ) { $rulefired = 1; $outbound_name = 'BDB Combined 2017 ~ 4302942' ;}
	if ( $inbound_name eq '~2017~B0446OXY17~OC0003517~CP' ) { $rulefired = 1; $outbound_name = 'Clegg Gifford CP 2017 ~ 4310521' ;}
	if ( $inbound_name eq '~2017~B0446OXY17~OC0003517~EL' ) { $rulefired = 1; $outbound_name = 'Clegg Gifford 2017 ~ 4302975' ;}
	if ( $inbound_name eq '~2017~B0446OXY17~OC0003517~PL' ) { $rulefired = 1; $outbound_name = 'Clegg Gifford 2017 ~ 4302975' ;}
	if ( $inbound_name eq '~2017~B0600A1730816~OC0001517~CP' ) { $rulefired = 1; $outbound_name = 'CBC UK Ltd CP 2017 ~ 4310549' ;}
	if ( $inbound_name eq '~2017~B0600A1730816~OC0001517~EL' ) { $rulefired = 1; $outbound_name = 'CBC UK 2017 ~ 4302977' ;}
	if ( $inbound_name eq '~2017~B0600A1730816~OC0001517~PL' ) { $rulefired = 1; $outbound_name = 'CBC UK 2017 ~ 4302977' ;}
	if ( $inbound_name eq '~2017~B0600A1744660~OC0002217~EL' ) { $rulefired = 1; $outbound_name = 'Peter Lole & Co Ltd 2017 ~ 4302962' ;}
	if ( $inbound_name eq '~2017~B0600A1744660~OC0002217~PL' ) { $rulefired = 1; $outbound_name = 'Peter Lole & Co Ltd 2017 ~ 4302962' ;}
	if ( $inbound_name eq '~2017~B0880GMINS2017~OC0002517~EL' ) { $rulefired = 1; $outbound_name = 'GM 2017 ~ 4302944' ;}
	if ( $inbound_name eq '~2017~B0880GMINS2017~OC0002517~PL' ) { $rulefired = 1; $outbound_name = 'GM 2017 ~ 4302944' ;}
	if ( $inbound_name eq '~2017~B1129LFL17003~OC0014417~CP' ) { $rulefired = 1; $outbound_name = 'Lucas Fettes CP 2017 ~ 4310526' ;}
	if ( $inbound_name eq '~2017~B1129LFL17003~OC0014417~EL' ) { $rulefired = 1; $outbound_name = 'Lucas Fettes 2017 ~ 4302985' ;}
	if ( $inbound_name eq '~2017~B1129LFL17003~OC0014417~PL' ) { $rulefired = 1; $outbound_name = 'Lucas Fettes 2017 ~ 4302985' ;}
	if ( $inbound_name eq '~2017~B1262BW0006517A~OC0011417~CP' ) { $rulefired = 1; $outbound_name = 'Kerry London CP 2017 ~ 4310530' ;}
	if ( $inbound_name eq '~2017~B1262BW0006517A~OC0011417~EL' ) { $rulefired = 1; $outbound_name = 'Kerry London 2017 ~ 4302986' ;}
	if ( $inbound_name eq '~2017~B1262BW0006517A~OC0011417~PL' ) { $rulefired = 1; $outbound_name = 'Kerry London 2017 ~ 4302986' ;}
	if ( $inbound_name eq '~2017~B1262BW0006517B~OC0023517~CP' ) { $rulefired = 1; $outbound_name = 'Kerry London CP 2017 ~ 4310530' ;}
	if ( $inbound_name eq '~2017~B1262BW0006517B~OC0023517~EL' ) { $rulefired = 1; $outbound_name = 'Kerry London 2017 ~ 4302986' ;}
	if ( $inbound_name eq '~2017~B1262BW0006517B~OC0023517~PL' ) { $rulefired = 1; $outbound_name = 'Kerry London 2017 ~ 4302986' ;}
	if ( $inbound_name eq '~2017~B132417SCHCOM~OC0022517~CP' ) { $rulefired = 1; $outbound_name = 'Schofields CP 2017 ~ 4310532' ;}
	if ( $inbound_name eq '~2017~B132417SCHCOM~OC0022517~EL' ) { $rulefired = 1; $outbound_name = 'Schofields 2017 ~ 4302971' ;}
	if ( $inbound_name eq '~2017~B132417SCHCOM~OC0022517~PL' ) { $rulefired = 1; $outbound_name = 'Schofields 2017 ~ 4302971' ;}
	if ( $inbound_name eq '~2017~B132417SCHCOMA~OC0025917~CP' ) { $rulefired = 1; $outbound_name = 'Schofields CP 2017 ~ 4310532' ;}
	if ( $inbound_name eq '~2017~B1921IR000010P17~OC0006917~CP' ) { $rulefired = 1; $outbound_name = 'Bennett Christmas CP 2017 ~ 4310520' ;}
	if ( $inbound_name eq '~2017~B1921IR000010P17~OC0006917~EL' ) { $rulefired = 1; $outbound_name = 'Bennett Christmas Ins Brokers 2017 ~ 4302960' ;}
	if ( $inbound_name eq '~2017~B1921IR000010P17~OC0006917~PL' ) { $rulefired = 1; $outbound_name = 'Bennett Christmas Ins Brokers 2017 ~ 4302960' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170022~OC0003917~CP' ) { $rulefired = 1; $outbound_name = 'Commercial UW CP 2017 ~ 4310531' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170022~OC0003917~EL' ) { $rulefired = 1; $outbound_name = 'Commercial Underwriting 2017 ~ 4302988' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170022~OC0003917~PL' ) { $rulefired = 1; $outbound_name = 'Commercial Underwriting 2017 ~ 4302988' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170044B~OC0024517~EL' ) { $rulefired = 1; $outbound_name = 'Ink Roofers & Scaffolders 2017 ~ 4303003' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170044B~OC0024517~PL' ) { $rulefired = 1; $outbound_name = 'Ink Roofers & Scaffolders 2017 ~ 4303003' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170044C~OC0007117~EL' ) { $rulefired = 1; $outbound_name = 'Ink Roofers & Scaffolders 2017 ~ 4303003' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170044C~OC0007117~PL' ) { $rulefired = 1; $outbound_name = 'Ink Roofers & Scaffolders 2017 ~ 4303003' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170045~OC0001817~CP' ) { $rulefired = 1; $outbound_name = 'J Bennett & Son CP 2017 ~ 4310545' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170045~OC0001817~EL' ) { $rulefired = 1; $outbound_name = 'J Bennett & Son (Insurance Brokers) Ltd 2017 ~ 4302998' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170045~OC0001817~PL' ) { $rulefired = 1; $outbound_name = 'J Bennett & Son (Insurance Brokers) Ltd 2017 ~ 4302998' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170049~OC0002617~CP' ) { $rulefired = 1; $outbound_name = 'Lockton CP 2017 ~ 4310514' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170049~OC0002617~EL' ) { $rulefired = 1; $outbound_name = 'Lockton Companies PLC 2017 ~ 4302987' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170049~OC0002617~PL' ) { $rulefired = 1; $outbound_name = 'Lockton Companies PLC 2017 ~ 4302987' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170053~OC0000417~EL' ) { $rulefired = 1; $outbound_name = 'Lycetts Boloodstock Equine 2017 ~ 4302970' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170053~OC0000417~PL' ) { $rulefired = 1; $outbound_name = 'Lycetts Boloodstock Equine 2017 ~ 4302970' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170079~OC0022617~CP' ) { $rulefired = 1; $outbound_name = 'Ink (Print Sch) CP 2017 ~ 4310553' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170079~OC0022617~EL' ) { $rulefired = 1; $outbound_name = 'Ink (Print Sch) 2017 ~ 4303005' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170079~OC0022617~PA' ) { $rulefired = 1; $outbound_name = 'Ink Print PA 2017 ~ 4303085' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170079~OC0022617~PL' ) { $rulefired = 1; $outbound_name = 'Ink (Print Sch) 2017 ~ 4303005' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170081A~OC0023617~EL' ) { $rulefired = 1; $outbound_name = 'Thames 2017 ~ 4302996' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170081A~OC0023617~PL' ) { $rulefired = 1; $outbound_name = 'Thames 2017 ~ 4302996' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170082B~OC0023417~EL' ) { $rulefired = 1; $outbound_name = 'Ink Roofers & Scaffolders 2017 ~ 4303003' ;}
	if ( $inbound_name eq '~2017~B6029OIMCC170082B~OC0023417~PL' ) { $rulefired = 1; $outbound_name = 'Ink Roofers & Scaffolders 2017 ~ 4303003' ;}
	if ( $inbound_name eq '~2017~B6029PEND005A117~OC0027517~EL' ) { $rulefired = 1; $outbound_name = 'ERM 2017 ~ 4302982' ;}
	if ( $inbound_name eq '~2017~B6029PEND005A117~OC0027517~PL' ) { $rulefired = 1; $outbound_name = 'ERM 2017 ~ 4302982' ;}
	if ( $inbound_name eq 'Advance Insurance Services~2017~B6029OIMCC170002~OC0003817~CP' ) { $rulefired = 1; $outbound_name = 'Advance Insurance Services CP 2017 ~ 4310529' ;}
	if ( $inbound_name eq 'Advance Insurance Services~2017~B6029OIMCC170002~OC0003817~EL' ) { $rulefired = 1; $outbound_name = 'Advance 2017 ~ 4302965' ;}
	if ( $inbound_name eq 'Advance Insurance Services~2017~B6029OIMCC170002~OC0003817~PL' ) { $rulefired = 1; $outbound_name = 'Advance 2017 ~ 4302965' ;}
	if ( $inbound_name eq 'AJG Equine~2017~B1262FPC0005817~OC0021617~CP' ) { $rulefired = 1; $outbound_name = 'AJG Equine CP 2017 ~ 4310507' ;}
	if ( $inbound_name eq 'AJG Equine~2017~B1262FPC0005817~OC0021617~EL' ) { $rulefired = 1; $outbound_name = 'AJG Equine Binder 2017 ~ 4303004' ;}
	if ( $inbound_name eq 'AJG Equine~2017~B1262FPC0005817~OC0021617~PL' ) { $rulefired = 1; $outbound_name = 'AJG Equine Binder 2017 ~ 4303004' ;}
	if ( $inbound_name eq 'Arthur J Gallagher - Walbrook~2017~B6029OIMCC170036~OC0004217~CP' ) { $rulefired = 1; $outbound_name = 'AJG Specie CP 2017 ~ 4361792' ;}
	if ( $inbound_name eq 'Arthur J Gallagher - Walbrook~2017~B6029OIMCC170036~OC0004217~EL' ) { $rulefired = 1; $outbound_name = 'AJG Specie 2017 ~ 4361791' ;}
	if ( $inbound_name eq 'Arthur J Gallagher - Walbrook~2017~B6029OIMCC170036~OC0004217~PL' ) { $rulefired = 1; $outbound_name = 'AJG Specie 2017 ~ 4361791' ;}
	if ( $inbound_name eq 'Beech UW Ltd Package~2017~B1262BW0043417A~OC0006817~CP' ) { $rulefired = 1; $outbound_name = 'Beech Underwriting Ltd CP 2017 ~ 4310540' ;}
	if ( $inbound_name eq 'Beech UW Ltd Package~2017~B1262BW0043417A~OC0006817~EL' ) { $rulefired = 1; $outbound_name = 'Beech Package 2017 ~ 4302993' ;}
	if ( $inbound_name eq 'Beech UW Ltd Package~2017~B1262BW0043417A~OC0006817~PL' ) { $rulefired = 1; $outbound_name = 'Beech Package 2017 ~ 4302993' ;}
	if ( $inbound_name eq 'Business Choice Direct Insuran~2017~B6029OIMCC170093~OC0018717~EL' ) { $rulefired = 1; $outbound_name = 'Business Choice Direct (Eldon) 2017 ~ 4302999' ;}
	if ( $inbound_name eq 'Business Choice Direct Insuran~2017~B6029OIMCC170093~OC0018717~PL' ) { $rulefired = 1; $outbound_name = 'Business Choice Direct (Eldon) 2017 ~ 4302999' ;}
	if ( $inbound_name eq 'Care Homes Insurance Services~2017~B1262BW0014417A~OC0001017~CP' ) { $rulefired = 1; $outbound_name = 'Care Home Ins Services CP 2017 ~ 4310528' ;}
	if ( $inbound_name eq 'Care Homes Insurance Services~2017~B1262BW0014417A~OC0001017~EL' ) { $rulefired = 1; $outbound_name = 'CHIS 2017 ~ 4302973' ;}
	if ( $inbound_name eq 'Care Homes Insurance Services~2017~B1262BW0014417A~OC0001017~PL' ) { $rulefired = 1; $outbound_name = 'CHIS 2017 ~ 4302973' ;}
	if ( $inbound_name eq 'City Underwriters~2017~B1262BW0061617A~OC0009517~CP' ) { $rulefired = 1; $outbound_name = 'City Underwriters CP 2017 ~ 4310522' ;}
	if ( $inbound_name eq 'City Underwriters~2017~B1262BW0213917A~OC0028317~CP' ) { $rulefired = 1; $outbound_name = 'City Underwriters CP 2017 ~ 4310522' ;}
	if ( $inbound_name eq 'Commercial Express Quotes Limi~2017~B1262BW0181717A~OC0003717~CP' ) { $rulefired = 1; $outbound_name = 'Commercial Express CP 2017 ~ 4310516' ;}
	if ( $inbound_name eq 'Commercial Express Quotes Limi~2017~B1262BW0181717A~OC0003717~EL' ) { $rulefired = 1; $outbound_name = 'Commercial Express 2017 ~ 4302969' ;}
	if ( $inbound_name eq 'Commercial Express Quotes Limi~2017~B1262BW0181717A~OC0003717~PL' ) { $rulefired = 1; $outbound_name = 'Commercial Express 2017 ~ 4302969' ;}
	if ( $inbound_name eq 'County Insurance Services Limi~2017~B1262BW0006317A~OC0000317~CP' ) { $rulefired = 1; $outbound_name = 'County Insurance Services CP 2017 ~ 4310541' ;}
	if ( $inbound_name eq 'County Insurance Services Limi~2017~B1262BW0006317A~OC0000317~EL' ) { $rulefired = 1; $outbound_name = 'County Insurance Services 2017 ~ 4302994' ;}
	if ( $inbound_name eq 'County Insurance Services Limi~2017~B1262BW0006317A~OC0000317~PL' ) { $rulefired = 1; $outbound_name = 'County Insurance Services 2017 ~ 4302994' ;}
	if ( $inbound_name eq 'Fairweather Insurance Services~2017~B1921IR000040R~OC0002017~CP' ) { $rulefired = 1; $outbound_name = 'Fairweather CP 2017 ~ 4310518' ;}
	if ( $inbound_name eq 'Fairweather Insurance Services~2017~B1921IR000040R~OC0002017~EL' ) { $rulefired = 1; $outbound_name = 'Fairweather Insurance Services 2017 ~ 4302959' ;}
	if ( $inbound_name eq 'Fairweather Insurance Services~2017~B1921IR000040R~OC0002017~PL' ) { $rulefired = 1; $outbound_name = 'Fairweather Insurance Services 2017 ~ 4302959' ;}
	if ( $inbound_name eq 'Fairweather Insurance Services~2017~B1921IR000040R~OC0002017A~CP' ) { $rulefired = 1; $outbound_name = 'Fairweather CP 2017 ~ 4310518' ;}
	if ( $inbound_name eq 'Fairweather Insurance Services~2017~B1921IR000040R~OC0002017A~EL' ) { $rulefired = 1; $outbound_name = 'Fairweather Insurance Services 2017 ~ 4302959' ;}
	if ( $inbound_name eq 'Fairweather Insurance Services~2017~B1921IR000040R~OC0002017A~PL' ) { $rulefired = 1; $outbound_name = 'Fairweather Insurance Services 2017 ~ 4302959' ;}
	if ( $inbound_name eq 'Fairweather Insurance Services~2017~B1921IR000041R~OC0027817~CP' ) { $rulefired = 1; $outbound_name = 'Fairweather CP 2017 ~ 4310518' ;}
	if ( $inbound_name eq 'Fairweather Insurance Services~2017~B1921IR000041R~OC0027817~EL' ) { $rulefired = 1; $outbound_name = 'Fairweather Insurance Services 2017 ~ 4302959' ;}
	if ( $inbound_name eq 'Fairweather Insurance Services~2017~B1921IR000041R~OC0027817~PL' ) { $rulefired = 1; $outbound_name = 'Fairweather Insurance Services 2017 ~ 4302959' ;}
	if ( $inbound_name eq 'GB Underwriting Limited~2017~B6029OIMCC170076~OC0008717~EL' ) { $rulefired = 1; $outbound_name = 'GB Underwriting 2017 ~ 4302940' ;}
	if ( $inbound_name eq 'GB Underwriting Limited~2017~B6029OIMCC170076~OC0008717~PL' ) { $rulefired = 1; $outbound_name = 'GB Underwriting 2017 ~ 4302940' ;}
	if ( $inbound_name eq 'GB Underwriting Limited~2017~B6029OIMCC170076~OC0008717A~EL' ) { $rulefired = 1; $outbound_name = 'GB Underwriting 2017 ~ 4302940' ;}
	if ( $inbound_name eq 'GB Underwriting Limited~2017~B6029OIMCC170076~OC0008717A~PL' ) { $rulefired = 1; $outbound_name = 'GB Underwriting 2017 ~ 4302940' ;}
	if ( $inbound_name eq 'Howden Insurance Brokers Ltd~2017~B6029OIMCC170075~OC0005317~EL' ) { $rulefired = 1; $outbound_name = 'Howden (Windsors) 2017 ~ 4302945' ;}
	if ( $inbound_name eq 'Howden Insurance Brokers Ltd~2017~B6029OIMCC170075~OC0005317~PL' ) { $rulefired = 1; $outbound_name = 'Howden (Windsors) 2017 ~ 4302945' ;}
	if ( $inbound_name eq 'Incorporated Insurance Group L~2017~B6029OIMCC170042~OC0006417~EL' ) { $rulefired = 1; $outbound_name = 'IIGL 2017 ~ 4303000' ;}
	if ( $inbound_name eq 'Incorporated Insurance Group L~2017~B6029OIMCC170042~OC0006417~PL' ) { $rulefired = 1; $outbound_name = 'IIGL 2017 ~ 4303000' ;}
	if ( $inbound_name eq 'Incorporated Insurance Group L~2017~B6029OIMCC170042A~OC0024317~EL' ) { $rulefired = 1; $outbound_name = 'IIGL 2017 ~ 4303000' ;}
	if ( $inbound_name eq 'Incorporated Insurance Group L~2017~B6029OIMCC170042A~OC0024317~PL' ) { $rulefired = 1; $outbound_name = 'IIGL 2017 ~ 4303000' ;}
	if ( $inbound_name eq 'Ink Underwriting Agencies Limi~2017~B6029OIMCC170098~OC0022717~CP' ) { $rulefired = 1; $outbound_name = 'Ink (Birmingham & Glasgow) CP 2017 ~ 4310552' ;}
	if ( $inbound_name eq 'Ink Underwriting Agencies Limi~2017~B6029OIMCC170098~OC0022717~EL' ) { $rulefired = 1; $outbound_name = 'Ink (Birmingham) 2017 ~ 4302968' ;}
	if ( $inbound_name eq 'Ink Underwriting Agencies Limi~2017~B6029OIMCC170098~OC0022717~PL' ) { $rulefired = 1; $outbound_name = 'Ink (Birmingham) 2017 ~ 4302968' ;}
	if ( $inbound_name eq 'J & M  Mercury Insurance~2017~B6029OIMCC170083A~OC0016717A~EL' ) { $rulefired = 1; $outbound_name = 'J & M Mercury 2017 ~ 4302946' ;}
	if ( $inbound_name eq 'J & M  Mercury Insurance~2017~B6029OIMCC170083A~OC0016717A~PL' ) { $rulefired = 1; $outbound_name = 'J & M Mercury 2017 ~ 4302946' ;}
	if ( $inbound_name eq 'J & M  Mercury Insurance~2017~B6029OIMCC170083A~OC0016917~EL' ) { $rulefired = 1; $outbound_name = 'J & M Mercury 2017 ~ 4302946' ;}
	if ( $inbound_name eq 'J & M  Mercury Insurance~2017~B6029OIMCC170083A~OC0016917~PL' ) { $rulefired = 1; $outbound_name = 'J & M Mercury 2017 ~ 4302946' ;}
	if ( $inbound_name eq 'J & M Insurance Services~2017~B6029OIMCC170083~OC0016717~EL' ) { $rulefired = 1; $outbound_name = 'J & M 2017 ~ 4302967' ;}
	if ( $inbound_name eq 'J & M Insurance Services~2017~B6029OIMCC170083~OC0016717~PL' ) { $rulefired = 1; $outbound_name = 'J & M 2017 ~ 4302967' ;}
	if ( $inbound_name eq 'J & M Insurance Services~2017~B6029PEND012A117~OC0026617~PL' ) { $rulefired = 1; $outbound_name = 'J & M 2017 ~ 4302967' ;}
	if ( $inbound_name eq 'Kerry London Limited~2017~B1262BW0006517A~OC0011417~CP' ) { $rulefired = 1; $outbound_name = 'Kerry London CP 2017 ~ 4310530' ;}
	if ( $inbound_name eq 'Kerry London Limited~2017~B1262BW0006517A~OC0011417~EL' ) { $rulefired = 1; $outbound_name = 'Kerry London 2017 ~ 4302986' ;}
	if ( $inbound_name eq 'Kerry London Limited~2017~B1262BW0006517A~OC0011417~PL' ) { $rulefired = 1; $outbound_name = 'Kerry London 2017 ~ 4302986' ;}
	if ( $inbound_name eq 'Kerry London Limited~2017~B1262BW0006517B~OC0023517~EL' ) { $rulefired = 1; $outbound_name = 'Kerry London 2017 ~ 4302986' ;}
	if ( $inbound_name eq 'Kerry London Limited~2017~B1262BW0006517B~OC0023517~PL' ) { $rulefired = 1; $outbound_name = 'Kerry London 2017 ~ 4302986' ;}
	if ( $inbound_name eq 'Kerry London Limited~2017~B1262BW0006517C~OC0024417~CP' ) { $rulefired = 1; $outbound_name = 'Kerry London CP 2017 ~ 4310530' ;}
	if ( $inbound_name eq 'Kerry London Limited~2017~B1262BW0006517C~OC0024417~EL' ) { $rulefired = 1; $outbound_name = 'Kerry London 2017 ~ 4302986' ;}
	if ( $inbound_name eq 'Kerry London Limited~2017~B1262BW0006517C~OC0024417~PL' ) { $rulefired = 1; $outbound_name = 'Kerry London 2017 ~ 4302986' ;}
	if ( $inbound_name eq 'Lycetts Commercial Rural~2017~B6029OIMCC170052~OC0000517~CP' ) { $rulefired = 1; $outbound_name = 'Lycetts Commercial Rural CP 2017 ~ 4310508' ;}
	if ( $inbound_name eq 'Lycetts Commercial Rural~2017~B6029OIMCC170052~OC0000517~EL' ) { $rulefired = 1; $outbound_name = 'Lycetts Commercial Rural 2017 ~ 4302949' ;}
	if ( $inbound_name eq 'Lycetts Commercial Rural~2017~B6029OIMCC170052~OC0000517~PA' ) { $rulefired = 1; $outbound_name = 'Lycetts Commercial Rural PA 2017 ~ 4303090' ;}
	if ( $inbound_name eq 'Lycetts Commercial Rural~2017~B6029OIMCC170052~OC0000517~PL' ) { $rulefired = 1; $outbound_name = 'Lycetts Commercial Rural 2017 ~ 4302949' ;}
	if ( $inbound_name eq 'Lycetts Commercial~2017~B6029OIMCC170052~OC0000517~CP' ) { $rulefired = 1; $outbound_name = 'Lycetts Commercial CP 2017 ~ 4310533' ;}
	if ( $inbound_name eq 'Lycetts Commercial~2017~B6029OIMCC170052~OC0000517~EL' ) { $rulefired = 1; $outbound_name = 'Lycetts Commercial 2017 ~ 4302963' ;}
	if ( $inbound_name eq 'Lycetts Commercial~2017~B6029OIMCC170052~OC0000517~PL' ) { $rulefired = 1; $outbound_name = 'Lycetts Commercial 2017 ~ 4302963' ;}
	if ( $inbound_name eq 'MG Insurance Consultants Limit~2017~B6029OIMCC170056~OC0014617~CP' ) { $rulefired = 1; $outbound_name = 'MG Insurance Commercial CP 2017 ~ 4310509' ;}
	if ( $inbound_name eq 'MG Insurance Consultants Limit~2017~B6029OIMCC170056~OC0014617~EL' ) { $rulefired = 1; $outbound_name = 'MG Commercial 2017 ~ 4302983' ;}
	if ( $inbound_name eq 'MG Insurance Consultants Limit~2017~B6029OIMCC170056~OC0014617~PL' ) { $rulefired = 1; $outbound_name = 'MG Property Owners 2017 ~ 4302950' ;}
	if ( $inbound_name eq 'OAMPS (UK) Ltd T/A PEN Underwr~2017~B6071OC0024017~OC0024017~CP' ) { $rulefired = 1; $outbound_name = 'Pen Underwriting Ltd - Pen High Hazard (OAMPS) Pet ~ 4310551' ;}
	if ( $inbound_name eq 'OAMPS (UK) Ltd T/A PEN Underwr~2017~B6071OC0024017~OC0024017~EL' ) { $rulefired = 1; $outbound_name = 'Pen Underwriting Ltd - Pen High Hazard (OAMPS) Pet ~ 4302951' ;}
	if ( $inbound_name eq 'OAMPS (UK) Ltd T/A PEN Underwr~2017~B6071OC0024017~OC0024017~PL' ) { $rulefired = 1; $outbound_name = 'Pen Underwriting Ltd - Pen High Hazard (OAMPS) Pet ~ 4302951' ;}
	if ( $inbound_name eq 'One Business Insurance Service~2017~B6029OIMCC170058~OC0014017~EL' ) { $rulefired = 1; $outbound_name = 'OIS 2017 ~ 4302991' ;}
	if ( $inbound_name eq 'One Business Insurance Service~2017~B6029OIMCC170058~OC0014017~PA' ) { $rulefired = 1; $outbound_name = 'OIS PA 2017 ~ 4303098' ;}
	if ( $inbound_name eq 'One Business Insurance Service~2017~B6029OIMCC170058~OC0014017~PL' ) { $rulefired = 1; $outbound_name = 'OIS 2017 ~ 4302991' ;}
	if ( $inbound_name eq 'One Business Insurance Service~2017~B6029PEND020A117~OC0033317~PL' ) { $rulefired = 1; $outbound_name = 'OIS Taxi PL 2017 ~ 4302952' ;}
	if ( $inbound_name eq 'Park Insurance Services~2017~B1262BW0079417A~OC0000117~CP' ) { $rulefired = 1; $outbound_name = 'Park Insurance CP 2017 ~ 4310534' ;}
	if ( $inbound_name eq 'Park Insurance Services~2017~B1262BW0079417A~OC0000117~EL' ) { $rulefired = 1; $outbound_name = 'Park Insurance 2017 ~ 4302981' ;}
	if ( $inbound_name eq 'Park Insurance Services~2017~B1262BW0079417A~OC0000117~PL' ) { $rulefired = 1; $outbound_name = 'Park Insurance 2017 ~ 4302981' ;}
	if ( $inbound_name eq 'Policyfast (Coversure) Combine~2017~B6029OIMCC170062~OC0000617~EL' ) { $rulefired = 1; $outbound_name = 'Policyfast (Coversure) Combined 2017 ~ 4302953' ;}
	if ( $inbound_name eq 'Policyfast (Coversure) Combine~2017~B6029OIMCC170062~OC0000617~PL' ) { $rulefired = 1; $outbound_name = 'Policyfast (Coversure) Combined 2017 ~ 4302953' ;}
	if ( $inbound_name eq 'Policyfast (Coversure) Haulier~2017~B6029OIMCC170062~OC0000617~EL' ) { $rulefired = 1; $outbound_name = 'Policyfast (Coversure) Hauliers 2017 ~ 4302964' ;}
	if ( $inbound_name eq 'Policyfast (Coversure) Haulier~2017~B6029OIMCC170062~OC0000617~PL' ) { $rulefired = 1; $outbound_name = 'Policyfast (Coversure) Hauliers 2017 ~ 4302964' ;}
	if ( $inbound_name eq 'SEIB Agents~2017~B6029MPEN170078A~OC0025417~CP' ) { $rulefired = 1; $outbound_name = 'SEIB Agents CP 2017 ~ 4310511' ;}
	if ( $inbound_name eq 'SEIB Agents~2017~B6029OIMCC170069~OC0000917~CP' ) { $rulefired = 1; $outbound_name = 'SEIB Agents CP 2017 ~ 4310511' ;}
	if ( $inbound_name eq 'SEIB Agents~2017~B6029OIMCC170069~OC0000917~EL' ) { $rulefired = 1; $outbound_name = 'SEIB Agents 2017 ~ 4302955' ;}
	if ( $inbound_name eq 'SEIB Agents~2017~B6029OIMCC170069~OC0000917~PL' ) { $rulefired = 1; $outbound_name = 'SEIB Agents 2017 ~ 4302955' ;}
	if ( $inbound_name eq 'SEIB Direct~2017~B6029OIMCC170069~OC0000917~CP' ) { $rulefired = 1; $outbound_name = 'SEIB Direct CP 2017 ~ 4310512' ;}
	if ( $inbound_name eq 'SEIB Direct~2017~B6029OIMCC170069~OC0000917~EL' ) { $rulefired = 1; $outbound_name = 'SEIB Direct 2017 ~ 4302956' ;}
	if ( $inbound_name eq 'SEIB Direct~2017~B6029OIMCC170069~OC0000917~PL' ) { $rulefired = 1; $outbound_name = 'SEIB Direct 2017 ~ 4302956' ;}
	if ( $inbound_name eq 'SEIB Horse PL~2017~B6029MPEN170078A~OC0025417~PL' ) { $rulefired = 1; $outbound_name = 'SEIB Horse PL 2017 ~ 4302957' ;}
	if ( $inbound_name eq 'SEIB Horse PL~2017~B6029OIMCC170069~OC0000917~PL' ) { $rulefired = 1; $outbound_name = 'SEIB Horse PL 2017 ~ 4302957' ;}
	if ( $inbound_name eq 'SEIB Quote Monkey~2017~B6029OIMCC170069~OC0000917~CP' ) { $rulefired = 1; $outbound_name = 'SEIB Quote Monkey CP 2017 ~ 4310536' ;}
	if ( $inbound_name eq 'SEIB Quote Monkey~2017~B6029OIMCC170069~OC0000917~PL' ) { $rulefired = 1; $outbound_name = 'SEIB Quote Monkey 2017 ~ 4302990' ;}
	if ( $inbound_name eq 'SEIB Quote Monkey~2017~B6029PEND026A117~OC0029917~CP' ) { $rulefired = 1; $outbound_name = 'SEIB Quote Monkey CP 2017 ~ 4310536' ;}
	if ( $inbound_name eq 'SEIB Quote Monkey~2017~B6029PEND026A117~OC0029917~PL' ) { $rulefired = 1; $outbound_name = 'SEIB Quote Monkey 2017 ~ 4302990' ;}
	if ( $inbound_name eq 'Shearwater Equine~2017~B6029OIMCC170068~OC0000717~EL' ) { $rulefired = 1; $outbound_name = 'Shearwater Equine 2017 ~ 4302966' ;}
	if ( $inbound_name eq 'Shearwater Equine~2017~B6029OIMCC170068~OC0000717~PL' ) { $rulefired = 1; $outbound_name = 'Shearwater Equine 2017 ~ 4302966' ;}
	if ( $inbound_name eq 'South Essex Insurance Brokers ~2017~B6029OIMCC170078~OC0004417~PL' ) { $rulefired = 1; $outbound_name = 'British Horse Society (BHS) SEIB 2017 ~ 4302941' ;}
	if ( $inbound_name eq 'TH March & Company Limited~2017~B0600A1731078~OC0011717~CP' ) { $rulefired = 1; $outbound_name = 'TH March CP 2017 ~ 4310544' ;}
	if ( $inbound_name eq 'TH March & Company Limited~2017~B0600A1731078~OC0011717~EL' ) { $rulefired = 1; $outbound_name = 'T H March 2017 ~ 4302976' ;}
	if ( $inbound_name eq 'TH March & Company Limited~2017~B0600A1731078~OC0011717~PL' ) { $rulefired = 1; $outbound_name = 'T H March 2017 ~ 4302976' ;}
	if ( $inbound_name eq '3XD~2017~B6029AFF1100316~OA0010917' ) { $rulefired = 1; $outbound_name = '3XD Affinity 2017 ~ 4302812' ;}
	if ( $inbound_name eq 'Advent~2017~B0600A1700408~OA0002517' ) { $rulefired = 1; $outbound_name = 'Advent Affinity 2017 ~ 4302831' ;}
	if ( $inbound_name eq 'AJG Belmont~2017~B1262BW0063417~OA0005717' ) { $rulefired = 1; $outbound_name = 'AJG - Belmont Affinity 2017 ~ 4301219' ;}
	if ( $inbound_name eq 'AJG Housing~2017~B1262BW0019317~OA0002417' ) { $rulefired = 1; $outbound_name = 'AJG Housing Affinity 2017 ~ 4301220' ;}
	if ( $inbound_name eq 'AJG Wakefield~2017~B1262BW0182617~OA0016417' ) { $rulefired = 1; $outbound_name = 'Wakefield Key Connect Affinity 2017 ~ 4303150' ;}
	if ( $inbound_name eq 'Ark~2017~B6029AFF1103217~OA0000117' ) { $rulefired = 1; $outbound_name = 'Ark Household HH Affinity 2017 ~ 4303127' ;}
	if ( $inbound_name eq 'Avantia Affinity~2017~B6029AFF1100416~OA0003617' ) { $rulefired = 1; $outbound_name = 'Avantia Affinity 2017 ~ 4302830' ;}
	if ( $inbound_name eq 'Avantia  Affinity Levy~2017~B6029AFF1100416~OA0003617' ) { $rulefired = 1; $outbound_name = 'Avantia Affinity 2017 ~ 4302830' ;}
	if ( $inbound_name eq 'Avantia Household~2017~B6029AFF1100416P~OA0008617' ) { $rulefired = 1; $outbound_name = 'Avantia Household HH Affinity 2017 ~ 4303128' ;}
	if ( $inbound_name eq 'Avantia Household Levy~2017~B6029AFF1100416P~OA0008617' ) { $rulefired = 1; $outbound_name = 'Avantia Household HH Affinity 2017 ~ 4303128' ;}
	if ( $inbound_name eq 'Bennett Gould~2017~B6029AFF1103317~OA0000217' ) { $rulefired = 1; $outbound_name = 'Bennett Gould HH Affin 2017 ~ 4303144' ;}
	if ( $inbound_name eq 'Besso Bernstein~2017~B1262BW0074317~OA0011217' ) { $rulefired = 1; $outbound_name = 'Besso Bernstein Affinity 2017 ~ 4301218' ;}
	if ( $inbound_name eq 'Besso Household~2017~B1262BW0074317~OA0011217' ) { $rulefired = 1; $outbound_name = 'Besso Household Affinity 2017 ~ 4301221' ;}
	if ( $inbound_name eq 'Beverley FTI~2017~B1262FBW0005317P2~OA0018817' ) { $rulefired = 1; $outbound_name = 'Beverley BS FTI PIP LIO Affin 2017 ~ 4355505' ;}
	if ( $inbound_name eq 'Beverley LIO PIP~2017~B1262FBW0005317P2~OA0018817' ) { $rulefired = 1; $outbound_name = 'Beverley BS FTI PIP LIO Affin 2017 ~ 4355505' ;}
	if ( $inbound_name eq 'Bluedrop~2017~B1262BW0066617P~OA0009317' ) { $rulefired = 1; $outbound_name = 'Bluedrop Non Standard Affinity 2017 ~ 4303111' ;}
	if ( $inbound_name eq 'Bluedrop Bedroom Rated~2017~B1262BW0066617P~OA0009317' ) { $rulefired = 1; $outbound_name = 'Bluedrop Non Standard Affinity 2017 ~ 4303111' ;}
	if ( $inbound_name eq 'Bluedrop Let~2017~B1262BW0066617P~OA0009317' ) { $rulefired = 1; $outbound_name = 'Bluedrop Non Standard Affinity 2017 ~ 4303111' ;}
	if ( $inbound_name eq 'Breeze Thatch and Household~2017~PEN/AFF1/1053/17~OA0008817' ) { $rulefired = 1; $outbound_name = 'Breeze Thatch Affinity 2017 ~ 4303125' ;}
	if ( $inbound_name eq 'Breeze Underwriting Ltd Crystal~2017~PEN/AFF1/1053/17~OA0015617' ) { $rulefired = 1; $outbound_name = 'Breeze Underwriting Ltd - Crystals Affinity 2017 ~ 4645996' ;}
	if ( $inbound_name eq 'Breeze Underwriting Ltd Goldpark~2017~PEN/AFF1/1053/17~OA0009817' ) { $rulefired = 1; $outbound_name = 'Breeze Underwriting Ltd - Goldpark Aff 2017 ~ 4645995' ;}
	if ( $inbound_name eq 'Brooks Braithwaite~2017~B6029AFF1102317~OA0005417' ) { $rulefired = 1; $outbound_name = 'Brooks Braithwaite Affinity 2017 ~ 4302829' ;}
	if ( $inbound_name eq 'CBC High Limit~2017~B0600A1726947~OA0005617' ) { $rulefired = 1; $outbound_name = 'CBC High Lmit Affinity 2017 ~ 4301347' ;}
	if ( $inbound_name eq 'CBC Miscellaneous~2017~B0600A1710025~OA0005017' ) { $rulefired = 1; $outbound_name = 'CBC Miscellaneous Affinity 2017 ~ 4301345' ;}
	if ( $inbound_name eq 'CBC Miscellaneous Overseas~2017~B0600A1710025~OA0005017' ) { $rulefired = 1; $outbound_name = 'CBC Miscellaneous Affinity 2017 ~ 4301345' ;}
	if ( $inbound_name eq 'CETA~2017~B1262BW0104717P~OA0013717' ) { $rulefired = 1; $outbound_name = 'CETA Affinity 2017 ~ 4303113' ;}
	if ( $inbound_name eq 'Chapman & Stacey~2017~B6029AFF1103417~OA0000417' ) { $rulefired = 1; $outbound_name = 'Chapman & Stacey HH Affin 2017 ~ 4303149' ;}
	if ( $inbound_name eq 'Charter Court LIO PIP~2017~B0600A1744705~OA0009217' ) { $rulefired = 1; $outbound_name = 'Charter Court FTI LIO PIP Affin 2017 ~ 4684225' ;}
	if ( $inbound_name eq 'Charter Court FTI~2017~B0600A1744705~OA0009217' ) { $rulefired = 1; $outbound_name = 'Charter Court FTI LIO PIP Affin 2017 ~ 4684225' ;}
	if ( $inbound_name eq 'Choice~2017~B1262BW0184917P~OA0014617' ) { $rulefired = 1; $outbound_name = 'Choice Affinity 2017 ~ 4302828' ;}
	if ( $inbound_name eq 'County~2017~B1262BW0070616P~OA0000517' ) { $rulefired = 1; $outbound_name = 'County Ins Thatched HH Affin 2017 ~ 4303130' ;}
	if ( $inbound_name eq 'Coventry Homecover~2017~B1262BW0189217P~OA0005117' ) { $rulefired = 1; $outbound_name = 'COVENTRY Homecover Affin 2017 ~ 4301369' ;}
	if ( $inbound_name eq 'Coventry Panel~2017~B1262BW0189217P~OA0004017' ) { $rulefired = 1; $outbound_name = 'COVENTRY PANEL Affin 2017 ~ 4301379' ;}
	if ( $inbound_name eq 'Coversure~2017~B6029AFF1106817~OA0016917' ) { $rulefired = 1; $outbound_name = 'Coversure Affinity 2017 ~ 4318350' ;}
	if ( $inbound_name eq 'Darlington LIO PIP~2017~B1262FBW0005317~OA0017117' ) { $rulefired = 1; $outbound_name = 'DARLINGTON FTI LIO PIP Affin 2017 ~ 4301380' ;}
	if ( $inbound_name eq 'Darlington FTI~2017~B1262FBW0005317~OA0017117' ) { $rulefired = 1; $outbound_name = 'DARLINGTON FTI LIO PIP Affin 2017 ~ 4301380' ;}
	if ( $inbound_name eq 'Driessen~2017~B1356C170100~OA0011917' ) { $rulefired = 1; $outbound_name = 'Driessen Affinity 2017 ~ 4301367' ;}
	if ( $inbound_name eq 'E-Insurance~2017~B1262BW0204017~OA0011117' ) { $rulefired = 1; $outbound_name = 'E-Insurance Affin 2017 ~ 4301190' ;}
	if ( $inbound_name eq 'E-Insurance Caravans~2017~B1262BW0204017A~OA0019517' ) { $rulefired = 1; $outbound_name = 'E-Insurance Holiday Home and Caravans Affin 2017 ~ 4472694' ;}
	if ( $inbound_name eq 'Firstport Insurance Serv Ltd~2017~B1262BW0034717~OA0009717' ) { $rulefired = 1; $outbound_name = 'Firstport Insurance Serv Ltd Affin 2017 ~ 4301217' ;}
	if ( $inbound_name eq 'Furness Building Society~2017~B1262BW0182717~OA0003117' ) { $rulefired = 1; $outbound_name = 'FURNESS Block Affin 2017 ~ 4301375' ;}
	if ( $inbound_name eq 'AJG IB (formerly Croydon)~2017~PEN/AFF1/1035/17~OA0001317' ) { $rulefired = 1; $outbound_name = 'AJG IB (formerly Croydon) Affin 2017 Let ~ 4303133' ;}
	if ( $inbound_name eq 'Wakefield Key Connect~2017~B1262BW0182617~OA0010117' ) { $rulefired = 1; $outbound_name = 'Wakefield Key Connect Affinity 2017 ~ 4303150' ;}
	if ( $inbound_name eq 'Gothic~2017~PEN/AFF1/1067/17~OA0017717' ) { $rulefired = 1; $outbound_name = 'Gothic Affinity 2017 ~ 4384933' ;}
	if ( $inbound_name eq 'Gresham~2017~B1033LC099200R~OA0001417' ) { $rulefired = 1; $outbound_name = 'Gresham HH Affin 2017 ~ 4303138' ;}
	if ( $inbound_name eq 'Hamilton Fraser Household~2017~B0600A1736036~OA0006417' ) { $rulefired = 1; $outbound_name = 'Hamilton Household Insurance Affinity 2017 ~ 4301359' ;}
	if ( $inbound_name eq 'Henderson~2017~PEN/AFF1/1023/17~OA0012817' ) { $rulefired = 1; $outbound_name = 'Henderson Affinity 2017 ~ 4302827' ;}
	if ( $inbound_name eq 'Heritage~2017~PEN/AFF1/1036/17~OA0000717' ) { $rulefired = 1; $outbound_name = 'Heritage HH Affin 2017 ~ 4303140' ;}
	if ( $inbound_name eq '"Higos~2017~B0600A1718746PEN/AFF1/1077/2017	~OA0009917"' ) { $rulefired = 1; $outbound_name = 'Higos CBC Affinity 2017 ~ 4302826' ;}
	if ( $inbound_name eq '"Higos Direct~2017~B0600A1718746	PEN/AFF1/1077/2017	~OA0019317"' ) { $rulefired = 1; $outbound_name = 'Higos Direct Affinity 2017 ~ 4754131' ;}
	if ( $inbound_name eq 'Hildon Park~2017~B1262BW0065417~OA0006117' ) { $rulefired = 1; $outbound_name = 'Hildon Park Affinity 2017 ~ 4303114' ;}
	if ( $inbound_name eq 'GA Hinks~2017~PEN/AFF1/1075/17~OA0017317' ) { $rulefired = 1; $outbound_name = 'G A Hinks Affinity 2017 ~ 4468916' ;}
	if ( $inbound_name eq 'Hughes~2017~PEN/AFF1/1038/17~OA0000917' ) { $rulefired = 1; $outbound_name = 'Hughes HH Affin 2017 ~ 4303147' ;}
	if ( $inbound_name eq 'HW Wood Stamp Dealers~2017~B1098S163245~OA0011817 ' ) { $rulefired = 1; $outbound_name = 'H W Wood Stamp Dealers Affinity 2017 ~ 4301365' ;}
	if ( $inbound_name eq 'HW Wood Household ~2017~B1098S163245~OA0011817 ' ) { $rulefired = 1; $outbound_name = 'H W Wood Stamp Dealers Affinity 2017 ~ 4301365' ;}
	if ( $inbound_name eq 'i4me~2017~B0600A1709758~OA0014917' ) { $rulefired = 1; $outbound_name = 'I4me Affinity 2017 ~ 4302824' ;}
	if ( $inbound_name eq 'i4me Direct~2017~PEN/AFF1/1079/17~OA0020117' ) { $rulefired = 1; $outbound_name = 'I4me Affinity 2017 ~ 4302824' ;}
	if ( $inbound_name eq 'IDL Choice~2017~PEN/AFF1/1020/17~OA0015717' ) { $rulefired = 1; $outbound_name = 'IDL Choice Affinity 2017 ~ 4302810' ;}
	if ( $inbound_name eq 'IDL Essentials~2017~PEN/AFF1/1020/17~OA0013617' ) { $rulefired = 1; $outbound_name = 'IDL Essentials Affinity 2017 ~ 4302822' ;}
	if ( $inbound_name eq 'IDL Standard~2017~PEN/AFF1/1020/17~OA0012917' ) { $rulefired = 1; $outbound_name = 'IDL Choice Affinity 2017 ~ 4302810' ;}
	if ( $inbound_name eq 'Intasure~2017~B1262BW0141617P~OA0001017' ) { $rulefired = 1; $outbound_name = 'Intasure HH Affin 2017 ~ 4303141' ;}
	if ( $inbound_name eq 'Internet Insurance Services~2017~B1033LC098600Q~OA0015517' ) { $rulefired = 1; $outbound_name = 'Internet Insurance Services Affinity 2017 ~ 4302813' ;}
	if ( $inbound_name eq 'IPH~2017~PEN/AFF1/1005/17~OA0006617' ) { $rulefired = 1; $outbound_name = 'IPH Affinity 2017 ~ 4302821' ;}
	if ( $inbound_name eq 'Iprism~2017~B1262BW01460/17~OA0015117' ) { $rulefired = 1; $outbound_name = 'Iprism Affinity 2017 ~ 4303115' ;}
	if ( $inbound_name eq 'Itex~2017~PEN/AFF1/1039/17~OA0001517' ) { $rulefired = 1; $outbound_name = 'ITEX HH Affin 2017 ~ 4303137' ;}
	if ( $inbound_name eq 'James Hallam ~2017~B1262BW0070617~OA0001617' ) { $rulefired = 1; $outbound_name = 'James Hallam/Touchstone HH Affin 2017 ~ 4303129' ;}
	if ( $inbound_name eq 'Lark Household~2017~B0670M01PENHH17~OA0013317' ) { $rulefired = 1; $outbound_name = 'Lark Household Affinity 2017 ~ 4301366' ;}
	if ( $inbound_name eq 'Leek United~2017~B1262FBW0005317P4~OA00017417' ) { $rulefired = 1; $outbound_name = 'Leek United Affin 2017 ~ 4301372' ;}
	if ( $inbound_name eq 'Limestreet Brokers~2017~PEN/AFF1/1037/17~OA0000817' ) { $rulefired = 1; $outbound_name = 'Lime St HH (formerly Houlders) Affin 2017 ~ 4303146' ;}
	if ( $inbound_name eq 'Magnet ~2017~B1033LC099300R~OA0001717' ) { $rulefired = 1; $outbound_name = 'Magnet HH Affin 2017 ~ 4303142' ;}
	if ( $inbound_name eq 'Mansfield PIP LIO~2017~B1262FBW0005317P~OA0017217' ) { $rulefired = 1; $outbound_name = 'MANSFIELD FTI PIP LIO Affin 2017 ~ 4301374' ;}
	if ( $inbound_name eq 'Mansfield FTI~2017~B1262FBW0005317P~OA0017217' ) { $rulefired = 1; $outbound_name = 'MANSFIELD FTI PIP LIO Affin 2017 ~ 4301374' ;}
	if ( $inbound_name eq 'Melton LIO PIP~2017~B1262FBW0005317P3~OA0017517' ) { $rulefired = 1; $outbound_name = 'MELTON MOWBRAY LIO PIP Affin 2017 ~ 4301373' ;}
	if ( $inbound_name eq 'Melton FTI~2017~B1262FBW0005317P3~OA0017517' ) { $rulefired = 1; $outbound_name = 'MELTON MOWBRAY LIO PIP Affin 2017 ~ 4301373' ;}
	if ( $inbound_name eq 'National Counties BS LIO PIP~2017~B1262FBW0005317P4~OA0018917' ) { $rulefired = 1; $outbound_name = 'National Counties BS FTI LIO PIP AFFIN 2017 ~ 4786635' ;}
	if ( $inbound_name eq 'National Counties BS FTI~2017~B1262FBW0005317P4~OA0018917' ) { $rulefired = 1; $outbound_name = 'National Counties BS FTI LIO PIP AFFIN 2017 ~ 4786635' ;}
	if ( $inbound_name eq 'O\'Brien Finlay Household~2017~B0600A1723521~OA0005817' ) { $rulefired = 1; $outbound_name = 'OBrien Finlay Household Affinity 2017 ~ 4301354' ;}
	if ( $inbound_name eq 'O\'Brien Finlay Mobile Home ~2017~B0600A1723513~OA0005917' ) { $rulefired = 1; $outbound_name = 'OBrien Finlay Mobile Homes Affinity 2017 ~ 4301352' ;}
	if ( $inbound_name eq 'O\'Brien Finlay Tara Glen~2017~B0600A1723523~OA0009017' ) { $rulefired = 1; $outbound_name = 'OBrien Finlay Tara Glen Affinity 2017 ~ 4301357' ;}
	if ( $inbound_name eq 'Orwell Household~2017~B1262BW0025017~OA0001817' ) { $rulefired = 1; $outbound_name = 'Orwell LET Affin 2017 ~ 4303124' ;}
	if ( $inbound_name eq 'Orwell Let~2017~B1262BW0025017~OA0001817' ) { $rulefired = 1; $outbound_name = 'Orwell LET Affin 2017 ~ 4303124' ;}
	if ( $inbound_name eq 'Palladium~2017~B0600A1700224~OA0004917' ) { $rulefired = 1; $outbound_name = 'Palladium Affinity 2017 ~ 4302819' ;}
	if ( $inbound_name eq 'Peter Lole~2017~B0600A1744675~OA0005517' ) { $rulefired = 1; $outbound_name = 'Peter Lole Affinity CP 2017 ~ 4302808' ;}
	if ( $inbound_name eq 'Playle Russell Standard~2017~B1262BW0009217~OA0007217' ) { $rulefired = 1; $outbound_name = 'Playle Russell Thatched Affinity 2017 ~ 4303110' ;}
	if ( $inbound_name eq 'Playle Russell Thatched~2017~B1262BW0009217~OA0007217' ) { $rulefired = 1; $outbound_name = 'Playle Russell Thatched Affinity 2017 ~ 4303110' ;}
	if ( $inbound_name eq 'Precision Beach Huts~2017~PEN/AFF2/0002/17~OA0017617' ) { $rulefired = 1; $outbound_name = 'Precision Affinity 2017 ~ 4302818' ;}
	if ( $inbound_name eq 'Precision ~2017~PEN/AFF2/0003/17~OA0013017' ) { $rulefired = 1; $outbound_name = 'Precision Affinity 2017 ~ 4302818' ;}
	if ( $inbound_name eq 'Redstone LIO PIP~2017~B0600A1731435~OA0004717' ) { $rulefired = 1; $outbound_name = 'Redstone LIO PIP FTI Affinity 2017 ~ 4301353' ;}
	if ( $inbound_name eq 'Redstone FTI~2017~B0600A1731435~OA0004717' ) { $rulefired = 1; $outbound_name = 'Redstone LIO PIP FTI Affinity 2017 ~ 4301353' ;}
	if ( $inbound_name eq 'Rooftop Mortgages Ltd~2017~B0600A1742379~OA0019117' ) { $rulefired = 1; $outbound_name = 'Rooftop Mortgages Ltd Affinity 2017 ~ 4301356' ;}
	if ( $inbound_name eq 'SAGA Household~2017~Not Provided~OA0002017' ) { $rulefired = 1; $outbound_name = 'Saga HH Affin 2017 ~ 4303148' ;}
	if ( $inbound_name eq 'SEIB IB Ltd~2017~PEN/AAF1/1070/17~OA0018617' ) { $rulefired = 1; $outbound_name = 'SEIB IB Ltd Affintiy 2017 ~ 4303107' ;}
	if ( $inbound_name eq 'Shearwater~2017~PEN/AFF1/1025/17~OA0011417' ) { $rulefired = 1; $outbound_name = 'Shearwater Affinity 2017 ~ 4302817' ;}
	if ( $inbound_name eq 'Stackhouse Poland~2017~B0600A1710091~OA0002617' ) { $rulefired = 1; $outbound_name = 'Stackhouse Poland Affinity 2017 ~ 4301351' ;}
	if ( $inbound_name eq 'Stackhouse Poland We buy any house~2017~B0600A1710091~OA0016717' ) { $rulefired = 1; $outbound_name = 'Stackhouse We Buy Any Home Affinity 2017 ~ 4573080' ;}
	if ( $inbound_name eq 'Starlane Let~2017~PEN/AFF1/1043/17~OA0008717' ) { $rulefired = 1; $outbound_name = 'Starlane LET HH Affin 2017 ~ 4303131' ;}
	if ( $inbound_name eq 'Starlane Household~2017~PEN/AFF1/1043/17~OA0008717' ) { $rulefired = 1; $outbound_name = 'Starlane LET HH Affin 2017 ~ 4303131' ;}
	if ( $inbound_name eq 'TH March ~2017~B0600A1712825~OA0006517' ) { $rulefired = 1; $outbound_name = 'T H March Affinity 2017 ~ 4301358' ;}
	if ( $inbound_name eq 'Tipton Block ~2017~B1262FBW0005317P1~OA0017017' ) { $rulefired = 1; $outbound_name = 'TIPTON Block Affin 2017 ~ 4301376' ;}
	if ( $inbound_name eq 'Tipton LIO PIP~2017~B1262FBW0005317P1~OA0017017' ) { $rulefired = 1; $outbound_name = 'TIPTON Block Affin 2017 ~ 4301376' ;}
	if ( $inbound_name eq 'Tipton FTI~2017~B1262FBW0005317P1~OA0017017' ) { $rulefired = 1; $outbound_name = 'TIPTON Block Affin 2017 ~ 4301376' ;}
	if ( $inbound_name eq 'Vasek Just Landlord~2017~B1262BW0015317P~OA0002917' ) { $rulefired = 1; $outbound_name = 'VASEK JUST TENANTS Affin 2017 ~ 4301187' ;}
	if ( $inbound_name eq 'Vasek Block of Flats~2017~B1262BW0013617P~OA0002717' ) { $rulefired = 1; $outbound_name = 'Vasek BLOCKS OF FLATS Affin 2017 ~ 4301194' ;}
	if ( $inbound_name eq 'Vasek Commercial~2017~B1262BW0015617P~OA0014817' ) { $rulefired = 1; $outbound_name = 'Vasek COMMERCIAL Affin 2017 ~ 4301193' ;}
	if ( $inbound_name eq 'Vasek High Net Worth~2017~B1262BW060717~OA0003517' ) { $rulefired = 1; $outbound_name = 'Vasek HIGH NET WORTH HOUSEHOLD Affin 2017 ~ 4301195' ;}
	if ( $inbound_name eq 'Vasek Household~2017~B1262BW0038217P~OA0014017' ) { $rulefired = 1; $outbound_name = 'Vasek HOUSEHOLD Affin 2017 ~ 4301196' ;}
	if ( $inbound_name eq 'Vasek Insure My Villa~2017~B1262BW0015517P~OA0003417' ) { $rulefired = 1; $outbound_name = 'Vasek INSURE MY VILLA Affin 2017 ~ 4301191' ;}
	if ( $inbound_name eq 'Vasek Just Tentants~2017~B1262BW0015317P~OA0002917' ) { $rulefired = 1; $outbound_name = 'VASEK JUST TENANTS Affin 2017 ~ 4301187' ;}
	if ( $inbound_name eq 'Vasek Portfolio~2017~B1262BW0015417P~OA0003017' ) { $rulefired = 1; $outbound_name = 'VASEK PORTFOLIO Affin 2017 ~ 4301186' ;}
	if ( $inbound_name eq 'Vasek Unoccupied Direct~2017~B1262BW0015417~OA0003017' ) { $rulefired = 1; $outbound_name = 'VASEK PORTFOLIO Affin 2017 ~ 4301186' ;}
	if ( $inbound_name eq 'Vasek Wholesale~2017~B1262BW0015417P~OA0003017' ) { $rulefired = 1; $outbound_name = 'VASEK PORTFOLIO Affin 2017 ~ 4301186' ;}
	if ( $inbound_name eq 'WMS MAS Building Guard ~2017~B0600A1726615~OA0008417' ) { $rulefired = 1; $outbound_name = 'WMS MAS Building Guard Affinity 2017 ~ 4301348' ;}
	if ( $inbound_name eq 'WMS Premier ~2017~B0600A1714587~OA0003217' ) { $rulefired = 1; $outbound_name = 'WMS Premier Affinity 2017 ~ 4301349' ;}
	if ( $inbound_name eq 'Care Homes Insurance Services~2017~B1262BW0214317A~OC0027617~CP' ) { $rulefired = 1; $outbound_name = 'Care Home Ins Services CP 2017 ~ 4310528' ;}
	if ( $inbound_name eq 'County Insurance Services Limi~2017~B1262BW0214217A~OC0030117~CP' ) { $rulefired = 1; $outbound_name = 'County Insurance Services CP 2017 ~ 4310541' ;}
	if ( $inbound_name eq 'GB Underwriting Limited~2017~B6029PEND008A117~OC0028517~EL' ) { $rulefired = 1; $outbound_name = 'GB Underwriting 2017 ~ 4302940' ;}
	if ( $inbound_name eq 'J & M  Mercury Insurance~2017~B6029PEND012A117A~OC0026717~EL' ) { $rulefired = 1; $outbound_name = 'J & M Mercury 2017 ~ 4302946' ;}
	if ( $inbound_name eq 'J & M Insurance Services~2017~B6029PEND012A117~OC0026617~EL' ) { $rulefired = 1; $outbound_name = 'J & M 2017 ~ 4302967' ;}
	if ( $inbound_name eq 'OIS Taxi PL 2017 ~ 4302952' ) { $rulefired = 1; $outbound_name = 'OIS Taxi PL 2017 ~ 4302952' ;}
	if ( $inbound_name eq 'One Business Insurance Service~2017~B6029PEND020A117~OC0033317~EL' ) { $rulefired = 1; $outbound_name = 'OIS Taxi PL 2017 ~ 4302952' ;}
	if ( $inbound_name eq 'SEIB Direct~2017~B6029MPEN170078A~OC0025417~EL' ) { $rulefired = 1; $outbound_name = 'SEIB Direct 2017 ~ 4302956' ;}
	if ( $inbound_name eq 'Shearwater Equine~2017~B6029MPEN170068~OC0025117~EL' ) { $rulefired = 1; $outbound_name = 'Shearwater Equine 2017 ~ 4302966' ;}
	if ( $inbound_name eq 'TH March & Company Limited~2017~B0600A1706503~OC0033717~CP' ) { $rulefired = 1; $outbound_name = 'TH March CP 2017 ~ 4310544' ;}
	if ( $inbound_name eq 'Care Homes Insurance Services~2017~B1262BW0214317A~OC0027617~EL' ) { $rulefired = 1; $outbound_name = 'CHIS 2017 ~ 4302973' ;}
	if ( $inbound_name eq 'Care Homes Insurance Services~2017~B1262BW0214317A~OC0027617~PL' ) { $rulefired = 1; $outbound_name = 'CHIS 2017 ~ 4302973' ;}
	if ( $inbound_name eq 'Care Homes Insurance Services~2017~B1262BW0214317A~OC0027617~PA' ) { $rulefired = 1; $outbound_name = 'CHIS 2017 ~ 4302973' ;}
	if ( $inbound_name eq 'Care Homes Insurance Services~2017~B1262BW0214317A~OC0027617~PI' ) { $rulefired = 1; $outbound_name = 'CHIS 2017 ~ 4302973' ;}
	if ( $inbound_name eq 'County Insurance Services Limi~2017~B1262BW0214217A~OC0030117~EL' ) { $rulefired = 1; $outbound_name = 'County Insurance Services 2017 ~ 4302994' ;}
	if ( $inbound_name eq 'County Insurance Services Limi~2017~B1262BW0214217A~OC0030117~PL' ) { $rulefired = 1; $outbound_name = 'County Insurance Services 2017 ~ 4302994' ;}
	if ( $inbound_name eq 'GB Underwriting Limited~2017~B6029PEND008A117~OC0028517~PL' ) { $rulefired = 1; $outbound_name = 'GB Underwriting 2017 ~ 4302940' ;}
	if ( $inbound_name eq 'J & M  Mercury Insurance~2017~B6029PEND012A117A~OC0026717~PL' ) { $rulefired = 1; $outbound_name = 'J & M Mercury 2017 ~ 4302946' ;}
	if ( $inbound_name eq 'SEIB Direct~2017~B6029MPEN170078A~OC0025417~PL' ) { $rulefired = 1; $outbound_name = 'SEIB Direct 2017 ~ 4302956' ;}
	if ( $inbound_name eq 'Shearwater Equine~2017~B6029MPEN170068~OC0025117~PL' ) { $rulefired = 1; $outbound_name = 'Shearwater Equine 2017 ~ 4302966' ;}
	if ( $inbound_name eq 'TH March & Company Limited~2017~B0600A1706503~OC0033717~EL' ) { $rulefired = 1; $outbound_name = 'T H March 2017 ~ 4302976' ;}
	if ( $inbound_name eq 'TH March & Company Limited~2017~B0600A1706503~OC0033717~PL' ) { $rulefired = 1; $outbound_name = 'T H March 2017 ~ 4302976' ;}
	if ( $inbound_name eq '~2017~B0600A1706502~OC0026217~EL' ) { $rulefired = 1; $outbound_name = 'Peter Lole & Co Ltd 2017 ~ 4302962' ;}
	if ( $inbound_name eq '~2017~B0600A1706502~OC0026217~PL' ) { $rulefired = 1; $outbound_name = 'Peter Lole & Co Ltd 2017 ~ 4302962' ;}
	if ( $inbound_name eq '~2017~B1129LFL17002~OC0026517~CP' ) { $rulefired = 1; $outbound_name = 'Lucas Fettes CP 2017 ~ 4310526' ;}
	if ( $inbound_name eq '~2017~B1129LFL17002~OC0026517~EL' ) { $rulefired = 1; $outbound_name = 'Lucas Fettes 2017 ~ 4302985' ;}
	if ( $inbound_name eq '~2017~B1129LFL17002~OC0026517~PL' ) { $rulefired = 1; $outbound_name = 'Lucas Fettes 2017 ~ 4302985' ;}
	if ( $inbound_name eq '~2017~B6029PEND005A117~OC0027517~CP' ) { $rulefired = 1; $outbound_name = 'Entertainment Risk Management CP 2017 ~ 4310535' ;}
	if ( $inbound_name eq '~2017~B6029PEND005A117~OC0027517~EL' ) { $rulefired = 1; $outbound_name = 'Entertainment Risk Management ~2017~B6029PEND005A117~OC0027517' ;}
	if ( $inbound_name eq '~2017~B6029PEND005A117~OC0027517~PL' ) { $rulefired = 1; $outbound_name = 'Entertainment Risk Management ~2017~B6029PEND005A117~OC0027517' ;}
	if ( $inbound_name eq '~2017~B6029PEND022A117~OC0027017~CP' ) { $rulefired = 1; $outbound_name = 'Peter D. James CP 2017 ~ 4310543' ;}
	if ( $inbound_name eq '~2017~B6029PEND022A117~OC0027017~EL' ) { $rulefired = 1; $outbound_name = 'Peter D. James Ltd 2017 ~ 4302995' ;}
	if ( $inbound_name eq '~2017~B6029PEND022A117~OC0027017~PL' ) { $rulefired = 1; $outbound_name = 'Peter D. James Ltd 2017 ~ 4302995' ;}
	if ( $inbound_name eq '~2017~B6029PEND031A117~OC0029817' ) { $rulefired = 1; $outbound_name = 'Thames Underwriting Ltd~2017~B6029PEND031A117~OC0029817' ;}
	if ( $inbound_name eq 'INK UNDERWRITING AGENCIES LIMI~2017~B6029PEND010A117~OC0025517~CP' ) { $rulefired = 1; $outbound_name = 'Ink (Print Sch) CP 2017 ~ 4310553' ;}
	if ( $inbound_name eq 'INK UNDERWRITING AGENCIES LIMI~2017~B6029PEND010A117~OC0025517~EL' ) { $rulefired = 1; $outbound_name = 'Ink Roofers & Scaffolders 2017 ~ 4303003' ;}
	if ( $inbound_name eq 'INK UNDERWRITING AGENCIES LIMI~2017~B6029PEND010A117~OC0025517~PA' ) { $rulefired = 1; $outbound_name = 'Ink Print PA 2017 ~ 4303085' ;}
	if ( $inbound_name eq 'INK UNDERWRITING AGENCIES LIMI~2017~B6029PEND010A117~OC0025517~PL' ) { $rulefired = 1; $outbound_name = 'Ink Roofers & Scaffolders 2017 ~ 4303003' ;}
	if ( $inbound_name eq 'Kerry London Limited~2017~B1262BW0214417A~OC0030517~CP' ) { $rulefired = 1; $outbound_name = 'Kerry London CP 2017 ~ 4310530' ;}
	if ( $inbound_name eq 'Kerry London Limited~2017~B1262BW0214417A~OC0030517~EL' ) { $rulefired = 1; $outbound_name = 'Kerry London 2017 ~ 4302986' ;}
	if ( $inbound_name eq 'Kerry London Limited~2017~B1262BW0214417A~OC0030517~PL' ) { $rulefired = 1; $outbound_name = 'Kerry London 2017 ~ 4302986' ;}
	if ( $inbound_name eq 'KERRY LONDON LIMITED~2017~B1262BW0214417A~OC0030517~PA' ) { $rulefired = 1; $outbound_name = 'kerry London PA 2017 ~ 4303089' ;}
	if ( $inbound_name eq 'KERRY LONDON LIMITED~2017~B1262BW0214417A~OC0030517~PI' ) { $rulefired = 1; $outbound_name = 'Kerry London 2017 ~ 4302986' ;}
	if ( $inbound_name eq 'PETER LOLE & CO LTD C/O CBC UK~2017~B0600A1706502~OC0026217~EL' ) { $rulefired = 1; $outbound_name = 'Peter Lole & Co Ltd 2017 ~ 4302962' ;}
	if ( $inbound_name eq 'PETER LOLE & CO LTD C/O CBC UK~2017~B0600A1706502~OC0026217~PL' ) { $rulefired = 1; $outbound_name = 'Peter Lole & Co Ltd 2017 ~ 4302962' ;}
	if ( $inbound_name eq '~2017~B6029PEND019A117~OC0029417~CP' ) { $rulefired = 1; $outbound_name = 'Movo Underwriting Solutions Limited CP 2017 ~ 4611575' ;}
	if ( $inbound_name eq '~2017~B6029PEND019A117~OC0029417~EL' ) { $rulefired = 1; $outbound_name = 'Movo Underwriting Solutions Limited 2017 ~ 4611576' ;}
	if ( $inbound_name eq '~2017~B6029PEND019A117~OC0029417~PL' ) { $rulefired = 1; $outbound_name = 'Movo Underwriting Solutions Limited 2017 ~ 4611576' ;}
	if ( $inbound_name eq '~2017~B6029PEND003A117~OC0025817' ) { $rulefired = 1; $outbound_name = 'Commercial Underwriting  2017 ~ 4302988' ;}
	if ( $inbound_name eq '~2017~B6029PEND009A117~OC0025717' ) { $rulefired = 1; $outbound_name = 'Ink Roofers & Scaffolders 2017 ~ 4303003' ;}
	if ( $inbound_name eq '~2017~B6029PEND011A117~OC0029117' ) { $rulefired = 1; $outbound_name = 'J Bennett & Son PA 2017 ~ 4303103' ;}
	if ( $inbound_name eq '~2017~B6029PEND035A117~OC0028717~PL' ) { $rulefired = 1; $outbound_name = 'GM 2017 ~ 4302944' ;}
	if ( $inbound_name eq '~2017~B6029PEND035A117~OC0028717~CP' ) { $rulefired = 1; $outbound_name = 'GM Insurance Brokers CP 2017 ~ 4310548' ;}
	if ( $inbound_name eq '~2017~B6029PEND028A117~OC0027417~CP' ) { $rulefired = 1; $outbound_name = 'CLA (Risk Solutions) Limited CP 2017 ~ 4361789' ;}
	if ( $inbound_name eq '~2017~B6029PEND028A117~OC0027417~PL' ) { $rulefired = 1; $outbound_name = 'CLA (Risk Solutions) Limited 2017 ~ 4361790' ;}
	if ( $inbound_name eq '~2017~B6029PEND015A117~OC0029217~PL' ) { $rulefired = 1; $outbound_name = 'Lockton Companies PLC 2017 ~ 4302987' ;}
	if ( $inbound_name eq '~2017~B6029PEND015A117~OC0029217~CP' ) { $rulefired = 1; $outbound_name = 'Lockton CP 2017 ~ 4310514' ;}
	if ( $inbound_name eq '~2017~B6029PEND029A117~OC0026117~EL' ) { $rulefired = 1; $outbound_name = 'Bennett Christmas Ins Brokers 2017 ~ 4302960' ;}
	if ( $inbound_name eq '~2017~B6029PEND029A117~OC0026117~CP' ) { $rulefired = 1; $outbound_name = 'Bennett Christmas CP 2017 ~ 4310520' ;}
	if ( $inbound_name eq '~2017~B6029PEND029A117~OC0026117~PL' ) { $rulefired = 1; $outbound_name = 'Bennett Christmas PA 2017 ~ 4303086' ;}
	if ( $inbound_name eq '~2017~B6029PEND036A117~OC0028917' ) { $rulefired = 1; $outbound_name = 'Godiva 2017 ~ 4303002' ;}
	if ( $inbound_name eq '~2018~B132418SCHCOM~OC0035118' ) { $rulefired = 1; $outbound_name = 'Schofields 2017 ~ 4302971' ;}
	if ( $inbound_name eq '~2018~B132418SCHCOM~OC0035118~CP' ) { $rulefired = 1; $outbound_name = 'Schofields CP 2017 ~ 4310532' ;}
	if ( $inbound_name eq 'CBC UK LTD~2017~B6029PEND034A117~OC0028817~CP' ) { $rulefired = 1; $outbound_name = 'CBC UK Ltd CP 2017 ~ 4310549' ;}
	if ( $inbound_name eq 'CBC UK LTD~2017~B6029PEND034A117~OC0028817~EL' ) { $rulefired = 1; $outbound_name = 'CBC UK  2017 ~ 4302977' ;}
	if ( $inbound_name eq 'CBC UK LTD~2017~B6029PEND034A117~OC0028817~PL' ) { $rulefired = 1; $outbound_name = 'CBC UK  2017 ~ 4302977' ;}
	if ( $inbound_name eq 'CHOICE~2017~B6029PEND019A117~OC0029417~CP' ) { $rulefired = 1; $outbound_name = 'Movo Underwriting Solutions Limited CP 2017 ~ 4611575' ;}
	if ( $inbound_name eq 'CHOICE~2017~B6029PEND019A117~OC0029417~EL' ) { $rulefired = 1; $outbound_name = 'Movo Underwriting Solutions Limited 2017 ~ 4611576' ;}
	if ( $inbound_name eq 'CHOICE~2017~B6029PEND019A117~OC0029417~PL' ) { $rulefired = 1; $outbound_name = 'Movo Underwriting Solutions Limited 2017 ~ 4611576' ;}
	if ( $inbound_name eq 'THAMES UNDERWRITING LTD~2017~B6029PEND031A117~OC0029817~CP' ) { $rulefired = 1; $outbound_name = 'Thames UW CP 2017 ~ 4310542' ;}
	if ( $inbound_name eq 'THAMES UNDERWRITING LTD~2017~B6029PEND031A117~OC0029817~EL' ) { $rulefired = 1; $outbound_name = 'Thames 2017 ~ 4302996' ;}
	if ( $inbound_name eq 'THAMES UNDERWRITING LTD~2017~B6029PEND031A117~OC0029817~PI' ) { $rulefired = 1; $outbound_name = 'Thames 2017 ~ 4302996' ;}
	if ( $inbound_name eq 'THAMES UNDERWRITING LTD~2017~B6029PEND031A117~OC0029817~PL' ) { $rulefired = 1; $outbound_name = 'Thames 2017 ~ 4302996' ;}

	
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
