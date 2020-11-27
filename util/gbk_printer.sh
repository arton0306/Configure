#!/bin/bash

# ref from: https://stackoverflow.com/questions/50231194/how-to-pipe-tail-f-to-iconv-cmmand
# usage `tail -f test.log | gbk_printer.sh`

# iconv.sh
IFS=''
while read line
do 
    echo "$line" | iconv -f gbk -t utf-8
done  < "${1:-/dev/stdin}"
