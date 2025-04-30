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

% Resistance and capacitance of low pass filter
% Cutoff: say 6000Hz
R1 = 1;
C1 = 8 * 10^(-5);

lowPassScale = 1 ./ sqrt(1 + (2 * pi * R2 * C2 * F).^2);
lowSpectral = lowPassScale.^2 .* spectral;

FcL = 1 / (2 * pi * R1 * C1); % cutoff frequency
lowFilteredAudio = lowpass(Vsound, FcL, Fs);
%playSound(lowFilteredAudio, Fs);

% Resistance and capacitance of high pass filter (to get rid of 60 Hz hum)
R2 = 16;
C2 = 1.5 * 10^(-4);

highPassScale = (2 * pi * R2 * C2 * F) ...
    ./ sqrt(1 + (2 * pi * R2 * C2 * F).^2);
highSpectral = highPassScale.^2 .* lowSpectral;

FcH = 1 / (2 * pi * R2 * C2); % cutoff frequency
filteredAudio = highpass(lowFilteredAudio, FcH, Fs);
playSound(filteredAudio, Fs)

figure(2);
plot(F, 10 * log10(highSpectral)); % We scale to put into decibel scale
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')
title('High Power Spectral Density')
xlim([-500 2.25*10^4]);
grid on
%exportgraphics(gcf, 'Part2Plots/spectral.png');

