#!/bin/bash
# cat  script_urls.txt | while read line
# do
#    echo $line
#    ./yt-dlp --write-thumbnail --format mp4  $line
# done
#
#
# rename mp4 file
# ls *.mp4 | while read -r __f; do
#   echo $__f
#   _fres=${__f// /}
#   _fres=${_fres//\'/}
#   _fres=${_fres//\[/}
#   _fres=${_fres//\]/}
#   _fres=${_fres//!/}
#   _fres=${_fres//-/}
#   mv "$__f" "$_fres"
#   echo $__f
#   echo $_fres
# done



#cut video  $() 等价于 ``
for __f in *.mp4; 
do
  time=$(ffprobe $__f 2>&1 | grep 'Duration' | cut -d ' ' -f 4 |cut -d ',' -f 1 )

  hour=`echo $time | cut -d ':' -f 1`
  min=`echo $time | cut -d ':' -f 2`
  secImill=`echo $time | cut -d ':' -f 3`
  second=`echo $secImill |cut -d '.' -f 1`
  million=`echo $secImill |cut -d '.' -f 2`

  echo "$__f" origin $hour:$min:$second.21 

  if [[ "$second" -gt "1" ]]; then
    second=$[$second-1]
    if [[ "$second" -lt "10" ]]; then
      second=0$second
    fi
  else
    min=`expr $min-1`
    if [[ "$min" -lt "10" ]]; then
      min=0$min
    fi
    second=59
  fi

  echo "---------------   $__f  \n"
  if [ "$__f" = "" ];then
    continue ;
  fi

  echo "$__f" -to $hour:$min:$second.21 -y -c copy "cut$__f"

  nohup ffmpeg -i $__f -to $hour:$min:$second.21 -y -c copy "cut$__f";
  #生成mts文件
  ffmpeg -i cut$__f -q 0 cut$__f.mts
  ffmpeg -i concat:"head.mts|cut$__f.mts" -c copy res_$__f
  
  rm cut$__f
  rm cut$__f.mts
  rm nohup.out

done

