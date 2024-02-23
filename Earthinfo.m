% Calculates mean and standard dev temp and alt on Earth
% 
% Earthinfo
% Kaysen Pajarillo 11/6/23
%
% Calculates and prints the mean and standard dev of temperature and altitude 
% on Earth
% at the equator and midlatitude

% Load data
load('aliendata.mat');

% Calculate the mean and standard deviation for midlatitude temperature and altitude
meanTemperature = mean(Tmidlat);
stdDevTemperature = std(Tmidlat);
meanAltitude = mean(Zmidlat);
stdDevAltitude = std(Zmidlat);

% Print midlatitude results
fprintf('Earth Properties @ Midlatitude\n');
fprintf('Mean Temperature: %.2f °C\n', meanTemperature);
fprintf('Mean Altitude: %.2f meters\n', meanAltitude);
fprintf('Std Dev Temperature: %.2f °C\n', stdDevTemperature);
fprintf('Std Dev Altitude: %.2f meters\n', stdDevAltitude);

% Calculate the mean and standard deviation for equator temperature and altitude
meanTempEq = mean(Teq);
stdDevTempEq = std(Teq);
meanAltEq = mean(Zeq);
stdDevAltEq = std(Zeq);

% Print equator results
fprintf('Earth Properties @ Equator\n');
fprintf('Mean Temperature: %.2f °C\n', meanTempEq);
fprintf('Mean Altitude: %.2f meters\n', meanAltEq);
fprintf('Std Dev Temperature: %.2f °C\n', stdDevTempEq);
fprintf('Std Dev Altitude: %.2f meters\n', stdDevAltEq);