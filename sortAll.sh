#!/usr/bin/env bash
# sortAll.sh
# Usage: bash scripts/sortAll.sh 1>results/logs/Aip02.sort.log 2>results/logs/Aip02.sort.err &

echo "Sort the resulting SAM files $(date)"

# Initialize variable to contain the suffix for .sam and .bam files:
samSuffix=".sam"
bamSuffix=".sorted.bam"
samAlignPath="results/sam/"
bamSortPath="results/bam/"

# Create needed folders
mkdir -p $bamSortPath

# Loop through all the .sam files in $samAlignPath
    for leftInFile in $samAlignPath*$samSuffix
    do
        # Remove the path from the filename and assign to pathRemoved
        pathRemoved="${leftInFile/$samAlignPath/}"
        # Remove the sam suffix from $pathRemoved and assign to suffixRemoved
        sampleName="${pathRemoved/$samSuffix/}"
       
	samtools sort \
	$samAlignPath$sampleName$samSuffix \
	-o $bamSortPath$sampleName$bamSuffix 
     done
