#!/bin/bash
# Description: Decodes a WebSphere XOR encoded password hash.

# Strip the {xor} prefix if present
input_hash=${1#"{xor}"}

# Decode from Base64 and process byte by byte
decoded_bytes=$(echo -n "$input_hash" | base64 -d 2>/dev/null)

# Exit if base64 decoding fails or input is empty
if [ -z "$decoded_bytes" ]
then
	exit 1
fi

# Loop through each character to perform XOR with '_'
for (( i=0; i<${#decoded_bytes}; i++ ))
do
	# Get the character
	char="${decoded_bytes:$i:1}"
	
	# Get the ASCII decimal value of the character
	printf -v ascii_val '%d' "'$char"
	
	# Perform XOR with 95 (ASCII for '_')
	xor_val=$(( ascii_val ^ 95 ))
	
	# Print the decoded character
	printf "\\x$(printf '%02x' "$xor_val")"
done

# Print a final newline character as required
printf "\n"
