:- use_module(library(clpfd)).

:- discontiguous lekcja/3, dlugosc_lekcji/2.

przelicz(MinutyDoby, Godziny, Minuty) :-
	Godziny #>= 0,
	Godziny #=< 23,
	Minuty #>= 0,
	Minuty #< 60,
	MinutyDoby #= Godziny * 60 + Minuty.

lekcja(1, 0, MinutyDoby) :-
	przelicz(MinutyDoby, 7, 10).
dlugosc_lekcji(1, 45).

lekcja(2, 0, MinutyDoby) :-
	przelicz(MinutyDoby, 7, 25).
dlugosc_lekcji(2, 30).

standardowa_przerwa(1, 5).
standardowa_przerwa(2, 5).

max_lekcja(13).

niestandardowa_przerwa(1, 3, 10).
niestandardowa_przerwa(1, 4, 10).
niestandardowa_przerwa(1, 5, 20).
niestandardowa_przerwa(1, 6, 10).
niestandardowa_przerwa(1, 7, 10).

niestandardowa_przerwa(2, 4, 10).
niestandardowa_przerwa(2, 5, 10).
niestandardowa_przerwa(2, 6, 10).

dlugosc_przerwy(Tablica, NumerLekcji, Dlugosc) :-
	\+ niestandardowa_przerwa(Tablica, NumerLekcji, _),
	standardowa_przerwa(Tablica, Dlugosc).
dlugosc_przerwy(Tablica, NumerLekcji, Dlugosc) :-
	niestandardowa_przerwa(Tablica, NumerLekcji, Dlugosc).

przerwa(Tablica, NumerLekcji, KoniecLekcji) :-
	lekcja(Tablica, NumerLekcji, PoczatekLekcji),
	dlugosc_lekcji(Tablica, DlugoscLekcji),
	KoniecLekcji #= PoczatekLekcji + DlugoscLekcji.
lekcja(Tablica, NumerLekcji, KoniecPrzerwy) :-
	max_lekcja(MaxLekcja),
	between(1, MaxLekcja, NumerLekcji),
	PoprzedniaLekcja is NumerLekcji - 1,
	przerwa(Tablica, PoprzedniaLekcja, PoczatekPrzerwy),
	dlugosc_przerwy(Tablica, PoprzedniaLekcja, DlugoscPrzerwy),
	KoniecPrzerwy #= PoczatekPrzerwy + DlugoscPrzerwy.