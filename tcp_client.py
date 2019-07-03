import socket
import cv2
import numpy

TCP_IP = 'localhost'
TCP_PORT = 5001

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((TCP_IP, TCP_PORT))
print("Connected")


img = cv2.imread('GeneralObjectRecognition/data/ak47.jpg')

encode_param=[int(cv2.IMWRITE_JPEG_QUALITY),90]
result, imgencode = cv2.imencode('.jpg',img,encode_param)
data = numpy.array(imgencode)
stringData = data.tostring()

sock.send(str(len(stringData)).ljust(16).encode('utf-8'))
sock.send(stringData)

print("Done sending")
#sock.shutdown(socket.SHUT_WR)
sock.close()
