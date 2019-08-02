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

After the evaluation is finished, it's possible to display the results in a prettier way with the display_results.py script in the "tools/" folder:

	python3 display_results.py "/path/to/img_dir/" "/path/to/output_labels.out"

(Assuming you're on the root):

	python3 tools/display_results.py GeneralObjectRecognition/data/ GeneralObjectRecognition/output_labels.out


// MP1 board setup //

In the project's root folder there's a tarball "nn-mp1-OS.tar.gz" which contains the OS' images to flash into the board. First, we need to extract the tarball's contents:
	
	tar -xzvf nn-mp1-OS.tar.gz

To install the image directly into a SD card you can follow these steps:
- Create a raw image
	
	cd image/stm32mp1/scripts/
	./create_sdcard_from_flashlayout.sh ../flashlayout_st-image-weston/FlashLayout_sdcard_stm32mp157a-dk1-trusted.tsv

- After connected, you must unmount your microSD card (to know your microSD card's name you can use 'cat /proc/partitions', generally it's something as "sdX" where X can be [a,b,c,d,e])
	
	 sudo umount `lsblk --list | grep <microSD_card_name> | grep part | gawk '{ print $7 }' | tr '\n' ' '`  

- Populate the microSD card with dd

	sudo dd if=../flashlayout_st-image-weston_FlashLayout_sdcard_stm32mp157a-dk1-trusted.raw of=/dev/<microSD_card_name> bs=8M conv=fdatasync 

If you have any trouble flashing the image you can take a look at the following links:

"https://wiki.st.com/stm32mpu/wiki/How_to_populate_the_SD_card_with_dd_command"
"https://wiki.st.com/stm32mpu/wiki/STM32MP15_Discovery_kits_-_Starter_Package#Downloading_the_image_and_flashing_it_on_the_board"
"https://wiki.st.com/stm32mpu/wiki/STM32MP15_Discovery_kits_-_Starter_Package#Booting_the_board"


// MP1 connection //

After the setup is finished, the board is ready to send images for evaluation. You can do it with the script "display_results_simple.py" in the "/usr/app/nn-connection" folder:

	python3 display_results_simple.py /path/to/images/dir 

The script will open a TCP socket with the IP 10.0.0.1 and PORT 5001 and send the images in the folder specified as an argument. Then it will receive the outfile "output_labels.out" with the evaluation results and display it on the terminal.

# TODO: make possible to configure TCP socket's IP and PORT as arguments

If you want to send your own imagefiles to the board:

- Connect an ethernet cable between the PC and the MP1

- Set both the PC and the MP1 to the same IP network

- Copy the files to the board

	scp -r <images_folder>/* root@<board ip address>:/<dest_path>

If you have any trouble with sending the files to the board you can take a look at the following links:

"https://wiki.st.com/stm32mpu/wiki/How_to_cross-compile_with_the_Developer_Package#Deploy_and_execute_on_board"


// MP1 connection - DEMO //

To run the DEMO:

- Connect an ethernet cable between the PC and the MP1

- Set the PC's ethernet interface to the IP address 10.0.0.1 (e.g. ifconfig eth0 10.0.0.1)

- Set the MP1's ethernet interface to any IP address on the 10.0.0.0/24 network (e.g. ifconfig eth0 10.0.2)

- On the PC
	
	cd /path/to/mp1-zybo-nn/tools
	python3 tcp_servel.py

- On the board
	 
	cd /usr/app/nn-connection
	python3 display_results_simple.py data/


// HLS export//

Not implemented.

#############################################################################


