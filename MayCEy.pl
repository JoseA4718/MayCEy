:-['BNF'].
:-['BaseDatos'].
:-style_check(-singleton).

%Reglas para manejo de listas y comparacion de datos
%Hecho inicial para primer elemento.
pe([X|_],X).

despedidaCambioYFuera(['Cambio y fuera','cambio y fuera']).

emergencias(['Mayday','mayday','7500']).

avionesPequenos(['Cessna','Beechcraft','Embraer Phenom']).
avionesMedianos(['Boing 717','Embraer 190','Airbus A220']).
avionesGrandes(['Boing 747','Airbus A340','Airbus A380']).

solicitudEmergencias([['Perdida de motor', 'Los bomberos iran en camino'],
      ['Parto en Medio Vuelo', 'El medico va en camino'],
      ['Paro Cardiaco de Pasajero', 'El medico de primeros auxilios va en camino'],
      ['Secuestro', 'Fuerza publica y el OIJ acudiran a la pista apenas lo mas rapid      o posible tras aterrizar'],
      ['7500','Se enviaran los bomberos y la fuerza publica a la pista']]).
    not(length(Lista,0)),
    eliminar(Entrada,Lista,NuevaLista),
    primerElemento(NuevaLista,Z),
    buscarDireccion(NuevaLista,Z,Y,Matricula,Pista,Hora).

buscarDireccion([],'',Y,Matricula,Pista,Hora):-
    write('La direccion indicada es incorrecta, intentelo de nuevo'),
    nl,
    quintoValorSaludo(X,Y,Matricula,Pista,Hora),!.

%----------Revisa la direccion encontrada----------------------------

revisarDireccion(Entrada,Pista):-
    primerElemento(Entrada,Z),
    Z=='este',
    Pista = 'P2-1',!.

revisarDireccion(Entrada,Pista):-
    primerElemento(Entrada,Z),
    Z=='oeste',
    Pista = 'P2-2',!.

revisarDireccion(Entrada,Pista):-
    primerElemento(Entrada,Z),
    not(length(Entrada,0)),
    eliminar(Z,Entrada,NuevaEntrada),
    revisarDireccion(NuevaEntrada,Pista).

revisarDireccion(Entrada,Pista):-
    length(Entrada,0),
    Pista = '1'.

% ----------Reglas que asignan la pista dependiendo de la direccion y
% tamano del avion.--------------------------------------------------
% Para despegue:

asignarPista(Matricula,Pista,Hora,Y):-
    Y==2,
    Pista=='P1',
    not(vuelosP1(_,Hora)),
    asserta(vuelosP1(Matricula,Hora)),
    write('Asignada la pista P1 correctamente, a las '),
    write(Hora),
    nl,
    nl,
    sextaEntrada(L),!.

asignarPista(Matricula,Pista,Hora,Y):-
    Y==2,
    Pista=='P2-1',
    not(vuelosP21(_,Hora)),
    asserta(vuelosP21(Matricula,Hora)),
    write('Asignada la pista P2-1 correctamente, a las '),
    write(Hora),
    nl,
    nl,
    sextaEntrada(L),!.

asignarPista(Matricula,Pista,Hora,Y):-
    Y==2,
    Pista=='P2-2',
    not(vuelosP22(_,Hora)),
    asserta(vuelosP22(Matricula,Hora)),
    write('Asignada la pista P2-2 correctamente, a las '),
    write(Hora),
    nl,
    nl,
    sextaEntrada(L),!.

asignarPista(Matricula,Pista,Hora,Y):-
    Y==2,
    Pista=='P3',
    not(vuelosP3(_,Hora)),
    asserta(vuelosP3(Matricula,Hora)),
    write('Asignada la pista P3 correctamente, a las '),
    write(Hora),
    nl,
    nl,
    sextaEntrada(L),!.

asignarPista(Matricula,Pista,Hora,Y):-%Caso en que la hora escrita ya este tomada
    Y==2,
    revisarP1(Z),
    Z=='available',
    not(Hora==''),
    Pista=='P1',
    vuelosP1(_,Hora),
    asignarHoraP12(Hora, Hora, X),
    asserta(vuelosP1(Matricula,X)),
    write('Asignada la pista P1, a las '),
    write(X),
    write(', pues la hora seleccionada esta tomada'),
    nl,
    nl,
    sextaEntrada(L),!.

