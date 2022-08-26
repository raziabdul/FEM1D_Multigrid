function [K, b] = getbc(K, b, bcCase)
% cases for the BCs at end points
%
% Case 1: Both homogenous Dirichlet. Default
% Case 2: Homogenous Dirichlet at x = 0, homogenous Neumann at x = L 

switch bcCase
    case 1
        K(1,1) = 1;
        K(1,2) = 0;
        K(end, end) = 1;
        K(end, end-1) = 0;
        b(1) = 0;
        b(end) = 0;
    case 2
        K(1,1) = 1;
        K(1,2) = 0;
        b(1) = 0;
    otherwise
        K(1,1) = 1;
        K(1,2) = 0;
        K(end, end) = 1;
        K(end, end-1) = 0;
        b(1) = 0;
        b(end) = 0;
end
