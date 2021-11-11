clc
clear all


%% Monoharmoniczny
f1 = 15;
f2 = 100;
A = 1;
B = 0.5;
t = 0:0.0001:1;

Fs = 10000;

y1 = A*sin(2*f1*pi*t);

%% Wykladniczo malejacy
X0 = 10;
alfa = 1;

y3 = ones(1, length(y1))

while abs(y3(500)) > 0.001 % warunek na wygluszenie po 0,5 sekundy - zrobic jeszce wygluszenie po 1 okresie - chyba ppo 0,1 sekundy - n = 100
    y2 = wykladniczy_malejacy(t, X0, alfa);

    %% Harmoniczny malejacy
    y3 = y1.*y2;
    alfa = alfa +1;
end

%% Sygnał zmodulowany
fi = 0;
y4 = B*sin(2*f2*pi*t + fi);
y5 = y1.*y4;

% pobawic sie czestotliwosciami i amplitudami - wypelnienie musi miec
% wiecej niz 20hz aby bylo slyszalne

% funkcja soundplaty
% sound lub play

%% parametry
srednia(t, y1)
energia(y1)
moc(t, y1)

%% Rysunki
figure(1)
plot(t, y1)
title("Sygnał monoharmoniczny")
xlabel("Czas [s]")
ylabel("Amplituda")
grid on

figure(2)
plot(t, y2)
title("Sygnał wykładniczy  malejący")
xlabel("Czas [s]")
ylabel("Amplituda")
grid on

figure(3)
plot(t, y3)
title("Sygnał sinusoidalny malejący wykładniczo")
xlabel("Czas [s]")
ylabel("Amplituda")
grid on

figure(4)
plot(t, y5)
title("Sygnał modulowany")
xlabel("Czas [s]")
ylabel("Amplituda")
grid on