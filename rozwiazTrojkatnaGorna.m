function [x] = rozwiazTrojkatnaGorna(A,b)
%Funkcja rozwiązuje układ równań liniowych, w przypadku, gdy macierz układu
% jest macierzą trójkątną górną.
% A - macierz układu (trójkątna górna)
% b - odpowiadający wektor wyrazów wolnych 
% [x] - zwracany wektor będący rozwiązaniem układu

% ustalenie rozmiaru macierzy

n = size(A, 1);

% sprawdzenie prostych warunków poprawności danych
if size(A, 1) ~= size(A, 2)
    error("Macierz A nie jest kwadratowa");
end
if size(b, 1) ~= n
    error("wektor b ma niepoprawny rozmiar");
end

% wypelnienie zwracanego wektora zerami
x = zeros(n, 1);
% policzenie ostatniej zmiennej
x(n) = b(n)/A(n,n);

% dla każdego wiersza macierzy A (oprócz ostatniego, od dołu)
for i = (n-1):-1:1
   %i-ta zmienna wyznaczana jest na podstawie wszystkich już wyznaczonych
   x(i) = (b(i) - A(i, (i+1):n)*x((i+1):n))/A(i,i);
end

end

