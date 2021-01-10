C = [1 i -3+i;2 1+3i -4+2i;2i -2 -2-3i];
c = [-1-i;2i;-1+i];

tstmoj = tic;
moje = przygotuj(C,c)
tmoj = toc(tstmoj);

tstmatlab = tic;
matlab = C\c
tmatlab = toc(tstmatlab);



subplot(1,2,1);

x = categorical(["Czas funkcji z zadania","Czas wbudowanej funkcji Matlaba"]);
y = [tmoj, tmatlab];

bar(x, y);
title("Czas rozwiązywania układu");
xlabel("Porównywana funkcja");
ylabel("Czas [s]");

subplot(1,2,2);

x = categorical(["Błąd funkcji z zadania","Błąd wbudowanej funkcji Matlaba"]);
y = [norm(abs(C*moje-c)), norm(abs(C*matlab-c))];

bar(x, y);
title("Błąd rozwiązania");
xlabel("Porównywana funkcja");
ylabel("Błąd");
ylim([0 1]);

