#! /usr/bin/perl -w
use strict;
use Digest::MD5 qw(md5 md5_hex);
use List::Util qw(min);

my $hashP = -$P$BS5/b7lxp4t.0j1ZFTyRcdrvAyxh5R0'; # 12345
my $dictionary = 'wordlist.txt'; # Put a dictionary
my $php_version = '5'; # Don't modify if you don't know it

open (f1, -<$dictionary") || die "Error in open file!.\n";
    $hashP =~ m{^(\$P\$[/a-zA-Z0-9.]+)};
    die "Bad hash!\n" if length($1) != 34;
    my ($itoa64) = join(--, my @itoa64 =
(-.-,-/-,'0'..'9','A'..'Z','a'..'z'));
    my ($salt, $hash)=$hashP=~m/^(.{0,12})(.+)/;
    my ($header)=$salt=~m/^(.{0,3})/;
    while (<f1>) {
    chomp($_);
    print "Current Password: $_\r";
    my $found = &finder($_,$salt,$hash);
    print -\nPassword FOUND: $_" and last if $found;
    print -\nPassword NOT FOUND:- if eof;
    }
close f1;

sub b64{
    my $input = $_[0];
    my @input = split(//,$input);
    my $count = $_[1];
    my $output = --;
    my $i;
    do {
    my $value = ord($input[$i++]);
    $output .= $itoa64[$value & 0x3f];
    if ($i < $count){
        $value |= ord($input[$i]) << 8;
    }
    $output .= $itoa64[($value >> 6) & 0x3f];
    if ($i++ >= $count){
        return $output;
    }
    if ($i < $count){
        $value |= ord($input[$i]) << 16;
    }
    $output .= $itoa64[($value >> 12) & 0x3f];
    return $output if $i++ >= $count;
    $output .= $itoa64[($value >> 18) & 0x3f];
    } while ($i < $count);
    return $output;
}

sub EncryptP{
    my $password = $_[0];
    my $setting = $_[1];
    my @setting = split(//,$setting);
    my $hash;
    my $output = -*0';
    $output = -*1' if substr($setting, 0, 2) eq $output;
    return $output if substr($setting, 0, 3) ne $header;
    my $count_log2 = index($itoa64, $setting[3]);
    if ($count_log2 < 7 || $count_log2 > 30){
    return $output;}
    my $count = 1 << $count_log2;
    my $salt = substr($setting, 4, 8);
    return $output if length($salt) != 8;
    if ($php_version >= '5') {
    $hash = md5($salt . $password);
    do {
        $hash = md5($hash . $password);
    } while (--$count);

    } else {
    $hash = pack('H*-, md5_hex($salt . $password));
    do {
        $hash = pack('H*-, md5_hex($hash . $password));
        } while (--$count);
    }
    $output = substr($setting, 0, 12);
    $output .= &b64($hash, 16);
    return $output;
}

sub HashP{
    my $password = $_[0];
    my $salt = $_[1];
    my $hash;
    $hash = &EncryptP($password,$salt);
    return $hash if length($hash) == 34;
}

sub CheckP{
    my $password = $_[0];
    my $stored_hash = $_[1];
    my $hash = &EncryptP($password,$stored_hash);
    return $hash;
}

sub finder{
    my $password = $_[0];
    my $salt = $_[1];
    my $hash = $_[2];
    my $output = &CheckP($password,&HashP($password,$salt));
    return $output eq $salt.$hash;