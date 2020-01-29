%Sample routine for testing backprop, using softmax

%input array X
X = [ 1; 2; 4; 5; 8; 0];

% dz/dY coming in from backprop 
dzdy = [-2; 4; 1; -3; -2; -4];

% We need to compute dzdx both analytically and numerically.
% The test will be successful if both yield same result

%forward pass to compute Y
Y = forw_softmax(X);

%computing the backprop derivatives analytically 
dzdx=back_softmax(X,Y,dzdy);

%now compute them by using numerical derivatives 

% numerically compute dz/dw
eps = 1.0e-6;
dzdxnumeric = zeros(size(X));
Y = forw_softmax(X);
for i=1:size(X,1)
    for j=1:size(X,2)
        filt = X;
        filt(i,j) = filt(i,j)+eps;
        yprime = forw_softmax(filt);
        deriv = (yprime-Y)/eps;
        dzdxnumeric(i,j) = dot(deriv(:),dzdy(:));
    end
end



%we will just compare them by eye
%this could be more fancy, like computing max abs diff between the two
fprintf('comparison of analytic and numerical derivs relu backprop\n');
fprintf('comparing dz/dx values\n');
dzdx
dzdxnumeric

