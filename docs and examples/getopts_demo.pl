use Getopt::Long;


GetOptions (
	
	#entity options
	'premium' 			=> \$premium,
	'policy' 			=> \$policy,
	'claim' 			=> \$claim,
	'claimmovement'  	=> \$claimmovement,
	
	#target options
	'sit'				=> \$sit,
	'uat'				=> \$uat,
	);

if ($premium){print "Premium called\n"}

if ($policy){print "Policy called\n"}

if ($claim){print "Claim called\n"}

if ($claimmovement){print "Claim Movement called\n"}

if ($sit && not $uat ) {print "Running on SIT"}

if ($uat && not $sit ) {print "Running on UAT"}

if ($uat && $sit) {print "please select only one target you twat!"}


