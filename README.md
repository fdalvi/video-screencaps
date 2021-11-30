Script to take screencaps of the input video equally spaced across the entire
video. Usage:

```bash
./create_screenshots.sh <video-file-path> <output-file-prefix>
```

The script will output two images, one that is 500px wide and one that is 1000px
wide. Each image will have 5 screencaps - a large screencap from the center 
of the video at the top, and 4 smaller ones arranged in a grid below it.


<p align="center">

![Sample Render](/docs/sample%20-%20500px.jpg?raw=true "Sample Render")

</p>

**Update (Nov 30, 2021):** There is an [updated script](https://github.com/rootwork/bash-scripts/blob/main/videos/vidcap.sh) by [@rootwork](https://github.com/rootwork) that has several more options and command line arguments for customization of the output. See [#1](https://github.com/fdalvi/video-screencaps/issues/1) for a summary.