asignarPista(Matricula,Pista,Hora,Y):-
    Y==2,
    revisarP1(Z),
    Z=='full',
    not(Hora==''),
    Pista=='P1',
    vuelosP1(_,Hora),
    asignarPistaNueva(X),
    asignarPista(Matricula, X, Hora,Y).

asignarPista(Matricula,Pista,Hora,Y):-
    Y==2,
    revisarP21(Z),
    Z=='available',
    not(Hora==''),
    Pista=='P2-1',
    vuelosP21(_,Hora),
    asignarHoraP212(Hora, Hora, X),
    asserta(vuelosP21(Matricula,X)),
    write('Asignada la pista P2-1, a las '),
    write(X),
    write(', pues la hora seleccionada esta tomada '),
    nl,
    nl,
    sextaEntrada(L),!.

asignarPista(Matricula,Pista,Hora,Y):-
    Y==2,
    revisarP21(Z),
    Z=='full',
    not(Hora==''),
    Pista=='P2-1',
    vuelosP21(_,Hora),
    asignarPistaNueva2(X),
    asignarPista(Matricula, X, Hora,Y).

asignarPista(Matricula,Pista,Hora,Y):-
    Y==2,
    revisarP22(Z),
    Z=='available',
    not(Hora==''),
    Pista=='P2-2',
    vuelosP22(_,Hora),
    asignarHoraP222(Hora, Hora, X),
    asserta(vuelosP22(Matricula,X)),
    write('Asignada la pista P2-2, a las '),
    write(X),
    write(', pues la hora seleccionada esta tomada'),
    nl,
    nl,
    sextaEntrada(L),!.

asignarPista(Matricula,Pista,Hora,Y):-
    Y==2,
    revisarP22(Z),
    Z=='full',
    not(Hora==''),
    Pista=='P2-2',
    vuelosP22(_,Hora),
    asignarPistaNueva3(X),
    asignarPista(Matricula, X, Hora,Y).

asignarPista(Matricula,Pista,Hora,Y):-
    Y==2,
    Pista=='P3',
    vuelosP3(_,Hora),
    asignarHoraP32(Hora, Hora, X),
    asserta(vuelosP3(Matricula,X)),
    write('Asignada la pista P3, a las '),
    write(X),
    write(', pues la hora seleccionada ya estaba tomada'),
    nl,
    nl,
    sextaEntrada(L),!.
%Para aterrizaje

asignarPista(Matricula,Pista,Hora,Y):-
    Y==1,
    Pista=='P1',
    not(vuelosP1(_,Hora)),
    asserta(vuelosP1(Matricula,Hora)),
    write('Pista P1 asignada, por favor disminuya la velocidad para que llegue a las '),
    write(Hora),
    nl,
    nl,
    sextaEntrada(L),!.

asignarPista(Matricula,Pista,Hora,Y):-
    Y==1,
    Pista=='P2-1',
    not(vuelosP21(_,Hora)),
    asserta(vuelosP21(Matricula,Hora)),
    write('Pista P2-1 asignada, por favor disminuya la velocidad para que llegue a las '),
    write(Hora),
    nl,
    nl,
    sextaEntrada(L),!.

asignarPista(Matricula,Pista,Hora,Y):-
    Y==1,
    Pista=='P2-2',
    not(vuelosP22(_,Hora)),
    asserta(vuelosP22(Matricula,Hora)),
    write('Pista P2-2 asignada, por favor disminuya la velocidad para que llegue a las '),
    write(Hora),
    nl,
    nl,
    sextaEntrada(L),!.

asignarPista(Matricula,Pista,Hora,Y):-
    Y==1,
    Pista=='P3',
    not(vuelosP3(_,Hora)),
    asserta(vuelosP3(Matricula,Hora)),
    write('Pista P3 asignada, por favor disminuya la velocidad para que llegue a las '),
    write(Hora),
    nl,
    nl,
    sextaEntrada(L),!.

