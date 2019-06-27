############################ MP1-ZYBO NEURAL NETWORK ########################

First of all, you need to have N2D2 and OpenCV installed. Then you have to set the {N2D2_PATH} environment variable to N2D2's root and set {OPENCV_PATH} to OpenCV's root if you didn't install it in the default path.


To compile the program:

-mkdir build
-cd build
-cmake .. && make

To execute it you can go to GeneralObjectRecognition and execute "./run.sh" to evaluate images in the "data/" directory.
The results will be in "output_labels.out".
