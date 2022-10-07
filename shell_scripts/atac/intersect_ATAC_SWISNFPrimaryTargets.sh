module load bedtools 

bedtools intersect -a ../SMb1.SMARCB1__VS__GFP.Up2.Region.bed -b G401_BAF47_BAF155_int_G401_BAF47_BRG1.bed -u > SMb1.SMARCB1__VS__GFP.Up2.Region.PrimaryTargets.bed 
bedtools intersect -a ../shDCAF5vsshCTRL_diff_gain.bed -b G401_BAF47_BAF155_int_G401_BAF47_BRG1.bed -u > shDCAF5vsshCTRL_diff_gain.PrimaryTargets.bed
wc -l SMb1.SMARCB1__VS__GFP.Up2.Region.PrimaryTargets.bed 
wc -l shDCAF5vsshCTRL_diff_gain.PrimaryTargets.bed
