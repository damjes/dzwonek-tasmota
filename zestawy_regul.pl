:- [tablice_dzwonien].

:- multifile polecenie/3.

regula(Tablica, Tresc) :-
	dzwonienie(Tablica, Kiedy),
	swritef(Tresc, 'ON Time#Minute=%w DO Power 3 ENDON', [Kiedy]).

zestaw_regul(Tablica, Zestaw) :-
	findall(Tresc, regula(Tablica, Tresc), Lista),
	atomics_to_string(Lista, ' ', Zestaw).

polecenie(pre, 'Rule1', '"').
polecenie(pre, 'Rule2', '"').
polecenie(post, 'Rule1', 1).
polecenie(post, 'Rule2', 0).

polecenie(wlasc, 'Rule1', Tresc) :-
	zestaw_regul(1, Tresc).
polecenie(wlasc, 'Rule2', Tresc) :-
	zestaw_regul(2, Tresc).
