% Calculates the volumes of Earth's layers and the percentage volume each layer occupies
% 
% earthLayers.m
% Written by Kaysen Pajarillo
% 10/23/2023
%
%------------------------------------

% thicknesses of Earth's layers in km
crust = 35;
mantle = 2850;
core = 3486;

% Radii of each layer
radiusCrust = crust;
radiusMantle = crust + mantle;
radiusCore = crust + mantle + core;

% Calculate volume of each layer using previous volSphere function
volCore = volSphere(radiusCore) - volSphere(radiusMantle);
volMantle = volSphere(radiusMantle) - volSphere(radiusCrust);
volCrust = volSphere(radiusCrust);

% Earth's total volume
totalVol = volSphere(radiusCore);

% Calculate percent of Earth's total volume each layer occupies
pctVolCore = (volCore/totalVol) * 100;
pctVolMantle = (volMantle/totalVol) * 100;
pctVolCrust = (volCrust/totalVol) * 100;

% Print the volumes and percentages
fprintf('Volume of Core: %.2e km^3\n', volCore);
fprintf('Volume of Mantle: %.2e km^3\n', volMantle);
fprintf('Volume of Crust: %.2e km^3\n', volCrust);
fprintf('Core: %.1f%%\n', pctVolCore);
fprintf('Mantle: %.1f%%\n', pctVolMantle);
fprintf('Crust: %.1f%%\n', pctVolCrust);

% New fig window
figure;

%Use colormap called "summer"
colormap('summer');

% Explode out each layer, so they are easy to see
explode = [1 1 1];

% Make pie chart
p = pie([pctVolCrust, pctVolMantle, pctVolCore], explode);

% Identify text objects
pText = findobj(p,'Type','text');

% Define layer names
layerNames = {'Crust: ', 'Mantle: ', 'Core: '};

% Display text and percent as one label
for k = 1:length(pText)
    pText(k).String = [layerNames{k}, pText(k).String];
end