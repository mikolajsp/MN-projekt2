function [x] = rozwiazTrojkatnaGorna(A,b)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

n = size(A, 1);

if size(A, 1) ~= size(A, 2)
    error("Macierz A nie jest kwadratowa");
end

if size(b, 1) ~= n
    error("wektor b ma niepoprawny rozmiar");
end

x = zeros(n, 1);
x(n) = b(n)/A(n,n);
for i = (n-1):-1:1
   x(i) = (b(i) - A(i, (i+1):n)*x((i+1):n))/A(i,i);
end



end

