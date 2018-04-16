#!/usr/bin/perl
#use Win32::Console::ANSI;
#use Term::ANSIColor;
#use LWP::UserAgent;
##############################################
system(($^O eq 'MSWin32') ? 'cls' : 'clear');
##############################################
$Anonsec = 'Auto_Detector';
$auteur = 'By Satya Enki';
$version = '1.0';
$groupe = '*** Anonsec ***';
$update = '03/06/2017';
$merci = 'All friends';
##############################################
$res="Result";
    if (-e $res) 
    {
    }
    else
    {
        mkdir $res or die "Pas obtenu de créer le répertoire: $res";
    }
################# ACCUEIL #############

print "\n";
print colored("+------------------------------------------------------------------------+",'red'),"\n";
print colored("                         --=[ $Anonsec ]=--",'BOLD WHITE'),"\n";
print colored("         +---**---==[ Team: $groupe  ]==---**---+",'BOLD WHITE'),"\n";
print colored("              +---**---==[ merci: $merci  ]==---**---+",'BOLD GREEN'),"\n";
print colored("+------------------------------------------------------------------------+",'red'),"\n";
print "\n";

########## PART WORK #################
print colored("[LA LISTE DE VOS SITES]: ",'BOLD WHITE');

$liste=<STDIN>;
chomp($liste);
print "\n";
open (liste, "<$liste") || die "\n [liste de sites non selectionner]";
my @liste = <liste>;
close liste;

foreach $site(@liste) {

if($site !~ /http:\/\//) { $site = "http://$site/"; };
detect();
}
sub detect($site){
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
$ua->timeout (8);

#################### CMS WORDPRESS ##################################
my $checar = $ua->get("$site")->content;
if($checar =~/wp-content\/themes\/|wp-content\/plugins\/|wordpress/) {
    print colored("[WORDPRESS]: $site",'WHITE ON_CYAN'),"\n";
open(save, '>>Result/WordPress.txt');
    print save "$site\n";
    close(save);
}
#################### CMS JOOMLA ##################################
elsif($checar =~/<script type=\"text\/javascript\" src=\"\/media\/system\/js\/mootools.js\"><\/script>|Joomla!|Joomla|joomla/) {
    print colored("[JOOMLA]: $site",'WHITE ON_GREEN'),"\n";
open(save, '>>Result/Joomla.txt');
    print save "$site\n";   
    close(save);
    }
#################### CMS VBULLETIN ##############################
elsif($checar =~/\/faq.php\/vb|\/forum\/|Powred by vbulletin/) {
    print colored("[VBULLETIN]: $site",'WHITE ON_RED'),"\n";
open(save, '>>Result/VBulletin.txt'); 
    print save "$site\n";   
    close(save);
  }
#################### CMS DRUPAL ##################################
elsif($checar =~/\/modules\/system\/system.menus.css|\/sites\/default\/files\/|<meta name=\"Generator\" content=\"Drupal 7/) {
    print colored("[DRUPAL]: $site",'WHITE ON_BLUE'),"\n";
open(save, '>>Result/Drupal.txt'); 
    print save "$site\n";   
    close(save);
    }
#################### CMS  ##################################
else{
    print colored("[CMS NON DETECTER]: $site",'BOLD WHITE'),"\n";
    open(save, '>>Result/Cms_N_Detecter.txt');
    print save "$site\n";
    close(save);
}
}