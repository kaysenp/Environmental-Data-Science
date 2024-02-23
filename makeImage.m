% Displays two 4 pixel images
% 
% makeImage
% Kaysen Pajarillo 12/4/23
%
% Dislays two 4 pixel images using indexed color and true color

% Define some colors
yellow = [1 1 0];
green  = [0 1 0];
blue   = [0 0 1];
red    = [1 0 0];

% Define a colormap
cMap1 = [yellow; green; blue; red];

% Define image values
mat1 = [1, 2; 3, 4];

% Preallocate a MxNx3 matrix
mat2 = zeros(2, 2, 3);

% Define redness for every pixel
mat2(:,:,1) = [1, 0; 0, 1];

% Define greenness for every pixel
mat2(:,:,2) = [1, 1; 0, 0];

% Define blueness for every pixel
mat2(:,:,3) = [0, 0; 1, 0];

% Create figure window
figure;

% Display indexed color image
subplot(1, 2, 1); % Left plot
image(mat1); % Create image
colormap(cMap1); % Set colormap
axis('square'); % Make square
title('Indexed Color Image'); % Add title

% Display true color image
subplot(1, 2, 2); % Right plot
image(mat2); % Create image
axis('square'); % Make square
title('True Color Image'); % Add title
