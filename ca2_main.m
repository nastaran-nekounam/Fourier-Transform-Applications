[a4sound,a4Fs] = audioread('\Data\Instrumental\a4.wav');
[b4sound,b4Fs] = audioread('\Data\Instrumental\b4.wav');
[c4sound,c4Fs] = audioread('\Data\Instrumental\c4.wav');
[d4sound,d4Fs] = audioread('\Data\Instrumental\d4.wav');
[e4sound,e4Fs] = audioread('\Data\Instrumental\e4.wav');
[f4sound,f4Fs] = audioread('\Data\Instrumental\f4.wav');
[g4sound,g4Fs] = audioread('\Data\Instrumental\g4.wav');
% sound(a4sound,a4Fs);
% sound(b4sound,b4Fs);
% sound(c4sound,c4Fs);
% sound(d4sound,d4Fs);
figure
 spectrogram(a4sound,1024,32,4096,'yaxis')
figure
 spectrogram(d4sound,2048,512,4096,'yaxis')

load('rec_2m.mat');
Fs = 500;
t = (0:(length(val)-1))/Fs
f = (-length(val)/2:length(val)/2-1)*Fs/length(val)
figure

plot(t,val)
xlabel('time')
ylabel('ECG data of person_1')
xlim([0,2])


ECG_f=fftshift(fft(val))
figure

plot(f,real(ECG_f))
%  xlim([-5,5])

xlabel('frequency(Hz)')
ylabel('amplitude of FT')
myfilt = ((51 < abs(f)) | (abs(f) < 50))&(abs(f) > 2) &(abs(f) < 35);
ECG_f = ECG_f.*myfilt;
output2 = real(ifft(ifftshift(ECG_f)));
figure
plot(t,output2)
 xlim([0,2])

xlabel('time')
ylabel('ECG data of person_1')

















