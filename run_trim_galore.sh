#BSUB -o Myjob.%J.log
#BSUB -e Myjob.%J.err
#BSUB -n 1 -R "rusage[mem=8]"
#BSUB -W 48:00

module load singularity/3.0.1

# Sample_Folder would be replacable by any folder path to a sample
mkdir -p Sample_Folder/trim_galore_output;/bin/cp ~/bin/trim_galore_docker_code.sh Sample_Folder/trim_galore_output; singularity run --bind Sample_Folder:/data --bind Sample_Folder/trim_galore_output:/data2 trim_galore_v0.6.0.sif /bin/bash /data2/trim_galore_docker_code.sh

