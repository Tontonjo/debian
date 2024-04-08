# Debian Preseed

## Tonton Jo
[Social links](https://linktr.ee/tontonjo)  

## Usefull Links:

## Other infos
[You can watch a demonstration of a preseeded installation](https://www.youtube.com/watch?v=XqYi9IQea68)  

## Commands:
:  
### Download your new ISO and upload it on your host  
### Create a directory where the ISO will be mounted on  
```shell
mkdir /mnt/iso
```
### Create a directory where the ISO will be mounted on  
```shell
mount -o loop "/root/debian.iso" /mnt/iso
```
### Copy the content of the ISO in a new folder  
```shell
cp -r /mnt/iso "/root/extracted_iso/"
```
### Once the copy is done, unmount the iso - you can then delete it if you want
```shell
umount /mnt/iso
```  
### Download the content of debian_preseed repository and copy all the files in "/root/extracted_iso/iso"

### Edit configurations as you need:  
- By default all settings are commented
- You'll have to pass trough many attemps to get your perfect configuration  
Preseed file is located in /root/extracted_iso/jo/preseed.cfg  
Custom menu file is located in /root/extracted_iso/isolinux/txt.cfg  

### Install Genisoimnage:  
```shell
apt-get install -y genisoimage
```  
### CD into iso files folder:  
```shell
cd /root/extracted_iso
```  
### Generate your new customized ISO  
```shell
genisoimage -o /root/preseeded_debian.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -J -r .
```

### Run your ISO!
Export the new generated iso file and run it!

