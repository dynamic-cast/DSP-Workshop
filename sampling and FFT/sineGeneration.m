%% This is a sine wave generation script

%Generate a sine wave using a MATLAB function

Fs = 44100; %sampling rate
f = 3; %frequency (Hz)
Ts = 1/Fs; 
t = 0:Ts:1;

sineWave = sin(2 * pi * f * t); %sine wave 
subplot(2, 1, 1) %subplot 1
plot(t, sineWave, 'linewidth', 2)
title('Sine Wave (MATLAB Function)')
grid on


%% Generate a sine wave sample by sample

y = zeros(1, 44100);

for n = 1:Fs + 1
    %we require a new sample every 1/Fs seconds
    %that's every 0.00002267573 seconds
    y(n) = sin(2 * pi * n * f/Fs);
end

figure(2)
subplot(2, 1, 2)
plot(t,y, 'r', 'linewidth', 2)
title('Sine Wave (sample by sample)')
grid on
