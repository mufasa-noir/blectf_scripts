#!/bin/bash
for ((i=0; i<=1000; i++));do
        command=$(gatttool -b 04:83:08:58:46:06  --char-read -a 0x003e|awk -F: '{print $2}'|tr -d ' '|xxd -r -p;printf '\n')

        if [[ "$command" == "Read me 1000 times" ]];then
                continue
        else
                echo "$command"
                break
        fi
done

