#!/bin/bash

grep -i "iptables" auth.log | grep -- "-A" | wc -l
