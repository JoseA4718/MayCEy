:-['BaseDatos'].

%Estructuras BNF para frases del usuario

%Oraciones

oracion(S0,S):-
    sintagmaNominal(S0,S1),
    sintagmaVerbal(S1,S). % Sintagma nominal + sintagma verbal

oracion(S0,S):-
    adverbio(S0,S1),
    sintagmaNominal(S1,S2),
    sintagmaVerbal(S2,S). % Adverbio + sintagma nominal + sintagma verbal

oracion(S0,S):-
    sintagmaNominal(S0,S). %Oracion solo con sintagma nominal

oracion(S0,S):-
    sintagmaVerbal(S0,S). % Oracion solo con sintagma verbal

oracion(S0,S):-
    adverbio(S0,S). % Oracion solo con un adverbio

oracion(S0,S):-
    palabraClave(S0,S). % Oracion solo con palabra clave (base para entender peticion)

%Sintagma nominal

sintagmaNominal(S0,S):-
    pronombre(S0,S). % Sintagma nominal conformado solo por un pronombre.

sintagmaNominal(S0,S):-
    complemento(S0,S). % Sintagma nominal conformado por un complemento directo.

%Complmento Directo

complemento(S0,S):-
    sustantivo(S0,S). % Complemento hecho solamente de un sustantivo

complemento(S0,S):-
    adjetivo(S0,S). % Complemento hecho solamente de un adjetivo

complemento(S0,S):-
    articulo(S0,S). % Complemento hecho solamente de un articulo

complemento(S0,S):-
    matricula(S0,S1),
    matricula(S1,S2),
    matricula(S2,S3),
    matricula(S3,S). %Complemento conformado por los cuatro valores de matriculas.

complemento(S0,S):-
    articulo(S0,S1),
    sustantivo(S1,S). % Complemento Conformado por articulo y sustantivo

complemento(S0,S):-
    articulo(S0,S1),
    sustantivo(S1,S2),
    adjetivo(S2,S). % Complemento conformado por un articulo, un sustantivo y un adjetivo

complemento(S0,S):-
    sustantivo(S0,S1), complemento(S1,S). % Lo forma un sustantivo multiple.

% Sintagma Verbal

sintagmaVerbal(S0,S):-
    verbo(S0,S). % formado por un verbo conjugado

sintagmaVerbal(S0,S):-
    infinitivo(S0,S). %formado por un infinitivo

sintagmaVerbal(S0,S):-
    verbo(S0,S1),
    complemento(S1,S). % formado por verbo conjugado y complemento directo

sintagmaVerbal(S0,S):-
    infinitivo(S0,S1),
    complemento(S1,S).  % formado por infinitivo y complemento directo

sintagmaVerbal(S0,S):-
    verbo(S0,S1),
    sintagmaVerbal(S1,S).

sintagmaVerbal(S0,S):-
    infinitivo(S0,S1),
    sintagmaVerbal(S1,S).

sintagmaVerbal(S0,S):-
    conectores(S0,S1),
    sintagmaVerbal(S1,S).

sintagmaVerbal(S0,S):-
    conectores(S0,S1),
    complemento(S1,S).

sintagmaVerbal(S0,S):-
    verbo(S0,S1),
    complemento(S1,S2),
    sintagmaVerbal(S2,S). % formado por verbo y complemento directo

sintagmaVerbal(S0,S):-
    infinitivo(S0,S1),
    complemento(S1,S2),
    sintagmaVerbal(S2,S). % formado por infinitivo y complemento directo.

%Palabras claves

palabraClave(S0,S):-
    saludo(S0,S). %Palabra clave de saludo ('hola', 'buenas')

palabraClave(S0,S):-
    saludo(S0,S1),
    maycey(S1,S). %Palabra clave incluyendo a maycey al final

palabraClave(S0,S):-
    despedida(S0,S). %Palabra clave de despedida ('adios','hasta luego','chao')

palabraClave(S0,S):-
    agradecimiento(S0,S). %Palabra clave de ageradecimiento ('gracias', 'muchas gracias')

palabraClave(S0,S):-
    solicitudEmergencia(S0,S). %Palabra clave de emergencia ('mayday, 7500')

%Sustantivos

sustantivo(['vuelo'|S],S).
sustantivo(['pasajero'|S],S).
sustantivo(['aerolinea'|S],S).
sustantivo(['copa'|S],S).
sustantivo(['american'|S],S).
sustantivo(['united'|S],S).
sustantivo(['aeromexico'|S],S).
sustantivo(['tec-airlines'|S],S).
sustantivo(['ace'|S], S).
sustantivo(['motor'|S],S).
sustantivo(['permiso'|S],S).
sustantivo(['boing','747'|S],S).
sustantivo(['airbus','a340'|S],S).
sustantivo(['airbus','a380'|S],S).
sustantivo(['embraer','190'|S],S).
sustantivo(['airbus','a220'|S],S).
sustantivo(['cessna'|S],S).
sustantivo(['beechcraft'|S],S).
sustantivo(['embraer','phenom'|S],S).
sustantivo(['velocidad'|S],S).
sustantivo(['distancia'|S],S).
sustantivo(['direccion'|S],S).
sustantivo([_NumVelocidad,'km/h'|S],S).
sustantivo([_NumDistancia,'km'|S],S).
sustantivo([_NumVuelo|S],S).
sustantivo([_Hora,':',_Minutos|S],S).
sustantivo(['este','a','oeste'|S],S).
sustantivo(['oeste','a','este'|S],S).
sustantivo(['matricula'|S],S).

%Adjetivos

adjetivo(['inmediato'|S],S).
adjetivo(['cardiaco'|S],S).
adjetivo(['roto'|S],S).
adjetivo(['destruido'|S],S).

