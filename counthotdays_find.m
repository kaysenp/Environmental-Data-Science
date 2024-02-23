% Counts hot days in Chicago
%
% counthotdays_find.m
% Kaysen Pajarillo 10/25/23
%
% Counts number of very hot, hot, and normal days in Chicago, July 1995

% Load data for Chicago
Chicago = load('cities_data\Chicago.txt');

% Create a variable equal to temp column for Chicago data
temps = Chicago(:, 1);

% Using find and length
% Count number of very hot days (>=90)
veryHotCount = length(find(temps >= 90));

% hot days (>=80 and <90)
hotCount = length(find(temps >= 80 & temps < 90));

% normal days (<80)
normalCount = length(find(temps < 80));

% Print results
fprintf('In Chicago in July 1995 there were:\n');
fprintf('%d very hot days (>%dF)\n', veryHotCount, 90);
fprintf('%d hot days (%d-%dF)\n', hotCount, 80, 90);
fprintf('%d normal days (<%dF)\n', normalCount, 80);
