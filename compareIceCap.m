% Compares Quelccaya ice cap surface areas 22 years apart
% 
% compareIceCap
% Kaysen Pajarillo 12/4/23
% 
% Reads in two Landsat images of the Quelccaya Ice Cap from two
% different time periods (22 years apart) and compares the total ice cap surface areas

% Read the images
iMat1988 = imread('Quelccaya_19880903.jpg');
iMat2010 = imread('Quelccaya_20100916.jpg');

% Convert to double and scale pixel values to [0, 1]
iMat1988 = im2double(iMat1988);
iMat2010 = im2double(iMat2010);

% Preallocate white matrices
iMat1988B = ones(size(iMat1988));
iMat2010B = ones(size(iMat2010));

% Loop through each pixel
pixelCount1988 = 0;
pixelCount2010 = 0;

% Loop for 1988 image
for row = 1:size(iMat1988, 1) % Iterates over each row of the image
    for col = 1:size(iMat1988, 2) % Iterates over each column within that row
        pixel = iMat1988(row, col, :); % Accesses the pixel at the current row column
        if pixel(1) < 100/255 && pixel(2) > 130/255 && pixel(3) > 155/255 % Conditions for snow/ice
            iMat1988B(row, col, :) = pixel;
            pixelCount1988 = pixelCount1988 + 1; % Total snow/ice pixels
        end
    end
end

% Loop for 2010 image
for row = 1:size(iMat2010, 1) % Iterates over each row of the image
    for col = 1:size(iMat2010, 2) % Iterates over each column within that row
        pixel = iMat2010(row, col, :); % Accesses the pixel at the current row column
        if pixel(1) < 100/255 && pixel(2) > 130/255 && pixel(3) > 155/255 % Conditions for snow/ice
            iMat2010B(row, col, :) = pixel;
            pixelCount2010 = pixelCount2010 + 1; % Total snow/ice pixels
        end
    end
end

% Calculate the area of the ice cap given that each pixel is 30m/pixel
area1988_km2 = pixelCount1988 * 30 * 30 / 1e6; % Area calculation and convert to km^2
area2010_km2 = pixelCount2010 * 30 * 30 / 1e6; % Area calculation and convert to km^2

% Calculate the difference between 1988 and 2010 area
totalChange_km2 = area2010_km2 - area1988_km2; 

% Calculate the rate of change
rateOfChange_km2_per_year = totalChange_km2 / 22; % Assuming exactly 22 years apart

% Print results
fprintf('Total Ice Cap Areas\n'); % Total Ice Cap Areas
fprintf('1988: %.2f km^2\n', area1988_km2); % 1988: xx.xx km^2
fprintf('2010: %.2f km^2\n', area2010_km2); % 2010: xx.xx km^2
fprintf('Total change: %.2f km^2\n', totalChange_km2); % Total change: xx.xx km^2
fprintf('Rate of change: %.2f km^2/yr\n', rateOfChange_km2_per_year); % Rate of change: xx.xx km^2/yr

% Display figures
% Raw image 1988
figure; % Figure window
imshow(iMat1988); % Display image raw 1988
title('RAW Image: 1988'), axis on; % Add title and display axis

% Ice cap extent 1988
figure;
imshow(iMat1988B); % Displays processed 1988 image
title('Quelccaya Ice Cap Extent: 1988'), axis on;

% Raw image 2010
figure;
imshow(iMat2010); % Displays raw 2010 image
title('RAW Image: 2010'), axis on;

% Ice cap extent 2010
figure;
imshow(iMat2010B); % Displays processed 2010 image
title('Quelccaya Ice Cap Extent: 2010'), axis on;
