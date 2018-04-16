#!/usr/bin/perl
 
use Net::SMTP::TLS;


# CONFIGURAÇÕES BÁSICAS #

# Autenticação no servidor SMTP 
my $servidor=""; 
my $porta=""; 
my $user='';
my $pass='';

#Dados do sender
#my $destino='em...@servidor.com'; # caso não queira usar uma lista
my $assunto="";
my $email='';

print <<print;
=============================================================================================
 .oooooo..o ooo        ooooo ooooooooooooo ooooooooo.            +-----------------------+
d8P'    `Y8 `88.       .888' 8'   888   `8 `888   `Y88.          |  By KoubackTr / 2014  |
Y88bo.       888b     d'888       888       888   .d88'          |                       |
 `"Y8888o.   8 Y88. .P  888       888       888ooo88P'           |  koubacktr\@gmail.com  |
     `"Y88b  8  `888'   888       888       888                  +-----------------------+
oo     .d8P  8    Y     888       888       888         
8""88888P'  o8o        o888o     o888o     o888o                                                                
                                                        
ooo        ooooo       .o                             ooo        ooooo       .o    o8o  oooo  
`88.       .888'     .d88                             `88.       .888'     .d88    `"'  `888  
 888b     d'888    .d'888    .oooo.o  .oooo.o          888b     d'888    .d'888   oooo   888  
 8 Y88. .P  888  .d'  888   d88(  "8 d88(  "8          8 Y88. .P  888  .d'  888   `888   888  
 8  `888'   888  88ooo888oo `"Y88b.  `"Y88b.  8888888  8  `888'   888  88ooo888oo  888   888  
 8    Y     888       888   o.  )88b o.  )88b          8    Y     888       888    888   888  
o8o        o888o     o888o  8""888P' 8""888P'         o8o        o888o     o888o  o888o o888o 
=============================================================================================

print


# ARQUIVO COM OS ENDEREÇOS DE EMAIL #

print "[!] Você precisa informar o arquivo de lista com os endereços\n Arquivo: ";
$arquivo = <stdin>;
open(EMAIL,"< $arquivo") or die "FILE NOT FOUND!\n"; 
chomp(my @destino = <EMAIL>); 

#Conexão com o servidor
my $smtp = new Net::SMTP::TLS("$servidor",
    Port    => $porta,
    User    => "$user",
    Password=> "$pass",
    Timeout => 5) || die "[!] Erro ao se conectar ou autenticar com o servidor: $servidor\n";


# PEGANDO ENDEREÇOS NO ARQUIVO INFORMADO #
foreach my $destino (sort @destino){ 

$smtp->mail("$email");

my @destinatario = ("$destino");
$smtp->recipient(@destinatario);

# DADOS A SEREM ENVIADOS #

$smtp->data();
$smtp->datasend("To: $destino\n");
$smtp->datasend("From: Puliça da Passoca Federal\n");
$smtp->datasend("Content-Type: text/html \n");
$smtp->datasend("Subject: $assunto");
$smtp->datasend("\n");
$smtp->datasend("

<!-- CONTEUDO DA MENSAGEM -->
<br>
<center>
<font size='8'>
<b>TESTE DE EMAIL EM PERL</b>
</font>
</center>

");

$smtp->datasend("\n");
print "\t[+] Enviado para: \t\t\t\ $destino\n";
$smtp->dataend();
}
$smtp->quit;
print "[!] Fim\n";