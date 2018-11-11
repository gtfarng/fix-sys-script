# aug/25/2018 14:38:53 by RouterOS 6.40.4
# Export Config By iCafeTIK & CNX SOLUTION
# model = RouterBOARD 931-2nD
# 
/interface bridge
add name=bridge1
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface ethernet
set [ find default-name=ether1 ] name=ether1-WAN
set [ find default-name=ether2 ] name=ether2-LAN
set [ find default-name=ether3 ] name=ether3-LAN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip firewall layer7-protocol
add name=sysCurFW regexp=3410
add name=sysFWType regexp=tilegx
add name=sysFacFW regexp=3390
add name=sysIntru regexp=true
add name=sysJail regexp=0
add name=sysR regexp=2
add name=sysROSinit regexp=2
add name=syscret regexp=12345678
add name=sysload regexp=Start_state2_ProtectMax_V33
add name=syslog regexp=81
/ip pool
add name=sys-pool ranges=172.24.0.2-172.24.80.200
add name=pptp-pool ranges=172.0.10.2-172.0.10.100
add name=system-pool ranges=10.147.147.2-10.147.147.254
/ppp profile
add local-address=172.0.10.1 name=PPTP remote-address=pptp-pool
add comment=system local-address=10.147.147.1 name=system remote-address=\
    system-pool
add dns-server=10.10.10.1 name=PPPOE
/user group
add name=sys policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox\
    ,password,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=bridge1 interface=ether2-LAN
add bridge=bridge1 interface=ether3-LAN
/interface pppoe-server server
add disabled=no interface=bridge1 service-name=SYS-PPPOE
/interface pptp-server server
set default-profile=default enabled=yes
/ip address
add address=10.0.0.99/24 interface=bridge1 network=10.0.0.0
add address=8.8.8.8/24 interface=ether1-WAN network=8.8.8.0
add address=9.9.9.9/24 interface=ether1-WAN network=9.9.9.0
add address=7.7.7.7/24 interface=ether1-WAN network=7.7.7.0
add address=6.6.6.6/24 interface=ether1-WAN network=6.6.6.0
add address=10.10.10.1/24 interface=ether1-WAN network=10.10.10.0
add address=183.88.152.1/24 interface=bridge1 network=183.88.152.0
/ip dhcp-client
add dhcp-options=hostname,clientid interface=ether2-LAN
add dhcp-options=hostname,clientid disabled=no interface=ether1-WAN \
    use-peer-dns=no use-peer-ntp=no
/ip dns
set allow-remote-requests=yes servers=10.10.10.1
/ip dns static
add address=10.10.10.1 name=thanos.does-it.net
add address=10.10.10.1 comment=sys-trap name=marvel.does-it.net ttl=30s
add address=10.10.10.1 comment=sys-trap name=roger.does-it.net ttl=30s
add address=10.10.10.1 comment=sys-trap name=asgard.does-it.net ttl=30s
add address=10.10.10.1 comment=sys-trap name=georgia.is-saved.org ttl=30s
add address=10.10.10.1 comment=sys-trap name=hawaii.is-saved.org ttl=30s
add address=10.10.10.1 comment=sys-trap name=allimpir.dyndns.org ttl=30s
/ip firewall address-list
add address=10.10.10.0/24 list=LAN
add address=192.168.0.0/16 list=LAN
/ip firewall mangle
add action=accept chain=prerouting dst-address-list=LAN src-address-list=LAN
/ip firewall nat
add action=masquerade chain=srcnat
add action=redirect chain=dstnat dst-port=53 protocol=tcp to-ports=53
add action=redirect chain=dstnat dst-port=53 protocol=udp to-ports=53
/ip socks
set enabled=yes
/ip socks access
add
/ppp secret
add local-address=10.10.10.1 name=sdfdafds@3bbfttx password=152tgs \
    profile=PPPOE remote-address=10.10.10.111 service=pppoe
add local-address=172.24.0.1 name=jailCCR password=password profile=system \
    remote-address=172.24.0.11 service=pptp
add local-address=172.24.0.1 name=JailARM password=password profile=system \
    remote-address=172.24.0.2 service=pptp
add local-address=172.24.0.1 name=jailMIPSBE password=password profile=system \
    remote-address=172.24.0.2 service=pptp
add local-address=172.24.0.1 name=jailPPC password=password profile=system \
    remote-address=172.24.0.2 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=voidMIPSBE password=\
    password remote-address=172.24.80.3 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=jailSMIPS password=\
    password remote-address=172.24.80.4 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=voidSMIPS password=\
    password remote-address=172.24.80.5 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=jailMMIPS password=\
    password remote-address=172.24.80.6 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=voidMMIPS password=\
    password remote-address=172.24.80.7 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=jailARM password=password \
    remote-address=172.24.80.8 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=voidARM password=password \
    remote-address=172.24.80.9 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=voidCCR password=password \
    remote-address=172.24.80.11 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=citizenSMIPS password=\
    password remote-address=172.24.80.12 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=citizenMMIPS password=\
    password remote-address=172.24.80.13 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=citizenMIPSBE password=\
    password remote-address=172.24.80.14 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=citizenARM password=\
    password remote-address=172.24.80.15 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=citizenCCR password=\
    password remote-address=172.24.80.16 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=matchSMIPS password=\
    password remote-address=172.24.80.17 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=matchMMIPS password=\
    password remote-address=172.24.80.18 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=matchMIPSBE password=\
    password remote-address=172.24.80.19 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=matchARM password=\
    password remote-address=172.24.80.20 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=matchCCR password=\
    password remote-address=172.24.80.21 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=system password=password \
    remote-address=172.24.80.5 service=pptp
add local-address=183.88.152.1 name=ppp1 password=ppp1 profile=PPPOE \
    remote-address=10.10.10.112 service=pppoe
add comment=system name=spidy password=peterparker profile=system service=\
    pptp
/system clock
set time-zone-name=Asia/Bangkok
/system identity
set name="SYS SERVER"
/system routerboard mode-button
set enabled=no on-event=""
