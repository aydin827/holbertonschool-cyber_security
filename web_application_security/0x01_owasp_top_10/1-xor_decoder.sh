#!/bin/bash

python3 -c '
import sys
import base64

hash_input = sys.argv[1].replace("{xor}", "")
decoded_bytes = base64.b64decode(hash_input)

for byte in decoded_bytes:
    print(chr(byte ^ 95), end="")
print("")
' "$1"
