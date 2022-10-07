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
#	-S shCTRL_H3K27ac_rep1Out.singleRep.bw shDCAF5_H3K27ac.merged.bw -R MetaDiffVoom.shDCAF5_ARID1A__VS__shCTRL_ARID1A.Up2.Region.bed  \
#-a 2000 -b 2000 -o arid1a.meta.k27ac.gz

plotProfile \
	-m arid1a.meta.k27ac.gz \
	--samplesLabel shCTRL_H3K27ac shDCAF5_H3K27ac \
	--regionsLabel "ARID1A gained" \
	--refPointLabel "peak center" \
	--yMin 0 \
	--outFileNameData arid1a.meta.k27ac.data.txt \
	-out arid1a.meta.k27ac.svg \
	--perGroup \
	--colors grey blueviolet \

