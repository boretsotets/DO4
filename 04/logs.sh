# logs.sh

METHODS=(GET POST PUT PATCH DELETE)
RESPONSES=(200 201 400 401 403 404 500 501 502 503)
AGENTS=(Mozilla "Google Chrome" Opera Safari "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library" "net tool")

logs() {
  LOGS_COUNT=$(shuf -i 100-1000 -n 1)
  STEP=$((86400 / $LOGS_COUNT))
  FILENAME=$(date -d @"$DATE" '+%Y-%m-%d')".log"
  COUNT=0
  for (( j=0; j<$LOGS_COUNT; j++ )) do
    IP=$(printf "%d.%d.%d.%d\n" "$((RANDOM % 256))" "$((RANDOM % 256))" "$((RANDOM % 256))" "$((RANDOM % 256))")
    METHOD=${METHODS[ $RANDOM % ${#METHODS[@]} ]}
    RESPONSE=${RESPONSES[ $RANDOM % ${#RESPONSES[@]} ]}
    AGENT=${AGENTS[ $RANDOM % ${#AGENTS[@]} ]}
    URL="/"$(echo $RANDOM | md5sum | head -c 20)
    RSTEP=$(( $RANDOM % $STEP ))
    RTIME=$(date -d @"$(($DATE + $RSTEP))" '+%d/%b/%Y:%T %z')
    DATE=$(( $DATE + $RSTEP ))
    echo "$IP - - [$RTIME] \"$METHOD $URL HTTP/1.1\" $RESPONSE 0 \"-\" \"$AGENT\"" >> $FILENAME

    COUNT=$(($COUNT + 1))
    printProgressBar $COUNT $LOGS_COUNT $2

  done
  printf "\n"
}

printProgressBar() {
    local width=50  # Width of the progress bar in characters
    local percent=$(( $1 * 100 / $2 ))  # Calculate percentage
    local numChars=$(( $width * $percent / 100 ))  # Calculate the number of characters to fill
    local numSpaces=$(( $width - $numChars ))  # Calculate the number of spaces

    # Build the progress bar string
    local progressBar="$FILENAME $3 ["
    for ((x = 0; x < numChars; x++)); do
        progressBar+="▓"
    done
    for ((x = 0; x < numSpaces; x++)); do
        progressBar+=" "
    done
    progressBar+="] $percent%"

    # Print the progress bar
    printf "\r%s" "$progressBar"
}