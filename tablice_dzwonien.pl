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

standardowa_przerwa(1, 10).
standardowa_przerwa(2, 5).

max_lekcja(13).

niestandardowa_przerwa(1, 0, 5).
niestandardowa_przerwa(1, 5, 15).
niestandardowa_przerwa(1, 10, 5).
niestandardowa_przerwa(1, 11, 5).
niestandardowa_przerwa(1, 12, 5).
niestandardowa_przerwa(1, 13, 5).

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

dzwonienie(Tablica, Kiedy) :-
	przerwa(Tablica, _, Kiedy).
dzwonienie(Tablica, Kiedy) :-
	lekcja(Tablica, _, Kiedy).

pisz_tablice(Tablica) :-
	lekcja(Tablica, NumerLekcji, Lekcja),
	przerwa(Tablica, NumerLekcji, Przerwa),
	przelicz(Lekcja, LekcjaGodziny, LekcjaMinuty),
	przelicz(Przerwa, PrzerwaGodziny, PrzerwaMinuty),
	writef('%3L. %3R:%3R-%3R:%3R\n', [NumerLekcji, LekcjaGodziny, LekcjaMinuty, PrzerwaGodziny, PrzerwaMinuty]),
	fail.
pisz_tablice(_).