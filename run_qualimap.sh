#BSUB -o Myjob.%J.log
#BSUB -e Myjob.%J.err
#BSUB -n 1 -R "rusage[mem=16]"
#BSUB -W 48:00

module load singularity/3.0.1

bn=$(basename "Sample_Folder")
# Sample_Folder would be replacable by any folder path to a sample
mkdir -p Sample_Folder/trim_galore_output/alignment/qualimap

#qualimap bamqc
singularity run --bind Sample_Folder/trim_galore_output/alignment:/data --bind Sample_Folder/trim_galore_output/alignment/qualimap:/data2 qualimap_v2.2.1.sif qualimap bamqc -bam /data/Aligned.sortedByCoord.out.bam --java-mem-size=13G -outfile ${bn}.genome.pdf -outdir /data2/${bn}.genome


# qualimap rnaseq
singularity run --bind Sample_Folder/trim_galore_output/alignment:/data --bind Sample_Folder/trim_galore_output/alignment/qualimap:/data2 --bind /data/ldiaz/lingqi_workspace/generate_star_index:/ref qualimap_v2.2.1.sif qualimap rnaseq -bam /data/Aligned.sortedByCoord.out.bam -gtf /ref/Homo_sapiens.GRCh38.96.gtf --java-mem-size=13G -outfile ${bn}.rnaseq.pdf -outdir /data2/${bn}.rnaseq



