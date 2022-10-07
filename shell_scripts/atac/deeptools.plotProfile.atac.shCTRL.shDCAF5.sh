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
	-S shCTRL.atac.avg.bw shDCAF5.atac.avg.bw  -R MetaDiffVoom.shDCAF5_ARID1A__VS__shCTRL_ARID1A.Up2.Region.bed  \
-a 2000 -b 2000 -o arid1a.meta.ATAC.heatMap.final.srj.gz

plotProfile \
        -m arid1a.meta.ATAC.heatMap.final.srj.gz \
        --samplesLabel shCTRL shDCAF5 \
        --regionsLabel "ARID1A gained" \
        --refPointLabel "peak center" \
        --outFileNameData arid1a.meta.final.data.srj.txt \
        -out arid1a.meta.atac.final.srj.svg \
        --perGroup \
        --yMax 30 \
	--colors grey red \
