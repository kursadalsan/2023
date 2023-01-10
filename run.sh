#!/bin/sh

mkdir $1 
cd $1
amass intel -whois -d $1 > 1.txt
amass enum -passive -df 1.txt > 2.txt
subfinder -dL 1.txt -o 3.txt
cat *.txt > 4.txt
httpx-toolkit -l 4.txt -o 5.txt -t 150
nuclei -rl 550 -bs 100 -s low -s medium -s high -s critical -l 5.txt 
