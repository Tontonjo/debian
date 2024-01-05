
## Get infos about your btrfs filesystem
```ssh
btrfs filesystem show
```
```ssh
btrfs filesystem usage /mnt/data
```
## Wipe some drives !! caution !!
```ssh
wipefs --all -t btrfs /dev/sdX /dev/sdX
```

## Create a raid 1 (btrfs does not supports raid5 well - discouraged)
```ssh
mkfs.btrfs -m raid1 -d raid1 /dev/sdX /dev/sdX
```

```ssh
mkdir /mnt/data
```

```ssh
mount /dev/sdX /mnt/data
```


```ssh
btrfs device usage /mnt/data/
```

## Mount in fstab:
- identify the btrfs UUID
```ssh
btrfs filesystem show | grep uuid
```
```ssh
nano /etc/fstab
```
add the folowwing
```ssh
UUID=$youruuid /mnt/data         btrfs   defaults,nofail      0  0
```

## Replace a drive:
- File system has to be mounted.
```ssh
mount -o degraded /dev/sdX /mnt/data
```
- Identify the ID of the missing drive with 
```ssh
btrfs filesystem show
```
In this case, the missing drive is the "1" as i have devid 2 and my raid is raid1
```Label: none  uuid: a78a5a91-ad4b-4037-861d-92212b34f63c
        Total devices 2 FS bytes used 1.00GiB
        devid    2 size 3.00GiB used 1.49GiB path /dev/sdd
        *** Some devices missing
```
Add new drive to system and wipe it if needed
```ssh
btrfs replace start 1  /dev/sdd  /mnt/data
```
Check again using "btrfs filesystem show" that the drive has been correctly replaced
After a disk has been failing or being replaced, rebalance the data
```ssh
btrfs filesystem balance /mnt/data
```
![image](https://github.com/Tontonjo/debian/assets/60965766/fdf02944-f8dc-459c-a232-c46273f5f15b)
![image](https://github.com/Tontonjo/debian/assets/60965766/3483e892-df3b-4337-9a56-224b27a680f2)

## Grow filesystem
If you replaced drive with bigger ones you can grow your filesystem on every drive:
```ssh
btrfs filesystem resize 1:max /mnt/btrfs/
btrfs filesystem resize 2:max /mnt/btrfs/
```

Status before:
```ssh
lsblk
```
```
sde      8:64   0   6G  0 disk /mnt/btrfs
sdf      8:80   0   6G  0 disk
```
```
Label: none  uuid: 706e4f5a-c829-45f4-a8aa-56375ea4d850
        Total devices 2 FS bytes used 256.00KiB
        devid    1 size 3.00GiB used 896.00MiB path /dev/sde
        devid    2 size 3.00GiB used 896.00MiB path /dev/sdf
```



Status after:
```
Label: none  uuid: 706e4f5a-c829-45f4-a8aa-56375ea4d850
        Total devices 2 FS bytes used 256.00KiB
        devid    1 size 6.00GiB used 608.00MiB path /dev/sde
        devid    2 size 6.00GiB used 608.00MiB path /dev/sdf
```




