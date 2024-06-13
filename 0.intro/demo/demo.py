## Monte Carlo simulation ##
# This programe is to simulate restart <n> (vs. r) in nearly infinite system (a line with 129 sites)
# with or without noise (random tau).
# And plot Errorbar

import numpy as np
import matplotlib.pyplot as plt
from scipy.special import jn

# Initialize parameters
t = 1.35
repeats = 30
shots = 1000
list_number_measure = range(10, 16)
er = 0.20

# In order to construct the U matrix, first bulid two matrices k,m.
k, m = np.meshgrid(np.arange(129), np.arange(129))
#U = (1j ** (k - m)) * jn(k - m, 2 * t)


def simulate(number_measure):
    firstlist = []
    std_dev_list = []
    for _ in range(shots):
        nsum = [0] * repeats
        for r in range(repeats):
            tau_state = np.concatenate(([0]*64, [1], [0]*64))
            for _ in range(number_measure):
                # Introducing noise on tau, using uniform distribution here

                trandom = t + np.random.uniform(-er * t, er * t)
                U = (1j ** (k - m)) * jn(k - m, 2 * trandom)

                tau_state = np.dot(U, tau_state)
                if np.random.random() <= abs(tau_state[64])**2:
                    nsum[r] = r * number_measure + _ + 1
                    break
                tau_state[64] = 0
                tau_state /= np.linalg.norm(tau_state)
        first_non_zero = next((num for num in nsum if num != 0), 0)
        firstlist.append(first_non_zero)

    std_dev = np.std(firstlist)/np.sqrt(shots)
    # Calculate the number of non-zero elements in [firstlist].
    non_zero_count = len([x for x in firstlist if x != 0])


    print(f" {non_zero_count}")
    print(number_measure)
    print(np.mean(firstlist), std_dev)
    return np.mean(firstlist), std_dev


#meanlist = [simulate(n) for n in list_number_measure]

meanlist = []
std_dev_list_all = []

for n in list_number_measure:
    mean, std_dev = simulate(n)
    meanlist.append(mean)
    std_dev_list_all.append(std_dev)

print(meanlist)
print(std_dev_list_all)
#plt.plot(list_number_measure, meanlist)
plt.errorbar(list_number_measure, meanlist, yerr=std_dev_list_all, fmt='o-', capsize=5)
plt.show()