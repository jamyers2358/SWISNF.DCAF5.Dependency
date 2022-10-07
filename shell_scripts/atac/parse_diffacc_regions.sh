#!/bin/bash 

# create two bed files 1 regions that gain and 1 for regions that lose

# if the region is significantly gained, print the regions 
awk -v OFS="\t" '{if($6 < 0.05 && $2 >= 1) print $1}' shDCAF5vsshCTRL_diff.txt > shDCAF5vsshCTRL_diff_gain.tmp
tr ':' '\t' <shDCAF5vsshCTRL_diff_gain.tmp | tr '-' '\t' > shDCAF5vsshCTRL_diff_gain.bed

awk -v OFS="\t" '{if($6 < 0.05 && $2 <= -1) print $1}' shDCAF5vsshCTRL_diff.txt > shDCAF5vsshCTRL_diff_loss.tmp
tr ':' '\t' <shDCAF5vsshCTRL_diff_loss.tmp | tr '-' '\t' > shDCAF5vsshCTRL_diff_loss.bed

# if the region is significantly gained, print the regions
awk -v OFS="\t" '{if($2 < 0.05 && $2 > -0.05) print $1}' shDCAF5vsshCTRL_diff.txt > shDCAF5vsshCTRL_control.tmp
tr ':' '\t' <shDCAF5vsshCTRL_control.tmp | tr '-' '\t' > shDCAF5vsshCTRL_control.bed


wc -l shDCAF5vsshCTRL_diff_gain.bed
wc -l shDCAF5vsshCTRL_diff_loss.bed
wc -l shDCAF5vsshCTRL_control.bed
rm *tmp

