#!/usr/bin/perl
use strict;
use warnings;
use LWP::UserAgent;

system(($^O eq 'MSWin32') ? 'cls' : 'clear');
system("title [Email - Hash_Md5 Decrypter]");
print q{
           ▒▒▒▒▒▒▒▓ 
           ▒▒▒▒▒▒▒▓▓▓ 
           ▒▓▓▓▓▓▓░░░▓ 
           ▒▓░░░░▓░░░░▓ 
           ▓░░░░░░▓░▓░▓ 
           ▓░░░░░░▓░░░▓ 
           ▓░░▓░░░▓▓▓▓ 
           ▒▓░░░░▓▒▒▒▒▓ 
           ▒▒▓▓▓▓▒▒▒▒▒▓ 
           ▒▒▒▒▒▒▒▒▓▓▓▓ 
           ▒▒▒▒▒▓▓▓▒▒▒▒▓  
           ▒▒▒▒▓▒▒▒▒▒▒▒▒▓ 
           ▒▒▒▓▒▒▒▒▒▒▒▒▒▓ 
           ▒▒▓▒▒▒▒▒▒▒▒▒▒▒▓ 
           ▒▓▒▓▒▒▒▒▒▒▒▒▒▓ 
           ▒▓▒▓▓▓▓▓▓▓▓▓▓ 
           ▒▓▒▒▒▒▒▒▒▓ 
           ▒▒▓▒▒▒▒▒▓ 

   [MASS EMAIL | HASH_MD5 DECRYPTER]
   [*** Brazilians Hackers Team ***]

};
print "[Insira sua lista]: ";
chomp(my $file=<STDIN>);
open (my $decrypter,'<',$file) || die "\n [Lista nao selecionada]";
my @file = <$decrypter>;

foreach my $id(@file) {
	
	my $lwp = LWP::UserAgent->new;
	   $lwp->agent('Mozilla 5.0');
	   $lwp->timeout(5);
	   $lwp->max_size('1_000_240');

my ($e,$hash) = split/[|]/,$id;
$hash =~/[0-9a-fA-F]{32}/ or warn "Não é uma hash md5\n";

my $url = "http://md5.darkbyte.ru/api.php?q=".$hash;
	my $req = $lwp->get($url);
	my $dmd5 = $req->decoded_content;
	if ($req->is_success){
		print "\n[Email] ".$e."| [Hash Decriptada] => ".$dmd5."\n";
	}
	open(my $fh, '>>', 'decrypter.txt');
	print $fh "$e|$dmd5\n";
	close $fh;


}

close $decrypter;