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

y3 = 10*ones(1, length(y1))

while abs(y3(500)) > 5 % warunek na wygluszenie po 0,5 sekundy
    y2 = wykladniczy_malejacy(t, X0, alfa);

    y3 = y1.*y2;
    alfa = alfa +1;
end

%% Sygnał zmodulowany
fi = 0;
y4 = B*sin(2*f2*pi*t + fi);
y5 = y1.*y4;

%% Sygnał sinc
t2 = -1:0.0001:1;
for n=1:1:length(t2)
    if t2(n)~=0
        y4(n)=A.*sin(2*pi*f1*t2(n))./(2*pi*f1*t2(n));
    else
        y4(n)=1;
    end
end
figure(5)
plot(t2,y4)
title('Sygnał sinc')
ylabel('Amplituda')
xlabel('Czas [s]')
grid on

%% parametry
mean1 = srednia(t, y1);
en1 = energia(y1);
min1 = minimum(y1);
max1 = maksimum(y1);

mean2 = srednia(t, y2);
en2 = energia(y2);
min2 = minimum(y2);
max2 = maksimum(y2);

mean3 = srednia(t, y3);
en3 = energia(y3);
min3 = minimum(y3);
max3 = maksimum(y3);

mean4 = srednia(t, y4);
en4 = energia(y4);
min4 = minimum(y4);
max4 = maksimum(y4);

mean5 = srednia(t, y5);
en5 = energia(y5);
min5 = minimum(y5);
max5 = maksimum(y5);

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

%% zapis do pliku
min_all=[min1;min2;min3;min4;min5];
max_all=[max1;max2;max3;max4;max5];
sred=[mean1;mean2;mean3;mean4;mean5];
ene=[en1;en2;en3;en4;en5];

wyniki=horzcat(min_all,max_all,sred,ene);
zapis = fopen('wyniki.txt', 'w');
fprintf(zapis, '%12.12f %12.12f %12.12f %12.12f %12.12f\n', wyniki);
fclose('all');

%% roznice
e_min=[min1-min(y1);min2-min(y2);min3-min(y3);min4-min(y4);min5-min(y5)];
e_max=[max1-max(y1);max2-max(y2);max3-max(y3);max4-max(y4);max5-max(y5)];
e_srednia=[mean1-mean(y1);mean2-mean(y2);mean3-mean(y3);mean4-mean(y4);mean5-mean(y5)];
