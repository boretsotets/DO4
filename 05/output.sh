# output.sh

output() {
  echo "ok"
  read -p "Enter the path to the log file: " log_file

  if ! [ -f "$log_path" ]; then
    echo "File does not exist"
    exit 1
  elif ! [ -r "$log_path" ]; then
    echo "User has no permission to read this file"
    exit 1
  fi

  if [[ $1 -eq 1 ]]; then
    echo "$(awk '{print|"sort -k9"}' $log_path)"
  elif [[ $1 -eq 2 ]]; then
    echo "$(awk '!x[$1]++' $log_file)"
  elif [[ $1 -eq 3 ]]; then
    echo "$(awk '{if ($9 ~ /^[4-5]/) print $0}' $log_path)"
  elif [[ $1 -eq 4 ]]; then
    echo "$(awk '{!x[$1]++; if ($9 ~ /^[4-5]/) print $0}' $log_path)"
  fi
}