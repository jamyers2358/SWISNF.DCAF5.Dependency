#!/bin/bash 

awk -v OFS="\t" '{new_var="ARID1A_"NR; print $1,$2,$3,new_var,$4}' MetaDiffVoom.shDCAF5_ARID1A__VS__shCTRL_ARID1A.Up2.Region.sort.score.bed > MetaDiffVoom.shDCAF5_ARID1A__VS__shCTRL_ARID1A.Up2.Region.sort.score.beta.bed
