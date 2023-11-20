# gen.sh

dir_gen() {
  DIR_PATH=""
  DATE=$(date +%d%m%y)
  DATE_LOG=$(date +%d-%m-%y)

  local repeat=0
  if [[ ${#DIR_NAME} -ge 5 ]]; then
    repeat=1
  elif [[ ${#DIR_NAME} -ge 3 ]]; then
    repeat=2
  elif [[ ${#DIR_NAME} -ge 2 ]]; then
    repeat=3
  else
    repeat=5
  fi

  for (( i=0; i<${DIR_NUM}; i++ )) do
    for (( j=0; j<${#DIR_NAME}; j++ )) do
      for (( k=1; k<=$repeat + $i; k++ )) do
        DIR_PATH+=${5:$j:1}
      done
    done
  DIR_PATH="$1/$DIR_PATH""_""$DATE"
  free_space $FILE_SIZE
  mkdir -p $DIR_PATH
  echo "$DIR_PATH"" ""$DATE_LOG" >> "file.log"
  file_gen $FILE_NAME $FILE_SIZE $FILE_NUM $DIR_PATH
  DIR_PATH=""
  done
}

file_gen() {
  FILE_PATH=""
  DATE=$(date +%d%m%y)
  DATE_LOG=$(date +%d-%m-%y)
  NO_EXT=${1%.*}
  EXT=${1#*.}
  local repeat=0

  if [[ ${#NO_EXT} -ge 5 ]]; then
    repeat=1
  elif [[ ${#NO_EXT} -ge 4 ]];then
    repeat=2
  elif [[ ${#NO_EXT} -ge 2 ]]; then
    repeat=3
  else
    repeat=5
  fi

  for (( i1=0; i1<${FILE_NUM}; i1++ )) do
    for (( j=0; j<${#NO_EXT}; j++ )) do
      for (( k=1; k<=$repeat + $i1; k++ )) do
        FILE_PATH+=${NO_EXT:$j:1}
      done
    done
  FILE_PATH="$DIR_PATH/$FILE_PATH""_""$DATE"".""$EXT"
  free_space $FILE_SIZE
  dd if=/dev/zero of=$FILE_PATH bs=1M count=${FILE_SIZE%"mb"} 2>/dev/null
  echo "$FILE_PATH"" ""$DATE_LOG"" ""$FILE_SIZE" >> file.log
  echo "$FILE_PATH"" ""$DATE_LOG"" ""$FILE_SIZE"
  FILE_PATH=""
  done
  
}