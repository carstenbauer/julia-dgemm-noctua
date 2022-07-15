[Paderborn Center for Parallel Computing (PC2)](https://pc2.uni-paderborn.de/)    
[National High-Performance Computing Alliance (NHR)](https://www.nhr-verein.de/)

## Noctua 2

**System:** [Noctua 2](https://pc2.uni-paderborn.de/hpc-services/available-systems/noctua2) (single and dual-socket AMD EPYC Milan 7763 64-Core CPUs)
* 64 cores -> single-socket
* 128 cores -> dual-socket (full node)

| BLAS | # cores | size | GFLOPS |
|---------------------|-----------|-------|------|
| Intel MKL v2022.0.0 | 128 cores | 10240 | 3279 |
| Intel MKL v2022.0.0 | 64 cores  | 10240 | 1684 |
| BLIS 0.9.0          | 128 cores | 10240 | 3893 |
| BLIS 0.9.0          | 64 cores  | 10240 | 2014 |
| Octavian 0.3.15     | 128 cores | 10240 | **1843** |
| Octavian 0.3.15     | 64 cores  | 10240 | 1802 |
| OpenBLAS 0.3.17 (shipped)     | 128 cores | 10240 | **2287** |
| OpenBLAS 0.3.17 (shipped)     | 64 cores  | 10240 | 2239 |

**Bold:** Needs fixing on either my or the package side?

## Noctua 1

**System:** [Noctua 1](https://pc2.uni-paderborn.de/hpc-services/available-systems/noctua1) (single and dual-socket Intel Xeon Gold "Skylake" 6148 20-Core CPUs)
* 20 cores -> single-socket
* 40 cores -> dual-socket (full node)

| BLAS | # cores | size | GFLOPS |
|---------------------|-----------|-------|------|
| Intel MKL v2022.0.0 | 40 cores | 10240 | 2096 |
| Intel MKL v2022.0.0 | 20 cores  | 10240 | 1073 |
| BLIS 0.9.0          | 40 cores | 10240 | 1819 |
| BLIS 0.9.0          | 20 cores  | 10240 | 994 |
| Octavian 0.3.15     | 40 cores | 10240 | **1053** |
| Octavian 0.3.15     | 20 cores  | 10240 | 1016 |
| OpenBLAS 0.3.17 (shipped)    | 40 cores | 10240 | **1032** |
| OpenBLAS 0.3.17 (shipped)     | 20 cores  | 10240 | 1176 |

**Bold:** Needs fixing on either my or the package side?

#### Notes
* Julia version 1.8.0-beta3 since the maximal number of OpenBLAS threads is fixed to 32 in 1.7 (current stable version).
