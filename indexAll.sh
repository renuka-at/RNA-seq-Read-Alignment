#!/usr/bin/env bash
# indexAll.sh
# Usage: bash scripts/indexAll.sh 1>results/logs/indexAll.log 2>results/logs/indexAll.err &

echo "Index the resulting BAM files $(date)"

# Initialize variable to contain the suffix for .bam and .bai files:
bamSuffix=".sorted.bam"
baiSuffix="sorted.bam.bai"
bamSortPath="results/bam/"
baiPath="results/bam/bai/"

# Create needed folders
mkdir -p $baiPath

# Loop through all the .bam files in $samAlignPath
    for leftInFile in $bamSortPath*$bamSuffix
    do
        # Remove the path from the filename and assign to pathRemoved
        pathRemoved="${leftInFile/$bamSortPath/}"
        # Remove the sam suffix from $pathRemoved and assign to suffixRemoved
        sampleName="${pathRemoved/$bamSuffix/}"

        samtools index \
        $bamSortPath$sampleName$bamSuffix \
        -b $baiPath$sampleName$baiSuffix
     done