asignarPista(Matricula,Pista,Hora,Y):-
    Y==1,
    revisarP1(Z),
    Z=='available',
    not(Hora==''),
    Pista=='P1',
    vuelosP1(_,Hora),
    asignarHoraP12(Hora, Hora, X),
    asserta(vuelosP1(Matricula,X)),
    write('Pista P1 asignada, por favor disminuya la velocidad para que logre aterrizar a las '),
    write(X),
    write(' pues la hora seleccionada ya esta ocupada'),
    nl,
    nl,
    sextaEntrada(L),!.

asignarPista(Matricula,Pista,Hora,Y):-
    Y==1,
    revisarP1(Z),
    Z=='full',
    not(Hora==''),
    Pista=='P1',
    vuelosP1(_,Hora),
    asignarPistaNueva(X),
    asignarPista(Matricula, X, Hora,Y).

asignarPista(Matricula,Pista,Hora,Y):-
    Y==1,
    revisarP21(Z),
    Z=='available',
    not(Hora==''),
    Pista=='P2-1',
    vuelosP21(_,Hora),
    asignarHoraP212(Hora, Hora, X),
    asserta(vuelosP21(Matricula,X)),
    write('Pista P2-1 asignada, por favor disminuya la velocidad para que logre aterrizar a las '),
    write(X),
    write(' pues la hora seleccionada ya esta ocupada '),
    nl,
    sextaEntrada(L),!.

asignarPista(Matricula,Pista,Hora,Y):-
    Y==1,
    revisarP21(Z),
    Z=='full',
    not(Hora==''),
    Pista=='P2-1',
    vuelosP21(_,Hora),
    asignarPistaNueva2(X),
    asignarPista(Matricula, X, Hora,Y).

asignarPista(Matricula,Pista,Hora,Y):-
    Y==1,
    revisarP22(Z),
    Z=='available',
    not(Hora==''),
    Pista=='P2-2',
    vuelosP22(_,Hora),
    asignarHoraP222(Hora, Hora, X),
    asserta(vuelosP22(Matricula,X)),
    write('Pista P2-2 asignada, por favor disminuya la velocidad para que logre aterrizar a las  '),
    write(X),
    write(' pues la hora seleccionada ya esta ocupada '),
    nl,
    sextaEntrada(L),!.

asignarPista(Matricula,Pista,Hora,Y):-
    Y==1,
    revisarP22(Z),
    Z=='full',
    not(Hora==''),
    Pista=='P2-2',
    vuelosP22(_,Hora),
    asignarPistaNueva3(X),
    asignarPista(Matricula, X, Hora,Y).

asignarPista(Matricula,Pista,Hora,Y):-
    Y==1,
    Pista=='P3',
    vuelosP3(_,Hora),
    asignarHoraP32(Hora, Hora, X),
    asserta(vuelosP3(Matricula,X)),
    write('Pista P3 asignada, por favor disminuya la velocidad para que logre aterrizar a las  '),
    write(X),
    write(' pues la hora seleccionada ya esta ocupada '),
    nl,
    nl,
    sextaEntrada(L),!.

%Asignacion de pista en caso de emergencias

asignarPista(Matricula,Pista,Hora,Y):-
    Y=='E',
    Pista=='P1',
    nl,
    write('Pista P1 asignada para su aterrizaje de emergencia. Se han enviado profesionales de ayuda para antender la    emergencia.'),
    nl,
    nl,
    sextaEntrada(L),!.

asignarPista(Matricula,Pista,Hora,Y):-
    Y=='E',
    Pista=='P2',
    nl,
    write('Pista P2-1 asignada para su aterrizaje de emergencia. Se han enviado profesionales de ayuda para antender la emergencia.'),
    nl,
    nl,
    sextaEntrada(L),!.

asignarPista(Matricula,Pista,Hora,Y):-
    Y=='E',
    Pista=='P3',
    nl,
    write('Pista P3 asignada para su aterrizaje de emergencia. Se han enviado profesionales de ayuda para antender la emergencia.'),
    nl,
    nl,
    sextaEntrada(L),!.

% -----------------Asignacion de horas para aterrizaje y despegue
% ----------------------------------------------------------------

% En caso de que no este disponible da la hora mas cercana a la dada por
% el usuario en la entrada.

asignarHoraP12(Hora, HoraC, Hora2):-
    horasPosibles(ListaHoras),
    asignarSiguienteHora(Hora,ListaHoras,X),
    not(vuelosP1(_,X)),
    Hora2 = X,!.

