import sys
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import glob
from pathlib import Path

def parse():
    if len(sys.argv) != 3:
        print('--Usage:\n--python3 display_results.py /path/to/img/dir/ /path/to/output_labels.out')
        sys.exit()
    args = []
    args.append(sys.argv[1])
    args.append(sys.argv[2])
    return args

def display(imgdir_path, results_path):
    images = {}
    for ext in ["jpg","jpeg","png","tga"]:
        for filepath in glob.glob(imgdir_path + '/*.%s' % ext):
            filename = Path(filepath).name
            images[filename] = mpimg.imread(filepath)

    results = {}
    with open(results_path) as out:
        for line in out.readlines():
            line_words = line.split(':')
            results[line_words[0].strip()] = line_words[1].strip()

    plt.figure(figsize=(10,10))
    for i,name in enumerate(images):
        plt.subplot(3,3,i+1)
        plt.xticks([])
        plt.yticks([])
        plt.grid(False)
        plt.imshow(images[name])
        plt.xlabel(results[name])
    plt.show()

if __name__ == "__main__":
    args = parse()
    display(args[0],args[1])
