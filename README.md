# Scientific Computing Training Camp (Basic)
May 27 to June 9, 2024 (14 days) at Hong Kong University of Science and Technology (Guangzhou). Not open for registration.

During the 14 days, you will **implement an algorithm**, simulate a many-body system, and write a report.

> Talk is cheap. Show me the code. - Linus Torvalds

## Topics
1. [Tensor Networks](1.tensor-networks/)
2. [AI for Science](2.ai4science/)
3. [Quantum Monte Carlo](3.quantum-monte-carlo/)
4. [Computational Complexity and Quantum Computing](4.computational-complexity/)

## Inputs
1. **Work on a project** under the chosen topic, in the meeting room, from 9:30AM-9:30PM.
2. **Bidaily presentation and report** at 4:00 PM, each group has 15min to report the project progress in the meeting. Write a report and submit it to this GitHub repo before 9:30PM. The report should be written in [Markdown](https://markdownguide.org/) format.
3. A final report in the Markdown format, which will be deployed to the [training camp website](https://codingthrust.github.io/trainingcamp/).

Note: each participant (including instructors) has 48 hour leave. Quitting is only allowed at the first 3 days.

## Expected output
1. A final report in the Markdown format.
2. A code repository.
3. Some research projects (not guaranteed).

## Events
**Mini-lectures**
1. Jin-Guo Liu, [Tensor network methods](./1.tensor-networks/tutorial/tensornetwork.md), May 27, 9:30AM
2. Ze-Cheng Gan, Differential equation models, algorithms and applications in Molecular Dynamics, May 29, 9:30AM
3. Qi Zhang, May 30, 9:30AM, Flow model for computational physics[^ml4p] (GitHub repo: https://github.com/zhangqi94/Flow)

**Talks**
1. Yi-Jia Wang, June 3, 11AM, online, Tensor network message passing[^Wang2024]
3. Ji-Yao Chen, June 5, 11AM, W4-202, Tensor networks, from ground states to excitations and back
2. Xiu-Hao Deng, Juan 6, 2PM, Quantum random walk
4. Zhao-Long Gu, June 8, 11AM, Correlation Effects and Their Interplay with Magnetic Fields and Band Topology in Twisted Transition Metal Dichalcogenides

## Guide
#### Conduct a survey
You can use [Google Scholar](https://scholar.google.com/) to search for the researchers you are interested in, and follow them to get updated with the latest research. You can use [Zotero](https://www.zotero.org/) to manage your references. For more details, please refer to [this guide](0.intro/guides/conduct-survey.md).
#### Technical writing
The report in the Markdown format should be submitted to this repository, under the folder of the corresponding topic. Please check preview events (e.g. [this one](https://code.hkust-gz.edu.cn/jinguoliu/rydbergtrainingmaterials/-/tree/main/2.error-correction/reports?ref_type=heads)) for references.

- [Guide: How to use AI to facilitate technical writing](0.intro/toolkit.md)

#### How to program?

- You must use **git** to manage your code, and use **pull requests** to submit your code. Please refer to [this guide](https://book.jinguo-group.science/stable/chap1/git/) for more details.
- **Code** ([Agile software development](https://en.wikipedia.org/wiki/Agile_software_development)), even if you do not understand the algorithm at all.
- **Remove uncertainty**, you can get help from me, or the community, e.g. https://julialang.org/community/
  - I want to ..., but I don't know how to start.
  - Is there any good example/existing code about...
  - Is it possible to help me review my code? Ref: [Blog: The Best Way to Do a Code Review on GitHub](https://linearb.io/blog/code-review-on-github)

#### Logistics

- Spaces that free to use: W1 4F-6F, maker space.
- We use [Zulip@HKUST-GZ](http://zulip.hkust-gz.edu.cn/) stream: `#NumericTrainingCamp` for (formal) online communication.
- We will have a WeChat group for informal communication.

#### Technical support
- Yusheng ZHAO
- Yidai ZHANG

## Final resports

- Yi-Dai Zhang, Huan-Hai Zhou
https://github.com/YidaiZhang/TensorNetworkAD2.jl

- Zhong-Yi Ni
https://github.com/nzy1997/TensorQEC.jl

- Xuan-Zhao Gao
https://github.com/ArrogantGao/Notes-Gsoc2024

- Hao-Jie Zhang
https://github.com/lovemy569/CMPO-For-Finite-Temperature

- Long-Li Zheng, Qing-Yuan Wang
https://github.com/Br0kenSmi1e/isoTNS.jl

- Yu-Sheng Zhao, Qing-Yun Qian
https://github.com/exAClior/RGRDMT.jl

- Xing-Yu Ren
https://github.com/Phy-Ren/Variational-Monte-Carlo

## References
[^Wang2024]: Wang, Y., Zhang, Y.E., Pan, F., Zhang, P., 2024. Tensor Network Message Passing. Phys. Rev. Lett. 132, 117401. https://doi.org/10.1103/PhysRevLett.132.117401
[^ml4p]: Machine learning for physicists, https://github.com/wangleiphy/ml4p
