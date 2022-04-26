:- multifile polecenie/3.

poziom(setup, 10).
poziom(pre, 20).
poziom(wlasc, 30).
poziom(post, 40).

generuj_poziom(Liczba-Lista) :-
	poziom(Poziom, Liczba),
	findall(polecenie(Polecenie, Tekst), polecenie(Poziom, Polecenie, Tekst), Lista).

wyjmij(_-Y, Y).

daj_poziomy(Lista) :-
	findall(X, generuj_poziom(X), ListaPoziomow),
	keysort(ListaPoziomow, Posortowana),
	maplist(wyjmij, Posortowana, ListaList),
	flatten(ListaList, Lista).

