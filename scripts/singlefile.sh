#! /bin/bash


# load the fastqc module so we can run it.

module load R



# run the R command line

Rscript ./filterRData.R $1 -o $2

