%(1) reading and listening Audio1_LP.wav
% and plotting FT
Fs = 16000;
dt = 1/16000;
[x,Fs] = audioread('Audio1_LP.wav');
t = 0:dt:(length(x)*dt)-dt;

Xw=fft(x); % minimum of 1001 values computed,
% to provide impression of continuous transform
Xw =fftshift(Xw);
Nfft=length(Xw);
k=-(Nfft-1)/2:1:(Nfft-1)/2; % with Nfft assumed odd here in this code
w=k*2*pi/Nfft/dt;
figure(1);
subplot(3,1,1);
plot(w,abs(Xw));
title('Magnitude of X(jw)');
xlabel('rad/sec');
subplot(3,1,2);
plot(w,angle(Xw));
title('Phase of X(jw)')
xlabel('rad/sec');
subplot(3,1,3);
plot(w,Xw);
title('Fourier transform, X(jw)');
xlabel('rad/sec');
%__________________________________________%


%(2) AM modulation (multiplying x(t) with
%carrier with freq 4kHz, modulated signal
% is y(t), plotting its FT

w0 = 2*pi*4000;
mod = sin(w0*t);
y = mod'.*x;
Yw=fft(y); % minimum of 1001 values computed,
% to provide impression of continuous transform
Yw =fftshift(Yw);
Nfft=length(Yw);
k=-(Nfft-1)/2:1:(Nfft-1)/2; % with Nfft assumed odd here in this code
w=k*2*pi/Nfft/dt;
figure(2);
subplot(3,1,1);
plot(w,abs(Yw));
title('Magnitude of Y(jw)');
xlabel('rad/sec');
subplot(3,1,2);
plot(w,angle(Yw));
title('Phase of Y(jw)')
xlabel('rad/sec');
subplot(3,1,3);
plot(w,Yw);
title('Fourier transform, Y(jw)');
xlabel('rad/sec');

%_____________________________________________%


%(3)coherent demodulation, mutiplying modulated
%signal y(t) with same carrier signal, 4kHz and
%applying low pass filter
xmod2 = y'.*mod;
b = [0 0 0 121868727358.1180];
a = [1 6209.9310 48890434.5196 121868727358.1180];
z = lsim(b,a,xmod2,t);
Zw=fft(z); % minimum of 1001 values computed,
% to provide impression of continuous transform
Zw =fftshift(Zw);
Nfft=length(Zw);
k=-(Nfft-1)/2:1:(Nfft-1)/2; % with Nfft assumed odd here in this code
w=k*2*pi/Nfft/dt;
figure(3);
subplot(3,1,1);
plot(w,abs(Zw));
title('Magnitude of Z(jw)');
xlabel('rad./sec.');
subplot(3,1,2);
plot(w,angle(Zw));
title('Phase of Z(jw)')
xlabel('rad./sec.');
subplot(3,1,3);
plot(w,Zw);
title('Fourier transform, Z(jw)');
xlabel('rad./sec.');


%_______________________%

%comparing x(t) and z(t)



figure;
subplot(2,1,1);
plot(t,x);
title('Input Signal in Time Domain');
xlabel('t');
ylabel('x(t)');
subplot(2,1,2);
plot(t,z);
title('Demodulated Signal in Time Domain');
xlabel('t');
ylabel('z(t)');