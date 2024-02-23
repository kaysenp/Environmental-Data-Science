% Displays precipitation data from Fort Collins
% 
% fortcollins
% Kaysen Pajarillo 11/20/23
%
% Analyzes precipitation data from Fort Collins, plots annual trends,
% and performs a t-test to determine if there's a significant change in precipitation between them.

% Load data
fileID = fopen('Fort_Collins_P.txt', 'r');
data = textscan(fileID, '%f %f', 'HeaderLines', 8); % Skip the first 8 lines
fclose(fileID);

% Separate the two elements of the cell array data into two distinct variables
time = data{1}; % First column is time
precip = data{2}; % Second column is precipitation

% Plot data
figure; % Create a new figure window
plot(time, precip, 'b-'); % Blue line, no marker
xlabel('Year'); % Label axes
ylabel('Annual total precipitation (inches)');
xlim([1896, 2010]); % Set x limit
title('Annual total precipitation over time in Fort Collins'); % Add title

% Find the indices for specified time and store
pos1899 = find(time == 1899);
pos1939 = find(time == 1939);
pos1940 = find(time == 1940);
pos1980 = find(time == 1980);

% Calculate the average amount of precipitation for the time interval [1899 1939] 
% and store that value in mean1
mean1 = mean(precip(pos1899:pos1939));

% Do the same for the time interval [1940 1980] and store that value in mean2
mean2 = mean(precip(pos1940:pos1980));

% Display results
fprintf('Fort Collins average precipitations\n');
fprintf('1899 to 1939: %.2f inches\n', mean1);
fprintf('1940 to 1980: %.2f inches\n', mean2);

% T-test
% Extract precipitation data for the two time intervals
precip1 = precip(pos1899:pos1939); % Precipitation in 1899-1939
precip2 = precip(pos1940:pos1980); % Precipitation in 1940-1980

% Create a vector d
% Store the difference in precipitation between two time intervals
d = precip2 - precip1;

% Store in a variable n the sample size
n = length(d);

% Compute t-statistic and store
d_mean = mean(d); % Mean of differences
d_std = std(d);   % Standard dev of differences
tstat = d_mean / (d_std / sqrt(n));

% Compare statistic to a critical value
alpha = 0.1; % Define the level of significance
tcrit = tinv([alpha/2, 1-alpha/2], n-1); % Compute the corresponding value for t-statistic: Two-tailed test

% Display results
fprintf('t-statistic: %.2f\n', tstat);
fprintf('Critical values for two-tailed test: %.2f and %.2f\n', tcrit(1), tcrit(2));

% Compare the absolute value of tstat and tcrit
if abs(tstat) > abs(tcrit(2))
    fprintf('tcrit = %.2f < tstat = %.2f, the amount of precipitation has changed significantly in Fort Collins\n', abs(tcrit(2)), abs(tstat));
elseif abs(tstat) < abs(tcrit(2))
    fprintf('tcrit = %.2f > tstat = %.2f, the amount of precipitation has not changed significantly in Fort Collins\n', abs(tcrit(2)), abs(tstat));
else
    fprintf('tcrit = %.2f and tstat = %.2f, the amount of precipitation has not changed significantly in Fort Collins\n', abs(tcrit(2)), abs(tstat));
end

