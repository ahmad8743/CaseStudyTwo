%% Names: Ahmad Hamzeh, Samir Afsary
%% Case Study Two Part Two
%% Spectral Graphing

load noisyhandel.mat
%playSound(Vsound,Fs)

% Use pwelch to estimate power spectral density of our signal
[spectral, F] = pwelch(Vsound, [], [], [], Fs);

% Plot the graph
figure(1);
plot(F, 10 * log10(spectral)); % We scale to put into decibel scale
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')
title('Original Power Spectral Density')
xlim([-500 2.25*10^4]);
grid on
exportgraphics(gcf, 'Part2Plots/spectral.png');