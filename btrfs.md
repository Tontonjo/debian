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

