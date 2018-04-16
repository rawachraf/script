#!/usr/bin/perl
#Fonte: http://madeinbrazil.umforum.net/t6120-perl-email-extractor

use strict;
use warnings;
use feature 'say';


sub entrada()
{
    system(($^O == 'linux') ? 'reset':'cls');
    open(my $arq,$ARGV[0]) || die "[-] $!.\n" if (defined($ARGV[0]) || die "[-] Parâmetro inválido.\n");
    while(<$arq>)
    {
        chomp;
        say $1 if  m/([\w]+\@[\w\.]+)/sg;        
    };  
    close($arq);  
}


&entrada();