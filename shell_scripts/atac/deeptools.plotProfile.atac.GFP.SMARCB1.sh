#BSUB -P deeptools_roberts
#BSUB -q standard 
#BSUB -R rusage[mem=32000]
#BSUB -eo je.deeptools
#BSUB -n 8
#BSUB -oo jo.deeptools
#BSUB -R "span[hosts=1]"

module load python/2.7.12

bw="/research_jude/rgs01_jude/groups/robertsgrp/projects/DCAF5/common/ATACSEQ/ROBERTS-277361-ATACSEQ/ROBERTS-277361-ATACSEQ_analysis/Coverage"

computeMatrix reference-point \
	--referencePoint "center" \
	-S shCTRL.atac.avg.bw shDCAF5.atac.avg.bw GFP.cab.avg.bw SMARCB1.cab.avg.bw  -R 01_SMb1.SMARCB1__VS__GFP.Up2.Region.PrimaryTargets.bed  \
-a 2000 -b 2000 -o SMb1.Up2.ATAC.cab.gz

plotHeatmap \
        -m SMb1.Up2.ATAC.cab.gz \
        -out SMb1.Up2.ATAC.cab.svg \
        --sortUsingSamples 2 \
        --samplesLabel shCTRL shDCAF5 GFP SMARCB1 \
        --colorList "white,grey" "white,red" "white,grey" "white,red" "white,red" \
         --zMax 20 20 20 20 20 \
	--regionsLabel 'Gain SMARCB1 no gain DCAF5' \
        --missingDataColor 'white'
#plotProfile \
#        -m arid1a.meta.ATAC.heatMap.final.cab.gz \
#        --samplesLabel GFP SMARCB1 \
#        --regionsLabel "ARID1A gained" \
#        --refPointLabel "peak center" \
#        --outFileNameData arid1a.meta.final.data.cab.txt \
#        -out arid1a.meta.atac.final.cab.svg \
#        --perGroup \
#        --colors grey red  \
