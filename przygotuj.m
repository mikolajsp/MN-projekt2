function [z] = przygotuj(C,wolne)
%funkcja rozbija macierz o wyrazach zespolonych na części rzeczywiste i
% urojone, przekazuje je do metod rozwiązujących układ równań metodą
% opisaną w treści zadania
% C - kwadratowa macierz układu równań o wyrazach zespolonych
% wolne - wektor wyrazów wolnych o wyrazach zespolonych
% [z] - wektor będący rozwiązaniem układu równań

% ustalenie rozmiaru macierzy 
n =size(C,1);

% podział C na części rzeczywistą i urojoną
A = real(C);
B = imag(C);

% podział wyrazów wolnych na części rzeczywistą i urojoną
a = real(wolne);
b = imag(wolne);

% przygotowanie macierzy blokowych z treści zadania
M = [A -B; B A];
p = [a;b];

% sprowadzenie macierzy układu do postaci trójkątnej górnej za pomocą gepp
[s,t] = gepp(M, p);
% rozwiązanie powstałego układu równań
rozw = rozwiazTrojkatnaGorna(s,t);
% odzyskanie komponentów rzeczywistego i urojonego z rozwiązania
x = rozw(1:n);
y = rozw((n+1):2*n);

% sprowadzienie z powrotem do postaci zespolonej
z = x + 1i*y;

end

