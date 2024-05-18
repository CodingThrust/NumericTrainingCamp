# Tensor networks

## Mathematic foundation

### Diagrammatic representation
#### Example 1: Trace Permutation
Diagram:
![](plots/traceperm.svg)

Math:
```math
{\rm con}(\{i, j, k\}, \{A_{ij}, B_{jk}, C_{ik}\}, \{\})
```
Julia:
```julia
ein"ij,jk,ik->"(A, B, C)
```
#### Example 2: SVD decomposition
Diagram:
![](plots/svd.svg)

Math:
```math
{\rm con}(\{i, j, k\}, \{U_{ij}, S_{j}, V_{jk}\}, \{i, k\})
```

Julia:
```julia
ein"ij,j,k->ik"(U, S, V)
```

#### Example 3: Fast Fourier Transform (FFT)
   https://book.jinguo-group.science/stable/chap3/fft/

### Contraction order
https://github.com/TensorBFS/OMEinsumContractionOrders.jl

1. What is a good contraction order?
2. Space complexity and tree width
3. Algorithms to find the optimal contraction order

### Automatic differentiation
Adjoint:
```math
\overline{x} = \frac{\partial \mathcal{L}}{\partial x}
```
where $\mathcal{L}$ is the loss function and $x$ is a vector.

Differential form:
```math
\delta \mathcal{L} = \overline{x}^T \delta x
```

Backward rule of einsum:
Consider
```math
T^{(0)} = {\rm con}(\Lambda, \{T^{(i)}_{\sigma_i} \mid i=1,\ldots,m\}, \sigma_0)
```
where $\Lambda = \cup_{i=0}^m \sigma_i$ is a set of indices, $T^{(i)}$ are tensors, and $\sigma_0$ is the output index.
```math
\delta T^{(0)} = \sum_k{\rm con}(\Lambda, \{T^{(i)}_{\sigma_i} \mid i=1,\ldots,m, i\neq k\} \cup \{\delta T^{(k)}_{\sigma_k}\}, \sigma_0)
```
The differential form is:
```math
\delta \mathcal{L} = \sum_{k=1}^m{\rm con}(\sigma_k, \{\delta T^{(k)}_{\sigma_k}, \overline T_{\sigma_k}\}, \emptyset) = {\rm con}(\sigma_0, \{\delta T^{(0)}_{\sigma_0}, \overline T_{\sigma_0}\}, \emptyset)
```
We have
```math
\overline T^{(k)}_{\sigma_k} = {\rm con}(\Lambda, \{T^{(i)}_{\sigma_i} \mid i=1,\ldots,m, i\neq k\} \cup \{\overline T^{(0)}_{\sigma_0}\}, \sigma_k)
```

Q: How about complex numbers?
- Rule based AD: derive the rules using the Wirtinger calculus
- Source-to-source AD: same as real numbers

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
![](plots/mps.svg)
1. A matrix product state is a tensor network representation of a quantum state.
   1. Example: product state
   2. Example: GHZ state
   3. Example: AKLT state (Ref. [^Schollwock2010] P31)
2. Normalization condition
   ![](plots/inner.svg)
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

[^Schollwock2010]: Schollwöck, U., 2011. Schollwöck, U. (2011). The density-matrix renormalization group in the age of matrix product states. Annals of Physics 326, 96–192. https://doi.org/10.1016/j.aop.2010.09.012
