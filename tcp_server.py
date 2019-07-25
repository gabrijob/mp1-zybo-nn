import socket
import numpy
 
import cv2

TCP_IP = 'localhost'
TCP_PORT = 5001

def recvall(sock, count):
    buf = b''
    while count:
        newbuf = sock.recv(count)
        if not newbuf: return None
        buf += newbuf
        count -= len(newbuf)
    return buf

def tcp_server():
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.bind((TCP_IP, TCP_PORT))
    sock.listen(True)
    conn, addr = sock.accept()
    print("Connected")
    
    nb_files = int(recvall(conn, 16))
    print("Receiving " + str(nb_files) + " files")
    for i in range(nb_files):
        lenght = recvall(conn ,16)
        filename = conn.recv(int(lenght)).decode()
        
        lenght = recvall(conn, 16)
        stringData = recvall(conn, int(lenght))
        data = numpy.fromstring(stringData, dtype='uint8')

        img = cv2.imdecode(data, 1)
        cv2.imwrite("downloads/" + filename, img)
        print("Image " + filename + " received succesfully [" + str(i+1) + "/" + str(nb_files) + "]")

    print("Done receiving")
    sock.close()

if __name__ == "__main__":
    tcp_server()
