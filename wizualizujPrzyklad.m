function [] = wizualizujPrzyklad(C,c)

UwarunkowanieMacierzy = cond(C);

%próby dla funkcji z zadania
for it = 1:10
    tstmoj = tic;
    RozwiazanieFunkcjaZZadania = przygotuj(C,c);
    tmoj(it) = toc(tstmoj);
end

%próby dla funkcji matlabowej
for it = 1:10
    tstmatlab = tic; 
    RozwiazanieFunkcjaMatlaba = C\c;
    tmatlab(it) = toc(tstmatlab);
end

figure;
% rysowanie wykresu średniego czasu
subplot(2,2,1);

x = categorical(["Funkcja z zadania","Wbudowana funkcja Matlaba"]);
y = [mean(tmoj), mean(tmatlab)];

b1 = bar(x, y);
title("Średni czas rozwiązywania układu");
xlabel("Porównywana funkcja");
ylabel("Czas [s]");

% rysowanie wykresu błędu
subplot(2,2,2);

x = categorical(["Funkcja z zadania","Wbudowana funkcja Matlaba"]);
y = [norm(abs(C*RozwiazanieFunkcjaZZadania-c)), norm(abs(C*RozwiazanieFunkcjaMatlaba-c))];

b2 = bar(x, y);
title("Błąd rozwiązania");
xlabel("Porównywana funkcja");
ylabel("Błąd = ||Cz-c||");

% rysowanie wykresu czasu w poszczególnych iteracjach
subplot(2,2,[3 4]);

plot(1:10, tmoj, "b-o", 1:10, tmatlab, "r-o");
title("Poszczególne czasy wykonania przykładu");
xlabel("Numer wykonania");
ylabel("Czas poszczególnych wykonań przykładu [s]");
legend("Funkcja z zadania","Wbudowana funkcja Matlaba");


% wypisanie wyników na konsolę
UwarunkowanieMacierzy
BladWzgledny = norm(RozwiazanieFunkcjaMatlaba - RozwiazanieFunkcjaZZadania)/norm(RozwiazanieFunkcjaMatlaba);
BladWzgledny
WspolczynnikStabilnosci = norm(RozwiazanieFunkcjaMatlaba - RozwiazanieFunkcjaZZadania)/(norm(RozwiazanieFunkcjaMatlaba)*UwarunkowanieMacierzy);
WspolczynnikStabilnosci
WspolczynnikPoprawnosci =  norm(c - C*RozwiazanieFunkcjaZZadania)/(norm(RozwiazanieFunkcjaZZadania)*norm(C));
WspolczynnikPoprawnosci
RozwiazanieFunkcjaZZadania
RozwiazanieFunkcjaMatlaba


end

