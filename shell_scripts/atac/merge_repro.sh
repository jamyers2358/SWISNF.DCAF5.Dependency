

module load bedtools

cat shCTRL.Repro.bed shDCAF5.Repro.bed | sortBed -i | mergeBed -i stdin > shCTRL.shDCAF5.Repro.NFR.bed
wc -l shCTRL.shDCAF5.Repro.NFR.bed
