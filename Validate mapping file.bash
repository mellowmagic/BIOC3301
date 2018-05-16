#!/bin/bash
#SBATCH -t 1:00:00
#SBATCH -n 24
#SBATCH -p short
##SBATCH --reservation=cbmucl

#Load modules to run python
module load eb
module load Miniconda2

# loading virtualenv
echo "loading virtualenv"
source activate qiime1

# setting temporary directory
export TMPDIR=~/qiime_tmp

# join read 1 and read 2 together
#join_paired_ends.py -f Read1.fastq.gz -r Read2.fastq.gz -b Index.fastq.gz -m SeqPrep -o JoinedReads

validate_mapping_file.py -m 2018fullmap2.tsv -o validate.vmf

#split_libraries_fastq.py -m ~/2018_02_smb/map_incomplete.tsv -i ~/2018_02_smb/JoinedReads/seqprep_assembled.fastq.gz -b ~/2018_02_smb/JoinedReads/seqprep_assembled.fastq_barcodes.fastq -o demultiplex -q 19 --rev_comp_barcode --rev_comp_mapping_barcodes

source deactivate
