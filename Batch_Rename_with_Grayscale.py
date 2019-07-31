import cv2
import matplotlib.pyplot as mpimage
import glob
from PIL import Image
import os

path = "data/meibomianGland/train/label/exp/"

for filename in glob.glob(f"{path}*.*"):
    name, extension = os.path.splitext(os.path.basename(filename))
    img2 = cv2.imread(filename)
    print(filename, "\t Has shape = ", img2.shape)
    im = cv2.cvtColor(img2, cv2.COLOR_RGB2GRAY)
    print("Last shape = ", im.size, "Object = ", im)
    im2 = Image.fromarray(im)
    print("Last shape = ", im2)
    mpimage.imshow(im2)
    im2.save(f"{path}{name}.png")
