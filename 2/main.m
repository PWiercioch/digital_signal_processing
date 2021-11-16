clc 
clear all

format long e

t = 0:0.001:1;

f1 = 100;
f2 = 200;

A = 1;
B = 0.5;

square = generator([-1:0.001:1], 100, 200, 1, 0.5);

square_impulse(square, square.t);
show_plot(square, "Impuls prostokątny");

triangle = generator([-1:0.001:1], 100, 200, 1, 0.5);

triangle_impulse(triangle);
show_plot(triangle, "Impuls trójkątny");

cosinuo = generator([-1:0.001:1], 1, 200, 1, 0.5);

square2 = generator([-1:0.001:1], 1, 200, 1, 0.5);
square_impulse(square2, square2.t/(pi/(pi*2*square2.f1)));

cosinusoidal_impulse(cosinuo, square2.y);
show_plot(cosinuo, "Impuls kosinusoidalny");

sinus = A * sin(2*pi*f1*t);
kosinus = B * cos(2*pi*f2*t);

file = fopen('plik_tekstowy.txt', 'w');
fprintf(file, '%12.4f %12.4f %12.4f\n', [t, sinus, kosinus]);
fclose('all');

clear file;

file = fopen('plik_tekstowy.txt', 'r');
odczyt = fscanf(file, '%g', [length(t),3]);
fclose('all');

clear file;

% drugi zapis - 24 miejsca po przecinku
% wyplotowac bledy na subplocie

file = fopen('plik_tekstowy2.txt', 'w');
fprintf(file, '%12.24f %12.24f %12.24f\n', [t, sinus, kosinus]);
fclose('all');

clear file;

file = fopen('plik_tekstowy2.txt', 'r');
odczyt2 = fscanf(file, '%g', [length(t),3]);
fclose('all');

clear file;

figure()
subplot(3,1,1)
plot(t, t-odczyt(:,1)')
title("czas")
grid on
subplot(3,1,2)
title("sinus")
grid on
plot(t, sinus-odczyt(:,2)')
subplot(3,1,3)
title("kosinus")
grid on
plot(t, kosinus-odczyt(:,3)')
sgtitle("Mniejsza dokladnosc")

figure()
subplot(3,1,1)
plot(t, t-odczyt2(:,1)')
title("czas")
grid on
subplot(3,1,2)
title("sinus")
grid on
plot(t, sinus-odczyt2(:,2)')
subplot(3,1,3)
title("kosinus")
grid on
plot(t, kosinus-odczyt2(:,3)')
sgtitle("Większa dokladnosc")
