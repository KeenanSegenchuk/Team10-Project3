function[F_s] = spectrograph2(signal, F_s, yl, str)
window = hamming(512);
N_overlap = 256;
N_fft = 1024;
[S,F,T,P] = spectrogram(signal, window, N_overlap, N_fft, F_s, "yaxis");
figure;
surf(T, F, 10*log10(P),"edgecolor","none");
axis tight;
view(0,90);
colormap(jet);
set(gca, "clim", [-80, -20]);
ylim(yl); xlim([1 6]);
xlabel('Time (s)'); ylabel("Frequency (Hz)");
title(str);
end