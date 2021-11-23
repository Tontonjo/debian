# Tonton Jo - 2020
## Join me on Youtube: https://www.youtube.com/c/TontonJo

## Sources:  
Excellent guide in case of need: https://linuxize.com/post/how-to-setup-passwordless-ssh-login/


## Commands to create a private and public key to allow passwordless SSH connexion between hosts

### Check if keys exist:
ls -al ~/.ssh/id_*.pub

### Generate keys  
shell```
ssh-keygen -t rsa -b 4096 
```

### Copy ID to remote server
shell```
ssh-copy-id user@ipaddress
```
