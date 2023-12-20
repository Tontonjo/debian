```wipefs --all -t btrfs /dev/sdX /dev/sdX```

```btrfs filesystem show```

```mkfs.btrfs -m raid1 -d raid1 /dev/sdX /dev/sdX```

```mkdir /mnt/data```

```mount /dev/sdX /mnt/data```

```trfs device usage /mnt/data/```

