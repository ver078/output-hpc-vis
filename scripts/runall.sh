\#!/bin/bash -l
#SBATCH --job-name=shaunjob
#SBATCH --ntasks=64
#SBATCH --mem=1gb
#SBATCH --time=0:2:00

##SBATCH --mail-type=ALL
##SBATCH --mail-user=shaun.verrall@csiro.au


inputdir=/OSM/CBR/PI_CAPS/work/ver078/test
outputdir=/OSM/CBR/PI_CAPS/work/ver078/output



for filename in $inputdir/*.RData
do
   echo $filename
   sbatch ./singlefile.sh $filename $outputdir
done


