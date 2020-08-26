#!/usr/bin/env python3

def main():
    num = 2
    #prime = []
    skip = False
    while True:
        skip = False
        for i in range(2, num):
            if ((num % i) == 0):
                skip = True
        if (not skip):
            #prime.append(num)
            #print(prime)
            print(num)
        num += 1
if __name__ == "__main__":
    main()
