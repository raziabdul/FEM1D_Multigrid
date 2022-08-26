function elmap = genElMap(el)

% 1D mesh with el elements

elmap = zeros(2,el);

% Write to file in ascii
for i = 1:el
    elmap(:,i) = [i i+1];
end

fileID = fopen('elmap.txt','w');
fprintf(fileID,'%10d %10d\n', elmap);
fclose(fileID);