%% runfe.m The main file
% This program solves a 1D Poisson's problem:
%  -u'' = f(x)
% with appropriate BCs using the FEM discretization and a V-cycle multigrid
% solver.
% You can limit the MG solver to a 2-grid cyle comprising the starting
% (fine) mesh and the coarse mesh (half the size) that is solved with a 
% direct sparse solver for the learning purpose. 
% However, due to direct solution, solving with a 2-grid cycle limits the 
% fine mesh size.

clear all
close all
clc

elnum = 64; % Number of elements
% Number of dofs, i.e., size of the global matrix
n = elnum + 1;

fprintf('Using %d initial grid points\n', n);

% PRE-PROCESSING
xc = genCoord(elnum); % set coordinates of uniform mesh
emap = genElMap(elnum);

% Build the system matrix
K = assemb1d(xc, emap);

% loadCase is 1 by dedault
loadCase = 1;
% Build the system load vector
b = assembRHS1d(xc, emap, loadCase);

% bcCase is 1 by dedault
bcCase = 1;

% Modify for the Dirichlet BCs
[K, b] = getbc(K, b, bcCase);

% SOLUTION PROCESS
% Start MG
[u, vc_cnt] = Multigrid_Solver(K, b, 1);
%disp('V cycle counts')
%disp(vc_cnt)

% POST-PROCESSING 
% Post-processing the results. For now, plot solution and report the
% "potential" energy
post1d(u, K, xc, loadCase)