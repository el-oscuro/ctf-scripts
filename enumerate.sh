#!/bin/bash
if [ "$1" == "" ]; then
  echo Usage: $0 ip [service]
  exit 1
fi
IP=$1
echo Host: $IP
if [ ! -f ./$IP-portscan.txt ]; then
  ./port-scan $IP
fi
PORTS=$(grep "/tcp" $IP-portscan.txt | cut -f1 -d"/")
echo PORTS=$PORTS
NMAP_PORTS=$(echo $PORTS | sed 's/ /,/g')

NMAP_FILE=./nmap-$IP.txt
if [ ! -f $NMAP_FILE ]; then
  nmap -sV -p $NMAP_PORTS $IP | tee $NMAP_FILE
fi


if [ "$2" != "" ]; then
  nmap_scripts=`locate *nse* | grep $2`
  for s in $nmap_scripts
  do
    echo nmap --script=$s $IP
  done
fi

  

