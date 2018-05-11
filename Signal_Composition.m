T = 2;
omega0 = (2*pi/T);
t = -4:0.001:4;
a0= 0.5;
x_approx = a0;
N_a = 7;
x_approx1 = x_approx;
for k=1:((N_a - 1)/2)
 a_k1 = ( (2*sin(k*(pi/2))) / (j*((k*pi)^2))) * exp(-j*k*pi/2);
 x_approx1 = x_approx1 + abs(a_k1)*cos(k*omega0.*t+angle(a_k1));
end
subplot(3,1,1);
plot(t,2*x_approx1),grid;
xlabel('t (s)');
ylabel('x(t)');
title('Plot of a Triangular signal with Na = 7');

N_a = 21;
x_approx1 = x_approx;
for k=1:((N_a - 1)/2)
 a_k1 = ((2*sin(k*(pi/2)))/(j*((k*pi)^2))) * exp(-j*k*pi/2);
 x_approx1 = x_approx1 + abs(a_k1)*cos(k*omega0.*t+angle(a_k1));
end
subplot(3,1,2);
plot(t,2*x_approx1),grid;
xlabel('t (s)');
ylabel('x(t)');
title('Plot of a Triangular signal with Na = 21');

N_a = 201;
x_approx1 = x_approx;
for k=1:((N_a - 1)/2)
 a_k1 = ((2*sin(k*(pi/2)))/(j*((k*pi)^2))) * exp(-j*k*pi/2);
 x_approx1 = x_approx1 + abs(a_k1)*cos(k*omega0.*t+angle(a_k1));
end
subplot(3,1,3);
plot(t,2*x_approx1),grid;
xlabel('t (s)');
ylabel('x(t)');
title('Triangular signal with Na = 201');