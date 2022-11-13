% Basic butterworth filter example
% Uses a built in IIR filter

[dataIn, Fs] = audioread('Lo-Fi-Demo.mp3');     % Read an audio file

% Filter the signal
fc = 800; % Make higher to hear higher frequencies.

% Design a Butterworth filter.
[b, a] = butter(6,fc/(Fs/2));
freqz(b,a)

% Apply the Butterworth filter.
filteredSignal = filter(b, a, dataIn);

% Play the sound.
player = audioplayer(filteredSignal, Fs);
play(player);