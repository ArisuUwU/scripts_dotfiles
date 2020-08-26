#!/usr/bin/env python3
from os import listdir, access, X_OK
from os.path import isfile

def main():
    folderList = []
    fileList = []
    folders = ''
    files = ''
    for item in listdir():
        if isfile(item):
            fileList.append(item)
        else:
            folderList.append(item)
    fileList.sort()
    folderList.sort() 
    folders = NiceString(folderList, "FOLDER")
    files = NiceString(fileList, "FILE")
    print(folders + files)

def NiceString(stringList, itemType):
    result = ''
    resultX = ''
    color = ''
    isx = []
    if (itemType == 'FOLDER'):
        color = colors['BLUE']
    else:
        color = colors['WHITE']
    for item in stringList:
        if (itemType == 'FILE' and access(item, X_OK)):
            resultX = resultX + colors['GREEN'] + item + colors['END']  + "  "
            continue
        result = result + color + item + colors['END']  + "  "
    return resultX + result

colors = {
        'BLUE'  : '\033[94m',
        'GREEN' : '\033[92m',
        'WHITE' : '\033[37m',
        'END'   : '\033[0m'
    }

if __name__ == '__main__':
    main()
