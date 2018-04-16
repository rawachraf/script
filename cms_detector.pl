#!/usr/bin/perl
# CODADO POR v4p0r
# SE FOR MODIFICAR PELO MENOS DEIXE ALGUM CRÉDITO PELO SCRIPT :P
# YUNKERS CREW <3 
# CURTA NOIS AE MANO : https://www.facebook.com/yunkers01/
# MEU CANAL : https://www.youtube.com/channel/UCLl84j_tLcuBxUHyktkQX-A

use Win32::Console::ANSI;
use Term::ANSIColor;
use LWP::UserAgent;
####################### LIMPAR O TERMINAL ############################################
system(($^O eq 'MSWin32') ? 'cls' : 'clear');
####################### DISCRIÇÃO ####################################################
$script = 'CMS DETECTOR';
$author = 'v4p0r';
$version = '0.0.1';
$team = 'Yunkers Crew';
$update = '10/05/2017';
$greetz = 'All friends - Yunkers Crew';
####################### CRIANDO O DIRETORIO RESULT PARA SALVAR OS .TXT ###############
$res="Result";
    if (-e $res) 
    {
    }
    else
    {
        mkdir $res or die "NAO CONSEGUIMOS CRIAR O DIRETORIO: $res";
    }
################# INICIO  #############

print "\n";
print colored("         --=[ $script",'BOLD WHITE'),"\n";
print colored("         +---**---==[ Version: $version ",'BOLD GREEN'),"\n";
print colored("         +---**---==[ Author: $author  ",'BOLD WHITE'),"\n";
print colored("         +---**---==[ Update Date : $update ",'BOLD GREEN'),"\n";
print colored("         +---**---==[ Team: $team  ",'BOLD WHITE'),"\n";
print colored("         +---**---==[ Agradecimentos: $greetz  ",'BOLD GREEN'),"\n";


print colored("+------------------------------------------------------------------------+",'red'),"\n";
print colored("+------------------------------------------------------------------------+",'red'),"\n";

########## PART WORK #################
print colored("[SUA LISTA DE SITES]: ",'BOLD WHITE');

$lista=<STDIN>;
chomp($lista);
open (lista, "<$lista") || die "\n [LISTA DE SITES NÃO SELECIONADA]";
my @lista = <lista>;
close lista;

foreach $site(@lista) {

if($site !~ /http:\/\//) { $site = "http://$site/"; };
detect();
}
sub detect($site){
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
$ua->timeout (8);

#################### PARTE DETECTANDO O CMS WORDPRESS ##################################
my $checar = $ua->get("$site")->content;
if($checar =~/wp-content\/themes\/|wp-content\/plugins\/|wordpress/) {
    print colored("[WORDPRESS]: $site",'WHITE ON_CYAN'),"\n";
open(save, '>>Result/WordPress.txt');
    print save "$site\n";
    close(save);
}
#################### PARTE DETECTANDO O CMS JOOMLA ##################################
elsif($checar =~/<script type=\"text\/javascript\" src=\"\/media\/system\/js\/mootools.js\"><\/script>|Joomla!|Joomla|joomla/) {
    print colored("[JOOMLA]: $site",'WHITE ON_GREEN'),"\n";
open(save, '>>Result/Joomla.txt');
    print save "$site\n";   
    close(save);
    }
#################### PARTE DETECTANDO O CMS VBULLETIN ##################################
elsif($checar =~/\/faq.php\/vb|\/forum\/|Powred by vbulletin/) {
    print colored("[VBULLETIN]: $site",'WHITE ON_RED'),"\n";
open(save, '>>Result/VBulletin.txt'); 
    print save "$site\n";   
    close(save);
  }
#################### PARTE DETECTANDO O CMS DRUPAL ##################################
elsif($checar =~/\/modules\/system\/system.menus.css|\/sites\/default\/files\/|<meta name=\"Generator\" content=\"Drupal 7/) {
    print colored("[DRUPAL]: $site",'WHITE ON_BLUE'),"\n";
open(save, '>>Result/Drupal.txt'); 
    print save "$site\n";   
    close(save);
    }
#################### CMS NÃO DETECTADO ##################################
else{
    print colored("[CMS NAO DETECTADO]: $site",'BOLD WHITE'),"\n";
    open(save, '>>Result/Cms_N_Detectado.txt');
    print save "$site\n";
    close(save);
}
}