#BSUB -P deeptools_roberts
#BSUB -q standard 
#BSUB -R rusage[mem=32000]
#BSUB -eo je.deeptools
#BSUB -n 8
#BSUB -oo jo.deeptools
#BSUB -R "span[hosts=1]"

module load python/2.7.12



#computeMatrix reference-point \
#	--referencePoint "center" \
#	-S GFP_sgC_H3K27ac.avg.bw B1_sgC_H3K27ac.avg.bw -R MetaDiffVoom.shDCAF5_ARID1A__VS__shCTRL_ARID1A.Up2.Region.bed  \
#-a 2000 -b 2000 -o arid1a.meta.SB1K27ac.gz

plotProfile \
	-m arid1a.meta.SB1K27ac.gz \
	--samplesLabel SMARCB1-H3K27ac SMARCB1+H3K27ac \
	--regionsLabel "ARID1A gained" \
	--refPointLabel "peak center" \
	--outFileNameData arid1a.meta.SB1K27ac.data.txt \
	-out arid1a.meta.SB1K27ac.svg \
	--yMax 7 \
	--yMin 0 \
	--perGroup \
	--colors grey brown \

