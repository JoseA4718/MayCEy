saludos(['hola','HOLA','Hola','buenos dias','Buenos Dias','Buenos dias','buenas','buenas tardes','Buenas tardes','Buenas Tardes','buenas noches','Buenas noches','Buenas ','saludos']).

despedidas(['Adios','Hasta luego','Cambio y fuera','Chao','Nos vemos'],'Hasta luego').
despedidas(['adios','hasta luego','cambio y fuera','chao','nos vemos'],'hasta luego').

agradecimientos(['gracias','Gracias','muchas gracias','Muchas gracias','Muchas Gracias','muy amable','Muy amable','perfecto','Perfecto'],'Con mucho gusto').

solicitudes(['aterrizar','despegar'],'Identifiquese, por favor').

emergencias(['Mayday','mayday','mayday, mayday','Mayday, Mayday','MAYDAY','7500']).

avionesPequenos(['Cessna','Beechcraft','Embraer Phenom']).
avionesMedianos(['Boing 717','Embraer 190','Airbus A220']).
avionesGrandes(['Boing 747','Airbus A340','Airbus A380']).

pista('P1','1','').
pista('P2-1','2','Este a Oeste').
pista('P2-2','2','Oeste a Este').
pista('P3','3','').

emergencias(['Perdida de motor','Llamar a bomberos'],['Parto en medio vuelo','Llamar a medico'],['Paro cardiaco de pasajero','Llamar a medico'],['Secuestro','Llamar al OIJ y fuerza publica']).

miembro(X,[X|_]):-!.
miembro(X,[_|R]):-miembro(X,R).

verificarVelocidad(Vel):-
    Vel >= 280,
    write('Por favor disminuya su velocidad a menos de 200km/h para lograr aterrizar a tiempo'), !;
    write('Puede aterrizar sin problemas').

asignarPista(Vel):-
    verificarVelocidad(Vel).

asignarPista(Avion, Direc):-
    (avionesPequenos(X); avionesMedianos(X); avionesGrandes(X)),
    miembro(Avion, X),
    Direc == '',
    write('Pista 3 asignada'), !.

asignarPista(Avion, Direc):-
    (avionesPequenos(X); avionesMedianos(X)),
    miembro(Avion, X),
    Direc == 'Este a Oeste',
    write('Pista 2-1 asignada'), !,
    Direc == 'Oeste a Este',
    write('Pista 2-2 asignada'), !.

asignarPista(Avion, Direc):-
    avionesPequenos(X),
    miembro(Avion, X),
    Direc == '',
    write('Pista 1 asignada'), !.

