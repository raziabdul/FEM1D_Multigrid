function x = genCoord(el)

% Length is 1 for now
% x from 0 to 1 with el elements

x=0:1/el:1;

% Write to file in ascii


fileID = fopen('coord.txt','w');
fprintf(fileID,'%.17g\n', x);
fclose(fileID);