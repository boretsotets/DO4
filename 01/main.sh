#!/bin/bash

source ./input.sh
source ./gen.sh

if [[ $# -ne 6 ]]; then
    echo Incorrect usage
    echo "Usage: bash $0 [ABSPATH] [SUBFOLDERNUMBER] [SUBFOLDERNAME] [FILENUMBER] [FILENAME] [FILESIZE]"
    exit 1;
fi

check_directory "$1"
check_numeric_param "$2"
check_file_name "$3"
check_numeric_param "$4"
check_file_ext "$5"
check_file_size "$6"

dir_gen "$@"