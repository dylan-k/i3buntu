#!/bin/bash
set -e
ID=$1

TITLE=$(curl -S "https://....atlasian.com |  grep -o "<title>[^<]*" | tail -c+8)

echo "$TITLE" > ~/todo
~/bin/gtask_add day "$TITLE"
