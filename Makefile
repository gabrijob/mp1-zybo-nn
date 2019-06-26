#!/bin/sh
CC = g++ -std=c++11

TARGET = n2d2_imexp

N2D2_PATH = /home/gabriel/Public/N2D2
OpenCV_DIR = /home/gabriel/Public/OpenCV/installation/Open-3.4.4/share/OpenCV/

INCLUDES = -I$(N2D2_PATH)/include

LDFLAGS = -L$(N2D2_PATH)/build/lib

OPENCV = `pkg-config --cflags --libs /home/gabriel/Public/OpenCV/installation/OpenCV-3.4.4/lib/pkgconfig/opencv.pc`
LIBS = -static -ln2d2_lib

$(TARGET) : $(TARGET).cpp 
	$(CC) $(OPENCV) -o $@ $^ $(INCLUDES) $(LDFLAGS) $(LIBS)
