# Computational Complexity

## Contents
1. Problem reduction
   1. Reducing problem to the independent set problem on KSG ([Julia](https://github.com/QuEraComputing/UnitDiskMapping.jl))
2. Combinatorial optimization problems, such as spin glass and hard-core lattice gas[^Wang2024]
   1. Generic tensor networks ([Julia](https://github.com/QuEraComputing/GenericTensorNetworks.jl))
3. Dynamics of computing
   1. Quantum annealing paper
4. Quantum circuit simulation by tensor network contraction ([Julia](https://docs.yaoquantum.org/dev/man/yao2einsum.html))


## Reading
- Book: The nature of computation[^Moore2011]
- Review: A Tutorial on Formulating and Using QUBO Models[^Glover2019]
- Article: Quantum optimization with arbitrary connectivity using Rydberg atom arrays[^Nguyen2023]

## People
- [Pan Zhang](https://scholar.google.com/citations?user=MFnbrRUAAAAJ&hl=zh-CN) - Statistical Physics, Machine Learning, Message Passing Algorithms, Tensor Networks, Quantum Computing
- [Hai-Jun Zhou](https://scholar.google.com/citations?user=j6fZctMAAAAJ&hl=zh-CN) - spin glass, optimization, polymer, complex network game
- [Cristopher Moore](https://scholar.google.com/citations?user=p_837e0AAAAJ&hl=zh-CN&oi=sra) - complex networks, networks, quantum computing, phase transitions, quantum computation
- [Zhengfeng Ji](https://scholar.google.com/citations?hl=zh-CN&user=2uXdu7AAAAAJ) - quantum information and computation

## Projects

- Reproduce: one of the papers about efficient simulation of noisy quantum circuit with tensor networks[^Gao2021][^Shao2023]
- Better contraction order finding algorithms[^Kalachev2021][^Gray2020].
- Tensor network based simulation of quantum circuits[^Pan2022] and the estimation of coherent error correction threshold.
- Open question: Reducing the spin glass problem/independent set problem on grid to the circuit SAT problem[^Liu2023][^Nguyen2023][^Glover2019].
- Open question: Computing 2D Fibonacci number[^Liu2023].

## References
[^Shao2023]: Shao, Y., Wei, F., Cheng, S., Liu, Z., 2023. Simulating Quantum Mean Values in Noisy Variational Quantum Algorithms: A Polynomial-Scale Approach. https://doi.org/10.48550/arXiv.2306.05804
[^Gao2021]: Gao, X., Kalinowski, M., Chou, C.-N., Lukin, M.D., Barak, B., Choi, S., 2021. Limitations of Linear Cross-Entropy as a Measure for Quantum Advantage. https://doi.org/10.48550/arXiv.2112.01657
[^Liu2023]: Liu, J.-G., Gao, X., Cain, M., Lukin, M.D., Wang, S.-T., 2023. Computing Solution Space Properties of Combinatorial Optimization Problems Via Generic Tensor Networks. SIAM J. Sci. Comput. 45, A1239–A1270. https://doi.org/10.1137/22M1501787
[^Markov2008]: Markov, I.L., Shi, Y., 2008. Simulating Quantum Computation by Contracting Tensor Networks. SIAM J. Comput. 38, 963–981. https://doi.org/10.1137/050644756
[^Pan2022]: Pan, F., Chen, K., Zhang, P., 2022. Solving the Sampling Problem of the Sycamore Quantum Circuits. Phys. Rev. Lett. 129, 090502. https://doi.org/10.1103/PhysRevLett.129.090502
[^Wang2024]: Wang, Y., Zhang, Y.E., Pan, F., Zhang, P., 2024. Tensor Network Message Passing. Phys. Rev. Lett. 132, 117401. https://doi.org/10.1103/PhysRevLett.132.117401
[^Moore2011]: Moore, Cristopher, and Stephan Mertens. The nature of computation. OUP Oxford, 2011.
[^Glover2019]: Glover, F., Kochenberger, G., Du, Y., 2019. A Tutorial on Formulating and Using QUBO Models.
[^Kalachev2021]: Kalachev, G., Panteleev, P., Yung, M.-H., 2021. Recursive Multi-Tensor Contraction for XEB Verification of Quantum Circuits 1–9.
[^Gray2020]: Gray, J., Kourtis, S., 2020. Hyper-optimized tensor network contraction.
[^Nguyen2023]: Nguyen, M.-T., Liu, J.-G., Wurtz, J., Lukin, M.D., Wang, S.-T., Pichler, H., 2023. Quantum Optimization with Arbitrary Connectivity Using Rydberg Atom Arrays. PRX Quantum 4, 010316. https://doi.org/10.1103/PRXQuantum.4.010316