asignarHoraP12(Hora, HoraC, Hora2):-
    horasPosibles(ListaHoras),
    asignarSiguienteHora(Hora,ListaHoras,X),
    vuelosP1(_,X),
    asignarHoraP12(X, HoraC, Hora2).

asignarHoraP212(Hora, HoraC, Hora2):-
    horasPosibles(ListaHoras),
    asignarSiguienteHora(Hora,ListaHoras,X),
    not(vuelosP21(_,X)),
    Hora2 = X,!.

asignarHoraP212(Hora, HoraC, Hora2):-
    horasPosibles(ListaHoras),
    asignarSiguienteHora(Hora,ListaHoras,X),
    vuelosP1(_,X),
    asignarHoraP212(X, HoraC, Hora2).

asignarHoraP222(Hora, HoraC, Hora2):-
    horasPosibles(ListaHoras),
    asignarSiguienteHora(Hora,ListaHoras,X),
    not(vuelosP22(_,X)),
    Hora2 = X,!.

asignarHoraP222(Hora, HoraC, Hora2):-
    horasPosibles(ListaHoras),
    asignarSiguienteHora(Hora,ListaHoras,X),
    vuelosP1(_,X),
    asignarHoraP222(X, HoraC, Hora2).

asignarHoraP32(Hora, HoraC, Hora2):-
    horasPosibles(ListaHoras),
    asignarSiguienteHora(Hora,ListaHoras,X),
    not(vuelosP3(_,X)),
    Hora2 = X,!.

asignarHoraP32(Hora, HoraC, Hora2):-
    horasPosibles(ListaHoras),
    asignarSiguienteHora(Hora,ListaHoras,X),
    vuelosP1(_,X),
    asignarHoraP32(X, HoraC, Hora2).

asignarHoraP32(Hora, HoraC, Hora2):-
    revisarP3(Z),
    Z == 'full',
    write('De momento la pista P3 esta llena, favor esperar hasta que se libere un espacio'),
    nl,
    sextaEntrada(X).

% -------Reglas para asignar la hora libre mas cercana a la
% dad------------------------------------------------------

asignarSiguienteHora(Hora,ListaHoras,Hora2):-
    primerElemento(ListaHoras, Y),
    Y == Hora,
    eliminar(Hora,ListaHoras,NLista),
    primerElemento(NLista,Hora2),!.

asignarSiguienteHora(Hora,ListaHoras,Hora2):-
    primerElemento(ListaHoras, Y),
    not(Y == Hora),
    not(Y == '23:00'),
    eliminar(Y,ListaHoras,NLista),
    asignarSiguienteHora(Hora, NLista, Hora2).

asignarSiguienteHora(Hora,ListaHoras,Hora2):-
    primerElemento(ListaHoras, Y),
    Y == Hora,
    Y == '23:00',
    Hora2 = '0:00',!.

% ------------------------Reglas para asignar otra pista en caso que la
% que deberia ser asignada tenga horario lleno-------------------------

asignarPistaNueva(PistaNueva):-
    nl,
    write('La pista a ser asignada (P1), esta llena, se le asignara una de las P2, por favor indique la direccion para asignarle otra pista.') ,
    nl,
    chequearEntrada(X),
    not(chequearCierre(X)),
    revisarDireccion(X,Y),
    (Y=='P2-1' ; Y=='P2-2'),
    PistaNueva=Y,!.

asignarPistaNueva(PistaNueva):-
    nl,
    write('La pista a ser asignada (P1), esta llena, se le asignara una de las P2, por favor indique la direccion para asignarle otra pista.'),
    nl,
    chequearEntrada(X),
    not(chequearCierre(X)),
    revisarDireccion(X,Y),
    Y==1,
    write('La direccion introducida es incorrecta, por favor, intentelo de nuevo.'),
    nl,
    asignarPistaNueva(PistaNueva).

asignarPistaNueva2(PistaNueva):-
    revisarP22(X),
    X == 'available',
    nl,
    write('La pista P2-1 esta llena.'),
    nl,
    nl,
    PistaNueva = 'P2-2'.

asignarPistaNueva2(PistaNueva):-
    revisarP22(X),
    X == 'full',
    nl,
    write('Ambas pistas P2-1 y P2-2 estan llenas.'),
    nl,
    nl,
    PistaNueva = 'P3'.

