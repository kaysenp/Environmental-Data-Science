% Displays temp and alt of Earth
% 
% EarthHist
% Kaysen Pajarillo 11/6/23
%
% Displays histograms of the temperate and altitude on Earth at the
% equator and midlatitude

% Load data
load('aliendata.mat');

% Create figure
figure;

% Temperature histogram at midlatitude
subplot(2,2,1); % Top left position
% Set range of -60 C to 0 C
histogram(Tmidlat, 'BinMethod', 'auto', 'BinLimits', [-60, 0]);
% Add title, axis labels, axis limits
title('Temperature - Midlat'); 
xlabel('T (°C)');
ylabel('Count');
xlim([-60 0]);
ylim([0 150]);

% Altitude histogram at midlatitude
subplot(2,2,2); % Top right position
% Set range of 4800 m to 5900 m
histogram(Zmidlat, 'BinMethod', 'auto', 'BinLimits', [4800, 5900]);
% Add title, axis labels, axis limits
title('Altitude - Midlat');
xlabel('Z (meters)');
ylabel('Count');
xlim([4800 5900]);
ylim([0 150]);

% Temperature histogram at equator
subplot(2,2,3); % Bottom left position
% Set range of -60 C to 0 C
histogram(Teq, 'BinMethod', 'auto', 'BinLimits', [-60, 0]);
% Add title, axis labels, axis limits
title('Temperature - Equator');
xlabel('T (°C)');
ylabel('Count');
xlim([-60 0]);
ylim([0 150]);

% Altitude histogram at equator
subplot(2,2,4); % Bottom right position
% Set range of 4800 m to 5900 m
histogram(Zeq, 'BinMethod', 'auto', 'BinLimits', [4800, 5900]);
% Add title, axis labels, axis limits
title('Altitude - Equator');
xlabel('Z (meters)');
ylabel('Count');
xlim([4800 5900]);
ylim([0 150]);

% Calculate skewness
skewnessAltMidlat = skewness(Zmidlat); % Midlatitude
skewnessTempMidlat = skewness(Tmidlat);
skewnessAltEq = skewness(Zeq); % Equator
skewnessTempEq = skewness(Teq);

% Print equator skewness
fprintf('Equator Z skewness: %.2f\n', skewnessAltEq);
fprintf('Equator T skewness: %.2f\n', skewnessTempEq);

% Print midlatitude skewness
fprintf('Midlat Z skewness: %.2f\n', skewnessAltMidlat);
fprintf('Midlat T skewness: %.2f\n', skewnessTempMidlat);
