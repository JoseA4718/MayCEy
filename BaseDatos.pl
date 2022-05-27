:- dynamic vuelosP1/2.
:- dynamic vuelosP21/2.
:- dynamic vuelosP22/2.
:- dynamic vuelosP3/2.

saludos('hola').
saludos('buenas').
saludos('Hola').
saludos('Buenas').
saludos('Buenas tardes').
saludos('Buenos dias').
saludos('Buenos noches').

despedidas('adios').
despedidas('Adios').
despedidas('hasta luego').
despedidas('Hasta luego').
despedidas('chao').
despedidas('Chao').
despedidas('hasta').
despedidas('cambio').

agradecimientos('gracias').
agradecimientos('muchas').

emergencia('perdida').
emergencia('parto').
emergencia('paro').
emergencia('secuestro').

avionesGrandes('boing747').
avionesGrandes('airbusa380').
avionesGrandes('airbusa340').
avionesMedianos('airbusa220').
avionesMedianos('boing717').
avionesMedianos('embraer190').
avionesPequenos('cessna').
avionesPequenos('beechcraft').
avionesPequenos('embraerphenom').

avionesDobles('boing').
avionesDobles('airbus').
avionesDobles('embraer').

pista('P1').
pista('P2-1').
pista('P2-2').
pista('P3').cierre('cerrar').

emergencias('mayday').
emergencias('Mayday').
emergencias('mayday,').
emergencias('Mayday,').
emergencias('emergencia').
emergencias('Emergencia').
emergencias('7500').

condicion('velocidad').
condicion('peso').
condicion('viento').
condicion('distancia').

matricula('alpha').
matricula('bravo').
matricula('charlie').
matricula('delta').
matricula('echo').
matricula('foxtrot').
matricula('golf').
matricula('hotel').
matricula('india').
matricula('juliet').
matricula('kilo').
matricula('lima').
matricula('mike').
matricula('november').
matricula('oscar').
matricula('papa').
matricula('quebec').
matricula('romeo').
matricula('sierra').
matricula('tango').
matricula('uniform').
matricula('victor').
matricula('whiskey').
matricula('xray').
matricula('yankee').
matricula('zulu').

hora('0:00').
hora('1:00').
hora('2:00').
hora('3:00').
hora('4:00').
hora('5:00').
hora('6:00').
hora('7:00').
hora('8:00').
hora('9:00').
hora('10:00').
hora('11:00').
hora('12:00').
hora('13:00').
hora('14:00').
hora('15:00').
hora('16:00').
hora('17:00').
hora('18:00').
hora('19:00').
hora('20:00').
hora('21:00').
hora('22:00').
hora('23:00').

horasPosibles(['0:00','1:00','2:00','3:00','4:00','5:00','6:00','7:00','8:00','9:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00','20:00','21:00','22:00','23:00']).

aterrizar('aterrizar').
despegar('despegar').
lista('hola').
cierre('cerrar').

respuestaSaludo():-
    nl,
    write('Hola! En que te puedo ayudar?').

respuestaIdentificacion():-
    nl,
    write('Identifiquese porfavor, con la matricula y avion').

respuestaMatricula():-
    nl,
    write('Por favor, escriba su matricula').

respuestaAvion():-
    nl,
    write('Indique el tipo de avion').

respuestaHoraSalida():-
    nl,
    write('Indique la hora de salida deseada').

respuestaHoraLlegada():-
    nl,
    write('Indique la hora de llegada deseada').

respuestaDireccionSalida():-
    nl,
    write('Indique la direccion de salida porfavor').

respuestaDireccionLlegada():-
    nl,
    write('Indique la direccion de llegada porfavor').

respuestaSolicitudAterrizaje():-
    nl,
    write('Indique la velocidad, distancia a la pista y direccion de vuelo').

respuestaEmergencia():-
    nl,
    write('Entendido! Indique la emergencia!').

respuestaAgradecimiento():-
    nl,
    write('Con gusto!').
