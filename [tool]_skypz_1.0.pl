#!/usr/bin/perl
# Skype Tools by v4p0r
# sh00tz -> Tr4xb0y - Cater - Strike King and All Friends

use WWW::Mechanize;
use JSON;
system(($^O eq 'MSWin32') ? 'cls' : 'clear');

 
print q {
  ___________                         
 /   _____/  | _____.__.______________
 \_____  \|  |/ <   |  |\____ \___   /
 /        \    < \___  ||  |_> >    / 
/_______  /__|_ \/ ____||   __/_____ \
        \/     \/\/     |__|        \/ Skype Tools
                                     Coded by v4p0r
};
print "\n [1] MASS SKYPE RESOLVER";
print "\n [2] MASS IPGEOLOCATION";
print "\n [3] SKYPE RESOLVER";
print "\n [4] IPGEOLOCATION";

print "\n\n NUMERO: ";
chomp ( my $boyz = <STDIN> );
if($boyz eq "1" ){
system(($^O eq 'MSWin32') ? 'cls' : 'clear');

print q {
  ___________                         
 /   _____/  | _____.__.______________
 \_____  \|  |/ <   |  |\____ \___   /
 /        \    < \___  ||  |_> >    / 
/_______  /__|_ \/ ____||   __/_____ \
        \/     \/\/     |__|        \/ Mass Skype Resolver
};
print " [+] LISTA DOS SKYPE: ";

$fileres=<STDIN>;
chomp($fileres);
open (fileres, "<$fileres") || die "\n [-] LISTA DE SKYPE NAO SELECIONADA";
my @fileres = <fileres>;
close fileres;

foreach $id(@fileres) { 

my $GET=WWW::Mechanize->new();
    $GET->get("http://webresolver.nl/api.php?key=VNV4I-DMJ4L-6MDW8-MBXTO&json&action=resolve&string=$id");
    my $json = $GET->content();
 

my $info = decode_json($json);
 
print "\n [:::] SKYPENAME: ", $info->{'username'}, "\n";
print " [:::] IP: ", $info->{'ip'}, "\n";
print "\n";

}
}
if($boyz eq "2" ){
system(($^O eq 'MSWin32') ? 'cls' : 'clear');

print q {
  ___________                         
 /   _____/  | _____.__.______________
 \_____  \|  |/ <   |  |\____ \___   /
 /        \    < \___  ||  |_> >    / 
/_______  /__|_ \/ ____||   __/_____ \
        \/     \/\/     |__|        \/ Mass IpGeoLocation
};

print " [+] LISTA DOS IPS: ";

$filegeo=<STDIN>;
chomp($filegeo);
open (filegeo, "<$filegeo") || die "\n [-] LISTA DE IPS NAO SELECIONADA";
my @filegeo = <filegeo>;
close filegeo;

foreach $geo(@filegeo) { 

my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/$geo");
    my $json = $GET->content();
 

my $info = decode_json($json);

print "-----------------------------------------\n";
print "  [!] IP: ", $info->{'query'}, "\n";
print "-----------------------------------------\n";
print "  [:::] ORG: ", $info->{'as'}, "\n";
print "  [:::] ISP: ", $info->{'isp'}, "\n";
print "  [:::] PAIS: ", $info->{'country'}," - ", $info->{'countryCode'}, "\n";
print "  [:::] CIDADE: ", $info->{'city'}, "\n";
print "  [:::] ESTADO: ", $info->{'regionName'}, " - " , $info->{'region'}, "\n";
print "  [:::] GEO: ", "LATITUDE: " , $info->{'lat'}, " - LONGITUDE: ", $info->{'lon'}, "\n";
print "  [:::] CODIGO POSTAL: ", $info->{'countryCode'}, "\n";
print "  [:::] STATUS: ", $info->{'status'}, "\n";
print "\n";


}
}


if($boyz eq "3" ){
system(($^O eq 'MSWin32') ? 'cls' : 'clear');

print q {
  ___________                         
 /   _____/  | _____.__.______________
 \_____  \|  |/ <   |  |\____ \___   /
 /        \    < \___  ||  |_> >    / 
/_______  /__|_ \/ ____||   __/_____ \
        \/     \/\/     |__|        \/ Skype Resolver
};
print " [+] SKYPE USERNAME: ";

$resol=<STDIN>;
chomp($resol); 

my $GET=WWW::Mechanize->new();
    $GET->get("http://webresolver.nl/api.php?key=VNV4I-DMJ4L-6MDW8-MBXTO&json&action=resolve&string=$resol");
    my $json = $GET->content();
 

my $info = decode_json($json);
 
print "\n [:::] SKYPENAME: ", $info->{'username'}, "\n";
print " [:::] IP: ", $info->{'ip'}, "\n";
print "\n";

}

if($boyz eq "4" ){
system(($^O eq 'MSWin32') ? 'cls' : 'clear');

print q {
  ___________                         
 /   _____/  | _____.__.______________
 \_____  \|  |/ <   |  |\____ \___   /
 /        \    < \___  ||  |_> >    / 
/_______  /__|_ \/ ____||   __/_____ \
        \/     \/\/     |__|        \/ IPGEOLOCATION
};
print " [+] IP: ";

$ipgeo=<STDIN>;
chomp($ipgeo); 

my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/$ipgeo");
    my $json = $GET->content();
 

my $info = decode_json($json);
 
print "-----------------------------------------\n";
print "  [!] IP: ", $info->{'query'}, "\n";
print "-----------------------------------------\n";
print "  [:::] ORG: ", $info->{'as'}, "\n";
print "  [:::] ISP: ", $info->{'isp'}, "\n";
print "  [:::] PAIS: ", $info->{'country'}," - ", $info->{'countryCode'}, "\n";
print "  [:::] CIDADE: ", $info->{'city'}, "\n";
print "  [:::] ESTADO: ", $info->{'regionName'}, " - " , $info->{'region'}, "\n";
print "  [:::] GEO: ", "LATITUDE: " , $info->{'lat'}, " - LONGITUDE: ", $info->{'lon'}, "\n";
print "  [:::] CODIGO POSTAL: ", $info->{'countryCode'}, "\n";
print "  [:::] STATUS: ", $info->{'status'}, "\n";
print "\n";

}