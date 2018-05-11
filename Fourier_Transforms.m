%define the function parameters
dt=0.05;
t=0:dt:10;
wo=5;
x=sinc((wo/pi)*(t-5))*(wo/pi);


Xw=fft(x,max(1001,length(x)))*dt; % minimum of 1001 values computed,
% to provide impression of continuous transform

Xw =fftshift(Xw);
Nfft=length(Xw);    %number of samples
k=-(Nfft-1)/2:1:(Nfft-1)/2; % with Nfft assumed odd here in this code
w=k*2*pi/Nfft/dt; %configuring scale in rad/sec


%plotting phase and magnitude
figure(1)
subplot(2,1,1)
plot(w,abs(Xw));
title('Magnitude of Fourier Transform')
xlabel('rad/sec')

subplot(2,1,2)
plot(w,angle(Xw));
title('Phase of Fourier Transform')
xlabel('rad/sec')