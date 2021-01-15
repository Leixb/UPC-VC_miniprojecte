% Llegeix una imatge i la passa a labelSignal per clasficar
% despres mostra el resultat

I = imread(uigetimagefile());
[final, mid] = labelSignal(I);

disp(mid)
disp(final)