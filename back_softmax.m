%
% This function is used to calculate the backpropagation values of
% meanpooling layer
% Input is a matrix x of size[m,1].
% y is matrix of size [m,1]
% output dzdx should be of size [m,1]
% @Author Mudit Garg

function dzdx=back_softmax(x,y,dzdy)
dydx=zeros(size(y,1),size(x,1));
for i=1:size(y,1)
    for j=1:size(x,1)
        if i==j
            dydx(i,j)=y(i)*(1-y(i));
        else
            dydx(i,j)=-y(i)*y(j);
        end
    end
end

dzdx_mat=dzdy.*dydx;

dzdx=sum(dzdx_mat);

dzdx=dzdx';


return