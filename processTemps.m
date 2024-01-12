% Plots temperature data from streamTemp.dat
% 
% processTemps.m
% Written by Kaysen Pajarillo
% 10/23/2023
%
%------------------------------------

% Load the data
tempDat = load('streamTemp.dat');

% Extract the columns
time = tempDat(:, 1);
wataugaHospital = tempDat(:, 2);
winklersCreek = tempDat(:, 3);
booneCreek = tempDat(:, 4);

% Convert temperatures from °F to °C
wataugaHospital = (wataugaHospital - 32) * 5/9;
winklersCreek = (winklersCreek - 32) * 5/9;
booneCreek = (booneCreek - 32) * 5/9;

% Make the time series start at time=0 days
time = time - time(1);

% Make new fig window
figure;

% Plot Watauga Hospital data blue
plot(time, wataugaHospital, 'b-');

% All 3 converted temp time series on one plot
hold on;

% Plot Winkler Creek data red
plot(time, winklersCreek, 'r-');

% Plot Boone Creek data green
plot(time, booneCreek, 'g-');

% Label axes and add legend
xlabel('Time (days)');
ylabel('Temperature (°C)');
legend('Watauga Hospital', 'Winklers Creek', 'Boone Creek');
