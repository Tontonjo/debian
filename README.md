# debian
A repo for Debian aimed scripts and documentation

## Tonton Jo  
### Join the community:
[![Youtube](https://badgen.net/badge/Youtube/Subscribe)](http://youtube.com/channel/UCnED3K6K5FDUp-x_8rwpsZw?sub_confirmation=1)
[![Discord Tonton Jo](https://badgen.net/discord/members/h6UcpwfGuJ?label=Discord%20Tonton%20Jo%20&icon=discord)](https://discord.gg/h6UcpwfGuJ)
### Support my work, give a thanks and help the youtube channel:
[![Ko-Fi](https://badgen.net/badge/Buy%20me%20a%20Coffee/Link?icon=buymeacoffee)](https://ko-fi.com/tontonjo)
[![Infomaniak](https://badgen.net/badge/Infomaniak/Affiliated%20link?icon=K)](https://www.infomaniak.com/goto/fr/home?utm_term=6151f412daf35)
[![Express VPN](https://badgen.net/badge/Express%20VPN/Affiliated%20link?icon=K)](https://www.xvuslink.com/?a_fid=TontonJo)  

## Execute:
### Hostname_changer.sh
```ssh
if [[ $(id -u) -ne 0 ]] ; then sudo wget -q -O hostname_changer.sh https://github.com/Tontonjo/debian/raw/master/hostname_changer.sh && sudo bash hostname_changer.sh; else wget -q -O hostname_changer.sh https://github.com/Tontonjo/debian/raw/master/hostname_changer.sh && bash hostname_changer.sh; fi
```
