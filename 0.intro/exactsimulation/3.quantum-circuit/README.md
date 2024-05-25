# Simulate a quantum circuit by tensor network contraction

Many quantum circuits have small entanglement, e.g. the QFT circuit[^Chen2023]. We can simulate them efficiently by tensor network contraction. In this demo, we will use the [Yao.jl](https://github.com/QuantumBFS/Yao.jl) package[^Luo2020] to simulate a quantum circuit by converting it to a tensor network and contracting the tensor network.

* The contraction order finding is the key technique to simulate a quantum circuit efficiently. Finding the optimal contraction order is an NP-hard problem.

## References

[^Luo2020]: Luo, X.-Z., Liu, J.-G., Zhang, P., Wang, L., 2020. Yao.jl: Extensible, Efficient Framework for Quantum Algorithm Design. Quantum 4, 341. https://doi.org/10.22331/q-2020-10-11-341
[^Chen2023]: Chen, J., Stoudenmire, E.M., White, S.R., 2023. Quantum Fourier Transform Has Small Entanglement. PRX Quantum 4, 040318. https://doi.org/10.1103/PRXQuantum.4.040318