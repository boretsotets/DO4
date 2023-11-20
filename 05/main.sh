#!/bin/bash

source ./output.sh

if [[ $# -ne 1 ]]; then
  echo "Error: need one parameter"
  exit 1
elif ! [[ $1 =~ ^[1-4]$ ]]; then
  echo "Error: parameter should be [1-4]"
  exit 1
fi

output $1

