#!/bin/bash
subfinder -d $1 -silent > subs.txt
while read sub; do
  ip=$(dig +short $sub)
  echo "$sub,$ip"
done < subs.txt > $1.txt
