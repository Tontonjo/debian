# ssh_authentication

## Tonton Jo
[Social links](https://linktr.ee/tontonjo)  

## Usefull Links: 

## Other infos

## Generate a pair of rsa keys in the folder of your choice
```shell
ssh-keygen -t rsa -b 4096 -C "name of user"
```
- Alternatively, specifiy output path directly in command
```shell
ssh-keygen -t rsa -b 4096 -C "name of user" -f /root/user_rsa
```

### Deploy your public key on the servers you want to connect using private key
```shell
ssh-copy-id -i "/root/user_rsa.pub" root@127.0.0.1
```
### In case of need, you can specify the port of the remote server
```shell
ssh-copy-id -i "/root/user_rsa.pub" -p 22 root@10.0.0.41
```

## Disable password login for root
```shell
nano /etc/ssh/sshd_config
```
- set
PermitRootLogin prohibit-password
