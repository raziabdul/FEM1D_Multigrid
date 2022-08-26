function K = assemb1d(x,emap)

n = length(x);
enum = n - 1; % number of elements
K = sparse(n, n);
edof = 2  % dof for linear 1D element	
% Assume element length uniform in mesh
elen = x(2) - x(1);


%emap = [1:enum;2:ndof]';
emap = emap';
for el = 1:enum
    Ke = getKe(elen);
    for ir = 1:edof
        irs = emap(el,ir);
        for ic = 1:edof
            ics = emap(el,ic);
            K(irs,ics) = K(irs,ics)+ Ke(ir,ic);
        end
    end
end
%full(A)