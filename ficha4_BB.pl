%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica 
% Grafos (Ficha 9)

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Diferentes representacaoes de grafos
%
%lista de adjacencias: [n(b,[c,g,h]), n(c,[b,d,f,h]), n(d,[c,f]), ...]
%
%termo-grafo: grafo([b,c,d,f,g,h,k],[e(b,c),e(b,g),e(b,h), ...]) or
%            digrafo([r,s,t,u],[a(r,s),a(r,t),a(s,t), ...])
%
%clausula-aresta: aresta(a,b)


%---------------------------------

g( grafo([madrid, cordoba, braga, guimaraes, vilareal, viseu, lamego, coimbra, guarda],
  [aresta(madrid, corboda, a4, 400),
   aresta(braga, guimaraes,a11, 25),
   aresta(braga, vilareal, a11, 107),
   aresta(guimaraes, viseu, a24, 174),
   aresta(vilareal, lamego, a24, 37),
   aresta(viseu, lamego,a24, 61),
   aresta(viseu, coimbra, a25, 119),
   aresta(viseu,guarda, a25, 75)]
 )).

%--------------------------------- 
%alinea 1)

adjacente(X,Y,K,E, grafo(_,Es)) :- member(aresta(X,Y,K,E),Es).
adjacente(X,Y,K,E, grafo(_,Es)) :- member(aresta(Y,X,K,E),Es).

%--------------------------------- 
%alinea 2)

auxiliarCaminho(_,A,[A|P1],[A|P1]).
auxiliarCaminho(G,A,[Y|P1]) :- adjacente(X, Y, _, _, G), 
                    not(member(X, [Y|P1])), 
                    auxiliarCaminho(G,A,[X, Y|P1],P).

caminho(G,A,B,P) :- auxiliarCaminho(G,A,[B],P).


%--------------------------------- 
% alinea 3)

ciclo(G,A,P):- adjacente(B,A,_,_,G),
	            caminho(G, A, B, P1),
	            length(P1, L), L > 2, append(P1, [A], P).

%--------------------------------- 
%alinea 4)

auxiliarCaminhoK(_, A, [A|P1], Km, Est,([A|P1], Km, Est)).
auxiliarCaminhoK(G, A, [Y|P1], Km, Est, (P, Km1, Est1)):- adjacente(X, Y, Estrada, Dist, G), 
	                                                        not(member(X, [Y|P1])),
	                                                        Km2 is Km + Dist, 
	                                                        auxiliarCaminhoK(G, A, [X, Y|P1], Km2, [Estrada|Est], (P, Km1, Est1)). 

caminhoK(G, A, B, P, Km, Est):- auxiliarCaminhoK(G, A, [B], 0, [], (P, Km, Est)).


%--------------------------------- 
%alinea 5)

cicloK(G, A, P, Km, Est):- adjacente(B, A, Es1, Km1, G),
	                         caminhoK(G, A, B, P1, Km2, Es1),
	                         length(P1, L), L> 2,
	                         append(P1, [A], P),
	                         Km is Km1 + Km2. 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).

membro(X, [X|_]).
membro(X, [_|Xs]):- membro(X, Xs).