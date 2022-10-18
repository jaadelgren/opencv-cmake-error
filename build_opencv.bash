# !/bin/bash

# Build OpenCV for Linux host.

BUILD_TYPE=Release
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"
INSTALL_DIR="$SCRIPT_DIR/install"
OPENCV_VERSION=4.6.0

if [[ ! -d $SCRIPT_DIR/opencv ]]; then
    git clone https://github.com/opencv/opencv.git
    cd opencv
    git checkout tags/$OPENCV_VERSION
fi

cd $SCRIPT_DIR/opencv

# Option to rebuild OpenCV from scratch
if [[ $1 == r* ]]; then
    echo "Rebuilding OpenCV"
    if [[ -d build ]]; then
        rm -r build
    fi
fi

mkdir -p build && cd build

cmake \
    -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
    -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DWITH_OPENEXR=OFF \
    -DWITH_EIGEN=ON \
    -DWITH_CUDA=OFF \
    -DWITH_PROTOBUF=OFF \
    -DWITH_QUIRC=OFF \
    -DBUILD_opencv_apps=OFF \
    -DBUILD_opencv_dnn=OFF \
    -DBUILD_opencv_highgui=OFF \
    -DBUILD_opencv_ml=OFF \
    -DBUILD_opencv_objc=OFF \
    -DBUILD_opencv_objdetect=OFF \
    -DBUILD_opencv_video=OFF \
    -DBUILD_opencv_videoio=OFF \
    -DBUILD_opencv_gapi=OFF \
    ..
# -DWITH_ADE=OFF \

make -j8
make install
 