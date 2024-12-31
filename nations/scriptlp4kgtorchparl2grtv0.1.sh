#!/bin/bash
#SBATCH -p gpu
#SBATCH -N 1                # 1 node
#SBATCH --ntasks-per-node=16 # 4 tasks out of 32
#SBATCH --gres=gpu:1        # 4 gpus per node out of 4
#SBATCH --mem=100GB        # memory per node out of 494000MB 
#SBATCH --job-name=natlppar_l2grtv0.1
#SBATCH --error=myJobnatlppar_l2grtv0.1.err            # standard error file
#SBATCH --output=myJobnatlppar_l2grtv0.1.out           # standard output file
#SBATCH --mail-user=rzf@unife.it          # standard output file


module load miniconda3/24.4.0
conda activate torch
export LD_LIBRARY_PATH=/hpc/home/$USER/.conda/envs/torch/lib/
/usr/bin/time -v $HOME/bin/swipl --stack-limit=450g compute_par_l2grtv0.1.pl
conda deactivate
module unload miniconda3/24.4.0
