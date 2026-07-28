#!/bin/bash
for ((i=0; i<=255; i++));do
	hex=$(printf "%02x" "$i")
	gatttool -b 04:83:08:58:46:06 --char-write-req -a 0x003c --value=$hex >/dev/null
	
	if [[ "$(gatttool -b 04:83:08:58:46:06  --char-read -a 0x003c|awk -F: '{print $2}'|tr -d ' '|xxd -r -p;printf '\n')" == "Brute force my value 00 to ff" ]];then
		echo "Invalid Hex Value: $hex"
		continue
	else
		echo "The Valid Hex Value is: $hex"
		break
	fi
done

