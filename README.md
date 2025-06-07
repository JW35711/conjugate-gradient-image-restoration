# 🧮 Conjugate Gradient vs. SOR - Numerical Experiment

This project reproduces the numerical experiment from my undergraduate thesis. It compares two iterative methods — **Conjugate Gradient (CG)** and **Successive Over-Relaxation (SOR)** — for solving SPD linear systems in the context of grayscale image restoration.

## 📒 What's inside?

- `notebooks/numerical-experiment.ipynb`:  
  A complete Jupyter Notebook with code, plots, and result analysis.

- `code/`:  
  MATLAB files used in the original thesis.

- `requirements.txt`:  
  Python packages needed to run the notebook.

## 📊 Features

- From-scratch implementation of both methods
- Matrix construction based on Poisson-type systems
- Timing, residual, and iteration count summary
- 4-panel convergence plots for both CG and SOR

## 📖 Background

This notebook summarizes part of my undergraduate thesis on numerical linear algebra and image restoration.  
It shows that CG significantly outperforms SOR in both speed and accuracy for large SPD systems.
