function [signal] = lowPdownS(signal, f, d)
%LOWPASS & DOWNSAMPLE: lowpass signal at freq. f and downsample signal at downS rate d
F_s = length(signal) / 6;
[signal, a] = lowpass(signal, f, F_s);
signal = decimate(signal, d, 'fir');
end