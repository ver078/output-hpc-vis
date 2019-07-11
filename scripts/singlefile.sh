#! /bin/bash


# load the fastqc module so we can run it.

module load R



# run the R command line

Rscript ./tester.R $1 -o $2

