# gen.sh

dir_gen() {
    DIR_PATH=""
    DATE=$(date +%d%m%y)
    LOG=$(date +%d-%m-%y)
    local repeat=0
    local file_name=$3

    if [ ${#file_name} -ge 4 ]; then
      repeat=1
    elif [ ${#file_name} -ge 2 ]; then
      repeat=2
    else
      repeat=4
    fi

    for (( i=0; i<$2; i++ )) do
      for (( j=0; j<${#3}; j++ )) do
        for (( k=1; k<=repeat + $i; k++ )) do
          DIR_PATH+=${file_name:$j:1}
        done
      done
    DIR_PATH="$1/$DIR_PATH""_""$DATE"
    mkdir -p $DIR_PATH
    echo $DIR_PATH" "$LOG >> log.txt
    file_gen $DIR_PATH $4 $5 $6
    DIR_PATH=""
    done
          
}

file_gen() {
    FILE_PATH=""
    DATE=$(date +%d%m%y)
    LOG=$(date +%d-%m-%y)
    SIZE=$(echo $4 | grep -o '[0-9]*')
    local repeat=0
    local file_name=${3%.*}
    local file_ext=${3#.*}
    if [ ${#file_name} -ge 4 ]; then
      repeat=1
    elif [ ${#file_name} -ge 2 ]; then
      repeat=2
    else
      repeat=4
    fi

    for (( i1=0; i1<$2; i1++ )) do
      for (( j=0; j<${#file_name}; j++ )) do
        for (( k=1; k<=repeat + $i1; k++ )) do
          FILE_PATH+=${file_name:$j:1}
        done
      done
    FILE_PATH="$1/$FILE_PATH""_""$DATE"".""$file_ext"
	  FREESPACE=$(df -k / | tail -1 | awk '{print $4}')
	  if [ $FREESPACE -lt 1048576 ]; then
		echo "Not enough space to create files"
		exit 1
	  fi
	  dd if=/dev/zero of=$FILE_PATH bs=1K count=$SIZE 2>/dev/null
    echo $FILE_PATH" "$LOG" "$4 >> file.log
    FILE_PATH=""
    done
}