#!/bin/bash 
green="\033[1;32m"
th3m3s(){
cat<<!
################################################
#  _____ _          ___       ____             #
# |_   _| |__   ___|_ _|_ __ / ___|  ___  ___  #
#   | | | '_ \ / _ \| || '_ \\___ \ / _ \/ __| #
#   | | | | | |  __/| || | | |___) |  __/ (__  #
#   |_| |_| |_|\___|___|_| |_|____/ \___|\___| #
#                                              #
################################################
!
echo -e $green"Personaliza Kali ? (Sim/Não)";
echo -e ":\c"; 
read resposta
if [ $resposta = "Sim" ]; then

echo -e $green"Instalando";

apt-get install gnome-tweak-tool
echo -e $green"Baixando Themas";
wget https://dl.dropboxusercontent.com/s/ywsdpguffp35pyc/numix___gtk3_theme_by_satya164-d5ygul6.zip
wget https://dl.dropboxusercontent.com/s/oaiwr9pkvstadn6/elementary.zip

for i in $(ls *.zip)
do
unzip $i
done

mv  Numix/  /usr/share/themes
mv elementary/ /usr/share/icons

gnome-tweak-tool

fi
}
th3m3s;