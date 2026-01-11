---

# Active Elastomer Dynamics: High-Performance Finite Volume Solver

This repository contains the numerical implementation of the continuum model for active actomyosin elastomers using the finite volume method, 
as described in [Nature Communications (2017)](https://www.nature.com/articles/s41467-017-01130-1).

The core engine is written in **Modern Fortran (F90)** for high-performance numerical integration, with a **Bash-based automation layer** for parameter sweeps and **Gnuplot** for automated visualization of phase transitions.

description: |
  ## 🛠️ Key Features

  * **Modular Fortran Design:** The solver is architected into specific physical modules:
  * `sigma_active.f90` / `sigma_elastic.f90`: Stress tensor calculations including active renormalization.
  * `flux.f90` / `limiter.f90`: High-resolution Finite Volume schemes (Van-Leer limiter).
  * `rk.f90`: 3rd order TVD Runge-Kutta time integration.



---

