%
% This function is used to calculate the backpropagation values of
% meanpooling layer
% Input is a matrix x of size[m,n].
% w is a weights matrix of size [m,n]
% y is a scalar value
% b is a scalar bias value
% dzdy is a scalar value
% output dzdx is a matrix of size [m,n]
% output dzdw is a another matrix of size [m,n]
% output dzdb is a scalar value
% @Author Mudit Garg

function [dzdx,dzdw,dzdb]=back_fc(x,w,b,y,dzdy)


dzdx=dzdy.*w;


dzdw=dzdy.*x;


% dydb =1. Thus, dzdb is the sum of all elements of dzdy
dzdb=sum(sum(dzdy));

return