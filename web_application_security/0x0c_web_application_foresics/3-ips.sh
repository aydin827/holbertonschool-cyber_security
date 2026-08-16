#!/bin/bash

grep -E "Failed password|Invalid user" auth.log | awk -F 'from ' '{print $2}' | awk '{print $1}' | sort -u > /tmp/failed_ips
grep "Accepted password" auth.log | awk -F 'from ' '{print $2}' | awk '{print $1}' | sort -u > /tmp/accepted_ips
comm -12 /tmp/failed_ips /tmp/accepted_ips | wc -l
