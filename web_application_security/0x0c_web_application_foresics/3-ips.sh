#!/bin/bash

grep "Accepted" auth.log | awk -F 'from ' '{print $2}' | awk '{print $1}' | sort -u | wc -l
