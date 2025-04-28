#!/bin/bash
#SBATCH --job-name=deep_ep
#SBATCH --partition=general
#SBATCH --time=48:00:00 

#SBATCH --mem=250GB
#SBATCH --gres=gpu:A100_80GB:2
#SBATCH --cpus-per-task=24

#SBATCH --output=/home/dhruvgu2/llm_sys_DeepEP/slurm/logs/output.log
#SBATCH --error=/home/dhruvgu2/llm_sys_DeepEP/slurm/logs/error.out

#SBATCH --mail-type=END
# #SBATCH --mail-user=dhruvgu2@andrew.cmu.edu

# Check for NVLink connectivity
echo "Checking for NVLink connectivity..."
nvidia-smi nvlink --status
nvidia-smi topo -m

module load cuda-12.5
cd /home/dhruvgu2/llm_sys_DeepEP

echo "Compiling the CUDA code..."
sh compile_cuda.sh 
echo "CUDA code compiled successfully."

echo "Starting the test script..."
python tests/test_intranode.py
echo "Test script completed."