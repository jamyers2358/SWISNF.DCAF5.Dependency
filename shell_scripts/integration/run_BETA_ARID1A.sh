#!/bin/bash 

module load miniconda 
source activate beta_1.0.7 

BETA basic -p ../define_ARID1A_peaks/MetaDiffVoom.shDCAF5_ARID1A__VS__shCTRL_ARID1A.Up2.Region.sort.score.beta.bed \
	-e shDCAF5_vs_shCTRL_BSF.txt  \
	-g hg19 \
	--gname2 \
	-o ARID1A  \
	-n ARID1A  \
	--df 0.05 \
	-k BSF 

