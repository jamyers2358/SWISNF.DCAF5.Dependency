
module load bedtools

peak_path_1='../../ROBERTS-277361-ATACSEQ_analysis/Peaks/'
peak_path_2='../../tmp_sjcab_std_atac/'

##2461568_G401_ATAC_shCTRL_rep1_SRJ.free.FDR50_peaks.narrowPeak
##2461569_G401_ATAC_shCTRL_rep2_SRJ.free.FDR50_peaks.narrowPeak
##2461570_G401_ATAC_shCTRL_rep3_SRJ.free.FDR50_peaks.narrowPeak
#2461571_G401_ATAC_shDCAF5_rep1_SRJ.free.FDR50_peaks.narrowPeak
#2461572_G401_ATAC_shDCAF5_rep2_SRJ.free.FDR50_peaks.narrowPeak
#2461573_G401_ATAC_shDCAF5_rep3_SRJ.free.FDR50_peaks.narrowPeak
#
##2461568_G401_ATAC_shCTRL_rep1_SRJ.free_macs2.filter.narrowPeak
##2461569_G401_ATAC_shCTRL_rep2_SRJ.free_macs2.filter.narrowPeak
##2461570_G401_ATAC_shCTRL_rep3_SRJ.free_macs2.filter.narrowPeak
#2461571_G401_ATAC_shDCAF5_rep1_SRJ.free_macs2.filter.narrowPeak
#2461572_G401_ATAC_shDCAF5_rep2_SRJ.free_macs2.filter.narrowPeak
#2461573_G401_ATAC_shDCAF5_rep3_SRJ.free_macs2.filter.narrowPeak

# for all shCTRL 

bedtools intersect -a ${peak_path_1}2461568_G401_ATAC_shCTRL_rep1_SRJ.free_macs2.filter.narrowPeak -b ${peak_path_2}2461569_G401_ATAC_shCTRL_rep2_SRJ.free.FDR50_peaks.narrowPeak  -u > shCTRL.rep1kept2.bed

bedtools intersect -a shCTRL.rep1kept2.bed -b ${peak_path_2}2461570_G401_ATAC_shCTRL_rep3_SRJ.free.FDR50_peaks.narrowPeak -u > shCTRL.rep1kept.bed

bedtools intersect -a ${peak_path_1}2461569_G401_ATAC_shCTRL_rep2_SRJ.free_macs2.filter.narrowPeak -b ${peak_path_2}2461568_G401_ATAC_shCTRL_rep1_SRJ.free.FDR50_peaks.narrowPeak -u > shCTRL.rep2kept1.bed

bedtools intersect -a shCTRL.rep2kept1.bed -b ${peak_path_2}2461570_G401_ATAC_shCTRL_rep3_SRJ.free.FDR50_peaks.narrowPeak -u > shCTRL.rep2kept.bed

bedtools intersect -a ${peak_path_1}2461570_G401_ATAC_shCTRL_rep3_SRJ.free_macs2.filter.narrowPeak -b ${peak_path_2}2461568_G401_ATAC_shCTRL_rep1_SRJ.free.FDR50_peaks.narrowPeak -u > shCTRL.rep3kept1.bed

bedtools intersect -a shCTRL.rep3kept1.bed -b ${peak_path_2}2461569_G401_ATAC_shCTRL_rep2_SRJ.free.FDR50_peaks.narrowPeak -u > shCTRL.rep3kept.bed

cat shCTRL.rep1kept.bed shCTRL.rep2kept.bed shCTRL.rep3kept.bed | sortBed -i | mergeBed -i stdin > shCTRL.Repro.bed

wc -l shCTRL.Repro.bed

# for all shDCAF5




