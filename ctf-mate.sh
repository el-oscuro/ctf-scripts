#!/bin/bash
script=`basename $0`
vpn_files=*.ovpn 
if [ "`ls *.ovpn | wc -l`" != "1" ]; then
  echo $script:  Create a separate directory for your ctf project and save your openvpn file in it
  echo $script:  cd to that directy and run $0.  It will open up 5 tabs, one with your VPN, another with 
  echo $script:  metasploit, and 3 addtional tabs
exit 1
fi

OVPN=`ls *.ovpn`

mate-terminal --tab --title="Open VPN" --working-directory=$PWD --command=openvpn\ $OVPN
mate-terminal --tab --title="Metasploit" --working-directory=$PWD --command=msfconsole
mate-terminal --tab --working-directory=$PWD 
mate-terminal --tab --working-directory=$PWD 


