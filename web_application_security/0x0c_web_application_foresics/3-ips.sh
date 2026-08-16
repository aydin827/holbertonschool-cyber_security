#!/bin/bash

grep "Accepted" auth.log | awk '{print $(NF-5)}' | sort -u | wc -l
