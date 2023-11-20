#!/bin/bash

source ./log.sh
source ./time.sh
source ./mask.sh

if [[ $# -ne 1 ]]; then
  echo "Error: need 1 parameter. Usage: $0 [1-3]"
elif [[ $1 == "1" ]]; then
  log
elif [[ $1 == "2" ]]; then
  time_del
elif [[ $1 == "3" ]]; then
  mask
else
  echo "Error: invalid parameter. Parameter should be 1-3"
  exit 1
fi