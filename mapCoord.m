function xOut = mapCoord(xIn, xI, xJ, cflag)

% Returns either local or global coordinate according to the cflag
% 1 returns local
% 2 returns global

% Element length
len = xJ - xI;

switch cflag
    case 1 % returns as local coordinate rho 
        xOut = (2*xIn - xI - xJ)/len; 
    case 2 % returns as global coordinate x
        xOut = (len*xIn + xI + xJ)/2;
    otherwise
        xOut = 0
end