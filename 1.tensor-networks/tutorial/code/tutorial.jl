using OMEinsum, Test, LinearAlgebra, Yao

# example 1.1: trace-permutation
code_traceperm = ein"ij,jk,ki->"

@testset "trace perm" begin
    A, B, C = rand(3, 3), rand(3, 3), rand(3, 3)
    res1 = code_traceperm(A, B, C)
    @test res1[] ≈ tr(A * B * C)
end

# Example 1.2: SVD decomposition
code_svd = ein"ij,j,jk->ik"
@testset "SVD" begin
    A = rand(3, 3)
    U, S, V = svd(A)
    res2 = code_svd(U, S, V')
    @test res2 ≈ A
end

# Example 1.3: Contraction order
code_order = ein"il,l,kjl,kmn,jn->im"
size_dict = uniformsize(code_order, 100)
contraction_complexity(code_order, size_dict)

opt_order1 = ein"(il,l),((kjl,kmn),jn)->im"
contraction_complexity(opt_order1, size_dict)

opt_order2 = ein"(il,l),(kjl,(kmn,jn))->im"
contraction_complexity(opt_order2, size_dict)

opt_order3 = optimize_code(code_order, size_dict, TreeSA())
contraction_complexity(opt_order3, size_dict)

# Example 2.1: ghz state
mutable struct IndexStore
    n::Int
    IndexStore(n::Int=0) = new(n)
end
newindex!(store::IndexStore) = store.n += 1

struct MPS{T}
    tensors::Vector{Array{T, 3}}
end
function ghz_mps(n::Int)
    t1 = zeros(ComplexF64, 1, 2, 2); t1[1, 1, 1] = t1[1, 2, 2] = 1
    t2 = zeros(ComplexF64, 2, 2, 2); t2[1, 1, 1] = t2[2, 2, 2] = 1
    t3 = zeros(ComplexF64, 2, 2, 1); t3[1, 1, 1] = t3[2, 2, 1] = 1/√2
    tensors = [t1, fill(t2, n-2)..., t3]
    return MPS(tensors)
end

function code_mps(n::Int)
    store = IndexStore()
    ixs = Vector{Int}[]
    iy = Vector{Int}()
    right = newindex!(store)
    for _ = 1:n
        left = right
        physical = newindex!(store)
        right = newindex!(store)
        push!(ixs, [left, physical, right])
        push!(iy, physical)
    end
    return EinCode(ixs, iy)
end

code_mps(5)

@testset "ghz state" begin
    n = 10
    rawmps = code_mps(n)
    ghz = ghz_mps(n)
    code = optimize_code(rawmps, uniformsize(rawmps, 2), TreeSA())
    v1 = vec(code(ghz.tensors...))
    v2 = statevec(ghz_state(n))
    @test v1 ≈ v2
end

# Example 2.2: Canonical form
function truncated_svd(tmat::AbstractMatrix, dmax::Int, atol::Real)
    u, s, v = LinearAlgebra.svd(tmat)
    dmax = min(searchsortedfirst(s, atol, rev=true), dmax, length(s))
    return u[:, 1:dmax], s[1:dmax], v'[1:dmax, :], sum(s[dmax+1:end])
end

entropy(p::Vector) = -sum(x->x * log(x), p)

function left_canonicalize!(mps::MPS)
    for i = 1:length(mps.tensors)-1
        left, right = mps.tensors[i], mps.tensors[i+1]
        mleft, mright = reshape(left, :, size(left, 3)), reshape(right, size(right, 1), :)
        u, s, v, trunc = truncated_svd(mleft * mright, size(mleft, 2), 0)
        @info "entropy = $(entropy(s .^ 2))"
        mps.tensors[i] = reshape(u, size(left, 1), size(left, 2), size(u, 2))
        mps.tensors[i+1] = reshape(Diagonal(s) * v, size(v, 1), size(right, 2), size(right, 3))
        mps.tensors[i+1] = permutedims(mps.tensors[i+1], (2, 1, 3))
    end
    return mps
end

@testset "canonical form" begin
    n = 5
    ghz = ghz_mps(n)
    left_canonicalize!(ghz)
    left_env = ones(ComplexF64, 1, 1)
    for i = 1:n
        left_env = ein"(ab,aij),bik->jk"(left_env, conj.(ghz.tensors[i]), ghz.tensors[i])
        @test left_env ≈ Matrix{ComplexF64}(I, size(left_env)...)
    end
end

# Example 2.3: Entanglement entropy
function right_canonicalize!(mps::MPS)
    for i = length(mps.tensors)-1:-1:1
        left, right = mps.tensors[i], mps.tensors[i+1]
        mleft, mright = reshape(left, :, size(left, 3)), reshape(right, size(right, 1), :)
        u, s, v, trunc = truncated_svd(mleft * mright, size(mleft, 2), 0)
        @info "entropy = $(entropy(s .^ 2))"
        mps.tensors[i] = reshape(u * Diagonal(s), size(left, 1), size(left, 2), size(u, 2))
        mps.tensors[i+1] = reshape(v, size(v, 1), size(right, 2), size(right, 3))
        mps.tensors[i+1] = permutedims(mps.tensors[i+1], (2, 1, 3))
    end
    return mps
end

ghz = ghz_mps(5)
left_canonicalize!(ghz)
right_canonicalize!(ghz)

# Example 2.4: Fidelity and expectation value
function code_dot(n::Int)
    store = IndexStore()
    ixs_bra = Vector{Int}[]
    ixs_ket = Vector{Int}[]
    firstidx_bra = newindex!(store)
    previdx_bra = firstidx_bra
    firstidx_ket = newindex!(store)
    previdx_ket = firstidx_ket
    for k = 1:n
        physical = newindex!(store)
        nextidx_bra = k == n ? firstidx_bra : newindex!(store)
        nextidx_ket = k == n ? firstidx_ket : newindex!(store)
        push!(ixs_bra, [previdx_bra, physical, nextidx_bra])
        push!(ixs_ket, [previdx_ket, physical, nextidx_ket])
        previdx_bra = nextidx_bra
        previdx_ket = nextidx_ket
    end
    ixs = [ixs_bra..., ixs_ket...]
    return DynamicEinCode(ixs, Int[])
end

@testset "fidelity" begin
    n = 5
    bra = ghz_mps(n)
    ket = ghz_mps(n)
    rawcode = code_dot(n)
    size_dict = OMEinsum.get_size_dict(rawcode.ixs, [bra.tensors..., ket.tensors...])
    code = optimize_code(rawcode, size_dict, TreeSA())
    @test code(conj.(bra.tensors)..., ket.tensors...)[] ≈ 1
end

# Example 2.6: Expectation value
function code_correlation(n::Int, opindices::Vector{Int})
    @assert issorted(opindices)
    store = IndexStore()
    ixs_bra = Vector{Int}[]
    ixs_ket = Vector{Int}[]
    ixs_ops = Vector{Int}[]
    firstidx_bra = newindex!(store)
    previdx_bra = firstidx_bra
    firstidx_ket = newindex!(store)
    previdx_ket = firstidx_ket
    for k = 1:n
        if k in opindices
            physical_bra = newindex!(store)
            physical_ket = newindex!(store)
            push!(ixs_ops, [physical_bra, physical_ket])
        else
            physical_ket = physical_bra = newindex!(store)
        end
        nextidx_bra = k == n ? firstidx_bra : newindex!(store)
        nextidx_ket = k == n ? firstidx_ket : newindex!(store)
        push!(ixs_bra, [previdx_bra, physical_bra, nextidx_bra])
        push!(ixs_ket, [previdx_ket, physical_ket, nextidx_ket])
        previdx_bra = nextidx_bra
        previdx_ket = nextidx_ket
    end
    ixs = [ixs_bra..., ixs_ket..., ixs_ops...]
    return DynamicEinCode(ixs, Int[])
end

@testset "expect" begin
    n = 5
    bra = ghz_mps(n)
    ket = ghz_mps(n)
    for i = 1:n
        rawcode = code_correlation(n, [i])
        size_dict = OMEinsum.get_size_dict(rawcode.ixs, [bra.tensors..., ket.tensors..., Matrix(X)])
        code = optimize_code(rawcode, size_dict, TreeSA())
        res = code(conj.(bra.tensors)..., ket.tensors..., Matrix(X))[]
        @info "⟨X$i⟩ = $res"
        @test res ≈ 0
    end
end

# Example 2.5: Sampling
# https://journals.aps.org/prx/abstract/10.1103/PhysRevX.8.031012
using StatsBase
function sample_mps!(mps::MPS)
    n = length(mps.tensors)
    left_canonicalize!(mps)
    right_env = ones(ComplexF64, 1, 1)
    res = zeros(Int, n)
    for i = n:-1:1
        p = ein"iaj,(iak,jk)->a"(conj(mps.tensors[i]), mps.tensors[i], right_env)
        res[i] = sample([0,1], Weights(abs.(p) |> normalize!))
        slice = mps.tensors[i][:, res[i]+1, :]
        right_env = ein"aj,(bk,jk)->ab"(conj(slice), slice, right_env)
    end
    return res
end

@testset "sampling" begin
    n = 5
    ghz = ghz_mps(n)
    data = sample_mps!(ghz)
    @test data == ones(Int, n) || data == zeros(Int, n)
end