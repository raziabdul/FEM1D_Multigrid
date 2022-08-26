function bb = assembRHS1d(x, emap, loadCase)

n = length(x);
enum = n - 1; % number of elements
bb = sparse(n, 1);
edof = 2  % dof for linear 1D element	
% Assume element length uniform in mesh
elen = x(2) - x(1);


emap = emap';
for el = 1:enum
    x1 = x(emap(el,1));
    x2 = x(emap(el,2));
    be = getbe(elen, loadCase, x1, x2, el);
    for ir = 1:edof
        irs = emap(el,ir);
        bb(irs) = bb(irs)+ be(ir);
    end
end
%full(A)