#BSUB -o Myjob.%J.log
#BSUB -e Myjob.%J.err
#BSUB -n 1 -R "rusage[mem=16]"
#BSUB -W 48:00

module load singularity/3.0.1

# Sample_Folder would be replacable by any folder path to a sample

fastq1=$(basename Sample_Folder/trim_galore_output/*R1_001_trim.fastq.gz)
fastq2=$(basename Sample_Folder/trim_galore_output/*R2_001_trim.fastq.gz)

singularity run --bind Sample_Folder/trim_galore_output:/data trim_galore_v0.6.0.sif fastqc /data/$fastq1 /data/$fastq2 -o /data



