#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: ./create_screenshots.sh <video-file> <output-file-prefix>"
    exit
fi

video_file=$1
output_file_prefix=$2
number_of_screenshots=5

duration=`ffprobe -show_streams ${video_file} 2>&1 | grep "^duration=" | cut -d'=' -f2`
seek_factor=`echo "scale=5; ($duration-0.1)/($number_of_screenshots-1)" | bc`

echo "Video is ${duration} seconds long..."
echo "Capturing frame every ${seek_factor} seconds..."
for ss_idx in `seq 0 $((number_of_screenshots-1))`; do
	ss=`echo "${ss_idx} * ${seek_factor}" | bc`
	echo "Capturing screenshot at ${ss}s..."
	ffmpeg -ss ${ss} -i ${video_file} -vframes 1 -f image2 tmp_${ss_idx}.jpg
done

montage tmp_2.jpg -tile 1x1  -border 2 -geometry 496x+0+0 final_1.jpg
montage tmp_{0,1,3,4}.jpg -tile 2x2  -border 2 -geometry 246x+0+0 final_2.jpg
montage final_1.jpg final_2.jpg -tile 1x2 -geometry +0+0 "${output_file_prefix} - 500px.jpg"
rm -f final_1.jpg final_2.jpg

montage tmp_2.jpg -tile 1x1  -border 2 -geometry 996x+0+0 final_1.jpg
montage tmp_{0,1,3,4}.jpg -tile 2x2  -border 2 -geometry 496x+0+0 final_2.jpg
montage final_1.jpg final_2.jpg -tile 1x2 -geometry +0+0 "${output_file_prefix} - 1000px.jpg"
rm -f final_1.jpg final_2.jpg

rm -f tmp_{0,1,2,3,4}.jpg