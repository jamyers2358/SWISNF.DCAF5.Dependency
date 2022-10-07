
module load bedtools

peak_path_1='../../ROBERTS-277361-ATACSEQ_analysis/Peaks/'
peak_path_2='../../tmp_sjcab_std_atac/'

#2461571_G401_ATAC_shDCAF5_rep1_SRJ.free.FDR50_peaks.narrowPeak
#2461572_G401_ATAC_shDCAF5_rep2_SRJ.free.FDR50_peaks.narrowPeak
#2461573_G401_ATAC_shDCAF5_rep3_SRJ.free.FDR50_peaks.narrowPeak
#
#2461571_G401_ATAC_shDCAF5_rep1_SRJ.free_macs2.filter.narrowPeak
#2461572_G401_ATAC_shDCAF5_rep2_SRJ.free_macs2.filter.narrowPeak
#2461573_G401_ATAC_shDCAF5_rep3_SRJ.free_macs2.filter.narrowPeak

# for all shDCAF5 

bedtools intersect -a ${peak_path_1}2461571_G401_ATAC_shDCAF5_rep1_SRJ.free_macs2.filter.narrowPeak -b ${peak_path_2}2461572_G401_ATAC_shDCAF5_rep2_SRJ.free.FDR50_peaks.narrowPeak  -u > shDCAF5.rep1kept2.bed

bedtools intersect -a shDCAF5.rep1kept2.bed -b ${peak_path_2}2461573_G401_ATAC_shDCAF5_rep3_SRJ.free.FDR50_peaks.narrowPeak -u > shDCAF5.rep1kept.bed

bedtools intersect -a ${peak_path_1}2461572_G401_ATAC_shDCAF5_rep2_SRJ.free_macs2.filter.narrowPeak -b ${peak_path_2}2461571_G401_ATAC_shDCAF5_rep1_SRJ.free.FDR50_peaks.narrowPeak -u > shDCAF5.rep2kept1.bed

bedtools intersect -a shDCAF5.rep2kept1.bed -b ${peak_path_2}2461573_G401_ATAC_shDCAF5_rep3_SRJ.free.FDR50_peaks.narrowPeak -u > shDCAF5.rep2kept.bed

bedtools intersect -a ${peak_path_1}2461573_G401_ATAC_shDCAF5_rep3_SRJ.free_macs2.filter.narrowPeak -b ${peak_path_2}2461571_G401_ATAC_shDCAF5_rep1_SRJ.free.FDR50_peaks.narrowPeak -u > shDCAF5.rep3kept1.bed

bedtools intersect -a shDCAF5.rep3kept1.bed -b ${peak_path_2}2461572_G401_ATAC_shDCAF5_rep2_SRJ.free.FDR50_peaks.narrowPeak -u > shDCAF5.rep3kept.bed

cat shDCAF5.rep1kept.bed shDCAF5.rep2kept.bed shDCAF5.rep3kept.bed | sortBed -i | mergeBed -i stdin > shDCAF5.Repro.bed

wc -l shDCAF5.Repro.bed

# for all shDCAF5




