function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

next_theta = zeros(length(theta), 1);

% feature scaling
Xs = X;
for i = 1:size(X)(1,2),
    xi = X(:,i);
    if max(xi) > min(xi),
        Xs(:,i) = (xi - sum(xi) / length(xi)) / (max(xi) - min(xi));
    end;
end;


if max(y) > min(y),
    ys = (y - sum(y) / length(y)) / (max(y) - min(y));
else
    ys = y;
end;

J_index = zeros(num_iters, 1);

origin_theta = theta;
prev_alpha = alpha;
prev_theta = theta;
prev_J_history = J_history;
overhead = false;
prev_step = 0;
step = 0;
while true,
    theta = origin_theta;
for iter = 1:num_iters
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    next_theta = theta - alpha / m  * (((theta' * Xs')' - ys)' * Xs)';
    theta = next_theta;    
    





    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
    % Check if overhead
    if iter > 1,
        %disp(sprintf('%d, J = %f; %d, J = %f', iter -1 , J_history(iter - 1), iter, J_history(iter)));
        if J_history(iter) - J_history(iter - 1) > 0,
            overhead = true;
            break;
        end;
    end;


end; % end for
    if overhead,
        theta = prev_theta;
        J_history = prev_J_history;
        break;
    else
        prev_alpha = alpha;
        alpha = prev_alpha * 3; % increase alpha
        prev_theta = theta;
        prev_J_history = J_history;
    end;
    
end;% end while

%for iter=1:num_iters,
%    J_index(iter) = iter;
%end;
%figure;
%plot(J_index, J_history, 'rx', 'MarkerSize', 10);
%xlabel('iterations');
%ylabel('cost');

end;
