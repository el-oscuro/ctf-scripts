#!/bin/bash
if [ `ls *.opvn | wc` != 1 ]; then
	echo $0:  Create a separate directory for your ctf project and save your openvpn file in it
	echo $0:  cd to that directy and run $0.  It will open up 5 tabs, one with your VPN, another with 
	echo $0:  metasploit, and 3 addtional tabs
	exit 1
fi

OVPN=`ls *.opvn`

mate-terminal --tab --working-directory=$PWD --command=openvpn\ $OPVN
mate-terminal --tab --working-directory=$PWD --command=msfconsole
mate-terminal --tab --working-directory=$PWD 
mate-terminal --tab --working-directory=$PWD 


