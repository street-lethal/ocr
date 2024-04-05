#!/bin/bash

cd work || exit
ls ./*.zip > zips.txt
while read -r zip
do
  declare filename
  filename=${zip//.zip/}
  mkdir "$filename"
  cd "$filename" || exit
  unzip "../$zip"

  ls ./*.jpg > jpgs.txt
  while read -r jpg
  do
    declare imagename
    imagename=${jpg//.jpg/}
    tesseract -l jpn+eng "$jpg" "$imagename"
    rm "$jpg"
  done < jpgs.txt
  rm jpgs.txt

  cd ..

  chown 1000:1000 -R /app_root/work/
done < zips.txt
rm zips.txt
