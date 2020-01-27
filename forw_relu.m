%
% Function to calculate output from ReLu activation filter.
% y=max(0,x), where y is the output.
% X is input matrix of size M X N.
% This function will return a matrix of M X N after being activated by ReLu
% filter.
% @Author Mudit Garg

function relu=forw_relu(x)
 relu =max(0,x);

return