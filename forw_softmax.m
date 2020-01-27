%
% This function is used to calculate output after applying softmax
% activation layer.
% Input is a one dimenshional vector. The output is also a 1D vector
% @Author Mudit Garg

function y=forw_softmax(x)

y=exp(x)./sum(exp(x));

return