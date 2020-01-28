%
% This function is used to calculate the backpropagation values of
% maxpooling layer
% Input is a matrix x of size[2m,2n].
% y is matrix of size [m,n]
% output dzdx should be of size [2m,2n]
% @Author Mudit Garg

function dzdx=back_maxpool(x,y,dzdy)

%splitting the x into columns of blocks 2 X 2
tmp=im2col(x,[2 2],'distinct');

%getting the max values in column array and the indices of max values
[max_val,index]=max(tmp);

new_arr=zeros(size(tmp));

%setting the new_array to dzdy values at indices where value is max, else
%everywhere it is zero
for i=1:size(tmp,2)
    new_arr(index(1,i),i)=dzdy(i);
end

%converting new_arry into an image of size [2m 2n]
dzdx=col2im(new_arr,[2 2],size(x),'distinct');

return