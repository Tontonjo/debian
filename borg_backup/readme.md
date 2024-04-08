# Borg Backup

## Tonton Jo
[Social links](https://linktr.ee/tontonjo)  

## Usefull Links: 
[Borg Website](https://www.borgbackup.org/)

## Other infos
[Passwordless SSH](https://raw.githubusercontent.com/Tontonjo/debian/master/passwordless_ssh.txt)

## Commands:
Install borg Backup for your distribution

- Instructions can be found in [commands.md](https://github.com/Tontonjo/borg_backup/blob/main/commands.md)

### Initialize your backup repository 
```shell
borg init -e keyfile /path/to/backup
```
```shell
borg init -e keyfile ssh://borg@10.0.0.171:2222/path/to/backup
```
### Backup the passphase and datastore key as suggested

- Copy the borg_backup.sh script on your server
- Edit BORG_REPO to aim at your local or remote datastore
- Edit BORG_PASSPHRASE to the one you choose when you inited the repository
- Edit /folder1 /folder2/data to the folders you want to backup
- Edit --exclude as needed
- Edit Retention policy
- Run script with
```shell
bash borg_backup.sh" 
```
- Use a cronjob to run it on a daily basis

## Export repository key - Important
```shell
 borg key export /path/to/backup /path/to/key
```

# General usage commands:

##Install borg
```shell
apt-get install borgbackup
```
## Initiate repository

### local:  
```shell
borg init -e authenticated /path/to/repository  
```
### remote:  
```shell
borg init -e authenticated ssh://username@ip_hostname:2222/path/to_repository
```

## Export keys: 
```shell
borg key export ssh://username@ip_hostname:2222/path/to_repository /root/borg-key
```

## Mount backups:
```ssh
borg mount /path/to/repository /path/to/mountpoint
```

# Docker borg Server:
Source: https://hub.docker.com/r/mannp/docker-borgserver

- create a folder that will host your keys:
```shell
mkdir -p /path/to/borg/sshkeys/clients
```
- Ensure correct rights on folder:
```shell
chown 1000:1000 /path/to/borg/sshkeys
```
- Copy your PUBLIC key to the remote server on a new folder - name this new folder as the repository name you want to use:
- copy content of "/root/.ssh/id_rsa.pub"
```shell
nano /path/to/borg/sshkeys/clients/remote-backup
```
- Paste content - save - exit
- Start your borg backup server container:
```shell
docker run -td --name borg-server --restart unless-stopped -p 2222:22 --volume /path/to/borg/sshkeys:/sshkeys --volume /path/to/borg/backup:/backup/ nold360/borgserver:latest
```