%Articulos

articulo(['el'|S],S).
articulo(['la'|S],S).
articulo(['por'|S],S).
articulo(['en'|S],S).
articulo(['para'|S],S).
articulo(['mi'|S],S).
articulo(['este'|S],S).
articulo(['al'|S],S).
articulo(['a'|S],S).
articulo(['los'|S],S).
articulo(['a','los'|S],S).
articulo(['en','los'|S],S).
articulo(['mas'|S],S).
articulo(['en','la'|S],S).
articulo(['a','la'|S],S).
articulo(['las'|S],S).
articulo(['en','las'|S],S).
articulo(['a','las'|S],S).
articulo(['un'|S],S).
articulo(['a','un'|S],S).
articulo(['unos'|S],S).
articulo(['a','unos'|S],S).
articulo(['una'|S],S).
articulo(['a','una'|S],S).
articulo(['unas'|S],S).
articulo(['a','unas'|S],S).
articulo(['de'|S],S).
articulo(['medio'|S],S).

%Verbo

verbo(['voy'|S],S).
verbo(['es'|S],S).
verbo(['estoy'|S],S).
verbo(['esta'|S],S).
verbo(['quisiera'|S],S).
verbo(['solicito'|S],S).
verbo(['gustaria'|S],S).
verbo(['debe'|S],S).
verbo(['perdida'|S],S).
verbo(['parto'|S],S).
verbo(['paro'|S],S).
verbo(['secuestro'|S],S).
verbo(['sera'|S],S).
verbo(['tengo'|S],S).
verbo(['salgo'|S],S).
verbo(['sale'|S],S).
verbo(['quiero'|S],S).
verbo(['deseo'|S],S).
verbo(['necesito'|S],S).

%Infinitivo

infinitivo(['despegar'|S],S).
infinitivo(['aterrizar'|S],S).
infinitivo(['solicitar'|S],S).
infinitivo(['salir'|S],S).
infinitivo(['arrancar'|S],S).
infinitivo(['cerrar'|S],S).
infinitivo(['llegar'|S],S).


%Adverbios

adverbio(['si'|S],S).
adverbio(['si,'|S],S).
adverbio(['no'|S],S).
adverbio(['no,'|S],S).
adverbio(['ninguno'|S],S).
adverbio(['ninguno,'|S],S).

%Pronombre

pronombre(['yo'|S],S).
pronombre(['me'|S],S).
pronombre(['mi'|S],S).

%Conectores de palabras

conectores(['y'|S],S).
conectores(['o'|S],S).

%Saludos

saludo(['hola'|S],S).
saludo(['Hola'|S],S).
saludo(['buenas'|S],S).
saludo(['Buenas'|S],S).
saludo(['buenos','dias'|S],S).
saludo(['buenas','tardes'|S],S).
saludo(['buenas','noches'|S],S).
saludo(['Buenos','dias'|S],S).
saludo(['Buenas','tardes'|S],S).
saludo(['Buenas','noches'|S],S).

%Despedidas

despedida(['adios'|S],S).
despedida(['Adios'|S],S).
despedida(['chao'|S],S).
despedida(['Chao'|S],S).
despedida(['hasta','luego'|S],S).
despedida(['hasta','pronto'|S],S).
despedida(['cambio','y','fuera'|S],S).

%Agradecimientos

agradecimiento(['gracias'|S],S).
agradecimiento(['Gracias'|S],S).
agradecimiento(['gracias!'|S],S).
agradecimiento(['Gracias!'|S],S).
agradecimiento(['muchas','gracias'|S],S).
agradecimiento(['muchas','gracias!'|S],S).

%Matriculas

matricula(['alpha'|S],S).
matricula(['bravo'|S],S).
matricula(['charlie'|S],S).
matricula(['delta'|S],S).
matricula(['echo'|S],S).
matricula(['foxtrot'|S],S).
matricula(['golf'|S],S).
matricula(['hotel'|S],S).
matricula(['india'|S],S).
matricula(['juliet'|S],S).
matricula(['kilo'|S],S).
matricula(['lima'|S],S).
matricula(['mike'|S],S).
matricula(['november'|S],S).
matricula(['oscar'|S],S).
matricula(['papa'|S],S).
matricula(['quebec'|S],S).
matricula(['romeo'|S],S).
matricula(['sierra'|S],S).
matricula(['tango'|S],S).
matricula(['uniform'|S],S).
matricula(['victor'|S],S).
matricula(['whiskey'|S],S).
matricula(['xray'|S],S).
matricula(['yankee'|S],S).
matricula(['zulu'|S],S).

%Emergencias

solicitudEmergencia(['mayday,','mayday'|S],S).
solicitudEmergencia(['mayday','mayday'|S],S).
solicitudEmergencia(['emergencia'|S],S).
solicitudEmergencia(['7500'|S],S).

%Nombrar a la maquina

maycey(['maycey'|S],S).
maycey(['maycey!'|S],S).
maycey(['Maycey'|S],S).
maycey(['Maycey!'|S],S).

%Eliminar caracter de un string

eliminarCaracter(S,C,X) :-
    atom_concat(L,R,S),
    atom_concat(C,W,R),
    atom_concat(L,W,X).

% Regla que transforma la linea escrita por el usuario a una lista para
% ser evaluada por el BNF.
% Entrada: List, la frase insertada por el usuario.
% Regla standard

my_read(List):-
    read_string(user,"\n","\r",_,String), % Lee la oracion y la divide en palabras
    downcase_atom(String, Lstring), % Convierte las palabras a minuscula
    eliminarCaracter(Lstring, '.', Nstring),
    atom_string(Atom, Nstring), % Transforma el atomo a string
    atomic_list_concat(List,' ',Atom). %Concatena el atomo a la lista.

