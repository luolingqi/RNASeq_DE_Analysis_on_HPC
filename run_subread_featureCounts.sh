#BSUB -o Myjob.%J.log
#BSUB -e Myjob.%J.err
#BSUB -n 1 -R "rusage[mem=16]"
#BSUB -W 48:00

module load singularity/3.0.1

# Sample_Folder would be replacable by any folder path to a sample
mkdir -p Sample_Folder/trim_galore_output/alignment/featureCounts; singularity run --bind Sample_Folder/trim_galore_output/alignment:/data --bind Sample_Folder/trim_galore_output/alignment/featureCounts:/data2 --bind /home/luol2/lingqi_workspace/generate_star_index:/gtf subread_v1.6.3.sif featureCounts -p -C -B -t exon -g gene_id -a /gtf/Homo_sapiens.GRCh38.96.gtf -o /data2/counts.txt /data/Aligned.sortedByCoord.out.bam
