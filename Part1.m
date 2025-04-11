% Names: Ahmad Hamzeh, Samir Afsary
% Case Study Two Part One

R = 1000; % 1000 ohms
C = 10^(-6); % 1 microfarad

% Differential equation as layed out in the paper
dq = @(t, q) (5 - 1 / C * q) / R;

% Solve
tspan = [0 0.5];
q0 = 0;
[t, sol] = ode45(dq, tspan, q0);

figure(1);
plot(t, sol);