#!/bin/python3

import sys
import os

def getblock(info, f):
    l = 1

    while l != 0:
        if info[f] == '{':
            l = l + 1
        elif info[f] == '}':
            l = l - 1
        f = f + 1

    return f

def genfile(str):
    fx = open(str)

    if fx == None:
        print('File Not Found')
        return

    info = fx.read()

    f = info.find('public static void main')

    bracket_f = info.find('{', f)
    blk = getblock(info, bracket_f+1)

    out = ''

    out += 'import java.util.Scanner;\n'
    out += 'public class '+str[str.rfind('/')+1:str.find('java')-1]+'_main\n'
    out += '{\n'
    out += "\t"+info[f:blk]+'\n'
    out += '}\n'

    fx.close()

    return out

def main():
    if len(sys.argv) <= 1:
        print('Enter name of directory')
        return
    
    ps = ''
    if len(sys.argv) >= 3:
        ps = sys.argv[2]

    files = os.listdir(sys.argv[1])

    for x in files:
        i = x.find('java')
        if i != -1:
            g = open(ps+'/'+x[0:i-1]+'_main.java', 'w')
            g.write(genfile(sys.argv[1]+'/'+x))
            g.close()

if __name__ == '__main__':
    main()
