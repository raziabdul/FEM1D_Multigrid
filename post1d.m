function post1d(uf, K, x, loadCase)
%%  Post-processor for viewing results
%   Input Parameters: 
%   uf - the FEM solution
%   K - the stiffness matrix
%   x - the coordinate
%   loadCase - the case study. See getbe 
%%


    disp("Post-processing...")
    % Length of domain
    len = x(end) - x(1);

    % Find the size of the fine stiffness matrix
    n = size(K,1);
    
    switch loadCase
        case 1
            % Analytical solution of the ODE
            u = -x.^2 + x;
        case 2
            % Analytical solution of the ODE
            u = x.^2 - x.^4;
        otherwise
            u = -x.^2 + x;
    end
    % Report error as L2 norm
    % However, for some problems, this is not suitable to show error 
    % convergence since the FE solution is exact at the nodes. 

    %errU = U_ana - U_fem; 
    %disp('L2 norm of error')
    %disp(norm(errU))

    % Report the total "potential" energy instead. From the variational
    % formulation of the FEM, the energy is approaching a constant as
    % the FE size h approaches 0.
    energy = uf'*K*uf;
    etmp = full(energy);
    strE = sprintf('%0.5e',etmp);
    disp('Energy')
    disp(strE)

    figure;      % Initialize the plot name
    plot(x, uf, "d"); % Plot the FEM U vs the exact U
    title('Exact vs FEM')
    ylabel('u(x)') 
    xlabel('x') 
    hold on         % Multiple plots on same graph
    plot(x, u);
    legend('FEM','Exact')
    hold off
    grid on     

    %figure
    %plot(x, u);
