<?php
# https://github.com/haqqur/shodan-rest-api-wrapper/blob/master/src/shodan.class.php
namespace Shodan;

class Shodan {

    private $shodan_stream;
    private $shodan_shodan;
    private $shodan_tools;
    private $shodan_dns;
    private $shodan;
    private $apikey;


    /**
     * Construct.
     * 
     * @param string $apikey;
     * @return void;
     */
    public function __construct($apikey) {
        $this->shodan_stream = 'https://stream.shodan.io/shodan';
        $this->shodan_shodan = 'https://api.shodan.io/shodan';
        $this->shodan_tools = 'https://api.shodan.io/tools';
        $this->shodan_dns = 'https://api.shodan.io/dns';
        $this->shodan = 'https://api.shodan.io';
        $this->apikey = $apikey;
        define('RETURN_TYPE', false); // false = object; true = array
    }

    /**
     * Send an HTTP request using libcurl.
     * 
     * @param string $target;
     * @return string $response;
     */
    public function curl_req($target) {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $target);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $response = curl_exec($curl);
        curl_close($curl);
        return $response;
    }

    /**
     * Returns all services that have been found on the given host IP.
     * 
     * @param string $ip;
     * @param bool $history;
     * @param bool $minify;
     * @return object/array $req;
     */
    public function host($ip, $history = false, $minify = false) {
        $req = $this->curl_req("{$this->shodan_shodan}/host/{$ip}?key={$this->apikey}&history={$history}&minify={$minify}");
        return json_decode($req, RETURN_TYPE);
    }

    /**
     * Return the total number of results that match the query and any facet information.
     * 
     * @param string $ip;
     * @param string $facets;
     * @return object/array $req;
     */
    public function host_count($ip, $facets = false) {
        if($facets) { $req = $this->curl_req("{$this->shodan_shodan}/host/count?key={$this->apikey}&query={$ip}&facets={$facets}"); }
        else { $req = $this->curl_req("{$this->shodan_shodan}/host/count?key={$this->apikey}&query={$ip}"); }
        return json_decode($req, RETURN_TYPE);
    }

    /**
     * Search Shodan using the same query syntax as the website and use facets to get summary information for different properties.
     * 
     * @param string $query;
     * @param string $facets;
     * @return object/array $req;
     */
    public function host_search($query, $page = 1, $facets = false, $minify = false) {
        if($facets) { $req = $this->curl_req("{$this->shodan_shodan}/host/search?key={$this->apikey}&query={$query}&facets={$facets}&page={$page}&minify={$minify}"); }
        else { $req = $this->curl_req("{$this->shodan_shodan}/host/search?key={$this->apikey}&query={$query}"); }
        return json_decode($req, RETURN_TYPE);
    }

    /**
     * Determine which filters are being used by the query string and what parameters were provided to the filters.
     * 
     * @param string $query;
     * @return object/array $req;
     */
    public function token_search($query) {
        $req = $this->curl_req("{$this->shodan_shodan}/host/search/tokens?key={$this->apikey}&query={$query}");
        return json_decode($req, RETURN_TYPE);
    }

    /**
     * Return an object containing all the services that the Shodan crawlers look at.
     * 
     * @return object/array $req;
     */
    public function services() {
        $req = $this->curl_req("{$this->shodan_shodan}/services?key={$this->apikey}");
        return json_decode($req, RETURN_TYPE);
    }

    /**
     * Look up the IP address for the provided list of hostnames.
     * 
     * @param string $hostname;
     * @return object/array $req;
     */
    public function dns_resolve($hostname) {
        $req = $this->curl_req("{$this->shodan_dns}/resolve?hostnames={$hostname}&key={$this->apikey}");
        return json_decode($req, RETURN_TYPE);
    }

    /**
     * Look up the hostnames that have been defined for the given list of IP addresses.
     * 
     * @param string $ip;
     * @return object/array $req;
     */
    public function dns_reverse($ip) {
        $req = $this->curl_req("{$this->shodan_dns}/reverse?ips={$ip}&key={$this->apikey}");
        return json_decode($req, RETURN_TYPE);
    }

    /**
     * Get your current IP address as seen from the Internet.
     * 
     * @return object/array $req;
     */
    public function myip() {
        $req = $this->curl_req("{$this->shodan_tools}/myip?key={$this->apikey}");
        return json_decode($req, RETURN_TYPE);
    }

    /**
     * Returns information about the API plan belonging to the given API key.
     * 
     * @return object/array $req;
     */
    public function api_info() {
        $req = $this->curl_req("{$this->shodan}/api-info?key={$this->apikey}");
        return json_decode($req, RETURN_TYPE);
    }

    /**
     * Return all of the data that Shodan collects. (subscription required)
     * 
     * @return object/array $req;
     */
    public function banners() {
        $req = $this->curl_req("{$this->shodan_stream}/banners?key={$this->apikey}");
        return json_decode($req, RETURN_TYPE);
    }

    /**
     *  Return geolocation data for all of the collected data by Shodan. (subscription required)
     * 
     * @return object/array $req;
     */
    public function geo() {
        $req = $this->curl_req("{$this->shodan_stream}/geo?key={$this->apikey}");
        return json_decode($req, RETURN_TYPE);
    }

    /**
     *  Returns banner data for the list of specified hosts. (subscription required)
     * 
     * @return object/array $req;
     */
    public function ports($port) {
        $req = $this->curl_req("{$this->shodan_stream}/ports/{$port}?key={$this->apikey}");
        return json_decode($req, RETURN_TYPE);
    }

}