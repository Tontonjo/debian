# Led control guide

### List your available devices:  
```ssh
ls /sys/class/leds/
```
### List available "triggers" using your device name (replace apu4:green:led1)
```ssh
cat /sys/class/leds/apu4:green:led1/trigger
```
### Send your trigger to your led
```ssh
echo 'disk-activity' > /sys/class/leds/apu4:green:led1/trigger
```
