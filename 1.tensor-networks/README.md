# Tensor Networks (Quantum many-body)

## Contents
1. Ground state finding, such as DMRG, CTMRG and VUMPO
   1. DMRG ([Julia](https://github.com/CodingThrust/SimpleTDVP.jl))
   2. Corner transfer matrix renormalization group (CTMRG) ([Julia](https://github.com/under-Peter/TensorNetworkAD.jl))
   3. variational uniform Matrix Product State algorithm (VUMPS) ([Julia](https://github.com/Jutho/TNSchool2018))
2. Finite temperature methods
   1. Continuous matrix product operator (CMPO) ([Python](https://github.com/TensorBFS/cMPO))
3. Dynamics
   1. Time-evolving block decimation (TEBD) ([Python](https://github.com/tenpy/tenpy))
   2. Time-dependent variational principle (TDVP) ([Julia](https://github.com/Jutho/TNSchool2018))
4. Classical tensor networks
   1. Tensor renormalization group (TRG) ([Julia](https://github.com/under-Peter/TensorNetworkAD.jl))

## People (suggested to follow)
- [Jutho Haegeman](https://scholar.google.com/citations?hl=zh-CN&user=yfHe3OAAAAAJ) - Quantum Many Body Physics, Tensor Network Methods
- [Ignacio Cirac](https://scholar.google.com/citations?hl=zh-CN&user=gPGlTbgAAAAJ) - quantum optics, quantum information, many-body systems
- [Frank Pollmann](https://scholar.google.com/citations?hl=zh-CN&user=hlf61gwAAAAJ) - Condensed Matter Theory
- [Edwin Miles Stoudenmire](https://scholar.google.com/citations?hl=zh-CN&user=DLFxevAAAAAJ) - Condensed Matter Theory, Computational Physics, Tensor Network Methods, DMRG
- [Shuo Yang](https://scholar.google.com/citations?hl=zh-CN&user=nemjDVIAAAAJ) - condensed matter theoryquantum physics, tensor networks
- [Hiroshi Shinaoka](https://scholar.google.com/citations?hl=zh-CN&user=NT-EiksAAAAJ) - Condensed matter physics, computational physics, strongly correlated electrons

## Projects

* Generalize TDVP from MPS to MPS$^2$[^Zaletel2019].
* TDVP for open quantum systems.
* The Lanczos + MPS approach for ground state finding[^Huang2018].
* Renormalization of quantum states. (open question)

## References
[^Zaletel2019]: Zaletel, M.P., Pollmann, F., 2019. Isometric Tensor Network States in Two Dimensions.
[^Huang2018]: Huang, R.-Z., Liao, H.-J., Liu, Z.-Y., Xie, H.-D., Xie, Z.-Y., Zhao, H.-H., Chen, J., Xiang, T., 2018. A generalized Lanczos method for systematic optimization of tensor network states. Chinese Phys. B 27, 070501. https://doi.org/10.1088/1674-1056/27/7/070501