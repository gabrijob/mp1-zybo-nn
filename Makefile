#!/bin/sh
CC = g++ -std=c++11

TARGET = n2d2_imexp

N2D2_PATH=/home/gabriel/Public/N2D2

LDFLAGS = -L$(N2D2_PATH)/build/lib

LIBS = -static -ln2d2

$(TARGET) : $(TARGET).cpp 
	$(CC) -o $@ $^ $(LIBS) $(LDFLAGS)
