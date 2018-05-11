% define coeffcient matrices of differential equation
b = [0 0 0 121868727358.1180];
a = [1 6209.9310 48890434.5196 121868727358.1180];

%use indicated function to calculate response
[h,w] = freqs(b,a);

%plot response, magnitude and phase to ensure its a low pass filter
% where low frequency signals are amplified and high frequency
% are attenuated
figure(8);
subplot(3,1,1);
plot(w,abs(h));
title('Magnitude of H');
xlabel('rad/sec');
subplot(3,1,2);
plot(w,angle(h));
title('Phase of H')
xlabel('rad/sec');
subplot(3,1,3);
plot(w,h);
title('Plot of H')