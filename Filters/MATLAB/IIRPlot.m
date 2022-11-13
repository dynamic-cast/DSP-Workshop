% Various Plots for IIR Filtering
% h[n] = y[n]/x[n]

clc;
clear all;
num = [1 0];    % a -> coefficients of y[n] Changeable to see what happens
den = [1 -1];   % b -> coefficients of x[n] Changeable to see what happens

figure(1)
subplot(1,3,1)
zplane(num,den)          % Z plane plot of h(n)
title('Pole Zero Plot')

w = 0:pi/32:pi;          % Omega Frequency (Changeable)
[h,w]=freqz(num,den,w);  % Freqz = frequency response
mag=abs(h);              % Absolute Value for magnitude
phase=angle(h);

subplot(1,3,2)
plot(w/pi,mag)
title('Magnitude Plot for IIR LPF')

subplot(1,3,3)
plot(w/pi,phase)
title('Phase Plot for IIR LPF')