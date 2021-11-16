clc
clear all


%% 1 zadanie
Fs = 10000;

t = -5:1/Fs:5;

f_exp = exp(-t);
f_skok = skok(t);

figure(1)
plot(t, f_exp)
xlabel("Czas [s]")
ylabel("Amplituda")
title("Funkcja wykładnicza")
grid on

figure(2)
plot(t, f_skok)
xlabel("Czas [s]")
ylabel("Amplituda")
title("Skok jednostkowy")
grid on

% rozklad
parzyste =[];
nieparzyste =[];
for n =1:1:length(t)
    parzyste(n) = (skok(t(n))*exp(-t(n)) + skok(-t(n))*exp(t(n)))/2;
    nieparzyste(n) = (skok(t(n))*exp(-t(n)) - skok(-t(n))*exp(t(n)))/2;
end

figure(3)
subplot(3,1,1)
plot(t, f_exp.*f_skok)
xlabel("Czas [s]")
ylabel("Amplituda")
title("Funkcja")
grid on

subplot(3,1,2)
plot(t, parzyste)
title("parzyste")
ylabel("Amplituda")
title("Cześć parzysta")
grid on

subplot(3,1,3)
plot(t, nieparzyste)
title("nieparzyste")
ylabel("Amplituda")
title("Część nieparzysta")
grid on

%% 2 zadanie
A = 0.5;
f = 15;
t = 0:0.0001:1.5;
alfa = 5;

rzeczywista = cos(2*pi*f*t).*exp(-t*alfa);
urojona = sin(2*pi*f*t).*exp(-t*alfa);

zespolona = rzeczywista + i.*urojona;

rzeczywista = real(zespolona);
urojona = imag(zespolona);

figure(4)
plot3(t, rzeczywista, urojona)
title("Zesppolona funkcja harmoniczna")
xlabel("czas")
ylabel("Czesc rzeczysita")
zlabel("CZesc urojona")
grid on

%% 3 zadanie
Fs = 10000;
f = 1;
A = 0.5;
t = 0:1/Fs:3;

y1 = square_bipolar(A, f, t,5);
y2 = square_bipolar(A, f, t,50);
y3 = square_bipolar(A, f, t,100);

subplot_3(t, y1, y2, y3)
sgtitle("Prostokątny bipolarny")

y4 = square_unipolar(A, f, t,5);
y5 = square_unipolar(A, f, t,50);
y6 = square_unipolar(A, f, t,100);

subplot_3(t, y4, y5, y6)
sgtitle("Prostokątny unipolarny")

y7 = square_unipolar_filled(A, f, t, 5, 0.3);
y8 = square_unipolar_filled(A, f, t, 50, 0.3);
y9 = square_unipolar_filled(A, f, t, 100, 0.3);

subplot_3(t, y7, y8, y9)
sgtitle("Prostokątny unipolarny wypelniony")

y10 = triangle_bipolar_1(A, f, t,5);
y11 = triangle_bipolar_1(A, f, t,50);
y12 = triangle_bipolar_1(A, f, t,100);

subplot_3(t, y10, y11, y12)
sgtitle("Trójkątny bipolarny 1")

y13 = triangle_bipolar_2(A, f, t,5);
y14 = triangle_bipolar_2(A, f, t,50);
y15 = triangle_bipolar_2(A, f, t,100);

subplot_3(t, y13, y14, y15)
sgtitle("Trójkątny bipolarny 2")

y16 = triangle_unipolar_1(A, f, t,5);
y17 = triangle_unipolar_1(A, f, t,50);
y18 = triangle_unipolar_1(A, f, t,100);

subplot_3(t, y16, y17, y18)
sgtitle("Trójkątny unipolarny 1")

y19 = triangle_unipolar_2(A, f, t,5);
y20 = triangle_unipolar_2(A, f, t,50);
y21 = triangle_unipolar_2(A, f, t,100);

subplot_3(t, y19, y20, y21)
sgtitle("Trójkątny unipolarny 2")

y22 = sine_double(A, f, t, 5);
y23 = sine_double(A, f, t, 50);
y24 = sine_double(A, f, t, 100);

subplot_3(t, y22, y23, y24)
sgtitle("Sygnał sinusoidalny wyprostowany dwupołówkowo")

y25 = sine_single(A, f, t, 5);
y26 = sine_single(A, f, t, 50);
y27 = sine_single(A, f, t, 100);

subplot_3(t, y25, y26, y27)
sgtitle("Sygnał sinusoidalny wyprostowany jednopołówkowo")