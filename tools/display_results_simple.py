import sys
import glob
import os
from tcp_client import tcp_client

def parse():
    if len(sys.argv) != 2:
        print('--Usage:\n--python3 display_results.py /path/to/img_dir')
        sys.exit()
    args = []
    args.append(sys.argv[1])
    return args

def display(results_path):
    results = {}
    with open(results_path + '/output_labels.out') as out:
        for line in out.readlines():
            line_words = line.split(':')
            results[line_words[0].strip()] = line_words[1].strip()

    print("=================Evaluation results:==================")
    for i,name in enumerate(results):
        print("--> Image [" + name + "] is [" + results[name] + "]")
    print("======================================================")

if __name__ == "__main__":
    args = parse()
    tcp_client(args[0])
    display(args[0])

