#! /bin/bash
#
# go.bash
# Copyright (C) 2019 zach <zach@mandark>
#
# Distributed under terms of the MIT license.
#

for i in {1..14}
do
  convert $i.jpg -resize 60x -extent 60x1 -colorspace Gray -compress none $i.ppm
  j=0
  for num in `tail -1 $i.ppm`; do
    if [ $((j % 3)) -eq 0 ]; then
      echo -n $num"," >> master.csv
    fi
    j=$((j + 1))
  done
  echo "" >> master.csv
done

