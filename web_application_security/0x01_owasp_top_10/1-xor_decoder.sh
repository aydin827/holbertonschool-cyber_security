#!/bin/bash

input="$1"
clean="${input#\{xor\}}"

echo "$clean" | base64 -d | xxd -p | tr -d '\n' | sed 's/../& /g' | awk '{for(i=1;i<=NF;i++) printf "%c", strtonum("0x"$i)^42}'
