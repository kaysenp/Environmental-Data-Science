% Plots the sinusoidal day/night temperature variation
% 
% plotTemp.m
% Written by Kaysen Pajarillo
% 10/23/2023
%
%------------------------------------

% Define amplitude (A) and wavelength (lambda)
A = 2;
lambda = 24;

% Make independent variable (x) go from 0 to 3*lambda with 50000 points
x = linspace(0, 3*lambda, 50000);

% Use the sinusoidal equation to calculate the y-values
y = A * sin(2*pi*x/lambda);

% Make new fig window
figure;
% Plot the results, label axes, and set axis limits
plot(x, y, 'r-');
xlabel('Time (hours)');
ylabel('Temperature Change (C)');
axis([0, 3*lambda, -1.25*A, 1.25*A]);