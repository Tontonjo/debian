# debconf_auto_answer_finder

In case you want to supply answwers when installing package, here's how you can find wich one are needed by the package:  

## Prepare:  
### Install the bianry for which you need auto-answers:
```shell
apt-get install iptables-persistent
```  
### Install needed tools:
```shell
apt-get install debconf-utils 
```  
### Find questions for the package you want:
```shell
debconf-get-selections | grep ^iptables-persistent
```
### Use:  
### Edit value as needed on target:
```shell
echo "iptables-persistent iptables-persistent/autosave_v6 boolean true" | debconf-set-selections 
```
### Install package with no question asked o
```shell
apt-get install iptables-persistent
```
