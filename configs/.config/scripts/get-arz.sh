#!/bin/sh

curl https://bonbast.com/ > bonbast.html

#pup=/data/data/com.termux/files/home/go/bin/pup
usd1=$(cat bonbast.html | pup 'td[id=usd1] text{}')
usd2=$(cat bonbast.html | pup 'td[id=usd2] text{}')


eur1=$(cat bonbast.html | pup 'td[id=eur1] text{}')
eur2=$(cat bonbast.html | pup 'td[id=eur2] text{}')

result="$  ▾ $usd1 ▴ $usd2 \n€  ▾ $eur1 ▴ $eur2"
notify-send "$(echo -e "${result} ")"
