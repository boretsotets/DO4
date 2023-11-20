# logger.sh

source ./gen.sh
source ./free_space.sh

logger() {
  start_time=$(date +%T)
  free_space $start_time $3
  FOLDERS=$(find / -type d | grep -v bin | sort -R)

  for i in $FOLDERS; do
    if [[ -w "$i" ]]; then
      DIR_NUM=$(shuf -i 1-5 -n 1)
      FILE_NUM=$(shuf -i 1-5 -n 1)
      dir_gen $i $DIR_NUM $DIR_NAME $FILE_NUM $FILE_NAME $FILE_SIZE
    fi
  done
  log_fin
}

log_fin() {
  fin_time=$(date +%T)
  run_time=$(date -u -d @$(( $(date -d "$fin_time" +%s) - $(date -d "$start_time" +%s ) )) +"%T")
  echo "Start time: $start_time" >> "file.log"
  echo "Finish time: $fin_time" >> "file.log"
  echo "Total time: $run_time" >> "file.log"

  echo "Start time: $start_time"
  echo "Finish time: $fin_time"
  echo "Total time: $run_time"
}