st=STAR
index=STAR273a-hg38-hasAnno
purp=Normal


mkdir -p $index

if ! test -f hg38.fasta
then
	zcat  hg38.fasta.gz >  hg38.fasta
fi

if ! test -f $index/genomeParameters.txt
then
  STAR --runMode genomeGenerate --genomeDir $index --genomeFastaFiles hg38.fasta\
     --sjdbGTFfile hg38.GTF
fi

for test in SEQC-A SEQC-B 
do
	trimmer=RAW 
	sc=`echo $test |cut -f2 -d'-' `
	r1=SEQC_ILM_AGR_${sc}_1-15M_R1.fastq.gz
	r2=SEQC_ILM_AGR_${sc}_1-15M_R2.fastq.gz

	# Normal STAR
	$st --runThreadN 8 --outFilterMultimapNmax 1 --genomeDir $index --readFilesIn \
	$r1 $r2 --readFilesCommand zcat --outFileNamePrefix \
	del4-STAR-$test-$trimmer.bam --outSAMtype BAM Unsorted;\
	$st --runThreadN 8 --outFilterMultimapNmax 1 --genomeDir $index --readFilesIn \
	$r1 $r2 --readFilesCommand zcat --outFileNamePrefix \
	STAR-$test-$trimmer.bam  --outSAMtype BAM Unsorted --sjdbFileChrStartEnd  \
	del4-STAR-$test-$trimmer.bamSJ.out.tab

	# "EndToEnd"
	$st --runThreadN 8 --outFilterMultimapNmax 1 --genomeDir $index --readFilesIn \
	$r1 $r2 --readFilesCommand zcat --outFileNamePrefix \
	del4-STAR-$test-$trimmer.bam --outSAMtype BAM Unsorted;\
	$st --runThreadN 8 --outFilterMultimapNmax 1 --genomeDir $index --readFilesIn \
	$r1 $r2 --readFilesCommand zcat --outFileNamePrefix \
	STARe2e-$test-$trimmer.bam  --outSAMtype BAM Unsorted --sjdbFileChrStartEnd  \
	del4-STAR-$test-$trimmer.bamSJ.out.tab --alignEndsType EndToEnd 
done
