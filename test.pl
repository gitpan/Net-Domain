# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..last_test_to_print\n"; }
END {print "not ok 1\n" unless $loaded;}
use Net::Domain;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

use constant CLASS => "Net::Domain";

print "Enter complete domain name to check:  ";
my $domain = <>;
chomp $domain;

$domain = new Net::Domain($domain);
@errors = $domain->IsValid();

if (@errors){
	print $_,"\n";
}
else {
	my ($registered,$registra,$registraurl,$whoisserver,$whoisoutput,$response,$tld) = $domain->DoWhois(1);
	print $response;
	print "\nRegistrar:\t\t$registra\n\n$whoisoutput\n\n";
	
}
exit;