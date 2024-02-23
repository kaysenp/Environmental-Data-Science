% Displays sodium content of volcanic glass
% 
% sodium
% Kaysen Pajarillo 11/6/23
%
% Calculates central tendency, dispersion, and shape parameters of the 
% distribution of sodium in volcanic glass by weight percentage and displays results as a histogram

% Load data
Na = load('sodiumcontent.txt');

% Remove outlier
Na(end) = []; % The last value is the outlier

% Calculate central tendency
sampleSize = numel(Na);
sampleMean = mean(Na);
sampleMedian = median(Na);

% Calculate dispersion
dataRange = range(Na);
stdDev = std(Na);

% Calculate shape parameters of the distribution
dataSkewness = skewness(Na);
dataKurtosis = kurtosis(Na);

% Print central tendency results
disp('CENTRAL TENDENCY');
disp(['Sample size: ', num2str(sampleSize)]);
disp(['Sample mean: ', num2str(sampleMean, '%.2f'), ' wt%']);
disp(['Sample median: ', num2str(sampleMedian, '%.2f'), ' wt%']);

% Print dispersion results
disp('DISPERSION');
disp(['Range: ', num2str(dataRange, '%.2f'), ' wt%']);
disp(['Standard deviation: ', num2str(stdDev, '%.2f'), ' wt%']);

% Print distribution's shape results
disp('DISTRIBUTION''S SHAPE');
disp(['Skewness: ', num2str(dataSkewness, '%.2f')]);
disp(['Kurtosis: ', num2str(dataKurtosis, '%.2f')]);

% Create histogram
figure;
histogram(Na, 'BinMethod', 'auto'); % Auto distribute bin centers
xlabel('Na (wt%)'); % Add x axis label
title('Distribution of Sodium Content'); % Add title
