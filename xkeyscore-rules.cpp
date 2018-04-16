___________                __     _______     _________   _____   
\_   _____/ __ __   ____  |  | __ \      \   /   _____/  /  _  \  
 |    __)  |  |  \_/ ___\ |  |/ / /   |   \  \_____  \  /  /_\  \ 
 |     \   |  |  /\  \___ |    < /    |    \ /        \/    |    \
 \___  /   |____/  \___  >|__|_ \\____|__  //_______  /\____|__  /
     \/                \/      \/        \/         \/         \/ 

___________                __    ____  ___ __                                                            
\_   _____/ __ __   ____  |  | __\   \/  /|  | __  ____   ___.__.  ______  ____    ____  _______   ____  
 |    __)  |  |  \_/ ___\ |  |/ / \     / |  |/ /_/ __ \ <   |  | /  ___/_/ ___\  /  _ \ \_  __ \_/ __ \ 
 |     \   |  |  /\  \___ |    <  /     \ |    < \  ___/  \___  | \___ \ \  \___ (  <_> ) |  | \/\  ___/ 
 \___  /   |____/  \___  >|__|_ \/___/\  \|__|_ \ \___  > / ____|/____  > \___  > \____/  |__|    \___  >
     \/                \/      \/      \_/     \/     \/  \/          \/      \/                      \/ 

  _________                                        _________              .___        
 /   _____/  ____   __ __ _______   ____    ____   \_   ___ \   ____    __| _/  ____  
 \_____  \  /  _ \ |  |  \\_  __ \_/ ___\ _/ __ \  /    \  \/  /  _ \  / __ | _/ __ \ 
 /        \(  <_> )|  |  / |  | \/\  \___ \  ___/  \     \____(  <_> )/ /_/ | \  ___/ 
/_______  / \____/ |____/  |__|    \___  > \___  >  \______  / \____/ \____ |  \___  >
        \/                             \/      \/          \/              \/      \/ 


#############################################################################
#############################################################################

// START_DEFINITION
/*
The fingerprint  identifica sessões que visitam o site do Tor Project 
países non-fvey..
*/
fingerprint('anonymizer/tor/torpoject_visit')=http_host('www.torproject.org')
and not(xff_cc('US' OR 'GB' OR 'CA' OR 'AU' OR 'NZ'));
// END_DEFINITION


// START_DEFINITION
/*
Estas variáveis ​​definem termos e sites relacionados com as TAILs (The Amnesic
Incognito Live System) software program, um mecanismo de COMSEC defendida por 
extremistas em fóruns extremistas.
*/

$TAILS_terms=word('tails' or 'Amnesiac Incognito Live System') and word('linux'
or ' USB ' or ' CD ' or 'secure desktop' or ' IRC ' or 'truecrypt' or ' tor ');
$TAILS_websites=('tails.boum.org/') or ('linuxjournal.com/content/linux*');
// END_DEFINITION

// START_DEFINITION
/*
This fingerprint identifica os utilizadores que procuram TAILs (The Amnesic
Incognito Live System) software program, visualização de documentos relacionados com TAILs,
ou sites de visualização que detalham TAILs.
*/
fingerprint('ct_mo/TAILS')=
fingerprint('documents/comsec/tails_doc') or web_search($TAILS_terms) or
url($TAILS_websites) or html_title($TAILS_websites);
// END_DEFINITION


// START_DEFINITION
requer gramática versão 5
/**
 * Tor endereços de serviços agregados escondida visto em trânsito.
 */
mapreduce::plugin('anonymizer/tor/plugin/onion') =
  immediate_keyword(/(?:([a-z]+):\/\/){0,1}([a-z2-7]{16})\.onion(?::(\d+)){0,1}/c : c++
    includes: {{
      #include <boost/lexical_cast.hpp>
    }}
    proto: {{
      message onion_t {
        required string address = 1;
        optional string scheme = 2;
        optional string port = 3;
      }
    }}
    mapper<onion_t>: {{
      static const std::string prefix = "anonymizer/tor/hiddenservice/address/";

      onion_t onion;
      size_t matches = cur_args()->matches.size();
      for (size_t pos=0; pos < matches; ++pos) {
        const std::string &value = match(pos);
        if (value.size() == 16)
          onion.set_address(value);
        else if(!onion.has_scheme())
          onion.set_scheme(value);
        else
          onion.set_port(value);
      }

      if (!onion.has_address())
        return false;

      MAPPER.map(onion.address(), onion);
      xks::fire_fingerprint(prefix + onion.address());
      return true;
    }}
    reducer<onion_t>: {{
      for (values_t::const_iterator iter = VALUES.begin();
          iter != VALUES.end();
          ++iter) {
        DB["tor_onion_survey"]["onion_address"] = iter->address() + ".onion";
        if (iter->has_scheme())
          DB["tor_onion_survey"]["onion_scheme"] = iter->scheme();
        if (iter->has_port())
          DB["tor_onion_survey"]["onion_port"] = iter->port();
        DB["tor_onion_survey"]["onion_count"] = boost::lexical_cast<std::string>(TOTAL_VALUE_COUNT);
        DB.apply();
        DB.clear();
      }
      return true;
    }});

/*
  *
  * Espaço reservado para impressão digital Tor endereços serviço escondido. 
  * Fingerpritns reais serão disparados pelos plugins 
  * 'anonymizer/tor/plugin/onion/ *'
*/
fingerprint('anonymizer/tor/hiddenservice/address') = nil;
// END_DEFINITION


// START_DEFINITION
appid('anonymizer/mailer/mixminion', 3.0, viewer=$ascii_viewer) =
        http_host('mixminion') or
        ip('128.31.0.34');
// END_DEFINITION

#############################################################################
#############################################################################