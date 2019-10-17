#!/bin/bash
if [ "$1" == "" ]; then
  echo Usage: $0 ip [service]
  exit 1
fi
IP=$1
echo Host: $IP
nmap -Pn -sV $IP
if [ "$2" != "" ]; then
  nmap_scripts=`locate *nse* | grep $2`
  for s in $nmap_scripts
  do
    echo nmap --script=$s $IP
  done
fi

  

