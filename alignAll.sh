#!/usr/bin/env bash
#alignAll.sh
# Usage: bash scripts/alignAll.sh 1>results/logs/alignAll.log 2>results/logs/alignAll.err &

echo "Align the reads to the reference with GSNAP $(date)"

# Initialize variable to contain the directory of trimmed fastq files 
fastqPath="data/trimmed/paired/"

# Initialize variable to contain the suffix for the left and right reads
leftSuffix=".R1.fastq"
rightSuffix=".R2.fastq"
AlignSamPath="results/sam/"
samSuffix=".sam"

#Create needed folders
mkdir -p $AlignSamPath

function alignReads {
    # Loop through all the left-read fastq files in $fastqPath
    for leftInFile in $fastqPath*$leftSuffix
    do
        # Remove the path from the filename and assign to pathRemoved
        pathRemoved="${leftInFile/$fastqPath/}"
        # Remove the left-read suffix from $pathRemoved and assign to suffixRemoved
        sampleName="${pathRemoved/$leftSuffix/}"	
        
	 gsnap \
   	 -A sam \
   	 -D data \
   	 -d AiptasiaGmapDb \
   	 -N 1 \
   	 $fastqPath$sampleName$leftSuffix \
   	 $fastqPath$sampleName$rightSuffix \
   	 1>$AlignSamPath$sampleName$samSuffix
    done		    
}
alignReads

