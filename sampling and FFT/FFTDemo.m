%% This is a script for demoing the Fast Fourier Transfor (FFT)
close; clear; clc

Fs = 1000; %sampling rate
nyquist = Fs/2; %nyquist frequency is half the sampling rate
% f = 600; %cycles per second (Hz)
f1 = 20;
f2 = 30;
f3 = 40;
duration = 1.5; %length of signal in seconds 
Ts = 1/Fs; %duration between samples in seconds (sampling period)
t = 0:Ts:duration; %time axis 

x1 = 3 * cos(2 * pi * f1 * t + 0.2);
x2 = 1 * cos(2 * pi * f2 * t - 0.3);
x3 = 2 * cos(2 * pi * f3 * t + 2.4);

x = x1 + x2 + x3;

% x = sin(2 * pi * f * t); %sinusoidal wave
subplot(3, 1, 1)
plot(t, x)
xlim([0 0.1])
ylabel('amplitude')
xlabel('time (seconds)')
grid on

% Take fourier transform
X = fft(x);

% Get the absolute value (magnitude)
X_Mag = abs(X);

% Get the angle (phase)
X_phase = angle(X);

% bins with frequency components: 

subplot(3, 1, 2)
plot(X_Mag)
ylabel('energy')
xlabel('frequency (bins)')
grid on

N = length(X); %fft length
% Ft = 0:N-1/N*Fs; % vector 0-44100
% freqAxis = (0:N - 1)/Fs * N;

% Next, calculate the frequency axis, which is defined by the sampling rate
% basically saying we want fs number of equally spaces values between -1, 1
% but we're putting our nyquist frequency out in front in order to specify
% that we want Fs equally spaced values between -nyquist and + nyquist
f_axis = Fs/2 * linspace(-1 ,1, N);


%apply fftshift to put it in the form we are used to (see documentation)
X_Shift = fftshift(X_Mag);
subplot(3, 1, 3)
plot(f_axis, X_Shift/(N/2))
ylabel('amplitude')
xlabel('frequency (Hz)')
grid on
























