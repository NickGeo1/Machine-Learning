% File 'cifar_data.mat' contains matrix A and vector (uint8 data type)
load('cifar_data.mat');

% Convert to double data type for computations
X = double(A)
x = double(a)

% Number of samples
P = size(X,1);

% Number of features
N = size(X,2);

% Find data center. mX holds m for every column
mX = sum(X)/P;

% Compute the centered data.
X0 = X - mX;

% Compute whitening transformation W so that Xw = X0 * W. 
% W is sqrt(P-1)*V*S^-1, V and S can be get from svd(X0).
% We get first 1024 rows out of 1200 rows of S with and
% first 1024 columns out of 1200 columns in U with "econ" 
[U,S,V] = svd(X0,"econ");
W = sqrt(P-1)*V*inv(S);

% Compute whitened data matrix Xw so that cov( Xw ) = eye( N )
Xw = sqrt(P-1)*U;
    

% Transform the new sample x into whitened feature space
xw = (x - mX)*W;


% Plot the result (not mandatory, but beneficial)
% Show first MxM images
M = 5;

figure
for i = 1:M^2
    subplot(M,M,i)
    imshow( reshape( X(i,:), 32, 32 )', [0 255] )
end
sgtitle('Original data')

range = max(abs(Xw(:)));
figure
for i = 1:M^2
    subplot(M,M,i)
    imshow( reshape( Xw(i,:), 32, 32 )', [-range range] )
end
sgtitle('Whitened data')

figure
subplot(121)
imshow( reshape( x, 32, 32 )', [0 255] )
title('Original new sample')
subplot(122)
imshow( reshape( xw, 32, 32 )', [-range range] )
title('Whitened new sample')

