function [Ap, bp] = gepp(A,b)
%gepp funkcja ta za pomocą eliminacji Gaussa z częściowym wyborem elementu
%głównego doprowadza ją do postaci trójkątej górnej, równocześnie
% przekształcając też wektor wyrazów wolnych.
% A - wejściowa macierz układu (kwadratowa)
% b - wejściwy wektor wyrazów wolnych
% Ap - macierz przekształcona za pomocą GEPP (trójkątna górna)
% bp - przekształcony w ten sam sposób wektor wyrazów wolnych (pionowy)

% ustalenie rozmiaru macierzy
n = size(A, 1);

% sprawdzenie prostych warunków poprawności danych
if size(A,1) ~= size(A,2)
    error("Macierz nie jest kwadratowa");
end
if size(b, 1) ~= n
    error("wektor wyrazów wolnych ma nieprawidłowy rozmiar");
end

% stworzenie macierzy rozszerzonej układu
Ar = [A, b];

% dla każdej kolumny macierzy A
for i = 1:n
    %znajdowanie indeksu maksymalnego elementu w kolumnie 
    [~, indeks] = max(abs(Ar(i:n,i)));
    indeks = indeks+i-1;
    
    %zamiana wierszy
    Ar([i indeks],:) = Ar([indeks i],:);
    
    %wyzerowanie wierszy pod przekatna
    for j = (i+1):n
       % w tym miejscu sprawdzam, czy układ ma jednoznaczne rozwiązanie
       if Ar(i,i) ~= 0 
           Ar(j,:) = Ar(j,:) - Ar(j, i)/Ar(i, i) * Ar(i, :);
       else
           error("Układ nie ma jednoznacznego rozwiązania lub jest sprzeczny")
       end
    end
       
end


% podzielenie układu macierzy rozszerzonej układu na macierz współczynników
% i wektor wyrazów wolnych
bp = Ar(:, n+1);
Ap = Ar(1:n, 1:n);

end

