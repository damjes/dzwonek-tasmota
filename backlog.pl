:- multifile backlog/2, polecenie/3.

scal_polecenie(polecenie(Nazwa, Argument), Tekst) :-
	atomics_to_string([Nazwa, Argument], ' ', Tekst).

% Backlog
polecenie(Poziom, "Backlog", Tresc) :-
	backlog(Poziom, ListaPolecen),
	maplist(scal_polecenie, ListaPolecen, ListaTresci),
	atomics_to_string(ListaTresci, '; ', Tresc).