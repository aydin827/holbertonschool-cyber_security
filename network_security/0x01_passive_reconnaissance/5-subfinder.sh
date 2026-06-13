#!/bin/bash
subfinder -d "$1" -silent | while read sub; do dig +short "$sub" | while read ip; do echo "$sub,$ip"; done; done > "$1.txt"
