using Statistics
using LinearAlgebra
using SpecialFunctions

function simulate(number_measure)
    t = 1.35
    er = 0.20
    repeats = 30
    shots = 1000
    firstlist = Int[]
    H = randn(ComplexF64, 129, 129)
    H += H'
    E0, U0 = eigen(H)
    k = 0:128
    m = 0:128
    km = k' .- m
    for n in 1:shots
        @info "$n/$shots"
        nsum = zeros(Int, repeats)
        for r in 1:repeats
            tau_state = vcat(zeros(64), [1], zeros(64))
            for j in 1:number_measure
                # Introducing noise on tau, using uniform distribution here
                trandom = t + rand() * 2 * er * t - er * t

                #U = ((0.0 + 1.0im) .^ km) .* besselj.(km, 2.0 * trandom)
                UD = exp.(-im .* E0 .* trandom)

                tau_state = U0 * (Diagonal(UD) * (U0' * tau_state))
                if rand() <= abs(tau_state[65])^2
                    nsum[r] = (r-1) * number_measure + j + 1
                    break
                end
                tau_state[65] = 0
                tau_state /= norm(tau_state)
            end
        end
        first_non_zero = findfirst(x -> x != 0, nsum)
        push!(firstlist, first_non_zero === nothing ? 0 : nsum[first_non_zero])
    end

    std_dev = std(firstlist)/sqrt(shots)
    # Calculate the number of non-zero elements in [firstlist].
    non_zero_count = count(x -> x != 0, firstlist)

    println(" $non_zero_count")
    println(number_measure)
    println(mean(firstlist), " ", std_dev)
    return mean(firstlist), std_dev
end

meanlist = []
std_dev_list_all = []

list_number_measure = 1:10
for n in list_number_measure
    mean, std_dev = simulate(n)
    push!(meanlist, mean)
    push!(std_dev_list_all, std_dev)
end

println(meanlist)
println(std_dev_list_all)

scatter(list_number_measure, meanlist, yerror=std_dev_list_all, legend=false)