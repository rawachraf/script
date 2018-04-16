#!/usr/bin/perl
#From TeaM ECF
#little Tools
#Greets To all member Team-ECF
#contact : nadimzobaer@gmail.com
 
use HTTP::Request;
use LWP::UserAgent;
if($^O =~ /Win/){
 
   system("cls");
   system("color a");
   system("title Reverse Domain Resolver By : TeaM ECF");
 
}else{
 
   system("clear");
}
print q{
                                   |--------------------|
                   | DNS IP Resolver    |
                   | Coded By : TeaM ECF|
                   |--------------------|
};
print "\n[*]Would You Like To Use A Proxy? (y/n) (yes/no) :";
my $chose = <>;
chomp($chose);
 
if(lc($chose) eq 'y') {
sleep (3);
print "\n\n [+]Put Proxy (ex: 127.0.0.1:80) :";
my $proxy = <>;
chomp($proxy);
print "\n\n[*]Enter Website URL or IP (Website URL without http://) :";
my $host = <>;
chomp($host);
my $file = "";
$ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.1) Gecko/20090624 Firefox/3.5");
$ua->proxy('http', 'http://'.$proxy.'');
my $zz = $ua->post('http://domains.yougetsignal.com/domains.php',
{
        remoteAddress => $host,
}
);
 
my $resulta = $zz->content;
while ($resulta =~ m/\[([^\]]*)\]/g)
{
        $zeb = $1;
        $zeb =~ m/\"(.*?)\", \"?\"/g;
open(a, ">>log.txt");
print a "http://$1/\n";
close(a);
}
if($resulta =~ /\"domainCount\":\"(.*?)\"/) {
sleep(2);
  print "\n  [*]Total IPs Resolved: $1\n";
}
if($resulta =~ /\"remoteIpAddress\":\"(.*?)\"/) {
sleep(1);
 
  print "\n  [*]IP Resolved >: $1\n";
}
print "\n[+]All IPs Reversed.\n";
}
if(lc($chose) eq 'n') {
 
print "\nPut Host or IP (host without http://) :";
my $host = <>;
chomp($host);
my $file = "log.txt";
my $ua = LWP::UserAgent->new(agent => 'Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.1) Gecko/20090624 Firefox/3.5');
my $zz = $ua->post('http://domains.yougetsignal.com/domains.php',
{
        remoteAddress => $host,
}
);
 
my $resulta = $zz->content;
while ($resulta =~ m/\[([^\]]*)\]/g)
{
        $zeb = $1;
        $zeb =~ m/\"(.*?)\", \"?\"/g;
open(a, ">>log.txt");
print a "http://$1/\n";
close(a);
}
if($resulta =~ /\"domainCount\":\"(.*?)\"/) {
sleep(2);
  print "\n  [*]Total IPs Resolved: $1\n";
}
if($resulta =~ /\"remoteIpAddress\":\"(.*?)\"/) {
sleep(1);
 
  print "\n  [*]IP Resolved > $1\n";
}
print "\n[+]All IPs Reversed.\n";
}