% Plots temp in July 1995
%
% heatplot_noloop.m
% Kaysen Pajarillo 10/30/23
%
% Plots daily temperature data for six major cities in July 1995

% Create a vector representing days in July 1995
days = 1:31;

% Load data for NYC
NYC = load('cities_data\NYC.txt');

% Initialize the first panel of a 3 rows by 2 columns subplot
subplot(3, 2, 1);

% Plot days against temperature
plot(days, NYC(:, 1), 'ko-'); % k for black, o for circle markers, - for line

% Label the x and y axes, add title, set y-axis limits 60-120F
xlabel('Days in July 1995');
ylabel('Temperature (degF)');
title('NYC');
ylim([60 120]);

% -----------------------------------------
% Chicago
Chicago = load('cities_data\Chicago.txt');

% Initialize the first panel of a 3 rows by 2 columns subplot
subplot(3, 2, 2);

% Plot days against temperature
% k for black, o for circle markers, - for line
plot(days, Chicago(:, 1), 'ko-');

% Label the x and y axes, add title, set y-axis limits 60-120F
xlabel('Days in July 1995');
ylabel('Temperature (degF)');
title('Chicago');
ylim([60 120]);

% -------------------------------------
% Phoenix
Pheonix = load('cities_data\Phoenix.txt');

% Initialize the first panel of a 3 rows by 2 columns subplot
subplot(3, 2, 3);

% Plot days against temperature
% k for black, o for circle markers, - for line
plot(days, Pheonix(:, 1), 'ko-');

% Label the x and y axes, add title, set y-axis limits 60-120F
xlabel('Days in July 1995');
ylabel('Temperature (degF)');
title('Phoenix');
ylim([60 120]);

% -------------------------------------
% Los Angeles
LA = load('cities_data\LA.txt');

% Initialize the first panel of a 3 rows by 2 columns subplot
subplot(3, 2, 4);

% Plot days against temperature
% k for black, o for circle markers, - for line
plot(days, LA(:, 1), 'ko-');

% Label the x and y axes, add title, set y-axis limits 60-120F
xlabel('Days in July 1995');
ylabel('Temperature (degF)');
title('LA');
ylim([60 120]);

% ---------------------------------------
% Houston
Houston = load('cities_data\Houston.txt');

% Initialize the first panel of a 3 rows by 2 columns subplot
subplot(3, 2, 5);

% Plot days against temperature
% k for black, o for circle markers, - for line
plot(days, Houston(:, 1), 'ko-');

% Label the x and y axes, add title, set y-axis limits 60-120F
xlabel('Days in July 1995');
ylabel('Temperature (degF)');
title('Houston');
ylim([60 120]);

% ------------------------------------
% Philedelphia
Philedelphia = load('cities_data\Philadelphia.txt');

% Initialize the first panel of a 3 rows by 2 columns subplot
subplot(3, 2, 6);

% Plot days against temperature
% k for black, o for circle markers, - for line
plot(days, Philedelphia(:, 1), 'ko-');

% Label the x and y axes, add title, set y-axis limits 60-120F
xlabel('Days in July 1995');
ylabel('Temperature (degF)');
title('Philedelphia');
ylim([60 120]);
