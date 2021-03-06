%Sample routine for testing backprop, using meanpool.

%input array X
X = [ 1 2 4 5 8 9; 2 4 1 6 0 5; 2 4 0 1 3 12;8 23 43 19 0 1;1 4 23 76 3 7;12 89 32 12 99 0];

% dz/dY coming in from backprop 
dzdy = [ 1 -3 -2;  -1 3 -2;  -3 5 4];

% We need to compute dzdx both analytically and numerically.
% The test will be successful if both yield same result

%forward pass to compute Y
Y = forw_meanpool(X);

%computing the backprop derivatives analytically 
dzdx=back_meanpool(X,Y,dzdy);

%now compute them by using numerical derivatives 

% numerically compute dz/dw
eps = 1.0e-6;
dzdxnumeric = zeros(size(X)./2);
Y = forw_meanpool(X);
for i=1:size(X,1)
    for j=1:size(X,2)
        filt = X;
        filt(i,j) = filt(i,j)+eps;
        yprime = forw_meanpool(filt);
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

