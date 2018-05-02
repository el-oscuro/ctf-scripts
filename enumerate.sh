#!/bin/bash
if [ "$1" == "" ]; then
  echo Usage: $0 http://url
  exit 1
fi
IP=`echo $1 | cut -f3 -d'/' | cut -f1 -d":"`
echo Host: $IP
nmap $IP
nmap -sS -v -A $IP | tee $IP-nmap.txt
uniscan -u $1 -qweds
cp -v /usr/share/uniscan/report/$IP.html uniscan-$IP.html
nikto -host $1 -output $IP-nikto.txt
dirb $1 -o $IP-dirb.txt 


