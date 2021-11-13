%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Inteligência Artificial MIEI /3  LEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com informacao genealogica.

filho( joao,jose ).
filho( jose,manuel ).
filho( carlos,jose ).

pai( paulo,filipe ).
pai( paulo,maria ).

avo( antonio,nadia ).

neto( nuno,ana ).

masculino(joao).
masculino(jose).
feminino(maria).
feminino(joana).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}

pai( P,F ) :- filho( F,P ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}

avo( A,N ) :- filho( N,X ), pai( A,X ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado neto: Neto,Avo -> {V,F}

neto( N,A ) :- avo( A,N ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}

bisavo( B,N ) :- filho( N,X ), avo( B,X ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente -> {V,F}

descendente( X,Y ) :- filho( X,Y ).
descendente( X,Y ) :- filho( X,Z ), descendente( Z,X ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F}

descendenteGrau(X,Y,1) :- filho( X,Y ).
descendenteGrau(X,Y,N) :- filho( X,Z ), G is N-1, descendenteGrau( Z,Y,G ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado trisavo: Trisavo,Trisneto -> {V,F}

trisavo(T,N) :- descendenteGrau( N,T,4 ).