
#directs script to loaction of .pm file
package inc::cms::premium::mod_cms_premium;

#setup includes
use lib 'c:\\UDWTesting';

use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(CMS_PREMIUM);
use DBI;
use DBD::ODBC;
use Data::Dumper;
use inc::tools::mod_dbtools qw(DBNAME);
use DateTime;
use DateTime::Format::MySQL;


sub CMS_PREMIUM{
	
	#pick up the inbound parameters

	#source handles
	my $DbHandleSOURCE = $_[0];
	my $testDbHandleSOURCE = $_[1];	

	
	
	
	#target handles
	my $DbHandleTARGET = $_[2];
	my $testDbHandleTARGET = $_[3];
	
	#get the database names and date for the return result
	my $targetDBName = inc::tools::mod_dbtools::DBNAME($DbHandleTARGET);
	my $sourceDBName = inc::tools::mod_dbtools::DBNAME($DbHandleSOURCE);
	my $datetime     = DateTime->now();
	my ( $date, $time ) =  split(/T/, $datetime);
	
	
	#target month to process
	my $RanINT = $_[4];	
	
	# premium specific source variables
	my $SPremium_Policy_Number = "";
	my $Spremium_System_Policy_ID = "";
	my $SSystem_Binding_Authority_ID = "";
	my $SSystem_Binding_Authority_ID_COPY;
	my $SPremium_Amt = "";
	my $SPremium_PRA_Class = "";
	my $SPremium_Policy_Action = "";
	my $SMonthYear = "";
	my $SPremType= "";
	
	#premium specific target variables
	my $TPremium_Policy_Number = "";
	my $Tpremium_System_Policy_ID = "";
	my $TSystem_Binding_Authority_ID = "";
	my $TPremium_Amt = "";
	my $TPremium_PRA_Class = "";
	my $TPremium_Policy_Action = "";
	my $TMonthYear = "";
	my $TPremType = "";
	
	
	#are we forcing a specific month?
	my $forcedate = '52017';
	
	#timing variable
	
	#data in out vars
	my ($putsth, $getsth, $insertSQL );
	

	
	#the SQL file we use for the extract
	my $dimSQL;
	
	#something for the test target
	my $testTarget;
	
	# set up the stuff we need 
	use inc::tools::mod_dbtools qw(ERRORLOG EXISTS_TABLE RANDOMGEN ROWCOUNT_TABLE GET_DEBUGSTATE STRINGCLEANER READSQL DBNAME);
	use inc::tools::mod_database qw(SIT CMS);
	use inc::tools::mod_table_compare qw(TABLECOMPARE);
	use inc::tools::mod_transform_rules qw(PRACLASS VALUECLEANER);
	use inc::cms::rules::mod_cms_binding_name_rules qw(BINDRULE);
	use inc::cms::rules::mod_cms_binding_class_rules qw(CLASSRULE);
	
	#get the debugstate
	my $debug = GET_DEBUGSTATE();
	if ($debug == 1){print "\n\n *** Debugging MOD CMS PREMIUM *** \n\n";}

	
	
	if ($debug == 1){print "\n\n *** CMS DEBUG \t \t Entering the main CMS Premium block *** \n\n";}
		if ($debug == 1){print "\n\n *** CMS DEBUG \t \t Creating the premium target table *** \n\n";}		
		my $createRightSQL="create table tmp_cms_premium_target \(Policy_Number varchar\(255\), Source_System_Policy_ID varchar\(255\), System_Binding_Authority_ID varchar\(255\), Premium_Amt varchar\(255\), PRA_Class varchar\(255\),  Month_Year varchar\(50\), Premium_Type varchar\(255\) \)";
		
		$putsth = $testDbHandleTARGET->prepare($createRightSQL);
		
		$putsth->execute()  || die $DBI::errstr;
		if ($debug == 1){print "\n\n *** CMS DEBUG \t \t Entering CMS TARGET SELECT Block RANDOM INT is currently ". $RanINT . " *** \n\n";}	
		
		my $targetSQLfile = 'c:\\udwtesting\\SQL\\dwh\\CMS-Premium-Target.sql';
		
		$dimSQL = inc::tools::mod_dbtools::READSQL($targetSQLfile);
		
		if ($forcedate > 1 ){ 
				$dimSQL = $dimSQL . $forcedate;
				}
		else{
				$dimSQL = $dimSQL . $RanINT;
				}
		
		if ($debug ==1){print "\n\n *** CMS DEBUG \t \t TARGET Select SQL is  " .  $dimSQL  . " *** \n\n";}	
		my @resultarray=();
			      
		$getsth = $DbHandleTARGET->prepare($dimSQL);
		$getsth->execute()  || die $DBI::errstr;
		
		if ($debug == 1){print "\n\n *** CMS DEBUG \t \t Entering the CMS TARGET INSERT block *** \n\n";}
		print "\nInserting CMS Premium Target Records \n";
		while (my @row = $getsth->fetchrow_array){
			
			$TPremium_Policy_Number = inc::tools::mod_dbtools::STRINGCLEANER($row[0]);
			
			$Tpremium_System_Policy_ID = inc::tools::mod_dbtools::STRINGCLEANER($row[1]);
			
			$TSystem_Binding_Authority_ID = inc::tools::mod_dbtools::STRINGCLEANER($row[2]);
			
			$TPremium_Amt = inc::tools::mod_dbtools::VALUECLEANER($row[3]);
			
			$TPremium_PRA_Class = inc::tools::mod_dbtools::STRINGCLEANER($row[4]);
			
			$TMonthYear = $row[5];
			
			$TPremType = inc::tools::mod_dbtools::STRINGCLEANER($row[6]);
			
			$insertSQL = "insert into tmp_cms_premium_target \(Policy_Number, Source_System_Policy_ID, System_Binding_Authority_ID, Premium_Amt, PRA_Class, Month_Year, Premium_type \) values \('" . $TPremium_Policy_Number . "'\,'" . $Tpremium_System_Policy_ID . "'\,'" . $TSystem_Binding_Authority_ID . "'\,'" . $TPremium_Amt . "'\,'" . $TPremium_PRA_Class . "'\,'" . $TMonthYear ."'\,'". $TPremType . "'\)";
				
			$putsth = $testDbHandleTARGET->prepare($insertSQL);
			$putsth->execute()||die "bad SQL \n\n" . $insertSQL . "\n\npassed to insert into tmp cms prem target"
			}
		print "Inserted CMS Target Premium Records for Random Date " . $TMonthYear . "\n";
		if ($debug == 1){ my $insertedTargetRowCount = ROWCOUNT_TABLE($testDbHandleTARGET, 'tmp_cms_premium_target');
			print "\n\n *** CMS DEBUG \t \t We think we inserted " . $insertedTargetRowCount . " TARGET records *** \n\n";
			}
			
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#Source
		if ($debug == 1){print "\n\n *** CMS DEBUG \t \t Entering the CMS SOURCE INSERT block *** \n\n";}	
		
		my $createLeftSQL="create table tmp_cms_premium_source \(Policy_Number varchar\(255\), Source_System_Policy_ID varchar\(255\), System_Binding_Authority_ID varchar\(255\), Premium_Amt varchar\(255\), PRA_Class varchar\(255\),  Month_Year varchar\(50\) , Premium_Type varchar\(255\) \)";		
		$putsth = $testDbHandleSOURCE->prepare($createLeftSQL);
		$putsth->execute() || die $DBI::errstr;
	
		if ($debug==1){print "\n\n *** CMS DEBUG \t \t Preparing Source select statement *** \n\n";}
			
		#use SQLREADER to get the actual SQL code
		my $sourceSQLfile = 'c:\\udwtesting\\SQL\\cms\\CMS-Premium-Source.sql';
		$dimSQL = inc::tools::mod_dbtools::READSQL($sourceSQLfile);
		
		if ($forcedate > 0 ){ 
				$dimSQL = $dimSQL . $forcedate;
				}
		else{
				$dimSQL = $dimSQL . $RanINT;
				}	
		
		if ($debug ==1){print "\n\n *** CMS DEBUG \t \t SOURCE Select SQL is  " .  $dimSQL  . " *** \n\n";}	
		#if ($debug ==1){print "\n\n *** CMS DEBUG \t \t Executing Source select statement *** \n\n";}
		
		$getsth = $DbHandleSOURCE->prepare($dimSQL);
		$getsth->execute() || die $DBI::errstr;
		print "\nInserting CMS Premium Source Records \n";
	
		if ($debug==1){print "\n\n *** CMS DEBUG \t \t Inserting SOURCE records *** \n\n";}	
		while (my @row = $getsth->fetchrow_array){
		#Code here to deal with all the rules of the ETL process, stringcleaning, float rounding, data hacking that we get told about down the line..
	
			$SPremium_Policy_Number = inc::tools::mod_dbtools::STRINGCLEANER($row[0]);
			#if ($debug ==1){print "\n\n *** CMS DEBUG \t \t Got source policy number " .  $SPremium_Policy_Number . " *** \n\n";}
	
			$Spremium_System_Policy_ID =inc::tools::mod_dbtools::STRINGCLEANER($row[1]);
			if ($debug ==1){print "\n\n *** CMS DEBUG \t \t Got source system ID " .  $Spremium_System_Policy_ID . " *** \n\n";}
			
	
			$SSystem_Binding_Authority_ID = inc::tools::mod_dbtools::STRINGCLEANER($row[2]);
			
			#get a clean copy of the original name to deal with the bloody awful design hack on binding authority key
			$SSystem_Binding_Authority_ID_COPY = inc::tools::mod_dbtools::STRINGCLEANER($row[2]);

			
			if ($debug ==1){print "\n\n *** CMS DEBUG \t \t Got Binding ID " .  $SSystem_Binding_Authority_ID . " *** \n\n";}		
			
			#exec the amount rounding rule
			$SPremium_Amt = inc::tools::mod_dbtools::VALUECLEANER($row[3]);
			if ($debug ==1){print "\n\n *** CMS DEBUG \t \t Got source prem amount " .  $SPremium_Amt . " *** \n\n";}			
			
			$SPremium_PRA_Class = inc::tools::mod_dbtools::STRINGCLEANER($row[4]);
			#exec the PRA CLASS RULES on SOURCE ONLY
			$SPremium_PRA_Class = inc::tools::mod_transform_rules::PRACLASS($SPremium_PRA_Class);		
			#if ($debug ==1){print "\n\n *** CMS DEBUG \t \t Got source premium class " .  $SPremium_PRA_Class . " *** \n\n";}		
	
	
			$SMonthYear = $row[5];
			#if ($debug ==1){print "\n\n *** CMS DEBUG \t \t Got source month year " .  $SMonthYear . " *** \n\n";}			
	
			$SPremType = inc::tools::mod_dbtools::STRINGCLEANER($row[6]);	
			#if ($debug ==1){print "\n\n *** CMS DEBUG \t \t Got source premtype " .  $SPremType  . " *** \n\n";}		

			# NASTY HACK ON THE CMS SYSTEM BINDING AUTHORITY ID
			# Wipro do some string manipulation to match the expected values in the CMS Binding authority name mapping sheet 

			# IMPLEMENT THE CMS NAME REPLACING RULE MOVED DOWN HERE SO WE HAVE THE CLASS AS WELL AT THIS POINT
			$SSystem_Binding_Authority_ID = inc::cms::rules::mod_cms_binding_class_rules::CLASSRULE($SSystem_Binding_Authority_ID, $SPremium_PRA_Class );
			
			#having done that we can finally call BINDRULE()
			$SSystem_Binding_Authority_ID = inc::cms::rules::mod_cms_binding_name_rules::BINDRULE($SSystem_Binding_Authority_ID, $SSystem_Binding_Authority_ID_COPY);

	
	
		$insertSQL = "insert into tmp_cms_premium_source \(Policy_Number, Source_System_Policy_ID, System_Binding_Authority_ID, Premium_Amt, PRA_Class, Month_Year, Premium_Type \) values \('" . $SPremium_Policy_Number . "'\,'" . $Spremium_System_Policy_ID . "'\,'" . $SSystem_Binding_Authority_ID . "'\,'" . $SPremium_Amt . "'\,'".$SPremium_PRA_Class. "'\,'" . $SMonthYear . "'\,'". $SPremType . "'\)";
		if ($debug ==1){print "\n\n *** CMS DEBUG \t \t Insert SQL is  " .  $insertSQL  . " *** \n\n";}
		
		$putsth = $testDbHandleSOURCE->prepare($insertSQL);				
		$putsth->execute()or die "Invalid SQL statement at premium insert";
	
		}
		if ($debug == 1){ my $insertedTargetRowCount = ROWCOUNT_TABLE($testDbHandleSOURCE, 'tmp_cms_premium_source');
			print "\n\n *** CMS DEBUG \t \t We think we inserted " . $insertedTargetRowCount . " SOURCE records *** \n\n";
			}	
		print "Inserted CMS source Premium Records for " . $SMonthYear . "\n";
		
		
	### Target and source tables should be present and populated now. lets try table compare, oh and get the SOURCE AND TARGET the right fucking way round.
	my $results = TABLECOMPARE('tmp_cms_premium_source','tmp_cms_premium_target');
	
	
	#dereference the fucking array already
	#count the source rows
	my $sourceRowCount = ROWCOUNT_TABLE($testDbHandleSOURCE, 'tmp_cms_premium_source');
	
	my @resultArray = (@{ $results });
	my $numberOfResults = @resultArray;
	print  $numberOfResults;
	if ($numberOfResults == 0){
		my $reportSQL = "INSERT INTO CMS_PREMIUM_RESULTS (DATE, TIME, SOURCEDATABASE, TESTTARGET, RECORDSTESTED, RESULT) VALUES ('" . $date . "','" . $time . "','" .  $sourceDBName . "','" . $targetDBName . "','" . $sourceRowCount . "','PASSED')";
		$putsth = $testDbHandleSOURCE->prepare($reportSQL);				
		$putsth->execute()or die "Invalid SQL statement at premium insert";
	}
	
	else{
		print "\n " . $numberOfResults . " Errors..\n";
		#print Data::Dumper->Dump(\@resultArray), "\n";
	
	#foreach my $result (@{ $results }){
		#ERRORLOG('MOD_CMS', 'N/A', 'Premium', $result, $testTarget);
	#	}
	
	}
	if ($debug==1){print "\n\n *** CMS DEBUG \t \t CMS PREMIUM COMPLETE *** \n\n";}
	
}

1;
