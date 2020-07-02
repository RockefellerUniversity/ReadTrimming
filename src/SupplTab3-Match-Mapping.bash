fc=featureCounts
for trimmer1 in RAW galore maticWindow maticInfo
do
	for test in SEQC-A SEQC-B
	do
		f1=Mapped-$test-Normal-$trimmer1.bam
		nohup $fc -a hg38_RefSeq_exon.txt -F SAF -T6 -R SAM -p -o annot-1.FC $f1 &>/dev/null&
		pids="$pids $!"
	done
done
wait $pids

for trimmer1 in RAW galore maticWindow maticInfo
do
	for trimmer2 in RAW galore maticWindow maticInfo
	do
		if [[ $trimmer1 > $trimmer2 ]]
		then 
			printf "$trimmer1\t$trimmer2\t"
			for test in SEQC-A SEQC-B
			do
			  {
				f1=Mapped-$test-Normal-$trimmer1.bam
				f2=Mapped-$test-Normal-$trimmer2.bam
				xx=$( python SupplTab3-Match-Read-Pos.py $f1.featureCounts.sam $f2.featureCounts.sam  )
				printf "%s %s %s" $trimmer1 $trimmer2 $test
				printf "\t"
				printf "$xx"
				printf "\t"
				echo
				echo
				echo
				echo
			  }&
			done 
			echo
		fi
	done
done

