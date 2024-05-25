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

## Basic Rules

NOTE: I should go through the README.

Repo: [https://github.com/CodingThrust/NumericTrainingCamp](https://github.com/CodingThrust/NumericTrainingCamp)

---

## Preliminary

- [Git and pull request](https://book.jinguo-group.science/stable/chap1/git/).
- [VSCode + Markdown + Copilot for technical writing](guides/report-writing.md)
- [Using Google Scholar to conduct a survey](guides/conduct-survey.md)

(Yi-Dai Zhang, Yu-Sheng Zhao can help you)

---

## Goals for today

- I will introduce many-body computing and the projects.
- Students decide the project to work on before 2PM. Students choosing the same project will form a group.

---

## Many-body computing

![](images/fig1.svg)

---

## Three models in the mind

Let $G = (V, E)$ be a graph.

- NP-complete model (e.g. Rydberg atoms array without Rabi pulse):
    $$
    H = - \sum_{i \in V} Δ_i n_{r_i} + \sum_{(i, j) \in E}V_{ij} n_{r_i} n_{r_j}
    $$
- Stoquastic model: Transverse field Ising model (e.g. 2-level model of Rydberg atoms array)
    $$
    H = -J \sum_{(i, j) \in E} Z_i Z_j - h \sum_{j\in V} X_j
    $$

---

## QMA complete model: Heisenberg model and 3-level model of Rydberg atoms array

$$
H = \sum_{(i, j) \in E} J_{ij}\mathbf{S}_i \cdot \mathbf{S}_j
$$

Ref: [3-level model of Rydberg atoms array](https://queracomputing.github.io/Bloqade.jl/dev/3-level/)

---

## Numeric methods
- Exact Simulation
- Tensor network method
- Monte Carlo


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
