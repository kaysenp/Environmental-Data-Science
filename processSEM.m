% Reads a SEM image of a mountain and displays its various mineral abundances
% 
% processSEM
% Kaysen Pajarillo 12/4/23
%
% Reads a grayscale SEM image of a rock sample from the Dolomite Mountains, Italy, identifies 
% the composition of each pixel, and then calculates the percentages of each mineral.

% Load the SEM image
SEMImage = imread('L-8F.jpg');

% Get the size of the image
[imageHeight, imageWidth] = size(SEMImage);

% Preallocate matrices
IronOxide = ones(imageHeight, imageWidth);
Calcite = ones(imageHeight, imageWidth);
Dolomite = ones(imageHeight, imageWidth);
Pores = ones(imageHeight, imageWidth);

% Loop over every pixel in the image
for row = 1:imageHeight % Iterates over each row of the image
    for col = 1:imageWidth % Iterates over each column within that row
        pixelValue = SEMImage(row, col); % Accesses the pixel at the current row column

        % Classify each mineral using the grayscale color values in the table
        if pixelValue > 175
            IronOxide(row, col) = 0; % >175: Save as black pixel in Iron Oxide matrix
        elseif pixelValue >= 95 && pixelValue <= 175 
            Calcite(row, col) = 0; % 95 – 175: Save as black pixel in Calcite matrix
        elseif pixelValue >= 61 && pixelValue <= 94
            Dolomite(row, col) = 0; % 61 – 94: Save as black pixel in Dolomite matrix
        else
            Pores(row, col) = 0; % <61: Save as black pixel in Pore Space matrix
        end
    end
end

% Plot images into the layout specified
figure;
subplot(2,3,1), imshow(SEMImage), colormap gray, title('RAW Image'), axis on;
subplot(2,3,2), imshow(Pores), colormap gray, title('Pore Space'), axis on;
subplot(2,3,3), imshow(Dolomite), colormap gray, title('Dolomite'), axis on;
subplot(2,3,4), imshow(Calcite), colormap gray, title('Calcite'), axis on;
subplot(2,3,5), imshow(IronOxide), colormap gray, title('Iron Oxides'), axis on;

% Calculate the total number of pixels
totalPixels = imageHeight * imageWidth;

% Calculate the number of pixels for each type
numPores = nnz(Pores == 0); % Black pixels in Pores
numDolomite = nnz(Dolomite == 0); % Black pixels in Dolomite
numCalcite = nnz(Calcite == 0); % Black pixels in Calcite
numIronOxides = nnz(IronOxide == 0); % Black pixels in Iron Oxide

% Calculate percentage of each mineral type in the image
percentPores = 100 * numPores / totalPixels;
percentDolomite = 100 * numDolomite / totalPixels;
percentCalcite = 100 * numCalcite / totalPixels;
percentIronOxides = 100 * numIronOxides / totalPixels;
percentTotal = percentPores + percentDolomite + percentCalcite + percentIronOxides;

% Print results
fprintf('Pixel Abundances\n'); % Pixel Abundances
fprintf('Porosity: %6.2f %%\n', percentPores); % Porosity: xx.xx %
fprintf('Dolomite: %6.2f %%\n', percentDolomite); % Dolomite: xx.xx %
fprintf('Calcite: %6.2f %%\n', percentCalcite); % Calcite: xx.xx %
fprintf('Iron Oxides: %5.2f %%\n', percentIronOxides); % Iron Oxides: x.xx %
fprintf('Total: %6.2f %%\n', percentTotal); % Total: xxx.xx %
