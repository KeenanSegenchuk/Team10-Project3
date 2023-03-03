function [signal] = highPdownS(signal, f, d)
%HIGHPASS & DOWNSAMPLE: highpass signal at freq. f and downsample signal at downS rate d
F_s = length(signal) / 6;
[signal, a] = highpass(signal, f, F_s);
signal = decimate(signal, d, 'fir');
end