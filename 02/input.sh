# input.sh

dirname_check() {
  if ! [[ $1 =~  ^[A-Za-z]{1,7}$ ]]; then
    echo "Error: $1 should be 1-7 letters"
    exit 1
  fi
}

filename_check() {
  if ! [[ $1 =~  ^[A-Za-z]{1,7}\.[A-Za-z]{1,3}$ ]]; then
    echo "Error: $1 should be 1-7 letters for name and 1-3 letters for extension"
    exit 1
  fi 
}

filesize_check() {
  if ! [[ "$1" =~ ^[1-9][0-9]?mb$|100mb$ ]]; then
    echo "Error: $1 should be file size 1-100mb"
    exit 1
  fi
}