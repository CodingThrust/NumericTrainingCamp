# Solving the ground state of a Heisenberg chain

In this demo, we will use the [Yao.jl](https://github.com/QuantumBFS/Yao.jl) package[^Luo2020] to simulate the ground state of a Heisenberg chain. The Hamiltonian is given by

$$
H = \sum_{i=1}^{N-1} \mathbf{S}_i \cdot \mathbf{S}_{i+1}
$$

where $\mathbf{S}_i$ is the spin operator at site $i$. The ground state of the Heisenberg chain is a spin singlet state.

## Properties
1. Translation invariance (periodic boundary condition or infinite chain)
2. Symmetry: $SU(2)$ symmetry
3. Ground state energy per site (infinite size): -1.7726

## Code
1. Get the ground state energy of a Heisenberg chain with 20 sites
2. Get the expectation value of the spin operator at different sites
3. Quantum quench, simulate the time evolution of the Heisenberg chain

## References
[^Luo2020]: Luo, X.-Z., Liu, J.-G., Zhang, P., Wang, L., 2020. Yao.jl: Extensible, Efficient Framework for Quantum Algorithm Design. Quantum 4, 341. https://doi.org/10.22331/q-2020-10-11-341