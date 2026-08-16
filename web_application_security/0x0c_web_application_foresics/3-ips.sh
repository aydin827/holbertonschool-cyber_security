#!/bin/bash

grep "Accepted" auth.log | awk '{print $11}' | grep -v '^10\.' | sort -u | wc -l
