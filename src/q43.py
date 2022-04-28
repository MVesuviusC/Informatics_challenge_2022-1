# Author  : Ali Snedden
# Date    : 4/26/22
# Purpose :
#   This solve's Matt Cannon's 2022 bioinformatics challenge
#   
#  
#           
# Debug   : 
#
# To Do   : 
#
import sys
import gzip
import re


def exit_with_error(String):
    """ 
    ARGS:
    RETURN:
    DESCRIPTION:
    DEBUG:
    FUTURE:
        1. Test if I could instead send an email, then die when error occurs
    """
    sys.stderr.write("{}\n".format(String))
    sys.exit(1)



def print_help(Arg):
    """
    ARGS:
        arg     : exit value
    DESCRIPTION:
        Print Help. Exit with value arg
    RETURN:
    FUTURE:
    """
    sys.stdout.write("\nUSAGE : python3 q39.py string infile.fasta \n\n"
                     "\tinfile.fasta    :  File search for strings\n")
            
    sys.exit(Arg)



class READ:
    def __init__(self, Header=None, Sequence=None):
        """ 
        ARGS:
        RETURN:
        DESCRIPTION:
        DEBUG:
        FUTURE:
        """
        self.h   = Header
        self.seq = Sequence
        self.mL = []



def main():
    """ 
    ARGS:
    RETURN:
    DESCRIPTION:
    DEBUG:
    FUTURE:
        1. Make less ugly by not repeating code for either compressed vs. not
           compressed
    """
    ## Prevent rogue command injection ##
    if(len(sys.argv) != 2 and len(sys.argv) != 3):
        exit_with_error("ERROR!! Incorrect number of arguments. {} given, "
                     "only 2 expected\n".format(len(sys.argv)))
    elif("-h" in sys.argv[1]):
        print_help(0)
    else:
        string = sys.argv[1].lower()
        path   = sys.argv[2]


    ## Only works with Python 3
    if(sys.version_info[0] != 3):
        exit_with_error("ERROR!!! Wrong python version ({}), version 3 "
                        "expected\n".format(sys.version_info[0]), emailAddressL)
    ## Read File
    readL = []                  # Read list
    fin = open(path, "r")
    for line in fin:
        # Read by read
        if(">" == line[0]):
            if(len(readL) > 0):
                readL[-1].seq=seq
            seq = ""
            read= READ(Header=line.strip())
            readL.append(read)
            continue
        seq += line.lower().strip()
    readL[-1].seq=seq           # Be sure to capture last read seq
    fin.close()

    ## Construct Regex
    # T/U
    regex = string.replace("t","[tu]")
    # M = A|C
    regex = regex.replace("m","[ac]")
    regex = regex.replace("r","[ag]")
    regex = regex.replace("w","[at]")
    regex = regex.replace("s","[cg]")
    regex = regex.replace("y","[ct]")
    regex = regex.replace("k","[gt]")
    regex = regex.replace("v","[acg]")
    regex = regex.replace("h","[act]")
    regex = regex.replace("d","[agt]")
    regex = regex.replace("b","[cgt]")
    regex = regex.replace("n","[gatc]")
    regex = regex.lower()
    print("Regex = {}".format(regex))

    ## Search
    for read in readL:
        for m in re.finditer(regex, read.seq):
            read.mL.append(m)

    ## Write output
    fout = open("out-q43.txt", "w+")
    for read in readL:
        if(len(read.mL) > 0):
            for m in read.mL:
                fout.write("{:<10} {:<10} {}\n".format(read.h, m.span()[0], m.group(0)))
    fout.close()
    
    
    print("Writing : out-q43.txt")
    #print("{} matches {} times in a {} length string".format(string, len(re.findall(string, seq)), len(seq)))






if __name__ == "__main__":
    main()

