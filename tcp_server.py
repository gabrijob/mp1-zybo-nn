import socket
import numpy
import os 
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

def evaluate():
    cmd = "bin/n2d2_imexp GeneralObjectRecognition/GoogleNet.ini -dir downloads/ -format jpg -w GeneralObjectRecognition/weights_googlenet"
    os.system(cmd)

def send_outfile(sock):
    outfile = open('output_labels.out', 'wb')
    count = getSize(outfile)
    sock.send(str(count).ljust(16).encode('utf-8'))
    while count:
        buf = outfile.read(1024)
        print("Sending output_labels.out [" + str(len(buf)) + "/" + str(count) + "]")
        sock.send(buf)
        count -= len(buf)
    sock.shutdown(socket.SHUT_WR)
    sock.recv(1024)

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
    evaluate()
    send_outfile(conn)
    sock.close()
    
if __name__ == "__main__":
    tcp_server()
