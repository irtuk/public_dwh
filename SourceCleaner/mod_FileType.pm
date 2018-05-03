package SourceCleaner::mod_FileType;

#setup includes

use lib 'c:\\UDWTesting\\';

use strict;

use warnings;

use Exporter qw(import);

our @EXPORT_OK = qw(FILETYPE);

sub FILETYPE{
	my $filetype;
	my $filename = $_[0];
	
	if 		($filename =~ /ClaimMovement/i){
				print "File ". $filename . " Is a claim Movement File\n"; 
				$filetype = 'CM';
				}
	
	
	elsif	($filename =~ /UWDW_Claims_YOABT/i){
				print "File ". $filename . " Is a claim File\n"; 
				$filetype = 'C';
				}
	
	
	elsif	($filename =~ /UWDW_Claims2_YOABT/i){
				print "File ". $filename . " Is a claim File\n"; 	
				$filetype = 'C';
				}
	
	
	elsif	($filename =~ /UWDW_Premium_Prem_YOABT/i){
				print "File ". $filename . " Is a Premium ( Premiums ) File\n";
				$filetype = 'PP';
				}
	
	
	elsif	($filename =~ /UWDW_Premium_Risk_YOABT/i){
				print "File ". $filename . " Is a Premium ( Risks ) File\n"; 
				$filetype = 'PR';
				}	
				
	elsif ($filename =~ /UWDW_Policy_YOABT/i){
				print "File ". $filename . " Is a Policy File\n"; 
				$filetype = 'POL';
				}	
	
	else { 
			die "Unexpected file type " . $filename . "\n"; 
			}


return $filetype;		
			
}