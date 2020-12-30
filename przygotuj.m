function [z] = przygotuj(C,wolne)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

n =size(C,1);

A = real(C);
B = imag(C);

a = real(wolne);
b = imag(wolne);

M = [A -B; B A];
p = [a;b];


[s,t] =gepp(M, p);
rozw = rozwiazTrojkatnaGorna(s,t);
x = rozw(1:n);
y = rozw((n+1):2*n);

z= x + 1i*y


end

