#BSUB -o Myjob.%J.log
#BSUB -e Myjob.%J.err
#BSUB -n 4 -R "rusage[mem=16]"
#BSUB -W 48:00

module load singularity/3.0.1

#Sample_Folder can be replaced by a path to sample folder
#bn=$(basename "Sample_Folder")
fastqs=$(ls -A1 Sample_Folder/trim_galore_output/| grep trim.fastq.gz | perl -pe 's#^#/data/#g;s/\n/ /g')

mkdir -p Sample_Folder/trim_galore_output/alignment; singularity run --bind Sample_Folder/trim_galore_output:/data --bind Sample_Folder/trim_galore_output/alignment:/data2 --bind /data/ldiaz/lingqi_workspace/generate_star_index/star_index_overhang50:/genome star_v2.7.sif --genomeDir "/genome" --outSAMstrandField intronMotif --outSAMattributes NH HI AS NM MD --outSAMunmapped Within --outFileNamePrefix /data2/ --outSAMtype BAM SortedByCoordinate --runThreadN 4 --readFilesIn $fastqs --readFilesCommand zcat --outFilterScoreMinOverLread 0 --outFilterMatchNminOverLread 0 --outFilterMatchNmin 0 --outFilterMismatchNmax 2
