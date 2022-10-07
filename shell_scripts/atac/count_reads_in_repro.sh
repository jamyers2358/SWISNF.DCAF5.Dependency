#BSUB -P DCAF5
#BSUB -q priority 
#BSUB -R rusage[mem=32000]
#BSUB -eo ze.log
#BSUB -n 8
#BSUB -oo zo.log
#BSUB -R "span[hosts=1]"

module load bedtools

REPRO="../repro_peaks/shCTRL.shDCAF5.Repro.NFR.bed"
HEADER=("Region")
for BEDPE in $(ls ../../tmp_sjcab_std_atac/*bedpe); do 
	tmp=$(cut -d '/' -f4 <<< ${BEDPE})
	PREFIX=${tmp%.*}
	HEADER+=(${PREFIX})
	# first create the bed file for counting 
	echo ${PREFIX}
	echo ${BEDPE}
	cat $BEDPE | awk '$NF == "-" && $6 - $2 < 109{OFS="\t"; print $1,$2,$6}' > ${PREFIX}.bed
	# now count the reads 
	bedtools intersect -a ${REPRO} -b ${PREFIX}.bed -c | awk '{print $NF}' > ${PREFIX}.count
done

#combine into count table
awk '{print $1":"$2"-"$3}' ${REPRO} > shCTRL.shDCAF5.All.Repro.NFR.bed.pre
echo "${HEADER[*]}" > shCTRL.shDCAF5.All.Repro.NFR.count.dat
paste shCTRL.shDCAF5.All.Repro.NFR.bed.pre *.count >> shCTRL.shDCAF5.All.Repro.NFR.count.dat

