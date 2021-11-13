%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% inteligência Artificial - MiEI/3 LEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Operacoes sobre listas.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pertence: Elemento,Lista -> {V,F}

pertence( X,[X|L] ).
pertence( X,[Y|L] ) :-
    X \= Y,
    pertence( X,L ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado comprimento: Lista,Comprimento -> {V,F}

comprimento( [],0 ).
comprimento( [X|L],N ) :-
    comprimento( L,N1 ),
    N is N1+1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado quantos: Lista,Comprimento -> {V,F}

quantos( [],0 ).
quantos( [X|L],N ) :- 
    quantos( L,N0 ),
    (pertence( X,L ) -> N is N0; N is N0 + 1).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado apagar: Elemento,Lista,Resultado -> {V,F}

apagar( X,[],[] ).
apagar( X,[X|L],L ).
apagar( X,[Y|L],[Y|N]) :- X \= Y , apagar(X,L,N).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado apagatudo: Elemento,Lista,Resultado -> {V,F}

apagatudo( X,[],[] ).
apagatudo( X,[X|L],N ) :- apagatudo( X,L,N ).
apagatudo( X,[Y|L],[Y|N] ) :- X \= Y , apagatudo( X,L,N ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado adicionar: Elemento,Lista,Resultado -> {V,F}

adicionar( X,[],[X] ).
adicionar( X,[X|L],[X|L] ).
adicionar( X,[Y|L],[Y|N] ) :- X \= Y, adicionar( X,L,N ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado concatenar: Lista1,Lista2,Resultado -> {V,F}

concatenar( [],L,L ).
concatenar( [X|L],N,R ) :- concatenar( L,N,R0 ), R = [X|R0]. 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado inverter: Lista,Resultado -> {V,F}

inverter( [],[] ).
inverter( [X|L],R ) :- inverter( L,R0 ), concatenar( R0,[X],R ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado sublista: SubLista,Lista -> {V,F}

sublista( [],L ).
sublista( [X|XS],[X|YS] ) :- sublista( XS,YS ).
sublista( [X|XS],[Y|YS] ) :- X \= Y, sublista( [X|XS], YS).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).
