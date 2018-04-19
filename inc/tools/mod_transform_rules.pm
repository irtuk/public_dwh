# This is the stub file for MOD TRANSFORM RULES
# Requirements...
# TRANSFORM RULES - performs field specific transformations of values as per the requirements or, frequently, just because WiPro thought it might be fun.


use lib 'c:\\UDWTesting';
package inc::tools::mod_transform_rules;
use strict;
use warnings;
use Exporter qw(import);
# export the main functions
our @EXPORT_OK = qw(PRACLASS VALUECLEANER);

sub PRACLASS{
	my $class = $_[0];
	#rule 1 on CMS 'UK EL' = 'EL'
	if ($class eq 'UK Employers Liability' ) { $class = 'Employers Liability'}
	return $class;
}



