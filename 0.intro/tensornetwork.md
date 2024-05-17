# Tensor networks

## Entanglement
1. Every multipartite quantum state has a Schmidt decomposition
```math
\ket{\psi} = \sum_{i} \lambda_i \ket{i}_A \ket{i}_B,\\
\sum_{i} \lambda_i^2 = 1, \lambda_i \geq 0.
```
2. Schmidt decomposition can be related to singular value decomposition (SVD)
3. The entanglement entropy is defined as
```math
S = -\sum_i \lambda_i^2 \log_2 \lambda_i^2.
```
4. Reduced density matrix - the tensor network representation
```math
\rho_A = \text{Tr}_B \ket{\psi}\bra{\psi}.
```
5. The eigenvalues of the reduced density matrix are the squares of the Schmidt coefficients.

## Matrix Product States (MPS)
1. A matrix product state is a tensor network representation of a quantum state.
   1. Example: product state
   2. Example: GHZ state
   3. Example: AKLT state
2. Normalization condition
3. Schmidt decomposition
   1. Reduced density matrix
   2. Fidelity
   3. Mutual information
4. Canonical form
5. Compression
6. Expectation values
7. Time evolution: Time-evolving block decimation (TEBD)
8. Variational optimization
9.  DMRG algorithm
10. Entanglement entropy and the area law
11. Systems with area law
12. Open quantum systems
13. VUMPS
14. TDVP

## Two-dimensional Tensor Networks
1. Projected entangled pair states (PEPS)
2. MPS^2
   1. Mose move
3. CTMRG
4. Fermionic system
5. PEPS + VMC

## From Quantum Circuit to Tensor Networks
1. Tensor network based simulation
2. Special gates
3. ZX-calculus
4. Optimal contraction order and treewidth
5. Entanglement propagation
   1. Lieb Robinson bound, check entanglement entropy

## Classical Tensor Networks
1. Tensor renormalization group (TRG)
2. Probabilistic graphical models
3. Combinatorial optimization
   1. Example: Spin-glass
   2. Example: Maximum independent set
   3. Example: Circuit SAT
      1. Is it possible to reduce spin-glass to circuit SAT?
4. Generic tensor networks
5. Overlap gap property
   1. Discuss hardest instance complexity and average complexity
6. From factoring to independent set problem