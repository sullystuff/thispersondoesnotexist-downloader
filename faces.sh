#!/bin/bash

# Configuration

while test $# -gt 0; do
           case "$1" in
                -n)
                    shift
                    num=$1
                    shift
                    ;;
                *)
                   echo "$1... you cant do that!"
                   return 1;
                   ;;
          esac
  done  


max=$num

url=https://www.thispersondoesnotexist.com/image
imgdir=faces
printf 'Downloading '$max' images.'
printf '\n'
printf 'Images will get their .jpg extention once all are downloaded.'
printf '\n'
# Loop to download images $max number of times
count=1
while [[ $count -le $max ]]
do
wget -q $url -P faces/
printf '\r%2d Completed' $count
((count++))
done

# Create images directory if it doesn't exist
mkdir -p $imgdir
cd $imgdir

# Checks each file downloaded for file extension, to avoid overwriting existing images
for f in *; do
if [[ $f != *.jpg ]] # Checks each file for .jpg extension
then
mv $f `basename $f `.$$.jpg; # Adds process ID ($$) and .jpg extension (E.g. image.7232.jpg
fi
done;

# Complete!
printf '\n'
printf 'Downloads complete! All images saved to images/'
printf '\n'
