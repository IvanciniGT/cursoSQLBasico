# SQL

SQL = Structured Query Language

Language?
- Síntaxis: Cómo se componen las frases. Reglas.
- Semántica: Significado de las palabras
- Gramática: Tipos de palabras, cómo se forman

## ANSI SQL
Estandar que rige cómo es el lenguaje SQL.

# Lenguajes informáticos

Tipos:
- Lenguajes de programación JAVA ,C , PYTHON, JS, COBOL
- Lenguajes de manipulación de datos: SQL (Dominio específico)
- Lenguajes de marcado de datos / Información: XML, JSON, YAML, HTML
- Lenguajes de definición de datos
- Lenguajes de modelado

Subcategoría:
- Lenguajes de próposito general
- Lenguajes de dominio específico

SQL sirve para consultar BBDD RELACIONALES.

# BBDD Relacionales?
Los datos se almacenan en tablas.
    Facturas
    Listado de productos
    Clientes
    Equipos infraestrutura

Esas tablas están relacionadas entre sí.... siempre? NO

## Base de datos - Guardan información de los entornos de producción.
Información con la que estamos trabajando ACTIVAMENTE, en el día a día.
Un repositorio de información donde tenemos datos que van cambiando en el tiempo.
Compañía de seguros: 
- Contratos activos
- Partes que tengo en trámite

## Datawarehouse
Guarda información histórica. 
- Consultas históricas.
- Business Intelligence.
  - Ayudarnos a entender las cuestiones básicas acerca de los datos que tenemos (negocio). Utilizar esta información para la toma de decisiones.
- DataMining
- Machine Learning

# Tipos de datos. Naturaleza: 

Desde el punto de vista de un humano:
- Numéricos
- Textos
- Booleanos / Lógicos -> Numerico: 0-1
- Fechas
- ....

Desde el punto de vista de un computador? Binario (en ceros y unos representación que hacemos de nuevo los humanos)
- Está llegando corriente por una patilla del microprocesador o no?
- Está magnetizado un segmento del HDD o no?

Cómo llamamos a la mínima ud infoirmación que guardamos o procesamos en un SI? BIT
1 bit puede albergar uno de estados valores: 0 - 1

Agrupar bits en uds de información más grandes? byte = 8 bits

1 bit podemos guardar 1 dato con 2 valores diferentes: 0 y 1
2 bits: 00 11 01 10           4 valores
3 bits:                       8 valores
n bits:                       2 elevado a n
8 bits:                       256 valores diferentes

Qué significan para un ser humano esos conjuntos de ceros y unos?
Dependerá del TIPO DE DATO:
INT: -128,0,127
POSINT: 0, 255
DECIMAL
CARACTER
                INT         POSINT        MAPA(JUEGO) DE CARACTERES
0000 0000       -128         0            a
....
0000 1001       -78          56           á
....
1111 1111       127          255          z


# Juegos de caracteres:
ASCII       Cada caracter se guarda en un byte... 256.... Esto es una RUINA !

Hay un estandar internacional que guarda todos los caracteres usados por los seres humanos en todos los idiomas registrados: UNICODE... 300k
JUEGOS DE CARACTERES QUE OFRECE UNICODE:
Todos pueden llegar a usar 32 bits para guardar un caracter
- UTF-8         Cada caracter se representa con 8, 16 o 32 bits
- UTF-16        Cada caracter se representa con 16 o 32 bits
- UTF-32        Cada caracter se representa con 32 bits

ISO-8859-1-2-3

# Quiero guardar un DNI?
El DNI tiene dos partes: NUMERO + "LETRA DE CONTROL"
La letra del DNI sirve para saber si el número está bien escrito.
Algoritmo de huella (HASH) MD5 SHA1

## Procedimiento de calculo de la letra del DNI
- Se toma el número del DNI.
- Se divide entre 23.
- Se coge el resto de esa división: 0-22
- Se mira en una tabla que letra corresponde a ese numero

Cómo me interesa guardarlo?
    Si lo guardo como texto:
        Cuántos caracteres tiene el número de un DNI? 9
        Cómo son caracteres "NORMALES" "HABITUALES", los puedo guardar en 1 byte.
        Cúanto ocupa mi DNI: 9 bytes
    Si lo guardo como número?
        Entre que número está el DNI: 0-99.999.999
        1 byte:     256
        2 bytes?    256*256
        4 bytes     Puedo guardar mas de 4kM de numeros... me sobra

Commodore 16kb 
PC Commodore 250.000 pts  - 1.500€
             HDD : 50.000pts          10Mb

# Cómo se guardan esos datos al final en el ordenador
Datos: Secuencias de bytes... enormes... dónde se guarda?

RAM
HDD/SSD en un fichero

    -----------FICHERO DE MI TABLA DE CLIENTES-----------------
    ID      NOMBRE*     TELEFONO        EMAIL
    1       Manolo      987876765       manolo@manolo.es
    2       Lucas       928392837       Lucas@Lucas.es
    3       Trini       289132798       Trini@Trini.es
    -----------------------------------------------------------

## ¿Qué implica guardar un dato nuevo? ¿Eso es lento o rápido?
Acceder al fichero y MODIFICARLO??? Más bien añadir una linea al final del fichero.
Esto es rapida? SI

