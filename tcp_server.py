import socket
import numpy
 
import cv2


def recvall(sock, count):
    buf = b''
    while count:
        newbuf = sock.recv(count)
        if not newbuf: return None
        buf += newbuf
        count -= len(newbuf)
    return buf

TCP_IP = 'localhost'
TCP_PORT = 5001

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.bind((TCP_IP, TCP_PORT))
sock.listen(True)
conn, addr = sock.accept()
print("Connected")

lenght = recvall(conn, 16)
stringData = recvall(conn, int(lenght))
data = numpy.fromstring(stringData, dtype='uint8')
sock.close()
print("Done receiving")

img = cv2.imdecode(data, 1)
cv2.imwrite('img.jpg', img)


