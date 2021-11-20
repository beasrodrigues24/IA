%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica 
% Problemas utilizando Pesquisa Informada
% Problema de Pesquisa -> Problema de Estado Único

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Notas:
% Partindo de qualquer nó, queremos chegar ao nó t

% Base de Conhecimento
% Definição das arestas: aresta(nó1, nó2, custo)

aresta(s, e, 2).
aresta(s, a, 5).
aresta(a, b, 2).
aresta(b, c, 2).
aresta(c, d, 3).
aresta(d, t, 3).
aresta(t, g, 2).
aresta(g, f, 2).
aresta(f, e, 5).


% Definição dos nodos: node(nó, estimativaDoCusto)

node(s,10).
node(a, 5).
node(b, 4).
node(c, 4).
node(d, 3).
node(t, 0).
node(g, 2).
node(f, 4).
node(e, 7).

%---------------------------------
% Devolve o nó adjacente e o seu custo

adjacente(X,Y,C) :- aresta(X,Y,C).
adjacente(X,Y,C) :- aresta(Y,X,C).

%---------------------------------
% Em profundidade 

auxiliarProfundidade(t, Visitados, Custo, Caminho, Custo) :- reverse([t|Visitados], Caminho).
auxiliarProfundidade(Node, Visitados, Custo, Caminho, Total) :- adjacente(Node,X,Valor),
                                                                not(member(X,Visitados)),
                                                                NewCost is Custo + Valor,
                                                                auxiliarProfundidade(X, [Node|Visitados], NewCost, Caminho, Total).


profundidade(Inicio, Caminho, Custo) :- auxiliarProfundidade(Inicio, [], 0, Caminho, Custo).

