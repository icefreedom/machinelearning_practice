function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

<<<<<<< HEAD
a1 = [ones(m, 1) X];
a2 = [ones(m, 1) sigmoid(a1 * Theta1')];
a3 = sigmoid(a2 * Theta2');
n = size(y);
Y_m = ones(n, 1) * [1:num_labels];
for i = 1:n,
    Y_m(i,:) = (Y_m(i,:) == y(i,1));
end;

J = (-1) / m * sum(sum(log(a3) .* Y_m + log(1 - a3) .* (1 - Y_m)));



=======
a1 = [ones(m,1) X];
a2 = [ones(m,1) sigmoid(a1 * Theta1')];
a3 = sigmoid(a2 * Theta2');

n = size(y,1);
Y_m = ones(n, 1) * [1:num_labels];

for i= 1:n,
    Y_m(i,:) = (Y_m(i, :) == y(i));
end;


J = (-1 / m ) * sum(sum( log(a3) .* Y_m  + log(1 - a3) .* (1 - Y_m)));

reg_J = lambda  * ( sum(sum(Theta1(:,2:end) .* Theta1(:, 2:end)))  + sum(sum(Theta2(:, 2:end) .* Theta2(:, 2:end)))) / ( 2 * m);

J = reg_J + J;        
>>>>>>> 5138d7ac57d14cadce0ef1e9d1bf65151e2e8df0





<<<<<<< HEAD

=======
O_l = a3 - Y_m;

O_h = O_l * Theta2 .* [ones(m, 1) sigmoidGradient(a1 * Theta1')];

Theta1_grad = (Theta1_grad +  O_h(:, 2:end)' * a1) / m;
reg_Theta1 = [zeros(size(Theta1, 1), 1) lambda / m * Theta1(:, 2:end)];
Theta1_grad = Theta1_grad + reg_Theta1;
Theta2_grad = (Theta2_grad + O_l' * a2) / m ;
reg_Theta2 = [zeros(size(Theta2,1),1) lambda / m * Theta2(:, 2:end)];
Theta2_grad = Theta2_grad + reg_Theta2;
>>>>>>> 5138d7ac57d14cadce0ef1e9d1bf65151e2e8df0









% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


<<<<<<< HEAD
=======

>>>>>>> 5138d7ac57d14cadce0ef1e9d1bf65151e2e8df0
end
