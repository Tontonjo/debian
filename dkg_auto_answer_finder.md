# dkg_auto_answer_finder

In case you want to supply answwers when installing package, here's how you can find wich one are needed by the package:  

### install needed tools:
```shell
apt-get install debconf-utils 
```  
### Find questions for the package you want:
```shell
debconf-get-selections | grep ^iptables-persistent
```
