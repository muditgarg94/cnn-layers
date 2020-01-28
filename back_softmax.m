%
% This function is used to calculate the backpropagation values of
% meanpooling layer
% Input is a matrix x of size[m,1].
% y is matrix of size [m,1]
% output dzdx should be of size [m,1]
% @Author Mudit Garg

function dzdx=back_softmax(x,y,dzdy)

dydx=diag(y);
[m,n]=size(dydx);
for i=1:m
    for j=1:n
        if i==j
            dydx(i,j)=y(i)*(1-y(j));
        else
            dydx(i,j)=-y(i)*y(j);
        end
    end
end

dzdx=dzdy.*dydx;


return