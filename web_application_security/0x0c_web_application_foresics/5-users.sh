#!/bin/bash

grep "new user:" auth.log | sed 's/.*name=//' | cut -d',' -f1 | sort -u | paste -sd,
