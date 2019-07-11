\#!/bin/bash -l
#SBATCH --job-name=shaunjob
#SBATCH --ntasks=64
#SBATCH --mem=1gb
#SBATCH --time=0:2:00

##SBATCH --mail-type=ALL
##SBATCH --mail-user=shaun.verrall@csiro.au


inputdir=/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome
outputdir=/OSM/CBR/AF_DATASCHOOL/output/ver078



for filename in $inputdir/*.csv
do
   echo $filename
   sbatch ./singlefile.sh $filename $outputdir
done


