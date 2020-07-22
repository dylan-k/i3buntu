#!/bin/bash
#set -

cd ~/tmp

sudo kill $(pgrep -f Telegram)

wget https://telegram.org/dl/desktop/linux -O tg.tar.gz

tar -xvf tg.tar.gz

sudo mv ./Telegram/Telegram /usr/local/bin/


