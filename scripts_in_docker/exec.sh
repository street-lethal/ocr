#!/bin/bash
cd work
ls *.zip > zips.txt
while read zip
do
  export filename=$(echo $zip | sed -e "s/.zip$//")
  mkdir "$filename"
  cd "$filename"
  unzip "../$zip"

  ls *.jpg > jpgs.txt
  while read jpg
  do
    export imagename=$(echo $jpg | sed -e "s/.jpg$//")
    tesseract -l jpn+eng "$jpg" "$imagename"
    rm "$jpg"
  done < jpgs.txt
  rm jpgs.txt

  cd ..

  chown 1000:1000 -R /app_root/work/
done < zips.txt
rm zips.txt
