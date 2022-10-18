# OpenCV GAPI/ADE Error
Simple repo to reproduce OpenCV GAPI/ADE error (bug report [here](https://github.com/opencv/opencv/issues/21447)).

## Instructions
Run the `build_opencv.bash` script to install OpenCV locally. Host machine should be Linux, tested on Ubuntu 20.04. Then, attempt to build the sample program:
```
mkdir build
cd build
cmake ..
```

And you should get a CMake error referencing `libade.a`.

NOTE: if you add the `-DWITH_ADE=OFF` option in `build_opencv.bash` then this particular issue is resolved, but 1) it is not immediately obvious from the rest of the build settings that this should be necessary, and 2) other issues come up while running CMake.
