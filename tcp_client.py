import socket
import cv2
import numpy
import os
import glob

TCP_IP = 'localhost'
TCP_PORT = 5001

def read_dir(dir_path):
    images = {}
    for ext in ["jpg", "jpeg", "png"]:
        for filepath in glob.glob(dir_path + '/*.%s' % ext):
            filename = os.path.basename(filepath)
            images[filename] = cv2.imread(filepath)
    return images

def convert_image(img, ext):
    encode_param = []
    if ext == "jpg" or ext == "jpeg":
        encode_param = [int(cv2.IMWRITE_JPEG_QUALITY), 90]
    elif ext == "png":
        encode_param = [int(cv2.IMWRITE_PNG_COMPRESSION), 4]
    result, imgencode = cv2.imencode('.'+ext, img, encode_param)
    data = numpy.array(imgencode)
    stringData = data.tostring()

    return stringData

def tcp_client(img_dir):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.connect((TCP_IP, TCP_PORT))
    print("Connected")

    images = read_dir(img_dir)
    sock.send(str(len(images)).ljust(16).encode('utf-8'))
    print("Sending images")
    for i,name in enumerate(images):
        sock.send(str(len(name)).ljust(16).encode('utf-8'))
        sock.send(name.encode())
        
        extension = os.path.splitext(name)[1]
        stringData = convert_image(images[name], extension)
        sock.send(str(len(stringData)).ljust(16).encode('utf-8'))
        sock.send(stringData)
        print("Image " + name + " sent succesfully [" + str(i+1) + "/" + str(len(images)) +  "]")

    print("Done sending")
    #sock.shutdown(socket.SHUT_WR)
    sock.close()

if __name__ == "__main__":
        print("ERROR")
