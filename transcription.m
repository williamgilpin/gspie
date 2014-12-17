function dmp = transcription(t, mp)

% functional form of differential equations governing gene transcription
% and translation, y(1) = mRNA concentration and y(2) = protein
% concentration


m = mp(1);
p = mp(2);

a_m = 3;
a_p = 5;
t_m = 3;
t_p = 30;



mdot = a_m - (1/t_m)*m;
pdot = (a_p)*m - (1/t_p)*p;

dmp = [mdot;  pdot];

