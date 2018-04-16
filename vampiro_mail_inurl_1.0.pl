#!/usr/bin/perl
#VAMPIRO MAIL INURL 1.0
#Acesse: www.inurl.com.br
 
use strict;
use warnings;
use feature 'say';
use LWP::Simple 'get';
use URI;    

    sub extrair(){
    system(($^O == 'linux') ? 'reset':'cls');
    
    my $url = URI->new($ARGV[0]);
    print "[URL]: Baixar os emails: ".$url."\n";
    print "Nome arquvio pra salvar os emails:\n";
    chomp(my $file =  <STDIN>);    
    open(my $arq, '>'.$file.$url->host().'-EMAIL.txt');
    system(($^O == 'linux') ? 'reset':'cls');
  
    print "Extraindo...\n"; 
    my $link = $ARGV[0] if (defined($ARGV[0])) || die "[-] Parâmetro inválido.\n";
    unless($link =~ /^http.?/i)
    {
        print "[X] URL inválida!\n";
        exit 1;
    };
    $_ = get($link) || die "$!.\n";        
    say $arq $1 while m/([\w]+\@[\w\.]+)/sg;      
    close($arq);
    say "Finalizado com sucesso!.\n";
}
&extrair();