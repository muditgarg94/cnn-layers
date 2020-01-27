%
% This function is used to calculate the backpropagation values of ReLu
% activation filter.
%
% @Author Mudit Garg

function dzdx=back_relu(x,y,dzdy)

% the dervative of relu is 0 when x<=0 and 1 when x>0. 
% In matlab, the condition returns a matrix with value as 1 when it
% satisfies and 0 when it does not satisfy.
dydx= x>0;


dzdx=dzdy.*dydx;
return