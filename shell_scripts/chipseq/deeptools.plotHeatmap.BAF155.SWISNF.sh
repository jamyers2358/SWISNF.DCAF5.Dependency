#BSUB -P deeptools_roberts
#BSUB -q standard 
#BSUB -R rusage[mem=32000]
#BSUB -eo je.deeptools
#BSUB -n 8
#BSUB -oo jo.deeptools
#BSUB -R "span[hosts=1]"

module load python/2.7.12

bw='/research_jude/rgs01_jude/groups/robertsgrp/projects/DCAF5/common/CHIPSEQ/ROBERTS-270343-CHIPSEQ/ROBERTS-270343-CHIPSEQ_analysis/Coverage/'

computeMatrix reference-point \
	--referencePoint "center" \
	-S shCTRL_BAF155.merged.bw shDCAF5_BAF155.merged.bw shCTRL_ARID1A.merged.bw shDCAF5_ARID1A.merged.bw shCTRL_BRG1_rep2Out.merged.bw shDCAF5_BRG1_rep2Out.merged.bw ${bw}shCTRL_BRD9.avg.bw ${bw}shDCAF5_BRD9.avg.bw SMARCB1.avg.bw -R MetaDiffVoom.shDCAF5_BAF155__VS__shCTRL_BAF155.Up2.Region.bed MetaDiffVoom.shDCAF5_BAF155__VS__shCTRL_BAF155.Down2.Region.bed \
-a 2000 -b 2000 -o baf155.swi.snf.SB1.brd9.gz

plotHeatmap \
	-m baf155.swi.snf.SB1.brd9.gz \
	-out baf155.swi.snf.SB1.brd9.svg \
	--sortUsingSamples 2 \
	--samplesLabel 'shCTRL_BAF155' 'shDCAF5_BAF155' 'shCTRL_ARID1A' 'shDCAF5_ARID1A' 'shCTRL_BRG1' 'shDCAF5_BRG1' 'shCTRL_BRD9' 'shDCAF5_BRD9' 'SMARCB1'   \
	--colorList "white,dodgerblue" "white,dodgerblue" "white,magenta" "white,magenta" "white,grey" "white,grey" "white,#482B7D" "white,#482B7D" "white,orangered"  \
	--regionsLabel 'BAF155 Gain' 'BAF155 Loss' \
	--whatToShow 'heatmap and colorbar' \
	--zMax 10 10 10 10 10 10 10 10 5 \
	--missingDataColor 'white'

