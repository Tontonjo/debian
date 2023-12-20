```ssh
wipefs --all -t btrfs /dev/sdX /dev/sdX
```

```ssh
btrfs filesystem show
```

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
mount -o degraded /dev/sdX /mnt/data
```

```ssh
btrfs device usage /mnt/data/
```

after a disk has been failing or being replaced:
```ssh
btrfs filesystem balance /mnt/data
```
![image](https://github.com/Tontonjo/debian/assets/60965766/fdf02944-f8dc-459c-a232-c46273f5f15b)
![image](https://github.com/Tontonjo/debian/assets/60965766/3483e892-df3b-4337-9a56-224b27a680f2)



