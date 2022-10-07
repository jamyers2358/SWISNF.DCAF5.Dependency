#!/bin/bash 

module load miniconda 
source activate beta_1.0.7 

BETA basic -p ../../define_BRG1_peaks/MetaDiffVoom.shDCAF5_BRG1_rep2Out__VS__shCTRL_BRG1_rep2Out.Up2.Region.sort.score.beta.bed \
	-e ../shDCAF5_vs_shCTRL_BSF.txt \
	-g hg19 \
	--gname2 \
	-o BRG1_Rep2OutMeanScores  \
	-n BRG1_Rep2OutMeanScores  \
	--df 0.05 \
	-k BSF 
