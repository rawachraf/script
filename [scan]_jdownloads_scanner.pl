#!/usr/bin/perl
 
 
use HTTP::Request;
use LWP::Simple;
use LWP::UserAgent;
 
 
if ($^O =~ /MSWin32/) {system("cls"); system("color a");
}else { system("clear"); }
print "\t[+]------Sample Scanner for JDownloads Vulnerability------[+]\n";
print "\t[!]      Dev by CrashBandicot From TeaM Mosta             [!]\n";
print "\t[!]      Recoded By RioSetyawan.a.k.a Rio86               [!]\n";
print "\t[!]      http://idiot-attacker.blogspot.com               [!]\n";
print "\t[+]-------------------------------------------------------[+]\n";
print "\n\n\t.Usage : perl $0  list_of_website.txt .\n\n";
 
open(tarrget,"<$ARGV[0]") or die "$!";
while(<tarrget>){
chomp($_);
$target = $_;
if($target !~ /http:\/\//)
{
$target = "http://$target";
}
 
$website = $target."/index.php?option=com_jdownloads&Itemid=0&view=upload";
 
$req=HTTP::Request->new(GET=>$website);
$ua=LWP::UserAgent->new();
$ua->timeout(30);
$response=$ua->request($req);
if($response->content=~ /Soumettre/ ||
   $response->content=~ /Submit/    
 
)
 {
 $Messageee ="GOOD";
open (TEXT, '>>GOOD.txt');
print TEXT "$target => $Messageee\n";
close (TEXT);
}
else {
$Messageee = "ERROR";
}
print ">> $target => $Messageee\n";
}