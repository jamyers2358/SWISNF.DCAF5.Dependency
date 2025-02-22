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
	-S shCTRL_BRG1_rep2Out.merged.bw shDCAF5_BRG1_rep2Out.merged.bw shCTRL_ARID1A.merged.bw shDCAF5_ARID1A.merged.bw shCTRL_BAF155.merged.bw shDCAF5_BAF155.merged.bw ${bw}shCTRL_BRD9.avg.bw ${bw}shDCAF5_BRD9.avg.bw SMARCB1.avg.bw -R MetaDiffVoom.shDCAF5_BRG1_rep2Out__VS__shCTRL_BRG1_rep2Out.Up2.Region.bed MetaDiffVoom.shDCAF5_BRG1_rep2Out__VS__shCTRL_BRG1_rep2Out.Down2.Region.bed \
-a 2000 -b 2000 -o brg1.swi.snf.SB1.brd9.gz

plotHeatmap \
	-m brg1.swi.snf.SB1.brd9.gz \
	-out brg1.swi.snf.SB1.brd9.svg \
	--sortUsingSamples 2 \
	--samplesLabel 'shCTRL_BRG1' 'shDCAF5_BRG1' 'shCTRL_ARID1A' 'shDCAF5_ARID1A' 'shCTRL_BAF155' 'shDCAF5_BAF155' 'shCTRL_BRD9' 'shDCAF5_BRD9' 'SMARCB1'  \
	--colorList "white,grey" "white,grey" "white,magenta" "white,magenta" "white,dodgerblue" "white,dodgerblue" "white,#482B7D" "white,#482B7D" "white,orangered" \
	--regionsLabel 'BRG1 Gain' 'BRG1 Loss' \
	--whatToShow 'heatmap and colorbar' \
	--zMax 10 10 10 10 10 10 10 10 5 \
	--missingDataColor 'white'

