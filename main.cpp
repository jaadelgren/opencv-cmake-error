#include <cstdlib>
#include <iostream>

#include <opencv2/imgproc.hpp>
#include <opencv2/imgcodecs.hpp>

// Read an image and display its size
int main(int argc, char* argv[])
{
    if (argc != 2)
    {
        std::cerr << "Provide single argument, path to image" << std::endl;
        std::exit(EXIT_FAILURE);
    }

    cv::Mat img = cv::imread(argv[1]);
    std::cout << "Image size: " << img.cols << " x " << img.rows << std::endl;

    return 0;
}
