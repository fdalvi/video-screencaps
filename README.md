Script to take screencaps of the input video equally spaced across the entire
video. Usage:

```bash
./create_screenshots.sh <video-file-path> <output-file-prefix>
```

The script will output two images, one that is 500px wide and one that is 1000px
wide. Each image will have 5 screencaps - a large screencap from the center 
of the video at the top, and 4 smaller ones arranged in a grid below it.