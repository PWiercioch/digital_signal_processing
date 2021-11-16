clc
clear all

%% Splot
x = [0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0];
y = [1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1];

splot_emb = conv(x, y);

my_splot = my_convolution(x, y);

figure()
plot(my_splot);
title("Splot")
xlabel("Czas")
ylabel("Amplituda")
grid on

figure()
plot(my_splot-splot_emb)
title("Roznica miedzy splotem napisanym a wbudowanym")
xlabel("Czas")
ylabel("Amplituda")
grid on


mi = 1; 
xs = 0; 
n = 1000;
x = xs + mi*randn(n,1); 

figure()
plot(x)
ylabel('Amplituda')
title('Rozkład normalny');
grid on

a = 0;
b = 1;
n = 1000;
x_1 = a + (b-a)* rand(n,1);

figure()
plot(x_1)
ylabel('Amplituda')
title('Rozkład równomierny');
grid on


min_x=min(x);
min_x_1=min(x_1);
max_x=max(x);
max_x_1=max(x_1);
mean_x=mean(x);
mean_x_1=mean(x_1);
var_x=var(x);
var_x_1=var(x_1);
std_x=std(x);
std_x_1=std(x_1);
energia_x=0;
energia_x_1=0;

for n=1:1:length(x)
    energia_x=energia_x+(x(n)).^2;
end

for n=1:1:length(x)
    energia_x_1=energia_x_1+(x_1(n)).^2;
end

moc_x=0;
for n=1:1:length(x)
    moc_x=moc_x+(1/(length(x)).*(x(n)^2));
end

moc_x_1=0;
for n=1:1:length(x)
    moc_x_1=moc_x_1+(1/(length(x)).*(x_1(n)^2));
end

kx=0; m=1;
for n=1:1:length(x)
    kx=kx +(n^m).*x(n);
end

kx_1=0;
m=1;
for n=1:1:length(x_1)
    kx_1=kx_1 +(n^m).*x_1(n);
end

sigmax=0; m=1;
for n=1:1:length(x)
    sigmax=sigmax +((n-kx)^2).*x(n);
end

sigmax_1=0;
m=1;
for n=1:1:length(x_1)
    sigmax_1=sigmax_1 +((n-kx_1)^2).*x_1(n);
end
