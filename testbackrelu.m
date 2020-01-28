%Sample routine for testing backprop, using ReLu as example.

%input array X
X = [ 1 2 4 5 8; 2 4 1 6 0; 2 4 0 1 3];

% dz/dY coming in from backprop 
dzdy = [-2 4 1 -3 -2; 3 1 -1 3 -2; -1 -2 -3 5 4];

% We need to compute dzdx both analytically and numerically.
% The test will be successful if both yield same result

%forward pass to compute Y
Y = forw_relu(X);

%computing the backprop derivatives analytically 
dzdx=back_relu(X,Y,dzdy);

%now compute them by using numerical derivatives 

% numerically compute dz/dw
eps = 1.0e-6;
dzdwnumeric = zeros(size(w));
Y = forw_conv(X,w,bias);
for i=1:size(w,1)
    for j=1:size(w,2)
        filt = w;
        filt(i,j) = filt(i,j)+eps;
        yprime = forw_conv(im,filt,bias);
        deriv = (yprime-Y)/eps;
        %note, deriv = dY/dwij, the deriv of all Y values wrt one wij value
        %we dot product that with deriv of z wrt all Y values, thus 
        %summing over all dz/dypq * dypq/dwij , leaving dz/dwij
        dzdwnumeric(i,j) = dot(deriv(:),dzdy(:));
    end
end

% numerically compute dz/dX
eps = 1.0e-6;
dzdxnumeric = zeros(size(X));
Y = forw_conv(X,w,bias);
for i=1:size(X,1)
    for j=1:size(X,2)
        newim = X;
        newim(i,j) = newim(i,j)+eps;
        yprime = forw_conv(newim,w,bias);
        deriv = (yprime-Y)/eps;
        %similar to above, deriv = dY/dxij, the deriv of all Y  wrt one xij value
        %we dot product that with deriv of z wrt all Y values, thus 
        %summing over all dz/dypq * dypq/dxij , leaving dz/dxij        
        dzdxnumeric(i,j) = dot(deriv(:),dzdy(:));
    end
end

% numerically compute dz/db
eps = 1.0e-6;
dzdbnumeric = 0;
Y = forw_conv(X,w,bias);
yprime = forw_conv(X,w,bias+eps);
deriv = (yprime-Y)/eps;
%deriv = dY/db, which we know analytically should be all 1's.
%so really, the answer we get below should just be the sum of 
%all values in dzdy
dzdbnumeric =  dot(deriv(:),dzdy(:));

%we will just compare them by eye
%this could be more fancy, like computing max abs diff between the two
fprintf('comparison of analytic and numerical derivs relu backprop\n');
fprintf('comparing dz/db values\n');
dzdb
dzdbnumeric
fprintf('comparing dz/dw values\n');
dzdw
dzdwnumeric
fprintf('comparing dz/dx values\n');
dzdx
dzdxnumeric

