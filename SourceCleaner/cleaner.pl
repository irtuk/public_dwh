#This is a meaningless change to check Ed J is set up correctly.
#setup includes
use lib 'c:\\UDWTesting\\';

use SourceCleaner::mod_CleaningRules qw(DOUBLESPACES);
use SourceCleaner::mod_FileType qw(FILETYPE);

use SourceCleaner::mod_c qw(CLAIMLINE);
use SourceCleaner::mod_p qw(POLICYLINE);
use SourceCleaner::mod_pp qw(PREMPREMLINE);
use SourceCleaner::mod_pr qw(PREMRISKLINE);
use SourceCleaner::mod_cm qw(CLAIMMOVEMENTLINE);


use strict;

use Cwd qw(cwd);


my $dir = cwd;
my $filetype;

print "Using Directory " . $dir. "\n";

print "Which files do we want to work on ( *  for all ) : ";

my $inputmask = <STDIN>;

chomp $inputmask;

my @po_files = glob( $inputmask );

foreach my $po_file (@po_files) {
	
	print $po_file . "\n";
	
if ($po_file =~ /Pen_UWDW_Claims_YOABT_201603_20180420.txt/) { go($po_file) ;}
if ($po_file =~ /Pen_UWDW_Premium_Risk_YOABT_201603_20180420.txt/) { go($po_file) ;}
if ($po_file =~ /Pen_UWDW_Policy_YOABT_201603_20180420.txt/) { go($po_file) ;}
if ($po_file =~ /Pen_UWDW_ClaimMovement_YOABT_201603_20180420.txt/) { go($po_file) ;}
if ($po_file =~ /Pen_UWDW_Premium_Prem_YOABT_201603_20180420.txt/) { go($po_file) ;}
if ($po_file =~ /Pen_UWDW_Claims_YOABT_201303_20180420.txt/) { go($po_file) ;}
if ($po_file =~ /Pen_UWDW_Premium_Prem_YOABT_201303_20180420.txt/) { go($po_file) ;}
if ($po_file =~ /Pen_UWDW_Policy_YOABT_201303_20180420.txt/) { go($po_file) ;}
if ($po_file =~ /Pen_UWDW_ClaimMovement_YOABT_201303_20180420.txt/) { go($po_file) ;}     
if ($po_file =~ /Pen_UWDW_Premium_Risk_YOABT_201303_20180420.txt/) { go($po_file) ;}	
	
}

sub go{
use SourceCleaner::mod_FileType qw(FILETYPE);
print "go called\n";

my $infile = $_[0];
my $filetype = FILETYPE($infile);

if ($filetype eq 'C'){
	CLAIMLINE($infile)
}

if ($filetype eq 'CM'){
	CLAIMMOVEMENTLINE($infile)
}

if ($filetype eq 'PP'){
	PREMPREMLINE($infile)
}

if ($filetype eq 'PR'){
	PREMRISKLINE($infile)
}

if ($filetype eq 'POL'){
	POLICYLINE($infile);
	}

}




	


