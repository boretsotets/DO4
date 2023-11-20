# log.sh

log() {
    read -p "Enter path to the log file: " LOG_FILE
    if [[ -f "$LOG_FILE" ]]; then
      echo "Deliting files..."
      rm -rf $(cat $LOG_FILE | awk '{print$1}')
      echo "Success!"
    else
      echo "Error: log file $LOG_FILE not found"
      exit 1
    fi
}