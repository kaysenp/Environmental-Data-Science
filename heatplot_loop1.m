% Plot temperature in July 1995
%
% heatplot_loop1.m
% Kaysen Pajarillo 10/30/23
%
% Plots data for the six most populous cities in the USA


% Info that will be used in the loop
cities = {'NYC','LA','Chicago','Houston','Phoenix','Philadelphia'}; % the cities
days = 1:31; % counter for days (7/1/1995-7/31/1995)


for i = 1:length(cities) % Loop over cities

    % Load data
    city_data = load(['cities_data\' cities{i} '.txt']); % cities{i} accesses the i-th element in 'cities'
    
    % Initialize the subplot
    subplot(3, 2, i);
    
    % Plot days against temperature
    plot(days, city_data(:, 1), 'ko-'); % k for black, o for circle markers, - for line
    
    % Label the x and y axes, add title, set y-axis limits 60-120F
    xlabel('Days in July 1995');
    ylabel('Temperature (degF)');
    title(cities{i});
    ylim([60 120]);

end