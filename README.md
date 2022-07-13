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
| OpenBLAS 0.3.13     | 128 cores | 10240 | **2287** |
| OpenBLAS 0.3.13     | 64 cores  | 10240 | 2239 |

**Bold:** Needs fixing on either my or the package side?

#### Notes
* Julia version 1.8.0-beta3 since the maximal number of OpenBLAS threads is fixed to 32 in 1.7 (current stable version).
