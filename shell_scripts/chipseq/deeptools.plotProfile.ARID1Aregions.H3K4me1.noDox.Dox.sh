#BSUB -P deeptools_roberts
#BSUB -q standard 
#BSUB -R rusage[mem=32000]
#BSUB -eo je.deeptools
#BSUB -n 8
#BSUB -oo jo.deeptools
#BSUB -R "span[hosts=1]"

module load python/2.7.12

bw="/research_jude/rgs01_jude/groups/robertsgrp/projects/PHF6/robertsgrp/Projects/Public_data/ChIPseq/G401/WangX/"

computeMatrix reference-point \
	--referencePoint "center" \
	-S ${bw}H3K4me1_NoDOX/H3K4me1_NoDOX.bw ${bw}H3K4me1_DOX/H3K4me1_DOX.bw  -R MetaDiffVoom.shDCAF5_ARID1A__VS__shCTRL_ARID1A.Up2.Region.bed  \
-a 2000 -b 2000 -o arid1a.meta.k4me1.dox.gz

plotProfile \
	-m arid1a.meta.k4me1.dox.gz \
	--samplesLabel noDox_H3K4me1 Dox_H3K4me1 \
	--regionsLabel "ARID1A gained" \
	--refPointLabel "peak center" \
	--outFileNameData arid1a.meta.k4me1.dox.data.txt \
	-out arid1a.meta.k4me1.dox.svg \
	--perGroup \
	--colors grey black \

