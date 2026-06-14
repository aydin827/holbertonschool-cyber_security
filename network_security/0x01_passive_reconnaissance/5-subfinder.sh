#!/bin/bash

subfinder -silent -d $1 | while read sub; do
    ip=$(dig +short $sub | head -n 1)
    [ -n "$ip" ] && echo "$sub,$ip"
done > $1.txt
