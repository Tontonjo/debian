#!/bin/bash

# Tonton Jo - 2020
# Join me on Youtube: https://www.youtube.com/c/TontonJo

# This script aims to correct  server certificate verification failed i encoutered against a valid let's encrypt certificate

# USAGE
# You can run this scritp directly using:
# wget https://raw.githubusercontent.com/Tontonjo/debian/master/server_verification_corrector.sh
# bash server_verification_corrector.sh

#Sources: https://fabianlee.org/2019/01/28/git-client-error-server-certificate-verification-failed/

varversion=1.0
#V1.0: Initial Release


echo "----------------------------------------------------------------"
echo "Tonton Jo - 2020"
echo "Server certificate verification failed corrector V$varversion"
echo "This script will add a pem file for every entry and declar it in /etc/ssl/certs/ca-certificates.crt"
echo "----------------------------------------------------------------"

echo "Target Hostname? (hostname.domain.tld): "
read 'varhostname'
echo "Target port? (443): "
read 'varport'

echo "- Installing - updating dependencies"
sudo apt-get install apt-transport-https ca-certificates -y
sudo update-ca-certificates
echo "- Creating .pem for $varhostname:$varport"
openssl s_client -showcerts -servername $varhostname -connect $varhostname:$varport </dev/null 2>/dev/null | sed -n -e '/BEGIN\ CERTIFICATE/,/END\ CERTIFICATE/ p'  > $varhostname.pem

cat $varhostname.pem | sudo tee -a /etc/ssl/certs/ca-certificates.crt

echo "- Done!"
