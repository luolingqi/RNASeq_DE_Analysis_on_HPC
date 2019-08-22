#BSUB -o Myjob.%J.log
#BSUB -e Myjob.%J.err
#BSUB -n 2 -R "rusage[mem=32]"
#BSUB -W 48:00

zcat /data/ldiaz/RawData/Project_09165_B/MICHELLE_0077/Sample_Colo741-R1_IGO_09165_B_2/Colo741-R1_IGO_09165_B_2_S27_R1_001.fastq.gz /data/ldiaz/RawData/Project_09165_B/MICHELLE_0078/Sample_Colo741-R1_IGO_09165_B_2/Colo741-R1_IGO_09165_B_2_S28_R1_001.fastq.gz | gzip -c > /data/ldiaz/RawData/Project_09165_B/merged_Colo741-R1_IGO_09165_B_2_S27_R1_001.fastq.gz

zcat /data/ldiaz/RawData/Project_09165_B/MICHELLE_0077/Sample_Colo741-R1_IGO_09165_B_2/Colo741-R1_IGO_09165_B_2_S27_R2_001.fastq.gz /data/ldiaz/RawData/Project_09165_B/MICHELLE_0078/Sample_Colo741-R1_IGO_09165_B_2/Colo741-R1_IGO_09165_B_2_S28_R2_001.fastq.gz | gzip -c > /data/ldiaz/RawData/Project_09165_B/merged_Colo741-R1_IGO_09165_B_2_S27_R2_001.fastq.gz




