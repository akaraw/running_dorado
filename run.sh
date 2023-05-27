#!/bin/bash

#SBATCH --job-name doradp_gpu
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task=4
#SBATCH --mem 16gb
#SBATCH --time 24:00:00
#SBATCH --gres=gpu:3

POD5 - https://github.com/nanoporetech/pod5-file-format
pod5 convert fast5 --help


pod5 convert fast5 QC_gDNA/SNI_SQK_LSK114_03032023/SNI_7_1_230223/20230303_1506_MN24731_ANQ118_9da6efca/fast5 --output QC_gDNA/SNI_SQK_LSK114_03032023/pod5
export PATH=~/basecalling/dorado-0.1.1+eb48766-Linux/bin/:/scratch1/kar131/mambaforge/bin:$PATH

#cuda:${CUDA_VISIBLE_DEVICES}

dorado basecaller --device "cuda:0" -b 200 --emit-fastq tools_ont/dorado_models/dna_r10.4.1_e8.2_400bps_fast@v4.0.0 QC_gDNA/SNI_SQK_LSK114_03032023/pod5 \
> QC_gDNA/SNI_SQK_LSK114_03032023/SNI_QC.fastq
