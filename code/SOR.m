function [delta_F, k, Time] = SOR(X, A, B)
% SOR method to solve AX = B

tol = 1e-6;
delta_F = 1;
k = 0;
omega = 1.2;
D = diag(diag(A));              % Diagonal part of A
L = -tril(A, -1);               % Strict lower triangular part
U = -triu(A, 1);                % Strict upper triangular part
DL = (D - omega * L);
DU = ((1 - omega) * D + omega * U);
L_omega = DL \ DU;
L_eta = omega * (DL \ B);

disp(' _________________________________________________________________ ');
disp('Out_k    Out_error');
disp(' _________________________________________________________________ ');

tic
while (k < 2000) && (delta_F > tol)
    X = L_omega * X + L_eta;
    R_i = B - A * X;
    delta_F = norm(R_i, 'fro');
    k = k + 1;
    
    ol1 = sprintf('%3d', k);
    ol2 = sprintf('%14.4e', delta_F);
    ol = [ol1, '  ', ol2];
    disp(ol);
    
    v(k) = delta_F;
end
Time = toc;

disp(' _________________________________________________________________ ');
disp(' ');

figure(1)
l = 1:k;
semilogy(l, v(l), 'p-', 'Color', [0.60, 0.20, 0.98], 'LineWidth', 1);
grid on
xlabel('Iteration');
ylabel('Residual');

end
