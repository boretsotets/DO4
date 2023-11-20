#!/bin/bash

source ./logs.sh

if [[ $# -ne 0 ]]; then
  echo "Error. No parameters used here"
  exit 1
fi

for (( i=0; i<=5; i++ )) do
  DATE=$(date -d "$((RANDOM % 365)) days ago" +%s )
  logs $DATE
done