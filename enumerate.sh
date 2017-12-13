#!/bin/bash
if [ "$1" == "" ]; then
  echo Usage: $0 IP
  exit 1
fi
nmap $1
nmap -sS -v -A $1 | tee $1-nmap.txt
uniscan -u http://$1 -qweds
cp /usr/share/uniscan/report/$1.html uniscan-$1.html
nikto -host $1 -output $1-nikto.txt
dirb -o $1-dirb.txt http://$1/


