#!/bin/bash
if [ "$0" == "-bash" ]; then
  SCRIPT=$0
else
  SCRIPT=`basename $0`  # For Messages
fi


ARG1=$1  # Save for later messages after shift

if [ "$SCRIPT" == "ctfenv.sh" ]; then
   (echo
    echo "$SCRIPT: Not sourced - will not update environment"
    echo
    echo "  Try running:"
    echo
    echo "    source $SCRIPT"  
    echo
    echo "  You can also add an alias to .bashrc or /etc/profile:"
    echo
    echo "  alias ctfenv=\'source $SCRIPT\'"
    echo) 1>&2
   exit 1  # not sourced
fi
LHOST=`ifconfig tun0 | grep "inet " | cut -c14\- | cut -f1 -d" "`
echo LHOST: $LHOST
