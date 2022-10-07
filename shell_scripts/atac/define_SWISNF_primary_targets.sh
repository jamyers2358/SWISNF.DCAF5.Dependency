module load bedtools 

bedtools intersect -a G401_BAF47_BAF155_hg19_macs2.filter.narrowPeak -b G401_BAF47_BRG1_hg19_macs2.filter.narrowPeak -u > G401_BAF47_BAF155_int_G401_BAF47_BRG1.bed

