# Tonton Jo - 2023
## Join me on Youtube: https://www.youtube.com/c/TontonJo


## Setup 3FA authentication

### Install Google Authenticator
```shell
sudo apt install libpam-google-authenticator
```
### Enable 2fa for current user
```shell
google-authenticator
```  
### Enable Google Authenticator module
```shell
nano /etc/pam.d/sshd
```  
add:  
auth required pam_google_authenticator.so nullok

### Enable 2fa for password logins:
```shell
nano /etc/ssh/sshd_config
```
KbdInteractiveAuthentication yes  
Restart service 
```shell
systemctl restart sshd.service
```
### Enable 2fa for passwordless connections using a private key
```shell
nano /etc/ssh/sshd_config
```  
AuthenticationMethods publickey,password publickey,keyboard-interactive
- Restart service 
```shell
systemctl restart sshd.service
```
### Enable 2fa for console access
```ssh
nano /etc/pam.d/common-auth
```  
auth required pam_google_authenticator.so nullok



