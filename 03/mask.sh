# mask.sh

mask() {
  read -p "Enter the mask: " MASK
  FILES=$(find / -name "$MASK" 2>/dev/null)
  echo "$FILES"
  read -p "Delete? " ans
  if [ "$ans" == "y" ]; then
    for i in $FILES; do
      if [ -f "$i" ]; then
        rm -rf "$i" 2>/dev/null
      fi
    done
  fi

}