## ¿Qué pasa si quiero extraer datos aleatorios del fichero?
Dame el telefono de "Trini"?
BUSQUEDA    => Encontrar a Trini
Hay 2 formas que podemos usar para encontrar a Trini allá dentro?
- Recorrer todas las personar y ver si cada una es Trini o no: FULLSCAN <<<<<<
- Ordenar los datos antes de hacer la búsqueda.
    Qué pasa si tengo los datos preordenados? Cómo hago esa búsqueda?
        Diccionario... Cómo buscamos en un diccionario?
            Utilizamos un algoritmo que se denomina: 
                BUSQUEDA BINARIA. DIVIDE Y VENCERÁS
                Si no tengo información adicional, partir a la mitad es la decisión más lógica

                    100000 datos
                    1 particion ... me cargo 50000
                    2                        25000
                    3                        12500
                    4                         6500
                    5                          3300
                    6                          1700
                    7                           900
                    8                           450
                    9                           225
                    10                          120
                    11                           60
                    12                           30
                    13                           15
                    14                            8
                    15                            4
                    16                            2
                    17                            1

                Según nos hacemos mayores... y vamos conociendo más palabras del idioma... aprendemos a usar mejor el diccionario:
                    Aceituna... abro por la mitad? No... porqué? esta al principio
                    Yugoslavia? me voy al final
                
                Hacen esto las bases de datos? SI, claro.. Son superlistas
                    De cada tabla calculan unas ESTADISTICAS (MNTO) si los datos cambian... si no cambian pues no... 

Cuanto pensais que le cuesta a un ORDENADOR, ORDENAR datos? Como el culo!

# INDICES
Qué es un índice? Libros
    Una copia ordenada de un conjunto de datos, junto con su ubicación

Libro de recetas de cocina:
    INDICE POR TIPO DE PLATO
        Tipos de platos: Primeros..... 17...23...47
                         Ensaladas.....17, 98, 110
                         Carnes.........98,283,1
    INDICE POR INGREDIENTE PRINCIPAL
        Bacalao
        Butifarra
        Cerdo       ... 18, 19, 26

        Cordero

Pero.. que problemas me da esto?
    De entrada, tengo más datos (por tener varios índices) escritos en disco.. datos repetidos.
    Si quiero introducir una palabra nueva en el índice, y ahí si que va ordenada?
    Los indices llevan muuuchos huecos, donde poder añadir datos nuevos en su orden correcto.. Pero esto hace que los indices ocupen bastante en HDD.
    Lo índices en la DDBB hay que mantenerlos... Los tengo que regenarar de vez en cuando.

Las BBDD relacionales están preparadas y muy bien preparadas para trabajar con información MUY ESTRUCTURADA.

El problema es por ejemplo un email. ASUNTO: Campo
Búsqueda sobre los asunto de los emails
-----------
VAcaciones de Lucas
VACACIONES DE LUCAS
vacaciones que voy a pedir en marzo
voy a pedir Vacaciones en marzo
Me voy de vacas en abril
-----------
Necesito bolígrafos
Solicitud de BOLIGRAFOS
Quiero pedir un boligrafo nuevo
-----------

Boligrafo -> NINGUNO... y esto está bien (Estrictamete es correcto... es adecuado para un usuario)? NO

UPCASE(ASUNTO) LIKE %BOLIGRAFO% < NUNCA UN INDICE VA A SER DE AYUDA > FULLSCAN
                                    De los indices normales (de los que hablabamos arriba)
UPCASE(ASUNTO) LIKE BOLIGRAFO%  < Si que usaría un indice

Oracle Text, SQL Server tienen algunas utilidades para hacer este trabajo eficientemente (POCAS) para busquedas fulltext: INDICES INVERTIDOS

VAcaciones de Lucas
VACACIONES DE LUCAS
vacaciones que voy a pedir en marzo
voy a pedir Vacaciones en marzo
Me voy de vacas en abril
   vvvvvvvv
vacaciones-de-lucas
vacaciones-de-lucas
vacaciones-que-voy-a-pedir-en-marzo
voy-a-pedir-vacaciones-en-marzo
me-voy-de-vacas-en-abril
   vvvvvvvv
vacaciones-*-lucas
vacaciones-*-lucas
vacaciones-*-voy-*-pedir-*-marzo
voy-*-pedir-vacaciones-*-marzo
*-voy-*-vacas-*-abril
    vvvvvvvv Quito acentos (si los hay), quitar plurales
vacacion            1(1) 2(1) 3(1) 4(4) 5 (5)
lucas               1(3)


Todo esto lo resuelven bien los MOTORES DE BUSQUEDAS DE TEXTO COMPLETO E INDEXADO
ElasticSearch, Solar

################################################
SIEMPRE: REGLA DE ORO EN LAS DBBDD RELACIONALES
################################################

Hemos de minimizar el uso de campos de tipo TEXTO !!!!!!!
Por qué? Los campos numéricos ocupan mucho menos y se trabaja mucho más rápido con ellos.
IMPACTO: SIEMPRE que tengamos una tabla con entradas, cada entrada llevará un identificador primario (PRIMARY KEY), que debe ser numérico...o una combinación de ids numéricos