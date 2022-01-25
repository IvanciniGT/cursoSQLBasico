SQL Es un lenguaje para manupular datos de BBDD
        No admite lógica
        Algo dependiente del motor de BBDD concreto

PL/SQL: Es un lenguaje de programación para usar dentro de BBDD Relacionales
        Muy dependiente del motor de BBDD concreto
        DESGRACIADAMENTE HA CAIDO EN DESUSO (Péndulo)

Antaño se metía mucha lógica de negocio en las BBDD a través de códgo PL/SQL
    Esto está muy mal.

Si llega el día 31 de diciembre quiero lanzar un proceso que totalice los importes 
Si una factura es mayor de tal importe hay que marcar en otra tabla que es necesario revisarla a mano
    Esto es lógica de negocio > App que gobierna la BBDD

Hoy en día toda la lógica se mete en las aplicaciones (ESPECIALMENTE EN EL MALIGNO MUNDO JAVA)
    Estamos n las mismas que antes...
    No toda la lógica es de negocio... hay lógica en los datos.
    La letra de un dni debe ser válida.
        Quien debe garantizar esto en última instancia? BBDD
            Bajo ningún concepto, ni por un bug de la app que lo puede tener, puede entrar un dato erroneo en mi BBDD > Logica de los datos> PL/SQL


Alta de una inscripción en una BBDD de curso: ¿Lógica de negocio o de datos?
    1º Asegurarnos que el usuario está dado de alta
    2º Si no lo está darlo de alta
    3º Si lo está, obtener su id
    4º Alta en la tabla inscripciones

Implica: de entrada, cuantas veces voy a la BBDD? al menos 3

PL/SQL
    funcion en BBD que se llame: inscripcionEnCurso(Persona, Curso):
        1º Asegurarnos que el usuario está dado de alta
        2º Si no lo está darlo de alta
        3º Si lo está, obtener su id
        4º Alta en la tabla inscripciones