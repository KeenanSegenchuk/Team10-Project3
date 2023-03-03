function [signal] = highPupS(signal, f, d)
%LOWPASS & DOWNSAMPLE: lowpass signal at freq. f and downsample signal at downS rate d
F_s = length(signal) / 6;
[signal, a] = highpass(signal, f, F_s);
signal = upsample(signal, d);
end