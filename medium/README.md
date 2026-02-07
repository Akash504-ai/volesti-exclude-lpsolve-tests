# Medium Test — Exclude LpSolve from volesti

This document lists alternative software that can solve Linear Programming (LP) problems related to computing the maximum inscribed ball of a convex polytope.

## CRAN Package

**rcdd**

The `rcdd` package is listed in the CRAN Task View: Optimization under Linear Programming solvers. It is based on cddlib and is designed for computations on convex polytopes. It can solve linear programs and can be used for formulating the maximum inscribed ball problem.

## Open-Source C++ LP Solvers

**HiGHS**

HiGHS is a modern open-source solver for linear and mixed-integer linear programming. It is widely used, provides good numerical stability, and is available in C++, R, and Python.

**COIN-OR Clp**

COIN-OR Clp is a long-standing open-source C++ solver for linear programming. It is part of the COIN-OR optimization suite and is commonly used in research and optimization software.
