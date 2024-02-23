% Plot temperature and deaths in July 1995
%
% heatplot_loop2.m
% Kaysen Pajarillo 10/30/23
%
% Plots data for the six most populous cities in the USA

% Info that will be used in the loop
cities = {'NYC','LA','Chicago','Houston','Phoenix','Philadelphia'}; % the cities
vars = {'Temperature [degF]','Deaths'}; % names of vars to label y axes
ylim_min = [60,0]; % y axis minima corresponding to vars
ylim_max = [120,110]; % y axis maxima corresponding to vars
days = 1:31; % counter for days (7/1/1995-7/31/1995)

% Loop and plot!

for i = 1:length(cities) % Loop over cities
    
    % Load data
    city_data = load(['cities_data\' cities{i} '.txt']);

    for n = 1:length(vars) % Loop over variables (temp and deaths)
        
        % Initialize one figure for temperature and another for deaths
        if i == 1
            figure; % Creates new figure
        else
            figure(n); % If figure with handle n exists: brought to forefront, If it doesnt exist: creates a new one with that handle
        end
        
        % Set the subplot
        subplot(3, 2, i);
        
        % Plot data
        plot(days, city_data(:, n), 'ko-');
        
        % Label the plot
        xlabel('Days in July 1995');
        ylabel(vars{n});
        title(cities{i});
        
        % Set y-axis limits
        ylim([ylim_min(n) ylim_max(n)]);
    
    end

end % End loop