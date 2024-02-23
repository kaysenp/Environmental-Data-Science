% Compares mean temps between 1980-1990 and 2000-2010
% 
% globalwarming
% Kaysen Pajarillo 11/20/23
%
% Compares mean temperatures between two time intervals (1980-1990 and 2000-2010), performs a pixel-wise t-test, 
% and visualizes significant changes on a map.

% Load data
load('surface_temperature_10daily.mat');

% Define four variables that define the two time intervals
recent_year1 = 2000;
recent_year2 = 2010;
control_year1 = 1980;
control_year2 = 1990;

% Extract temperature data for control (historic climate) period
indices_time_control = find(year >= control_year1 & year <= control_year2);
temp_past = temperature(:,:,indices_time_control);

% Extract temperature data for recent (modern) period
indices_time_recent = find(year >= recent_year1 & year <= recent_year2);
temp_recent = temperature(:,:,indices_time_recent);

% Calculate the difference in mean temperatures between the two intervals
difference_in_means = mean(temp_recent, 3) - mean(temp_past, 3);

% Create a figure with subplots
figure;
subplot(2, 1, 1); % First subplot

% Plot the difference in means
imagesc(lon, lat, difference_in_means); % Create image
axis xy; % Set axis
colormap([1 1 1; jet]); % Color scheme
caxis([-4 4]); % Force the color bar to go from -4K to +4K
colorbar; % Add a color bar

% Add coastlines
load('coastlines.mat');
hold on; % Overlay
plot(coastlon, coastlat, 'k'); % Add coastlines black
hold off;

% Label axes and add title
xlabel('Longitude');
ylabel('Latitude');
title('Difference (2000-2010) minus (1980-1990) in temperature (K)');

% Store in a variable n the sample size
n = length(indices_time_control);
% Compute the crtitcal value 
alpha = 0.05; % Significance level for 95% confidence
df = n - 1; % Degrees of freedom
tcrit = tinv(1 - alpha/2, df); % Two-tailed test

% Perform a t-test on each pixel of this map and create a matrix
difference_in_means_95sig = NaN(size(difference_in_means)); % Initialize with NaN
for index_lon = 1:length(lon)
    for index_lat = 1:length(lat)
        % Get the recent temperature time series for this pixel i,j
        temp_recent_here = reshape(temp_recent(index_lat, index_lon, :), [n, 1]);
        % Get the past temperature time series for this pixel i,j
        temp_past_here = reshape(temp_past(index_lat, index_lon, :), [n, 1]);
        % Make vector of paired differences d
        d = temp_recent_here - temp_past_here;
        % Perform t-test
        tstat = mean(d) / (std(d) / sqrt(n));
        % If we can reject the null hypothesis, then:
        if abs(tstat) >= tcrit
            difference_in_means_95sig(index_lat, index_lon) = mean(d);
        end
    end
end

% Second subplot
subplot(2, 1, 2);

% Plot the significant mean differences only
imagesc(lon, lat, difference_in_means_95sig); % Create image
axis xy; % Set axis
colormap([1 1 1; jet]); % Color scheme
caxis([-4 4]); % Force the color bar to go from -4K to +4K
colorbar; % Add colorbar

% Plot coastlines black
hold on; % Overlay
plot(coastlon, coastlat, 'k'); % Coastlines black
hold off; % Stop overlay

% Label axes and add title
xlabel('Longitude');
ylabel('Latitude');
title('95% significant only');
