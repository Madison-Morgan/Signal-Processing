clear x fs

%store audio file into x, with samling rate of FS
Fs=16000;
[x,fs] = audioread('noisy_audio.wav');

%use ellip function to return the transfer function
% coeffcients of a 8th-order lowpass filter
% normalized passband edge freqeuncy Wp
% filter has 1 db peak-to-peak passband ripple and
% 100 db of stopband attenuation down from the peak
%passband value
w1 = 1.7/pi; w2 = 2.4/pi; Wp = [w1 w2];
[b,a] = ellip(8,1,100,Wp,'stop');


% we then filter x (audio signal) with the produced transfer
% function/filter
y = filter(b,a,x);

%next we perform a fourier transform on y and plot the
% magnitude of the transform (frequency content of noisy
% audio signal- partially filtered)
Xw=fft(y,max(1001,length(y)));
Xw=fftshift(Xw);
Nfft=length(Xw);
k=-(Nfft-1)/2:1:(Nfft-1)/2;
w=k*2*pi/Nfft;
figure(1)
subplot(2,1,1)
plot(w,20*log(abs(Xw)));
title('Magnitude Fourier Transform')
xlabel('rad./sample')

%We also plot the angle of the Fourier transform
subplot(2,1,2)
plot(w,angle(Xw));
title('Phase Fourier Transf.')
xlabel('rad./sample')

%%%%%%%%%%%%%%%%%%%%%%%%%%%--------------------------


%here we continue producing a transfer function
% to filter the audio signal and eliminate
% the portions of noise
w3 = 0.18/pi; w4 = 0.28/pi; Wp2 = [w3 w4];
[b1,a1] = ellip(6,1,100,Wp2,'stop');
z = filter(b1,a1,y);

%We perform a Fourier Transform on the filtered signal
% and plot the magnitude (frequency content)
Xw=fft(z,max(1001,length(z)));
Xw=fftshift(Xw);
Nfft=length(Xw);
k=-(Nfft-1)/2:1:(Nfft-1)/2;
w=k*2*pi/Nfft;
figure(1)
subplot(2,1,1)
plot(w,20*log(abs(Xw)));
title('Magnitude Fourier Transform')
xlabel('rad./sample')

%We also plot the phase of the Fourier Transform
subplot(2,1,2)
plot(w,angle(Xw));
title('Phase Fourier Transform')
xlabel('rad./sample')