asignarPistaNueva3(PistaNueva):-
    revisarP21(X),
    X == 'available',
    nl,
    write('La pista P2-2 esta llena.'),
    nl,
    nl,
    PistaNueva = 'P2-1'.

asignarPistaNueva3(PistaNueva):-
    revisarP21(X),
    X == 'full',
    nl,
    write('Ambas pistas P2-2 y P2-1 estan llenas.'),
    nl,
    nl,
    PistaNueva = 'P3'.

% -------------Reglas para verificar si las pistas estan
% llenas--------------------

revisarP1(X):-
    findall(Y,vuelosP1(_,Y),L),
    length(L, 24),
    X='full',!.

revisarP1(X):-
    findall(Y, vuelosP1(_,Y),L),
    not(length(L, 24)),
    X='available',!.

revisarP21(X):-
    findall(Y, vuelosP21(_,Y),L),
    length(L, 24),
    X='full',!.

revisarP21(X):-
    findall(Y, vuelosP21(_,Y),L),
    not(length(L, 24)),
    X='available',!.

revisarP22(X):-
    findall(Y, vuelosP22(_,Y),L),
    length(L, 24),
    X='full',!.

revisarP22(X):-
    findall(Y, vuelosP22(_,Y),L),
    not(length(L, 24)),
    X='available',!.

revisarP3(X):-
    findall(Y, vuelosP3(_,Y),L),
    length(L, 24),
    X='full',!.

revisarP3(X):-
    findall(Y, vuelosP3(_,Y),L),
    not(length(L, 24)),
    X='available',!.

% -------------------------Revision de entrada del usuario para
% agradecimiento-----------------------------------------------

% Llama a revisarAgradecimiento, si encuentra una keyword de
% agradecimiento tira el mensaje de respuesta.
leerAgradecimiento(X):-
    primerElemento(X,Y),
    revisarAgradecimiento(X,Y,Respuesta),
    not(Respuesta='false'),
    respuestaAgradecimiento(),
    nl,
    nl,
    septimaEntrada(L),!.

revisarAgradecimiento(Lista,Entrada,Respuesta):-
    agradecimientos(Entrada),
    Respuesta = 'true',!.

revisarAgradecimiento(Lista,Entrada,Respuesta):-
    not(length(Lista,0)),
    eliminar(Entrada,Lista,NuevaLista),
    primerElemento(NuevaLista, Z),
    revisarAgradecimiento(NuevaLista,Z,Respuesta).

revisarAgradecimiento([],Entrada,Respuesta):-
    Entrada == '',
    not(agradecimientos(Entrada)),
    nl,
    write('Para cerrar el chat despidase o escriba cerrar'),
    nl,
    Respuesta='false',!.

% -------------------------Revision de entrada del usuario para
% despedida-----------------------------------------------

% Llama a revisarDespedida, si hay una keyword de despedida cierra el
% chat.

leerDespedida(X):-
    primerElemento(X,Y),
    revisarDespedida(X,Y,Respuesta),
    not(Respuesta='false'),
    nl,
    write('--------CHAT CERRADO - DISPONIBLE PARA EL SIGUIENTE CHAT----------'),
    nl,
    nl,
    primerEntrada(L),!.

revisarDespedida(Lista,Entrada,Answer):-
    despedidas(Entrada),
    Answer = 'true',!.

revisarDespedida(Lista,Entrada,Respuesta):-
    not(length(Lista,0)),
    eliminar(Entrada,Lista,NuevaLista),
    primerElemento(NuevaLista, Z),
    revisarDespedida(NuevaLista,Z,Respuesta).

revisarDespedida([],Variable,Answer):-
    Variable == '',
    not(despedidas(Variable)),
    nl,
    write('Para terminar el chat despidase...'),
    nl,
    Answer='false',!.

% ---------------------Reglas para verificar si la entrada del usario
% son palabrtas clave de cierre--------------------------------------

% Llama a revisarCierre para ver si hay una palabra clave de cierre, si
% es asi cierra la ejecucion.
chequearCierre(X):-
    primerElemento(X,Y),
    revisarCierre(X,Y,Respuesta),
    not(Respuesta='false'),
    abort.

revisarCierre(Lista,Entrada,Respuesta):-
    cierre(Entrada),
    Respuesta = 'true',!.

