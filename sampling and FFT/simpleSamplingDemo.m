%% This is a sampling script
close, clc

%% signal generation

duration = 10; 
dt = 0.0001; %time step (how often we compute a sample)
t = 0:dt:duration; %x-axis (time)
f = 500; %frequency
x_t = sin(2 * pi * f * t); %continuous time sinusoid


% plotting code
subplot(3, 1, 1) % subplot 1
plot(t ,x_t, 'linewidth',1.5)
xlim([0 0.01]) % limit the x-axis
title('Continuous Time Sinusoid x(t) (500Hz)')
legend('x(t)')
grid on
% hold on

%% sampling

Fs = 600; % sampling frequency 
Ts = 1/Fs; % sampling period
n = 0:Ts:10; % x-axis (samples)
x_n = sin(2 * pi * f * n); % discrete time sinusoid

% plotted 
subplot(3, 1, 2) % subplot 2
plot(t ,x_t, 'linewidth',1.5)
hold on
stem(n, x_n, 'g', 'linewidth',1.5) % for 'discrete' 
hold off
grid on
legend('x(t)', 'x[n]')
xlim([0 0.01]) % limit the x-axis 
% sound(x_n)

%% reconstruction

t_r = linspace(0, max(n), (max(n)/dt)); %x-axis (reconstructed time axis)
y_t = interp1(n, x_n, t_r, "spline"); %reconstructed continous time sinusoid

%plotting code
subplot(3, 1, 3) % subplot 3
plot(t_r, y_t,'r','linewidth',1.5) 
grid on
xlim([0 0.01]) %limit x-axis
% sound(x_n)

%% Add FFT Code here to verify 
