#!/bin/bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 128
#SBATCH -A pc2-mitarbeiter
#SBATCH -o mkl_job_128.out
#SBATCH -J mkl_job_128
#SBATCH -p all
#SBATCH -t 30:00
#SBATCH --exclusive

module reset

NTHREADS=128 # 128 == full node
export JULIA_NUM_THREADS=$NTHREADS
export MKL_NUM_THREADS=$NTHREADS
export MKL_DYNAMIC=false
export OMP_PLACES=CORES
export OMP_PROC_BIND=CLOSE

# Need to use Julia 1.8(!) which we don't yet have as a module
/scratch/pc2-mitarbeiter/bauerc/.julia/juliaup/julia-1.8.0-rc1+0~x64/bin/julia --project dgemm_mkl.jl 10240