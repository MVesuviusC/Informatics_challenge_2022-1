# Author  : Ali Snedden
# Date    : 4/26/22
# Purpose :
#   This solve's Matt Cannon's 2022 bioinformatics challenge
#   It reads in a compressed (gzip) fastq file and trims 10 chars  
#   from each read.
#           
# Debug   : 
#   Can compare by testing against 
#    gunzip -c /gpfs0/scratch/mvc002/infoChallenge_1.fastq.gz | awk '{if(NR % 2 == 0){print substr($0, 1, length($0)-10)}else{print $0}}' > trimmed.fastq
#
# To Do   : 
#
import sys
import gzip


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
    sys.stdout.write("\nUSAGE : python3 q38.py infile.fastq.gz outfile.fastq\n\n"
                     "\tinfile.fastq.gz     :  File to strip 10 chars from\n"
                     "\toutfile.fastq.gz    :  File to write output to\n")
            
    sys.exit(Arg)



def main():
    """ 
    ARGS:
    RETURN:
    DESCRIPTION:
    DEBUG:
    FUTURE:
    """
    ## Prevent rogue command injection ##
    if(len(sys.argv) != 2 and len(sys.argv) != 3):
        exit_with_error("ERROR!! Incorrect number of arguments. {} given, "
                     "only 2 expected\n".format(len(sys.argv)))
    elif("-h" in sys.argv[1]):
        print_help(0)
    else:
        path    = sys.argv[1]
        outpath = sys.argv[2]


    ## Only works with Python 3
    if(sys.version_info[0] != 3):
        exit_with_error("ERROR!!! Wrong python version ({}), version 3 "
                        "expected\n".format(sys.version_info[0]), emailAddressL)
    ## Read CL args
    fout= open(outpath, "w+")
    fin = gzip.open(path, "r")

    for line in fin:
        # Read by read
        line = line.decode("utf-8")
        if(line[0] == "@"):
            header = line
            data   = fin.readline().decode("utf-8") # Probably shouldn't use hidden func.
            data = data[:-11]   # strip last 10 incl \n
            # skip intermediate 
            interm = fin.readline().decode("utf-8").strip()
            # qc
            qc = fin.readline().decode("utf-8")
            qc = qc[:-11]       # strip last 10 incl \n
            # Write output
            fout.write("{}\n{}\n{}\n{}\n".format(header,data,interm,qc))
        else:
            exit_with_error("ERROR!!! Only read headers should be read here")

    fout.close()
    fin.close()



    print("The End")




if __name__ == "__main__":
    main()

