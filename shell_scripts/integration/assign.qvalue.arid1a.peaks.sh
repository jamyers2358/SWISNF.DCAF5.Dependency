# I want to use the differential peaks for BETA. To do this, I need to generated average scores for the gained/lost peaks using bedtools map and the individual replicates since the bedfile of gains is just chr start and stop


cat 2403658_G401_shDCAF5_ARID1A_CST.hg19.macs2.narrowPeak 2418838_G401_shCTRL_ARID1A_Sigma_rep2_S11.hg19.macs2.narrowPeak 2418839_G401_shCTRL_ARID1A_Sigma_rep3_S12.hg19.macs2.narrowPeak > Union_shDCAF5_ARID1A.narrowPeak

bedtools map -a MetaDiffVoom.shDCAF5_ARID1A__VS__shCTRL_ARID1A.Up2.Region.sort.bed -b Union_shDCAF5_ARID1A.sort.narrowPeak -o mean -c 9 > MetaDiffVoom.shDCAF5_ARID1A__VS__shCTRL_ARID1A.Up2.Region.sort.score.bed

#column 9 contains the q value for the peak
