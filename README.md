# Ferry Maintenance Report

This project analyzes the **maintenance and reliability of a ferry system** using stochastic modeling techniques. The ferry has two engines, each driving a separate propeller, and its operational performance is modeled as a **continuous-time Markov process** with multiple repair strategies. The study evaluates long-term availability, average velocity, expected time to failure, and compares continuous-time and discrete-time approaches.

## Project Overview

* **Problem Type:** Stochastic processes & reliability analysis
* **Context:** Ferry system with two engines subject to failures and repairs
* **Key Features:**

  * Continuous-time Markov process modeling
  * State definitions for full operation, partial operation, and total failure
  * Repair strategies allocating different numbers of repairers to each engine
  * Stationary distribution computation and steady-state performance
  * Monte Carlo simulation for expected time to failure
  * Discrete-time approximation for simulation and probability analysis

## Methodology

1. **System Modeling**

   * Four system states: both engines working, engine 1 failure, engine 2 failure, both engines failed
   * Intensity matrices defined for different repair strategies
   * Ergodicity ensures existence of stationary distribution

2. **Stationary Distribution**

   * Computed from `πQ = 0` with normalization
   * Provides steady-state probabilities under each repair strategy

3. **Average Speed**

   * Calculated as expected value of system speed using stationary probabilities
   * Shows performance impact of different maintenance policies

4. **Continuous-Time Simulation**

   * Modeled dwell times with exponential distributions
   * Simulated trajectories verified against analytic steady-state results

5. **Expected Time to Failure**

   * Monte Carlo simulations with 10,000 runs
   * Empirical estimates of average time until complete failure

6. **Discrete-Time Approximation**

   * Transition matrix `P(h) = I + Qh` or `P(h) = exp(Qh)`
   * Simulated trajectories validated against continuous-time model

7. **Probability Analysis**

   * Probability of complete failure within 10 steps computed from `P^10`
   * Expected passage time calculated using the fundamental matrix `(I − P)⁻¹`

## Results

* **Repair allocation strategy** strongly affects ferry availability and speed.
* **Stationary distributions** provide steady-state performance insights.
* **Monte Carlo simulations** confirmed analytic failure time estimates.
* **Discrete-time models** approximated continuous-time dynamics accurately for small time steps.

## Usage Instructions

### Requirements

* MATLAB or Octave

## Technologies

* **MATLAB**: stochastic simulation & matrix computations
* **Markov processes**: reliability and performance analysis
* **Monte Carlo methods**: expected time-to-failure estimation

## Authors

* Ali Ghasemi ([aghasemi@kth.se](mailto:aghasemi@kth.se))
* Filippo Romano ([froma@kth.se](mailto:froma@kth.se))

*KTH Royal Institute of Technology – Ferry Maintenance Project (2024)*

---

📄 This repository contains the models, simulations, and report analyzing ferry maintenance strategies using Markov processes and stochastic modeling.
