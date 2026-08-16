#!/bin/bash

FILE=${1:-auth.log}
grep ssh $FILE
