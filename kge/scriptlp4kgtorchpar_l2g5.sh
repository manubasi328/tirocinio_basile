#!/bin/bash
#SBATCH -p gpu
#SBATCH -N 1                # 1 node
#SBATCH --ntasks-per-node=16 # 4 tasks out of 32
#SBATCH --gres=gpu:1        # 4 gpus per node out of 4
#SBATCH --mem=450GB        # memory per node out of 494000MB 
#SBATCH --job-name=kgelppar_l2g5
#SBATCH --error=myJobkgelppar_l2g5.err            # standard error file
#SBATCH --output=myJobkgelppar_l2g5.out           # standard output file
#SBATCH --mail-user=rzf@unife.it          # standard output file


module load miniconda3/24.4.0
conda activate torch
export LD_LIBRARY_PATH=/hpc/home/$USER/.conda/envs/torch/lib/
/usr/bin/time -v $HOME/bin/swipl --stack-limit=100g compute_par_l2g5.pl
conda deactivate
module unload miniconda3/24.4.0
