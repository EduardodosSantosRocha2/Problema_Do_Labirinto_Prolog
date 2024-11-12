:- dynamic marcado/1.
:- dynamic e_seguro/1.
:- dynamic verificado/1.
:- dynamic sala_com_monstro/1.
:- dynamic sala_fedida/1.

%------------------------------------------
poe_monstro(X) :-assertz(sala_com_monstro(X)),Y1 is X - 1,Y2 is X + 1,Y3 is X + 4,Y4 is X - 4,marca_sala_vizinha_com_fedor(Y1),marca_sala_vizinha_com_fedor(Y2),marca_sala_vizinha_com_fedor(Y3),marca_sala_vizinha_com_fedor(Y4).

%------------------------------------------
marca_sala_vizinha_com_fedor(X) :-X > 0, X < 17,assertz(sala_fedida(X)).

%------------------------------------------
seguro(X):- marcado(X), sala_fedida(X), assertz(e_seguro(X)).
seguro(X) :-marcado(X),not(sala_fedida(X)),Z1 is X - 1,marca_para_investigar(Z1),Z2 is X + 1,marca_para_investigar(Z2),Z3 is X - 4,marca_para_investigar(Z3),Z4 is X + 4,marca_para_investigar(Z4),assertz(e_seguro(X)).
%------------------------------------------
marca_para_investigar(X) :- X < 1; X > 16.
marca_para_investigar(X) :-X > 0, X < 17,(not(marcado(X))-> assertz(marcado(X));true).




