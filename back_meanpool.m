%
% This function is used to calculate the backpropagation values of
% meanpooling layer
% Input is a matrix x of size[2m,2n].
% y is matrix of size [m,n]
% output dzdx should be of size [2m,2n]
% @Author Mudit Garg

function dzdx=back_meanpool(x,y,dzdy)

%Every derivative in meanpool is 0.25 times of dzdy
tmp=0.25.*dzdy(:);

% creating a new array that contains the derivative values column wise
for i=1:4
    for j=1:size(tmp,1)
        new_array(i,j)=tmp(j);
    end
end

%converting new array into an image of size [2m 2n]
dzdx=col2im(new_array,[2 2],size(x),'distinct');


return