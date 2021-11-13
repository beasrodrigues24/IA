%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Inteligência Artificial - MiEI/3 LEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Operacoes aritmeticas.

ope( X+Y,R ) :- R is X+Y.
ope( X-Y,R ) :- R is X-Y.
ope( X*Y,R ) :- R is X*Y.
ope( X/Y,R ) :- R is X/Y.

% Maior valor entre 2
max( X,Y,R ) :- X>=Y , R is X.
max( X,Y,R ) :- Y>=X , R is Y.

% Maior valor entre 3
max( X,Y,Z,R ) :- max(X,Y,A), max(A,Z,R).

% Menor valor entre 2
min( X,Y,R ) :- X>=Y , R is Y.
min( X,Y,R ) :- Y>=X, R is X. 

% Menor valor entre 3
min( X,Y,Z,R ) :- min(X,Y,A), min(A,Z,R).

% Determina se é par 
par( X ) :- 0 is mod( X,2 ).

% Determina se é impar 
impar( X ) :- not(par(X)).

% Máximo divisor comum 
mdc( X,X,X ).
mdc( X,Y,M ) :- X>=Y, Z is X-Y, mdc( Z,Y,M ).
mdc( X,Y,M ) :- Y>=X, Z is Y-X, mdc( X,Z,M ).

% Mínimo múltiplo comum 
mmc( X,Y,R ) :-
    max(X, Y, MaiorR),
    min(X, Y, MenorR),
    mmc_aux(MaiorR, MenorR, MaiorR, R).

mmc_aux( MaiorR, MenorR, MMC, R) :-
    mod(MMC, MenorR) =\= 0,
    NewMMC is MMC + MaiorR,
    mmc_aux(MaiorR, MenorR, NewMMC, R).
mmc_aux( MaiorR, MenorR, MMC, MMC).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: X,Y,Soma -> {V,F}

soma( X,Y,Soma ) :-
    Soma is X+Y.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: X,Y,Z,Soma -> {V,F}

soma(X,Y,Z,Soma ) :- 
    Soma is X+Y+Z.