#!/bin/bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 128
#SBATCH -A pc2-mitarbeiter
#SBATCH -o openblas_job_64.out
#SBATCH -J openblas_job_64
#SBATCH -p normal
#SBATCH --reservation=bauerc_dgemm
#SBATCH -t 30:00
#SBATCH --exclusive

module reset

NTHREADS=64 # 64 == single socket
export JULIA_NUM_THREADS=$NTHREADS
export OMP_NUM_THREADS=$NTHREADS
export OMP_PLACES=CORES
export OMP_PROC_BIND=CLOSE

# Need to use Julia 1.8(!) which we don't yet have as a module
/scratch/pc2-mitarbeiter/bauerc/.julia/juliaup/julia-1.8.0-rc1+0~x64/bin/julia --project dgemm_openblas.jl 10240
