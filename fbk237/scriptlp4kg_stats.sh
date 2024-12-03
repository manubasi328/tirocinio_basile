#!/bin/bash
#SBATCH -p compute
#SBATCH -N 1                # 1 node
#SBATCH --ntasks-per-node=48 # 4 tasks out of 32
#SBATCH --gres=gpu:0        # 4 gpus per node out of 4
#SBATCH --mem=450GB        # memory per node out of 494000MB 
#SBATCH --job-name=fbklps
#SBATCH --error=myJobfbklps.err            # standard error file
#SBATCH --output=myJobfbklps.out           # standard output file

module load miniconda3/24.4.0
conda activate torch
export LD_LIBRARY_PATH=/hpc/home/$USER/.conda/envs/torch/lib

/usr/bin/time -v $HOME/bin/swipl --stack-limit=450g compute_stats.pl
