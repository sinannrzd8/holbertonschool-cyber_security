#!/bin/bash

if [ -z "$1" ]; then
    exit 1
fi

input_hash="${1#"{xor}"}"

hex_data=$(echo -n "$input_hash" | base64 -d 2>/dev/null | od -An -v -tx1 | tr -d ' \n')

if [ -z "$hex_data" ]; then
    exit 1
fi

decoded_output=""

for (( i=0; i<${#hex_data}; i+=2 )); do
    byte_hex="${hex_data:$i:2}"
    byte_dec=$((16#$byte_hex))
    
    # WebSphere daxili XOR açarı: 95
    xor_dec=$(( byte_dec ^ 95 ))
    
    decoded_char=$(printf "\\$(printf '%03o' $xor_dec)")
    decoded_output="${decoded_output}${decoded_char}"
done

echo -n "$decoded_output"
