#!/bin/bash
#PBS -l mem=250gb,nodes=1:ppn=128,walltime=96:00:00
#PBS -m abe
#PBS -M konox006@umn.edu
#PBS -A msistaff
#PBS -W group_list=msistaff
#PBS -q mangi

# Load modules
module load java/jdk1.8.0_171
module load bowtie2/2.3.4.1.CentOS7
module load samtools/1.7
module load R/3.5.0
module load ncbi_blast+/2.7.1.CentOS7
module load jellyfish/2.1.3
module load python3/3.6.3_anaconda5.0.1
module load salmon/0.14.1

# Define paths
TRINITY="/home/jkimball/shared/Software/trinityrnaseq-v2.8.6/Trinity"
READS_DIR="/panfs/roc/scratch/konox006/JKimball/RNASeq/Trimmed_reads"
# Global scratch is very slow
#OUTPUT_DIR="/panfs/roc/scratch/konox006/JKimball/RNASeq/trinity_k25_Transcriptome_Asm"
OUTPUT_DIR="/home/jkimball/shared/WR_Annotation/Transcriptome_Asm_Mangi_trinity"

mkdir -p "${OUTPUT_DIR}"
cd "${OUTPUT_DIR}"

# Set some more parameters for the assembly
MIN_CONTIG=250

# Run Trinity
${TRINITY} \
    --seqType fq \
    --max_memory 248G \
    --left "${READS_DIR}/WR_8Tissues.R1.trimmed.fastq" \
    --right "${READS_DIR}/WR_8Tissues.R2.trimmed.fastq" \
    --SS_lib_type RF \
    --CPU 128 \
    --KMER_SIZE 25\
    --monitoring \
    --monitor_sec 30 \
    --min_contig_length ${MIN_CONTIG} \
    --output "${OUTPUT_DIR}"
