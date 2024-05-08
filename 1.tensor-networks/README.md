# Tensor Networks (Quantum many-body)

## Contents
1. Ground state finding, such as DMRG, CTMRG and VUMPO
   1. DMRG ([Julia](https://github.com/CodingThrust/SimpleTDVP.jl))
   2. Corner transfer matrix renormalization group (CTMRG) ([Julia](https://github.com/under-Peter/TensorNetworkAD.jl), [Python](https://github.com/TensorBFS/dTRG))
   3. variational uniform Matrix Product State algorithm (VUMPS) ([Julia](https://github.com/Jutho/TNSchool2018))
2. Finite temperature methods
   1. Continuous matrix product operator (CMPO) ([Python](https://github.com/TensorBFS/cMPO))
3. Dynamics
   1. Time-evolving block decimation (TEBD) ([Python](https://github.com/tenpy/tenpy))
   2. Time-dependent variational principle (TDVP) ([Julia](https://github.com/Jutho/TNSchool2018))
4. Classical tensor networks
   1. Tensor renormalization group (TRG) ([Julia](https://github.com/under-Peter/TensorNetworkAD.jl), [Python](https://github.com/TensorBFS/dTRG))

## Reading
- Review: A practical introduction to tensor networks: Matrix product states and projected entangled pair states[^Orus2014].
- Review: The density-matrix renormalization group in the age of matrix product states[^Schollwock2011].
- Review: Tangent-space methods for uniform matrix product states[^Vanderstraeten2019].
- Website: [Tensor Network website](https://tensornetwork.org/).
- Book: Density Matrix and Tensor Network Renormalization[^Tao2023].

## People
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
[^Schollwock2011]: Schollwöck, U., 2011. Schollwöck, U. (2011). The density-matrix renormalization group in the age of matrix product states. Annals of Physics 326, 96–192. https://doi.org/10.1016/j.aop.2010.09.012
[^Vanderstraeten2019]: Vanderstraeten, L., Haegeman, J., Verstraete, F., 2019. Tangent-space methods for uniform matrix product states. SciPost Physics Lecture Notes 7, 1–77. https://doi.org/10.21468/scipostphyslectnotes.7
[^Orus2014]: Orús, R., 2014. A practical introduction to tensor networks: Matrix product states and projected entangled pair states. Annals of Physics 349, 117–158. https://doi.org/10.1016/j.aop.2014.06.013
[^Tao2023]: Xiang, Tao. Density Matrix and Tensor Network Renormalization. Cambridge University Press, 2023.