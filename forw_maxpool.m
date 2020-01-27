%
% This function is used to calculate output after applying max-pool layer
% to CNN. Input is a matrix of size 2M X 2N. The output will be a matrix of
% size M X N.
% @Author Mudit Garg

function y=forw_maxpool(x)
[m,n]=size(x);
if(mod(m,2)~=0 && mod(n,2)~=0)
    error('input matrix is not of correct dimensions.');
elseif(m<2 && n<2)
    y=zeros(m/2,n/2);
else
    tmp=im2col(x,[2 2],'distinct');
    tmp=max(tmp);
    y=col2im(tmp,[1 1],[m/2 n/2],'distinct');
end
return