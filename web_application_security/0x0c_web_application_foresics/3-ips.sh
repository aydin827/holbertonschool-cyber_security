#!/bin/bash

grep "Accepted" auth.log | awk '{print $10}' | sort -u | wc -l
