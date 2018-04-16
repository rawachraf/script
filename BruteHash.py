#!/usr/bin/env python 
#-*- coding: utf-8-*-
import os, hashlib, argparse, sys, time
def CheckSystem():
	if sys.platform != 'linux2':
		os.system("cls")
	else:
		os.system("clear")
def banner():
	print """	\033[1;32m
            `,+@@@+                              
          .+@@@@@@@;                            
       `;@@@@@@@@@@@                            
      +@@@@@@@@@@@@@:                            
    ;@@@@@@@@@@@@@@@@                            
  `@@@@@@@@@@@@@@@@@@`                          
  `@@@@@@@@@@@@@@@@@@#                          
   .@@@@@@@@@@@@@@@@@@,                          
    :@@@@@@@@@@@@@@@@@@      .'@@                
     #@@@@@@@@@@@@@@@@+;  .+@@@@@                
     `@@@@@@@@@@@@@#;;+@+#@@@#:`                
      #@@@@@@@@@@';'@@@@@@@:`                    
      `@@@@@@@+;;+@@@@@##`                      
       .@@@#;;+@@@@@#+',.,'.                    
        +;;'#@@@@#+;`      ,:                    
        .#@@@@#++:  @.    ...`                  
     `'@@@@#++'. +  .#++;;+  +                  
   ,@@@@@#++:``::+   `',:+,. ,                  
 `@@@@#, #+` ',.`'.   +` ``  `,  .+              
  @@:`  ,+. ,`:``.:   '. .',+++   #              
  ``    #+`++,.`:,``    :`+@@'@@@@'    ````      
        #'`#+:`.,`:` .@@@+@#  +`.      :  `:    
        #:: +.`,.., `@@,#@':. +        :   '    
        #: ` ',:`,, @#``    + +        ' `,;    
        #: ` `:''`  @` #:.. , '        #+++:    
        #: ,     ;#'#  + :   `:         #++      
        #; '     `''         ,          '.      
        ;' '                 #         `@#      
         #.;                ;`       ,#.:;      
         `+;               '.        @   `            Cod3D By ./Fatsio Thaerudit
          :#;            `@:        :`  `,      
           .#+;        `'+.'        +               
             .@++#'+@+@++` ;@.     '            
              `' ., ` #:`# `+.#+  :.            
               ., :  @#;.`;`:  `#@.              
                +``,.;`@+,. '#                  
                @' ' ;`@:+`#`;`                  
               `#+  ,'`#  :.  '                  
               ' #.  :`#` '`. +                  
               # +.  .:+: :`. .                  
              `, +,   ..+ '`   :                
              ;` #+@:,:#.;``   '                
              #'##:#+.  : `;   ;                
              #. #:      `'`   :                
                 #,        `   .\033[0m
 	    			     \033[0;35mBy: ./Fatsio Thaerudit \033[0m
 	\033[0;37mmd5, sha1, sha224, sha256, sha384, sha512\033[0m
 	Use python BruteHash --h Pour plus d'informations ... 
	"""
	time.sleep(1)
ajuda = """
	Utilisez le type de Hash qui sera faire la force brute ... et le chemin de WordList ..
	Exemple: python BruteHash.py --type md5 --hash 38e2b2e31c0fce9537f735dda9fdf10a --wordList /home/user/word.txt"
	--Type <<--- Commande pour définir le type de Hash, md5, sha1, sha224, sha256, sha384, sha512.
	--Hash le mot crypté.
	--WordList le chemin de son WordList. 
"""
CheckSystem()
banner()
parser = argparse.ArgumentParser()
parser.add_argument("--type", action="store",dest="type", help="Définissez le type de hachage que vous voulez briser. MD5, SHA1, SHA224, SHA256, SHA384, SHA512 ...", required=True)
parser.add_argument("--wordList",action="store",dest="WordList", help="Chemin WordList à utiliser..", required=True)
parser.add_argument("--hash",action="store",dest="Hash", help="Type de Hash", required=True)
parser.add_argument("--h", help="Option Aide",action="store_true")
args = parser.parse_args()
type = None
Hash = str(args.Hash)
if args.type.lower() == 'md5':
	type = hashlib.md5
elif args.type.lower() == 'sha1': 
	type = hashlib.sha1
elif args.type.lower() == 'sha224':
	type = hashlib.sha224
elif args.type.lower() == 'sha256':
	type = hashlib.sha256
elif args.type.lower() == 'sha384':
	type = hashlib.sha384
elif args.type.lower() == 'sha512':
	type = hashlib.sha512
a = open(args.WordList, "r").readlines()
for kay in a:
	kay = kay.replace("\n", "").replace("\r", "")
	print "\033[0;31mPalavra a ser testada: "+str(kay)+"\033[0m"
	encripted = type(kay).hexdigest()
	if encripted == Hash:
		time.sleep(3)
		CheckSystem()
		banner()
		print "\033[0;32mHash original: "+str(args.Hash)+"\033[0m"
		print "\033[0;32mTexto original: "+str(kay)+"\033[0m"
		quit()