# time.sh

time_del() {
  read -p "Enter start date in format MM/DD/YYYY: " START_DATE
  check_date $START_DATE
  read -p "Enter start time: " START_TIME
  check_time $START_TIME
  read -p "Enter finish date in format MM/DD/YYYY: " FIN_DATE
  check_date $FIN_DATE
  read -p "Enter finish time: " FIN_TIME
  check_time $FIN_TIME

  START_DATE=$(date -d "${START_DATE} ${START_TIME}" +%s)
  FIN_DATE=$(date -d "${FIN_DATE} ${FIN_TIME}" +%s)

  FILES=$(find / -newermt "@"$START_DATE -not -newermt "@"$FIN_DATE 2>/dev/null)
  
  if [[ -z "$FILES" ]]; then
    echo "No files found for this interval"
  else
    echo "$FILES"
    read -p "Delete these files? [y/n]" ans
    if [ "$ans" == "y" ]; then
      for i in $FILES; do
        if [ -f "$i" ]; then
		  rm -rf $i
        fi
      done
      echo "Files deleted"
    else
      echo "Operation canceled"
    fi
  fi

}

check_date() {
  CHECK=$(date -d $1 2>/dev/null)
  if ! [[ $CHECK ]]; then
    echo "Error: invalid date $1"
    exit 1
  fi
}

check_time() {
  local time=$1
  if ! [[ $time =~ ^[0-9]{2}:[0-9]{2}$ ]]; then
    echo "Error: invalid time $1"
    exit 1
  fi

  hours=${time%%:*}
  mins=${time#*:}

  if [[ $hours -ge 25 ]]; then
    echo "Error: invalid hours $1"
    exit 1
  elif [[ $mins -ge 60 ]]; then
    echo "Error: invalid mins $1"
    exit 1
  fi
}