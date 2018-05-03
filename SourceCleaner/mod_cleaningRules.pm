package SourceCleaner::mod_CleaningRules;

#setup includes
use lib 'c:\\UDWTesting\\';
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(DOUBLESPACES);

sub DOUBLESPACES{
	my $line = $_[0];
	if ($line =~ /  /i){
	$line =~ s/ +/ /g;	
	}
	return $line;
}