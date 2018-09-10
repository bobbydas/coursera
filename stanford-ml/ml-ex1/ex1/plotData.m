function plotData(x, y)
%PLOTDATA Plots the data points x and y into a new figure
%   PLOTDATA(x,y) plots the data points and gives the figure axes labels of
%   population and profit.

figure; % open a new figure window

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the training data into a figure using the
%               "figure" and "plot" commands. Set the axes labels using
%               the "xlabel" and "ylabel" commands. Assume the
%               population and revenue data have been passed in
%               as the x and y arguments of this function.
%
% Hint: You can use the 'rx' option with plot to have the markers
%       appear as red crosses. Furthermore, you can make the
%       markers larger by using plot(..., 'rx', 'MarkerSize', 10);

% Plotting the data, seeting marker size, color and type
plot(x,y,'rx', 'MarkerSize', 10);

% Setting x and y labels
ylabel ('Profit in $10,000s');
xlabel ('Population in 10,000s');

% Define axis limits and aspect ratio
axis([4,24, -5,25], 'square');

% Set x-axis ticks at intervals of 2
set(gca,'XTick',4:2:24);



% ============================================================

end
