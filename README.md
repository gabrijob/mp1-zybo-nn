############################ MP1-ZYBO NEURAL NETWORK ########################

// N2D2 module setup //

First of all, you need to have N2D2 and OpenCV installed. 
Then you have to set the {N2D2_PATH} environment variable to N2D2's root and set{OPENCV_PATH} to OpenCV's root if you didn't install it in the default path.

To compile the program:

-mkdir build
-cd build
-cmake .. && make

To execute it you can go to GeneralObjectRecognition and execute "./run.sh" to evaluate images in the "data/" directory.
The results will be in "output_labels.out".

If you want to execute with a different set of images, file formats or weights, you can do it with the command (assuming you're at the project's root):

	bin/n2d2_imexp /path/to/Network.ini -d "/path/to/img_dir/" -format "file_format" -w "/path/to/weights_dir"  

PS: The learning can only be done directly with N2D2, you cannot do it in her for the moment. 


// Displaying the results //

After the evaluation is finished, it's possible to display the results in a prettier way with the display_results.py script:

	python3 display_results.py "/path/to/img_dir/" "/path/to/output_labels.out"

(Assuming you're on the root):

	python3 display_results.py GeneralObjectRecognition/data/ GeneralObjectRecognition/output_labels.out


// TCP Client & Server //

Not fully implemented yet.

(But you can try to run both in the same machine, it'll just copy a image to the tcp server's location)


// HLS export//

Not implemented.

#############################################################################