revisarCierre(Lista,Entrada,Respuesta):-
    not(length(Lista,0)),
    eliminar(Entrada,Lista,ListaNueva),
    primerElemento(ListaNueva,Z),
    revisarCierre(ListaNueva,Z,Respuesta).

revisarCierre([],Entrada,Respuesta):-
    Entrada == '',
    not(cierre(Entrada)),
    Respuesta = 'false',!.

% ----------------------------------Analisis de entradas del
% usuario------------------------------

% Regla que llama a my_read en la base de datos para dividir la oracion
% y convertirla en una lista, y luego de eso, se llama al BNF para
% verificar si la sintaxis es correcta.

chequearEntrada(X):-
    my_read(X),
    oracion(X,[]),!.

% Reglas para revisar las entradas del usuario, se mantiene un order de
% querries, de manera que haya un orden logico en la conversacion con
% MayCEy.

% Revisa primera entrada del usuario (posibles casos: saludo o
% emergencia)
primerEntrada(X):-
    chequearEntrada(X),
    not(chequearCierre(X)),
    revisarEntrada(X),!.
%Revisa la segunda entrada en caso de que la primera fuera un saludo
segundoValorSaludo(X):-
    respuestaSaludo(),
    nl,
    chequearEntrada(X),
    not(chequearCierre(X)),
    revisarSolicitud(X).
% Revisa la segunda entrada en caso de que la primera fuera una
% emergencia
segundoValorEmergencia(X):-
    respuestaEmergencia(),
    nl,
    chequearEntrada(X),
    not(chequearCierre(X)),
    revisarEmergencia(X),!.
% Revisa la tercera entrada para ambos casos, si es una solicitud normal
% o emergencia.
tercerValorSaludo(X,Y):-
    respuestaIdentificacion(),
    nl,
    chequearEntrada(X),
    not(chequearCierre(X)),
    revisarIdentificacion(X,Y),!.
%Revisar la tercera entrada para el caso que era emergencia
tercerValorEmergencia(X):-
    respuestaIdentificacion(),
    nl,
    chequearEntrada(X),
    not(chequearCierre(X)),
    revisarIdentificacion(X,'E'),!.
% Revisa la cuarta entrada, solo para conversacion normal, pues
% emergencias para este paso ya fueron antendidas.
cuartoValorSaludo(X,Y,Matricula,Pista):-
    Y==2,
    respuestaHoraSalida(),
    nl,
    chequearEntrada(X),
    not(chequearCierre(X)),
    leerHora(X,Y,Matricula,Pista),!.
cuartoValorSaludo(X,Y,Matricula,Pista):-
    Y==1,
    respuestaHoraLlegada(),
    nl,
    chequearEntrada(X),
    not(chequearCierre(X)),
    leerHora(X,Y,Matricula,Pista),!.
%Revisa la quinta entrada, analisis de la direccion dada por el usuario
%
quintoValorSaludo(X,Y,Matricula,Pista,Hora):-
    Y==2,
    respuestaDireccionSalida(),
    nl,
    chequearEntrada(X),
    not(chequearCierre(X)),
    leerDireccion(X,Y,Matricula,Pista,Hora),!.

quintoValorSaludo(X,Y,Matricula,Pista,Hora):-
    Y==1,
    respuestaDireccionLlegada(),
    nl,
    chequearEntrada(X),
    not(chequearCierre(X)),
    leerDireccion(X,Y,Matricula,Pista,Hora),!.

% Revisa la sexta entrada del usuario, relacionada con la despedida o
% cierre del chat.

sextaEntrada(X):-
    chequearEntrada(X),
    not(chequearCierre(X)),
    leerAgradecimiento(X).

sextaEntrada(X):-
    chequearEntrada(X),
    not(chequearCierre(X)),
    leerDespedida(X).

% Revisa la ultima entrada posible, relacionada con el cierre, en caso
% de que el usuario no cierre o se despida correctamente.

septimaEntrada(X):-
    chequearEntrada(X),
    not(chequearCierre(X)),
    leerDespedida(X).

% REGLA INICIAL PARA COMENZAR EL CODIGO, SE DEBE ESCRIBIR EN LA MAQUINA
% PARA COMENZAR.

mayCEy():-
    primerEntrada(X).
