---

# Active Elastomer Dynamics: High-Performance Finite Volume Solver

This repository contains the numerical implementation of the continuum model for active actomyosin elastomers using the finite volume method, 
as described in [Nature Communications (2017)](https://www.nature.com/articles/s41467-017-01130-1).

The core engine is written in **Modern Fortran (F90)** for high-performance numerical integration, with a **Bash-based automation layer** for parameter sweeps and **Gnuplot** for automated visualization of phase transitions.

## 🛠️ Key Features

* **Modular Fortran Design:** The solver is architected into specific physical modules:
* `sigma_active.f90` / `sigma_elastic.f90`: Stress tensor calculations including active renormalization.
* `flux.f90` / `limiter.f90`: High-resolution Finite Volume schemes (Van-Leer limiter).
* `rk.f90`: 3rd order TVD Runge-Kutta time integration.

## 🚀 Getting Started

### Prerequisites

* `gfortran` compiler
* `make` utility
* `gnuplot` (for automated graphing)

### Execution

The included Bash script automates the entire "Compile-Run-Plot" cycle. It manages directory creation, compiles the modular Fortran code via the `Makefile`, and executes parameter loops.

```bash
chmod +x run_simulation.sh
./run_simulation.sh

```

## 📈 Numerical Scheme

The code solves the non-linear advection-diffusion equations using:

1. **Spatial:** Finite Volume Method with an Upwind/Lax-Wendroff hybrid scheme (Van-Leer Flux Limiter) to prevent numerical dispersion near sharp contractile fronts.
2. **Temporal:** 3rd Order Runge-Kutta for high-order accuracy in capturing oscillatory dynamics.

## 📁 Repository Structure

* `/code`: Source Fortran files (`.f90`) and `Makefile`.
* `/data`: Raw numerical output (density profiles, time evolution).
* `/graph`: Automatically generated PNG/EPS plots categorized by parameter values ( and ).
* `plot.gp`: Gnuplot scripts for data visualization.

---

