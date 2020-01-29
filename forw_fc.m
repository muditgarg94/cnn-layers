%
% Function to calculate the output of fully connected layer
% x is a M X N matrix.
% w is weights matrix of size M X N
% b is a scalar bias value.
% output is a scalar value computed by $\sum_i \sum_j w_{ij} x_{ij} +b$
%
% @Author Mudit Garg

function y=forw_fc(x,w,b)

y=dot(x(:),w(:))+b;

return


