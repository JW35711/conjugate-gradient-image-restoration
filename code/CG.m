function [delta_F, k, Time] = CG(X, A, B)
% Conjugate Gradient (CG) method to solve AX = B

tol = 1e-6;
delta_F = 1;
k = 0;

R_i = B - A * X;
P_i = R_i;

disp(' _________________________________________________________________ ');
disp('Out_k    Out_error');
disp(' _________________________________________________________________ ');

tic
while (k < 2000) && (delta_F > tol)
    Q_i = A * P_i;
    ss = trace(R_i' * R_i);
    alpha = ss / trace(P_i' * Q_i);
    X = X + alpha * P_i;
    R_i = R_i - alpha * Q_i;
    beta = trace(R_i' * R_i) / ss;
    P_i = R_i + beta * P_i;
    
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
