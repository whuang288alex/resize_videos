import os
import cv2
import argparse
import glob

parser = argparse.ArgumentParser()
parser.add_argument('-vi', '--in_dir', type=str, help='input directory')
parser.add_argument('-fps', '--fps', type=float, default=None, help='frame rate')
args = parser.parse_args()
assert os.path.exists(args.in_dir), 'video directory does not exist'


exts = ['avi', 'mp4', 'mkv', 'webm']
filepaths = []
for ext in exts:
    filepaths += sorted(
        glob.glob(os.path.join(args.in_dir, '*.{:s}'.format(ext)))
    )

for file in filepaths:
    cap = cv2.VideoCapture(file)
    fps = cap.get(cv2.CAP_PROP_FPS)
    cap.release()
    if fps != args.fps:
        print("Failed.")
        exit()
print("Succeed.")