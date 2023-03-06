pod5-convert-from-fast5 -p 20 QC_gDNA/SNI_SQK_LSK114_03032023/SNI_7_1_230223/20230303_1506_MN24731_ANQ118_9da6efca/fast5 QC_gDNA/SNI_SQK_LSK114_03032023/pod5
export PATH=~/basecalling/dorado-0.1.1+eb48766-Linux/bin/:$PATH

dorado basecaller --device "cuda:0" -b 200 --emit-fastq tools_ont/dorado_models/dna_r10.4.1_e8.2_400bps_fast@v4.0.0 QC_gDNA/SNI_SQK_LSK114_03032023/pod5 \
> QC_gDNA/SNI_SQK_LSK114_03032023/SNI_QC.fastq
