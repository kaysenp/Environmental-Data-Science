% Counts hot days in Chicago
%
% counthotdays.m
% Kaysen Pajarillo 10/25/23
%
% --------------------------------

% Load data for Chicago
Chicago = load('cities_data\Chicago.txt');

% Create a variable equal to temp column for Chicago data
temps = Chicago(:, 1);

% Using for loops and if-elseif-else
% Count number of very hot (>=90), hot (>=80 and <90), normal (<80) days

% Initalize counters
veryHotcounter = 0;
hotCounter = 0;
normalCounter = 0; 

% Go over elements of temps and counters when a condition is met
for i=1: length(temps)
    if temps(i)>= 90
        veryHotcounter = veryHotcounter + 1;
    elseif temps(i)>= 80 && temps(i)<90
        hotCounter = hotCounter + 1;
    else
        normalCounter = normalCounter + 1;
    end 
end

% Print results
fprintf('In Chicago in July 1995 there were:\n');
fprintf('%d very hot days (>%dF)\n', veryHotcounter, 90);
fprintf('%d hot days (%d-%dF)\n', hotCounter, 80, 90);
fprintf('%d normal days (<%dF)\n', normalCounter, 80);
