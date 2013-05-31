function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

positive_X = [];
negative_X = [];

for i = 1 : length(y),
    if y(i) == 1,
        positive_X = [positive_X ; X(i,:)];
    else
        negative_X = [negative_X ; X(i,:)];
    end;
end;


plot(positive_X(:,1), positive_X(:,2), 'k+', 'MarkerSize', 10);
hold on;
plot(negative_X(:,1), negative_X(:,2), 'ko', 'MarkerSize', 10);

xlabel('x1');
ylabel('x2');








% =========================================================================



hold off;

end
