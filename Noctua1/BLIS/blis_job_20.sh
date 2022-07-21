#!/bin/bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 40
#SBATCH -A pc2-mitarbeiter
#SBATCH -o blis_job_20.out
#SBATCH -J blis_job_20
#SBATCH -p gpu
#SBATCH --reservation=bauerc_269
#SBATCH -t 30:00
#SBATCH --exclusive

module reset

NTHREADS=20 # 20 == single socket
export JULIA_NUM_THREADS=$NTHREADS
export BLIS_NUM_THREADS=$NTHREADS
export OMP_PLACES=CORES # does BLIS respect OMP variables?
export OMP_PROC_BIND=CLOSE # does BLIS respect OMP variables?

# Need to use Julia 1.8(!) which we don't yet have as a module
/scratch/pc2-mitarbeiter/bauerc/.julia/juliaup/julia-1.8.0-rc1+0~x64/bin/julia --project dgemm_blis.jl 10240
