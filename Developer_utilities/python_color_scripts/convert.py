#!/usr/bin/env python3
''' 
convert -- converts png or equivalent images with rgb channels into blocks using 256 color scheme  
 
Created Sunday, 16 August 2020.
Carrie Ganote 
'''
import sys 
import argparse
import logging as log
import math
import scipy.ndimage
from scipy.misc import imread
import matplotlib.pyplot as plt
import numpy as np
full = '█'
half = '▄'

levels=[0, 95, 135, 175, 215, 255]
def test():
    for i in range(0, 16):
        for j in range(0, 16):
            code = str(i * 16 + j)
            sys.stdout.write(u"\u001b[38;5;" + code + "m " + u"\u001b[48;5;" + "87m" + code.ljust(4))
        print (u"\u001b[0m")


def process(imagefile, output):
    if output == "-1":
        out = sys.stdout
    else:
        out = open(output, 'w')
    # load the rgb channels
    data = imread(imagefile)
    log.debug("read data successfully")
    red = data[..., 0]
    green = data[..., 1]
    blue = data[..., 2]
    dimension = red.shape
    log.debug("image size is {}".format(dimension))
    rows = dimension[0]
    cols = dimension[1]
    colors=np.zeros( (rows,cols) )
    if rows % 2 == 0:
        log.debug("even number of rows: {}".format(rows))
        startpoint = 0
    else:
        startpoint = 1
        log.debug("odd rows: {}".format(rows))
        for j in range(0, cols):
            color = convertRGBtoNum(red[0][j], green[0][j], blue[0][j])
            # look into unicode.join(u'',vals) if something doesn't work with the +
            out.write(u"\u001b[38;5;" + str(color) + "m" + half)
        out.write(u"\u001b[0m" + "\n")
    switch=2
    for i in range(startpoint, rows):
        if switch % 2 == 0:
            for j in range(0, cols):
                color = convertRGBtoNum(red[i][j], green[i][j], blue[i][j])
                log.debug("row {} column {} switch {} color {}".format(i, j, switch, color))
                colors[i][j] = color
        else: 
            for j in range(0, cols):
                color = convertRGBtoNum(red[i][j], green[i][j], blue[i][j])
                lastcolor = colors[i-1][j]
                log.debug("last color found was {}".format(lastcolor))
                #sys.stdout.write(u"\u001b[38;5;" + str(int(color)) + "m" + u"\u001b[48;5;" + str(int(lastcolor)) + "m" + half + u"\u001b[0m")
                out.write(u"\u001b[38;5;" + str(int(color)) + "m" + u"\u001b[48;5;" + str(int(lastcolor)) + "m" + half + u"\u001b[0m")
            out.write(u"\u001b[0m" + "\n")
        switch += 1
    out.close()
#print ("type of data is ", type(red))
#for i,j in np.ndindex(np.shape(red)):

    #plt.imshow(green)
    #plt.show()

def getnearest(num):
    mindiff = 256
    mini = 0
    for i in range(0, len(levels)):
        diff = abs(levels[i] - num)
        if diff < mindiff:
            mini = i
            mindiff = diff
    return mini

def convertRGBtoNum(red, green, blue):
    newred = getnearest(red)
    newgreen = getnearest(green)
    newblue = getnearest(blue)
    return 16 + (newred*36) + (newgreen*6) + newblue

def convertNumtoRGB(num):
    num -= 16 
    red = int(num/36)
    leftover = num - (red * 36)
    green = int(leftover/6)
    blue = leftover - (green * 6)
    return levels[red], levels[green], levels[blue]

def main(*args):
    parser = argparse.ArgumentParser(description="")
    #parser.add_argument("-","--", help="", default="")
    parser.add_argument("-o", "--output", help="Name of output file (default is -1 for STDOUT)", default="-1")
    parser.add_argument("-i","--inputs", help="Input file(s). Must be .png file types with rgb channels.", nargs='+', default=["three_by_three.png",])
    parser.add_argument("-v","--verbose", help="Enable debugging messages to be displayed", action='store_true')
    args = parser.parse_args()
    if args.verbose:
        log.basicConfig(format='%(message)s',level=log.DEBUG)
    if not args.inputs:
        parser.print_help()
        sys.exit(1)
    for inputf in args.inputs:
        process(inputf, args.output)
        #test()
if __name__ == "__main__":
    main(*sys.argv)
