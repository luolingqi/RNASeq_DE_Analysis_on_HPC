#BSUB -o Myjob.%J.log
#BSUB -e Myjob.%J.err
#BSUB -n 4 -R "rusage[mem=32]"
#BSUB -W 48:00

singularity run --bind /home/luol2/generate_star_index:/data star_v2.7.sif --runThreadN 8 --runMode genomeGenerate --genomeDir /data/star_index_overhang50/ --genomeFastaFiles /data/Homo_sapiens.GRCh38.dna.primary_assembly.fa --sjdbGTFfile /data/Homo_sapiens.GRCh38.96.gtf --sjdbOverhang 50
