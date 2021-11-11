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
title("Mnożenie")
grid on

subplot(3,1,2)
plot(t, parzyste)
title("parzyste")
ylabel("Amplituda")
title("Mnożenie")
grid on

subplot(3,1,3)
plot(t, nieparzyste)
title("nieparzyste")
ylabel("Amplituda")
title("Mnożenie")
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