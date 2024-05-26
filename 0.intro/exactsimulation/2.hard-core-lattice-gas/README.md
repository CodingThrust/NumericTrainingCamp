# The hard-core lattice gas model

In this demo, we will use the [GenericTensorNetworks.jl](https://github.com/QuEraComputing/GenericTensorNetworks.jl) package[^Liu2023] to simulate the hard-core lattice gas model.
The hard-core lattice gas model is a classical model of interacting particles on a lattice. The Hamiltonian is given by

$$
H = \infty \sum_{\langle i, j \rangle} n_i n_j - \mu \sum_i n_i
$$

where $n_i$ is the occupation number of site $i$ and the sum is over nearest neighbors.

- Given a graph as the input, finding its ground state is NP-complete.
- Counting the number of feasible configurations of the hard-core lattice gas model is hard, even for the square lattice. The number of configurations is sequence [A006506](https://oeis.org/A006506) in the OEIS.
- Finding the partition function of the hard-core lattice gas model has attracted much attention in the statistical physics community.

## Code
1. Get the ground state energy of the hard-core lattice gas model on a square lattice with $20\times 20$ sites.
2. Count the number of feasible configurations, and the partition function.
3. Visualize the configuration space.

## References
[^Liu2023]: Liu, J.-G., Gao, X., Cain, M., Lukin, M.D., Wang, S.-T., 2023. Computing Solution Space Properties of Combinatorial Optimization Problems Via Generic Tensor Networks. SIAM J. Sci. Comput. 45, A1239–A1270. https://doi.org/10.1137/22M1501787