# 1D FEM with a V-cyle multigrid solver for solving Poisson's equation.

The code is essentially a fork of
https://github.com/EnigmaHuang/Poisson_FDM_Multigrid where the main
difference is discretization of the ODE is done with the FEM.

I wrote this code to better understand how MG works, so I'd say it's
the most understable lines of code using FEM-MG. 

I also want to prepare a template for adding more features related to
the FEM, so it now has all the basic features of an FEM implementation
like assembly, element integration, etc. For now, it only uses linear
basis functions.

As of now, it solves 1D Poisson's problem, i.e., 2-point BVP
    -u'' = f(x)
with appropriate BCs.

You can limit the MG solver to a 2-grid cyle comprising the starting
(fine) mesh and the coarse mesh (half the size) that is solved with a
direct sparse solver for the learning purpose. However, due to direct
solution, solving with a 2-grid cycle limits the fine mesh size.

To run, simply execute runfe.m.

Numerical examples for now:

1. f(x) = 2, homogenous Dirichlet BC at both ends

2. f(x) = 2 - 12*x^2, homogenous Dirichlet BC at both ends

This code is written with the assistance of my student Amiruddin Azhar.