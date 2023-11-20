# free_space.sh

#source ./logger.sh

free_space() {
    FREESPACE=$(df -k / | tail -1 | awk '{print $4}')
    local filesize_num="${FILE_SIZE%"mb"}"
    if [[ $FREESPACE -lt $((filesize * 1024 + 1048576)) ]]; then
      echo "No space to create file"
      log_fin 
      exit 1
    fi
}

