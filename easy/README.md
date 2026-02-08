# Easy Test — Exclude LpSolve from volesti

This is the document where I describes the completion of the **Easy test** for the **“Exclude LpSolve from R and C++ interfaces of volesti”** GSoC project.

The goal of this test is to:
- build and run the **C++ interface of volesti**
- attempt to build and run the **R interface**
- understand where the **LpSolve** is used
- observe how the maximum inscribed (inner) ball is computed

---

## Environment

- **OS**: Ubuntu 24.04.3 LTS (noble)
- **Architecture**: x86_64
- **Compiler**: g++ 13.3.0
- **CMake**: 3.28.3
- **R**: 4.3.3 (Angel Food Cake)

---

## Repository Setup

- Core repository: https://github.com/GeomScale/volesti
- Branch used: `develop`
- Clone type: fresh, clean clone (separate from prior development work)
- Clone location: `~/gsoc-clean/volesti`

Note:(This is what i observe)  
The volesti repository does **not** contain a top-level `CMakeLists.txt`.CMake builds are performed from subdirectories such as `examples/`.

---

## C++ Interface (volesti)

### Selected Example

- Path: `examples/hpolytope-volume`
- Files:
  - `CMakeLists.txt`
  - `hpolytopeVolume.cpp`
  - `data/`

This example was chosen because it uses preprocessing routines required for volume computation, which internally rely on LP-based methods.

---

### Build Configuration

- Eigen found at: `/usr/include/eigen3`
- Boost found at: `/usr/include`
- LpSolve was **not found locally** and was **automatically downloaded**
  via CMake `FetchContent`

Non-fatal warnings observed:
- `cmake_minimum_required()` order warning
- FetchContent policy warning (CMP0135)

---

### Build and Execution

**Build command**
make -j$(nproc)


**Result**
- Build completed successfully
- Executable generated: `hpolytopeVolume`
- LpSolve built from source as `liblp_solve.a`

Non-fatal warnings:
- `-std=c++17` passed to C compiler (LpSolve sources)
- Deprecated `ftime` usage in LpSolve
- Large allocation warnings in LUSOL (LpSolve internals)

---

### Program Output

**Command**
./hpolytopeVolume


**Input Polytope**
- Type: H-polytope
- Dimension: 4
- Constraints: 8
- Geometry: 4D cube \([-1, 1]^4\)

**Output**
- Volume (Cooling Balls): 15.5051
- Volume (Cooling Gaussians): 15.4796
- Volume (Sequence of Balls): 15.9247

**Status**
- Program executed successfully
- No runtime errors
- LP-based preprocessing completed

---

## Maximum Inscribed Ball Observation

- The example does **not** explicitly compute or print the maximum inscribed ball
- The inner ball is computed **internally during preprocessing**
- This step is required before volume computation and sampling

Relevant internal logic is implemented in: `include/generators/convex_bodies_generator.h`

This confirms that the LpSolve is a **core dependency** in the preprocessing pipeline.

---

## R Interface (Rvolesti)

### Repository

- Repository: https://github.com/GeomScale/Rvolesti
- Clone location: `~/gsoc-clean/Rvolesti`

---

### R Dependencies

Installed successfully from source:
- `Rcpp`
- `lpSolve`

Library path:
~/R/x86_64-pc-linux-gnu-library/4.3


---

### Build and Installation

**Build**
R CMD build .

- Build succeeded
- Output: `volesti_1.2.0.tar.gz`

**Install**
R CMD INSTALL volesti_1.2.0.tar.gz

Result:
- Installation **did not complete successfully**
- Extensive Eigen / RcppEigen / Spectra template warnings observed
- No final error message printed
- Package not installed (confirmed via `library(volesti)`)

Likely cause:
- Known compatibility issues between **GCC 13**, **Eigen**, and **Spectra**
- Toolchain-related, not configuration-related

---

## Easy Test Conclusion

- C++ interface of volesti was successfully built and executed
- The LpSolve was automatically fetched and used during preprocessing
- Maximum inscribed ball computation is internal but essential
- R interface build was attempted and failure was documented clearly
- Toolchain sensitivity further motivates replacing LpSolve

**Easy test completed successfully.**


