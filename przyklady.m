%przyklad 1
wizualizujPrzyklad([1 1i -3+1i;2 1+3i -4+2i;2i -2 -2-3i],[-1-1i;2i;-1+1i]);
%przyklad 2
wizualizujPrzyklad(rand(100),(1:100)');
%przyklad 3
wizualizujPrzyklad(rand(100)*1i + rand(100),(1:100)' + (100:-1:1)'*1i);
%przyklad 4
wizualizujPrzyklad(hilb(10)*1i + hilb(10), (1:0.5:5.5)');
%przyklad 5
wizualizujPrzyklad(gallery("dorr", 70) + gallery("dorr",70)*3i, (1:70)');
%przyklad 6
przygotuj([1 1i;1 1i],[2; 2i])
przygotuj([5 2i;5 2i],[1; 1])
 