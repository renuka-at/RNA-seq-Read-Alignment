**Project Title - RNA-Seq Read Alignment Workflow**
This project processes RNA-Seq data by building a reference genome database, performing quality trimming, aligning reads, and generating sorted and indexed BAM files.

**Description**
The project uses shell scripts to streamline RNA-Seq analysis for Aiptasia miRNA-Seq data. The scripts include:

AipBuild.sh: Builds a reference genome database using gmap_build.
trimAll.sh: Performs quality trimming of raw reads with Trimmomatic.
alignAll.sh: Aligns trimmed reads to the reference genome using GSNAP.
sortAll.sh: Sorts aligned reads in BAM format using samtools.
indexAll.sh: Indexes sorted BAM files for easier data access.
Getting Started

1. Log in to the HPC Cluster
2. Clone the repository:
3. Start a compute session:
srun --partition=short --pty --export=ALL --nodes=1 --ntasks=1 --mem=10Gb --time=02:00:00 /bin/bash

**Dependencies**
Load the following modules to set up the environment:
module load anaconda3/2021.11
source activate BINF-12-2021
module load gsnap/2021-12-17
module load samtools/1.10

**Usage**

Place raw reads in data/rawreads/ (FASTQ format).
Place the reference genome in data/ (FASTA format).
Run the scripts from the scripts directory. Outputs will be organized as follows:
Trimmed reads: data/trimmed/paired/ and data/trimmed/unpaired/.
Aligned SAM files: results/sam/.
Sorted BAM files: results/bam/.
Index files: results/bam/ (indexed .bai files).

**Methods**

Trimming:
Performed using Trimmomatic (v0.39-2) to remove adapters and low-quality regions.

Database Building:
Reference genome database was built using GMAP (v2021-12-17).

Alignment:
Trimmed reads were aligned to the reference using GSNAP (v2021-12-17).

Sorting and Indexing:
Sorted and indexed BAM files using samtools for downstream processing.

**SBATCH Script for Job Submission**

This repository includes an SBATCH script to automate and submit the workflow to a SLURM-based high-performance computing (HPC) cluster. The script ensures the execution of all necessary steps in sequence, logging both output and errors.
How to Use

Save the script above as sbatch_alignRNAseq.sh in the root directory of your project.

Submit the script to the SLURM workload manager using the command:

```bash
sbatch sbatch_alignRNAseq.sh
```

Output Logs: Each step of the workflow produces logs in the results/logs/ directory for debugging and record-keeping. The log filenames are formatted with the job name ($SLURM_JOB_NAME) and job ID ($SLURM_JOB_ID).

**Acknowledgment**
Developed at Northeastern University for BINF6308 coursework.
Author: Renuka Athinarayanan

