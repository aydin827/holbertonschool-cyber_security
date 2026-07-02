#!/bin/bash

input="$1"
clean="${input#\{xor\}}"

echo "$clean" | base64 -d | python3 -c '
import sys

data = sys.stdin.buffer.read()
key = b"websphere"

out = bytes([data[i] ^ key[i % len(key)] for i in range(len(data))])
print(out.decode(errors="ignore"))
'
