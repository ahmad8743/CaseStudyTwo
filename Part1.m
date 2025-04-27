%% Names: Ahmad Hamzeh, Samir Afsary
%% Case Study Two Part One

%% Solving our differential equation 
clear; clc;
R = 1000; % 1000 ohms
C = 10^(-6); % 1 microfarad

% Differential equation as layed out in the paper
dq = @(t, q) (5 - 1 / C * q) / R;

% Solve differential equation numerically
tspan = [0 0.05];
q0 = 0;
[t1, sol] = ode15s(dq, tspan, q0); % Use ode15s for stiff equation

% Analytical solution for the DE
t2 = linspace(0, 0.05, 100);
ansol = 5 * C * (1 - exp(-t2 /(R * C)));

% Plot findings
% Numerical solution
figure(1);
subplot(1, 2, 1);
plot(t1, sol, 'LineWidth', 2);
ylim([0, 5 * C + 10^(-7)]);
title('Numerical solution');
axis square;

% Analytical solution
subplot(1, 2, 2);
plot(t2, ansol, 'LineWidth', 2);
ylim([0, 5 * C + 10^(-7)]);
title('Analytical solution');
axis square;
exportgraphics(gcf, 'Part1Plots/solcomp.png');

%% Comparing changes in time constant
clear; clc;
R = 1000; % 1000 ohms
C = 10^(-6); % 1 microfarad

tau1 = R * C; % our original time constant
% Change original by factor of 10 in each way
tau2 = tau1 * 10;
tau3 = tau1 / 10;

% Solve for each tau
% For simplicity, we will assume that capacitance isn't change and that the
% resistance of the circuit is being modified
t = linspace(0, 0.05, 100);
sol1 = 5 * C * (1 - exp(-t /(tau1)));
sol2 = 5 * C * (1 - exp(-t /(tau2)));
sol3 = 5 * C * (1 - exp(-t /(tau3)));

% Plot the solutions on the same graph to highlight differences
figure(2);
plot(t, sol1, 'LineWidth', 2);
hold on;
plot(t, sol2, 'LineWidth', 2);
hold on;
plot(t, sol3, 'LineWidth', 2);
hold on;
title('Graph of charge with varying time constants');
legend({'Original', 'Scale up by 10', 'Scale down by 10'});
exportgraphics(gcf, 'Part1Plots/tau.png');

%% Plotting amplitude as a function of frequency
clear; clc;
R = 1000; % 1000 ohms
C = 10^(-6); % 1 microfarad

% For the capacitor
w = linspace(50, 1000, 1000); % As specified in the directions
sol_cap = 5 ./ sqrt(1 + (2 * pi * w * R * C).^2);

% For the resistor
sol_res = (10 * pi * w * R * C) ./ sqrt(1 + (2 * pi * w * R * C).^2);

% Plot findings for both
figure(3);
plot(w, sol_cap, 'LineWidth', 2);
title('Graph of amplitude as a function of frequency (Capacitor)');
exportgraphics(gcf, 'Part1Plots/freq_c.png');

figure(4);
plot(w, sol_res, 'LineWidth', 2);
title('Graph of amplitude as a function of frequency (Resistor)');
exportgraphics(gcf, 'Part1Plots/freq_r.png');