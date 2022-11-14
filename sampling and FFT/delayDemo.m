% This is a script for applying a simple delay effect
clear; close; clc

[x,Fs] = audioread('guitar.aiff');
x = x(:,1); %make signal mono

%delay time 

delayInSeconds = 0.25;

delayInSamples = delayInSeconds * Fs;

%making sure our signals are the same length

zeroPadding = zeros(delayInSamples, 1);
originalSignal = [x ; zeroPadding]; %88200 signal + 44100 zeros
delayedSignal = [zeroPadding ; x]; %44100 zeros + 88200 signal


y = zeros(size(originalSignal));

% for n = 1:length(originalSignal)
%     y(n,1) = originalSignal(n,1) + 0.5 * delayedSignal(n,1);
% end

% sound(x, Fs)
% sound(y, Fs)

for n = 1:length(x)
    if (n-delayInSamples) < 1
        y(n,1) = x(n,1);
    else
        y(n,1) = x(n,1) + 0.5 * x(n-delayInSamples,1);
    end
end


% sound(x, Fs)
% sound(y, Fs)