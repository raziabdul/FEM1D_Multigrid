function be = getbe(len, loadCase, xmin, xmax, el)

% Constructs the element load/RHS vector according to case study
% Case 1 : Constant f(x) = 2
% Case 2 : f(x) = 2 - 12*x^2
%          1D version of the 2D example in Brigg's, Chapter 4
%
% rho is the local coordinate rho = [-1,1]
% For a linear element, the basis functions are
% xi_1 = (1 - rho)/2
% xi_2 = (1 + rho)/2
switch loadCase
    case 1
        be = len*2/2*[1; 1];
    case 2
        % Need to use quadrature. Doesn't seem to be possible with
        % MATLAB's "integrate"
        % Function to integrate is of order 3rd: xi*f(x)
        % n points can exactly integrate polynomial to order 2*n - 1
        % So only need 2 quadrature points
        % From: https://pomax.github.io/bezierinfo/legendre-gauss.html
        rho = 1/sqrt(3)*[-1 1]; % weight is 1 so no need to include here

        % Basis functions at rho:
        xi1 = (1 - rho)/2;
        xi2 = (1 + rho)/2;
        % To get values of f(x) at rho, convert rho to x
        xc = mapCoord(rho, xmin, xmax, 2);   
        fc = 2 - 12*xc.^2;

        be(1) = xi1*fc';
        be(2) = xi2*fc';

        % multiply with the length/2 factor. Also needs the negative to
        % work
        be = -len/2*be;
    otherwise % default to case 1
        be = len*2/2*[1; 1];
end