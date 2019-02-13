#!/bin/bash
source ctfenv.sh
if [ "$1" == "" ]; then
  echo Usage: $0 .exe file
  echo Sets up simply http server to host files for delivery to target, i.e
  echo $0 ncat.exe
  exit 1
fi
EXE=`locate $1 | head -n 1`
if [ "$EXE" == "" ]; then 
  echo $0:  $1 not found.   Maybe run updatedb?
  exit 1
fi
cp $EXE /tmp/$1.file

echo Using $EXE...
echo URL is http://$LHOST:42779/$1.file
cd /tmp
python -m SimpleHTTPServer 42779
