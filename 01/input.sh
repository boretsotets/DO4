# input.sh

check_directory() {
  local path="$1"
  if ! [[ "$path" =~ ^/ ]]; then
    echo "Error: '$path' is not aboslute path"
    exit 1
  elif ! [ -d "$path" ]; then
    echo "Error: '$path' no such directory"
    exit 1
  fi
}

check_numeric_param() {
  local number="$1"
  if ! [[ $number =~ ^[0-9]+$ ]]; then
    echo "Error: '$number' should be a numeric parameter"
    exit 1
  elif [ $number -le 0 ]; then
    echo "Error: $number should be greater than 0"
    exit 1
  fi
}

check_file_name() {
  local file="$1"
  if ! [[ $file =~ ^[A-Za-z]{1,7}$ ]]; then
    echo "Error: '$file' should be 1-7 letters"
  fi
}

check_file_ext() {
  local file="$1"
  if ! [[ "$file" =~ ^[A-Za-z]{1,7}\.[A-Za-z]{1,3}$ ]]; then
    echo "Error: '$file' should be 1-7 letters for name and 1-3 letter for extension"
  fi
}

check_file_size() {
  local size="$1"
  if ! [[ "$size" =~ ^[1-9][0-9]?kb$|100kb$ ]]; then
    echo "Error: '$size' should be 1-100 kb"
  fi
}