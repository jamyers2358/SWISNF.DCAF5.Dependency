#!/bin/bash 

module load miniconda 
source activate beta_1.0.7 

BETA basic -p ../../define_BAF155_peaks/MetaDiffVoom.shDCAF5_BAF155__VS__shCTRL_BAF155.Up2.Region.sort.score.beta.bed  \
	-e ../shDCAF5_vs_shCTRL_BSF.txt  \
	-g hg19 \
	--gname2 \
	-o BAF155_allrepMeanScores  \
	-n BAF155_allrepMeanScores  \
	--df 0.05 \
	-k BSF 

