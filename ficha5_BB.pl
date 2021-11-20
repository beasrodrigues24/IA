%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica 
% Problema dos jarros -> Problema de Estado Único

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Notas:
% Jarro A -> capacidade= 8
% Jarro B -> capacidade= 5
% Par(A, B) -> jarros(A, B)
% Estado Inicial -> jarros(0, 0)
% Estado Objetivo -> jarros(_, 4) ou jarros(4, _)
% Estado Inicial <-> Estado Objetivo -> Operadores

%---------------------------------
% Estado inicial

estadoInicial(jarros(0,0)).

%---------------------------------
% Estado final 

estadoFinal(jarros(_,4)).
estadoFinal(jarros(4,_)).

%---------------------------------
% Operações 

transicao(jarros(A,B), encher(1), jarros(8,B)) :- A < 8. 
transicao(jarros(A,B), encher(2), jarros(A,8)) :- B < 8.
transicao(jarros(A,B), esvaziar(1), jarros(0,B)) :- A > 0. 
transicao(jarros(A,B), esvaziar(2), jarros(A,0)) :- B > 0. 
transicao(jarros(A,B), transferir(1,2), jarros(C,D)) :- A > 0, 
                                                        C is max(0, A-5+B), 
                                                        C < A, 
                                                        D is B + A - C.
transicao(jarros(A,B), transferir(2,1), jarros(C,D)) :- B > 0, 
                                                        D is max(0,B-5+A),
                                                        D < B,
                                                        C is A + B - D.

%---------------------------------
% Estratégia em profundidade 

auxiliarProfundidade(Ei, Ef, Visitados, Caminho) :- reverse([Ei|Visitados], Caminho).
auxiliarProfundidade(Ei, Ef, Visitados, Caminho) :- not(member(Ei, Visitados)), 
                                                    transicao(Ei,T,E),
                                                    auxiliarProfundidade(E,Ef,[Ei|Visitados],Caminho).

profundidade(Ei, Ef, Caminho) :- auxiliarProfundidade(Ei, Ef, [], Caminho).


%---------------------------------
% Estratégia em largura

auxiliarLargura(Ei, Ef, Visitados, Visitados).
auxiliarLargura(Ei, Ef, Visitados, Caminho) :- not(member(Ei,Visitados)),
                                               transicao(Ei,T,E),
                                               append(Visitados, [Ei], NovosVisitados),
                                               auxiliarLargura(E, Ef, NovosVisitados, Caminho).

largura(Ei, Ef, Caminho) :- auxiliarLargura(Ei, Ef, [], Caminho).
