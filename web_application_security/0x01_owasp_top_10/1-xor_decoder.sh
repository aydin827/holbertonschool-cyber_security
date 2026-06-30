#!/bin/bash
input="$1"
clean="${input#\{xor\}}"
echo "$clean" | base64 -d
