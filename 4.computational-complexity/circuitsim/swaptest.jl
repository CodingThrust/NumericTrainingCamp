using Yao, YaoToEinsum, YaoPlots; darktheme!()

# the swap test circuit
swaptest_circuit = EasyBuild.swap_test_circuit(2, 2, 0.0)
vizcircuit(swaptest_circuit)

reg1 = rand_state(2)
reg2 = rand_state(2)
fidelity(reg1, reg2)^2
reg = join(reg1, reg2, zero_state(1))
fid = expect(put(5, 1=>Z), reg |> swaptest_circuit)

# the expectation
expcircuit = chain(swaptest_circuit, put(5, 1=>Z), swaptest_circuit')
vizcircuit(expcircuit)

# step one: HZH = X
c1 = chain(swaptest_circuit[1:end-1])
vizcircuit(chain(c1, put(5, 1=>X), c1'))

# step two: (C₁U₂)X₁(C₁U₂) = U₂
vizcircuit(chain(put(5, 1=>H), swap(5, 2, 4), swap(5, 3, 5), put(5, 1=>H)); starting_texts=["0", "", "", "", ""], ending_texts=["0", "", "", "", ""])

# step three: H^2 = I
vizcircuit(chain(swap(5, 2, 4), swap(5, 3, 5)); starting_texts=["0", "", "", "", ""], ending_texts=["0", "", "", "", ""])

# YaoToEinsum
YaoToEinsum.yao2einsum(swaptest_circuit)