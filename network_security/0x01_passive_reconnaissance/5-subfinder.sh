#!/bin/bash
subfinder -d $1 -silent | while read sub; do echo "$sub,$(dig +short $sub)"; done | tee $1.txt
