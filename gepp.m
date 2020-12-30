function [Ap, bp] = gepp(A,b)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

n = size(A, 1);

if size(A,1) ~= size(A,2)
    error("Macierz nie jest kwadratowa");
end

if size(b, 1) ~= n
    error("wektor wyrazów wolnych ma nieprawidłowy rozmiar");
end

Ar = [A, b];

for i = 1:n
    %znajdowanie maksymalnego elementu w wierszu 
    [maksimum, indeks] = max(abs(Ar(i:n,i)));
    indeks = indeks+i-1;
    
    %zamiana wierszy
    Ar([i indeks],:) = Ar([indeks i],:);
    
    %wyzerowanie wierszy pod przekatna
    
    for j = (i+1):n
       Ar(j,:) = Ar(j,:) - Ar(j, i)/Ar(i, i) * Ar(i, :);
    end
    
    
end


bp = Ar(:, n+1);
Ap = Ar(1:n, 1:n);




end

