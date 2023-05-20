# MOTD

Tonton Jo - 2022  
Join me on Youtube: https://www.youtube.com/c/tontonjo

This script is used to show some usefull informations when loging in on system

## One line execution:
```ssh
if [[ $(id -u) -ne 0 ]] ; then sudo wget -q -O - https://github.com/Tontonjo/debian/raw/master/etc/update-motd.d/motd.sh | sudo bash ; else wget -q -O - https://github.com/Tontonjo/debian/raw/master/etc/update-motd.d/motd.sh | bash ; fi
``` 
## USAGE
### Download the motd file
```ssh
wget -qO /etc/update-motd.d/01-jo https://github.com/Tontonjo/debian/raw/master/etc/update-motd.d/01-jo
```  
### make it executable
```ssh
chmod +x /etc/update-motd.d/01-jo
```  
### make a backup and delete motd file
```ssh
cp /etc/motd /etc/motd.bck && rm -rf /etc/motd
```  
### Delete uname motd script
```ssh
rm -rf /etc/update-motd.d/10-uname
```  
