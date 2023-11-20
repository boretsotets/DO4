#!/bin/bash

source ./input.sh
source ./logger.sh

if [ $# -ne 3 ]; then
  echo "Error: script is run with 3 parameters"
  echo "Usage: $0 [DIRECTORYNAME] [FILENAME] [FILESIZE]"
  exit 1
fi

dirname_check $1
filename_check $2
filesize_check "$3"
DIR_NAME=$1
FILE_NAME=$2
FILE_SIZE=$3

logger $DIR_NAME $FILE_NAME $FILE_SIZE