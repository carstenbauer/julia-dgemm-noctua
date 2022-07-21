[Paderborn Center for Parallel Computing (PC2)](https://pc2.uni-paderborn.de/)    
[National High-Performance Computing Alliance (NHR)](https://www.nhr-verein.de/)

## Noctua 1

**System:** [Noctua 1](https://pc2.uni-paderborn.de/hpc-services/available-systems/noctua1) (single and dual-socket **Intel** Xeon Gold "Skylake" 6148 20-Core CPUs)
* 20 cores -> single-socket
* 40 cores -> dual-socket (full node)

| BLAS | # cores | size | GFLOPS |
|---------------------|-----------|-------|------|
| Intel MKL v2022.0.0 (JLL) | 40 cores | 10240 | 2081 |
| Intel MKL v2022.0.0 (JLL) | 20 cores  | 10240 | 1054 |
| BLIS 0.9.0 (JLL)          | 40 cores | 10240 | 1890 |
| BLIS 0.9.0 (JLL)          | 20 cores  | 10240 | 990 |
| Octavian 0.3.15     | 40 cores | 10240 | **1053** |
| Octavian 0.3.15     | 20 cores  | 10240 | 1016 |
| OpenBLAS 0.3.20 (shipped with Julia 1.8)    | 40 cores | 10240 | **1092** |
| OpenBLAS 0.3.20 (shipped with Julia 1.8)     | 20 cores  | 10240 | 1063 |
|---------------------|-----------|-------|------|
| OpenBLAS 0.3.17 (custom)    | 40 cores | 10240 | 1908 |
| OpenBLAS 0.3.17 (custom)     | 20 cores  | 10240 | 1439 |
| OpenBLAS 0.3.20 (custom)    | 40 cores | 10240 | 1897 |
| OpenBLAS 0.3.20 (custom)     | 20 cores  | 10240 | 1444 |
|---------------------|-----------|-------|------|
| OpenBLAS 0.3.17 (JLL)    | 40 cores | 10240 | 1437 |
| OpenBLAS 0.3.17 (JLL)     | 20 cores  | 10240 | 1124 |
| OpenBLAS 0.3.20 (JLL)    | 40 cores | 10240 | 1535 |
| OpenBLAS 0.3.20 (JLL)     | 20 cores  | 10240 | 1185 |

**Bold:** Needs fixing on either my or the package side? (see https://github.com/JuliaLang/julia/issues/46123)

## Noctua 2

**System:** [Noctua 2](https://pc2.uni-paderborn.de/hpc-services/available-systems/noctua2) (single and dual-socket **AMD** EPYC Milan 7763 64-Core CPUs)
* 64 cores -> single-socket
* 128 cores -> dual-socket (full node)

| BLAS | # cores | size | GFLOPS |
|---------------------|-----------|-------|------|
| Intel MKL v2022.0.0 (JLL) | 128 cores | 10240 | 3287 |
| Intel MKL v2022.0.0 (JLL) | 64 cores  | 10240 | 1679 |
| BLIS 0.9.0 (JLL)          | 128 cores | 10240 | 3935 |
| BLIS 0.9.0 (JLL)          | 64 cores  | 10240 | 2033 |
| Octavian 0.3.15     | 128 cores | 10240 | **1854** |
| Octavian 0.3.15     | 64 cores  | 10240 | 1869 |
| OpenBLAS 0.3.20 (shipped with Julia 1.8)    | 128 cores | 10240 | **2305** |
| OpenBLAS 0.3.20 (shipped with Julia 1.8)     | 64 cores  | 10240 | 2284 |

**Bold:** Needs fixing on either my or the package side?

#### Notes
* Julia version 1.8.0-beta3 since the maximal number of OpenBLAS threads is fixed to 32 in 1.7 (current stable version).
