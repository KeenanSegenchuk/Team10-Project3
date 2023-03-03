%project3
signal = audioread("p2mono.wav");

%f of lowpass filter
f_l = 4000;

%downsample factor
d_f = 2; 

lpdsS = lowPdownS(signal, f_l, d_f);



spectrograph(signal, 44100, "original signal");
spectrograph(lpdsS, F(lpdsS), "lowpass-downsampled by f_l=" + f_l + " d_f=" + d_f);

%speech = lowPdownS(signal, f_l, 1);

f_l = f_l / d_f;

hpdsS1 = highPdownS(lpdsS, f_l, d_f);
lpdsS1 = lowPdownS(lpdsS, f_l, d_f);


spectrograph2(lpdsS1, F(lpdsS1), [0, 5500], "1st order low f decomp");
spectrograph2(hpdsS1, F(hpdsS1), [0, 5500], "1st order high f decomp");

hphp = highPdownS(hpdsS1, f_l, d_f);
hplp = lowPdownS(hpdsS1, f_l, d_f);

f_l = f_l / d_f;

lphp = highPdownS(lpdsS1, f_l, d_f);
lplp = lowPdownS(lpdsS1, f_l, d_f);

spectrograph2(hphp, F(hphp), [0, 2750], "(2nd order) hphp decomp");
spectrograph2(hplp, F(hplp), [0, 2750], "(2nd order) hplp decomp");
spectrograph2(lphp, F(lphp), [0, 2750], "(2nd order) lphp decomp");
spectrograph2(lplp, F(lplp), [0, 2750], "(2nd order) lplp decomp");

lp2 = lowPupS(lplp, f_l, d_f);
hp2 = highPupS(lphp, f_l, d_f);

f_l = f_l * d_f;

lp1 = lowPupS(hplp, f_l, d_f);
hp1 = highPupS(hphp, f_l, d_f);

hp = hp1 + lp1;
lp = hp2 + lp2;

lp1 = lowPupS(lp, f_l, d_f);

f_l = f_l * d_f;

hp1 = highPupS(hp, f_l, d_f);

speech = hp1 + lp1;


speech = lowPupS(speech, f_l, d_f);

spectrograph(speech, F(speech), "reconstructed 2nd order decomp");
ap = audioplayer(speech, F(speech));
play(ap);
audiowrite("team10-synthesized.wav", speech, floor(F(speech)));


function f_d = F(x)
    f_d = length(x)/6;
end