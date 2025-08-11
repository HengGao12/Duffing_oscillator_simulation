# Duffing Oscillator Simulation
> Heng Gao  
> Fudan University
---

This repository provides the simulation code for Duffing oscillators driven by white noise.  
Here, we mainly use Euler-Maruyama algorithm to solve the nonlinear stochastic Duffing equation, which can be written as 

$$\ddot{x}+\delta\dot{x}-x+x^3 = \sigma\cdot \dot{B}(t), \quad\quad\forall t\in [0, T],$$

where $\sigma$ is a positive constant, $\delta>0$ is the damping coefficient, $B(t)$ represents the Brownian motion, $T$ is the total time.

## Usage
Run `duffing_driven_by_noise.m` for reproducing the experiments.
