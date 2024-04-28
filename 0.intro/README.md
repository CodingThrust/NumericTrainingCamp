---
theme : "black"
transition: "fade"
center: false
height: 800
---
<style>
    .reveal h1, .reveal h2, .reveal h3, .reveal h4, .reveal h5 {
                  text-transform: none;
		  }
    .reveal p {
        text-align: left;
    }
    .reveal ul {
        display: block;
    }
    .reveal ol {
        display: block;
    }
    .reveal p:has(> img){
        text-align: center;
    }
    h3 {
        border-bottom: 2px solid yellow;
        padding: 10px;
    }
</style>

# Road to become a numeric gangster

---

## Goal

Three models in the mind

- NP-complete model: Hard-core lattice gas (Classical part of Rydberg atoms array)
    ```math
    H = - \sum_i Δ_i n_{r_i} + \sum_{i<j}V_{ij} n_{r_i} n_{r_j}
    ```
- Stoquastic model: Transverse field Ising model (2-level model of Rydberg atoms array)
    ```math
    H = \sum_i \frac{\Omega_i}{2} \left(e^{i\phi_i}\ket{r_i}\bra{g_i} + e^{-i\phi_i}\ket{g_i}\bra{r_i}\right) - \sum_i Δ_i n_{r_i} + \sum_{i<j}V_{ij} n_{r_i} n_{r_j}
    ```
- QMA complete model: 3-level model of Rydberg atoms array
    ```math
    \begin{aligned} 
        H = & \sum_i \frac{\Omega_i^{\mathrm{hf}}(t)}{2}\left(e^{i \phi_i^{\mathrm{hf}}(t)}|0_i\rangle\langle 1_i|+e^{-i \phi_i^{\mathrm{hf}}(t)}| 1_i\rangle\langle 0_i|\right)-\sum_i \Delta_i^{\mathrm{hf}}(t)|1_i\rangle\langle 1_i| \\ 
        & +\sum_i \frac{\Omega_i^{\mathrm{r}}(t)}{2}\left(e^{i \phi_i^{\mathrm{r}}(t)}|1_i\rangle\langle r_i|+e^{-i \phi_i^{\mathrm{r}}(t)}| r_i\rangle\langle 1_i|\right)-\sum_i\left[\Delta_i^{\mathrm{hf}}(t)+\Delta_i^{\mathrm{r}}(t)\right]\left|r_i\right\rangle\left\langle r_i\right| \\ 
        & +\sum_{i<j} V_{i j}\left|r_i\right\rangle\left\langle r_i|\otimes| r_j\right\rangle\left\langle r_j\right| .
    \end{aligned}
    ```

---


## How to communicate?

- Onsite: 9:30AM-9:30PM, location TBA.
- Online: Zulip stream (less formal): `#NumericTrainingCamp`, for general discussion, sharing.

---

## Basic Rules

NOTE: I should go through the README.

Repo: [https://code.hkust-gz.edu.cn/numericgangsters/numerictrainingcamp](https://code.hkust-gz.edu.cn/numericgangsters/numerictrainingcamp)

---

## Preliminary

You must go through the following guides before starting a topic

- Git and Pull request
- Using [Google Scholar](https://scholar.google.com/) to conduct a survey
- VSCode + Markdown + Copilot for technical writing
- Linear algebra based simulation of quantum systems


---

## Goals for today

- I will introduce many-body computing and the four topics.
- Students decide the topic and the group before 2PM.

---

## Top groups - suggested to follow

To follow a research direction, it is a good practice to follow the top groups in the field on Google Scholar. Here are some top groups in the field of numeric methods:

---

## Main References

- Tensor network org
- age of MPS
- Quantum Monte Carlo

---

# Video watching: with questions in mind

TODO:
- A video about tensor networks
- A video about VMC

---

## Continue

- Reproduce a paper
- Work on a new idea

---

## Grouping

Before 2PM, students decide the topic and the group.

- 4 groups are formed.
- 2-4 students per group.

---

## About Projects: Pivot the Idea!
The provided topics may not be perfect for the following reasons:
- Has been done before.
- Too hard or too easy.
- Incorrect.

We need to do survey, discuss, discuss, and discuss to pivot the idea.