# volesti-exclude-lpsolve-tests

This repository contains my test work for the **“Exclude LpSolve from R and C++ interfaces of volesti”** Google Summer of Code (GSoC) project under the **GeomScale** organization.

The main goal of this work is to evaluate the current reliance on **LpSolve** in volesti, understand it's limitations and explore the alternative linear programming solvers for more robust preprocessing in high-dimensional settings.

---

## Repository Structure
```bash
volesti-exclude-lpsolve-tests/
│
├── easy/
│ └── README.md # Easy test: build & run volesti, C++ example, R interface attempt
│
├── medium/
│ └── README.md # Medium test: alternative LP solvers (R + C++)
│
├── hard/
│ └── README.md # Hard test: max inscribed ball using nloptr (optional)
|
├── README.md 
```

---

## Tests Overview

### Easy Test (Completed)
- Built and ran the **C++ interface of volesti** from a clean clone
- Successfully configured, compiled, and executed the `hpolytope-volume` example
- Observed automatic fetching and compilation of **LpSolve** via CMake
- Cloned and built **Rvolesti**
- Attempted installation of the R interface and documented a reproducible build failure on:
  - Ubuntu 24.04
  - GCC 13
  - R 4.3.3
- Identified compiler / Eigen / Spectra interaction as a likely cause

Detailed results are documented in `easy/README.md`.

---

### Medium Test (Completed)
- Identify **one alternative CRAN package** (excluding nloptr, quadprog, ipop, solveqp) capable of solving LPs
- Identify **two open-source C++ LP solvers**
- Compare alternatives with LpSolve in terms of:
  - robustness
  - integration effort
  - suitability for high-dimensional polytopes

Details will be documented in `medium/README.md`.

---

### Hard Test (Completed)
- Implement maximum inscribed ball computation using **nloptr**
- Compare results with existing volesti preprocessing
- Document numerical behavior and limitations

Details (if completed) will be documented in `hard/README.md`.

---

## Environment Summary

- **OS**: Ubuntu 24.04.3 LTS
- **Compiler**: GCC / G++ 13.3.0
- **CMake**: 3.28.3
- **R**: 4.3.3 (Angel Food Cake)

---

## Prior Contributions to GeomScale

I am an active contributor to the GeomScale ecosystem. My previous contributions include code and documentation changes that have been reviewed and merged into GeomScale **volesti** repositories. This prior involvement has helped me become familiar with the project’s
codebase, contribution workflow, and development practices.

## Author

Akash Santra  
(GSoC 2026 Applicant – GeomScale)


