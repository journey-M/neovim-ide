#!/bin/bash
cat  script_urls.txt | while read line
do
   echo $line
   ./yt-dlp --write-thumbnail --format mp4  $line
done


#rename mp4 file
ls *.mp4 | while read -r __f; do
  echo $__f
  _fres=${__f// /}
  _fres=${_fres//\'/}
  _fres=${_fres//\[/}
  _fres=${_fres//\]/}
  _fres=${_fres//!/}
  _fres=${_fres//-/}
  mv "$__f" "$_fres"
  echo $__f
  echo $_fres
done



#cut video  $() 等价于 ``
for __f in *.mp4; 
do
  ffmpeg -i $__f -vf "setpts=0.972*PTS" res$__f 

done

