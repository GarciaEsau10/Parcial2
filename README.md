Para el siguiente problema, desarrolla la solución en Quartus 18.1 utilizando el lenguaje descriptivo VHDL y el CPLD EPM240T100C5. Se debe realizar un sistema de seguridad, para esto se tienen 4 interruptores deslizables, un botón de presión normalmente abierto, un sistema de apertura de puertas, y una alarma policiaca. El funcionamiento es el siguiente:
a) Se ingresara un código de 4 dígitos por medio de los interruptores deslizables. Un digito a la vez. Cada digito se codificara por medio de los 4 interruptores.
b) Para confirmar el ingreso de un digito se presionara el botón normalmente abierto.
c) Una vez ingresado el código de 4 dígitos ocurrirá alguno de los siguientes eventos:
c.1) Si el código ingresado corresponde a los 4 últimos dígitos del numero de cuenta, se enviara una señal en algunas de las salidas del CPLD que activara la apertura de la puerta.
c.2) Si el código ingresado corresponde al día y mes de nacimiento (dd/mm), se enviara una señal en alguna otra salida del CPLD que activara la alarma policiaca.
c.3) Si el código ingresado corresponde al año de nacimiento (aaaa), se enviarán dos señales (las mismas usadas en los dos puntos anteriores) que activaran tanto la apertura de la puerta como la alarma policiaca.
c.4) Si el código no corresponde a ninguna de las condiciones anteriores, no se realiza acción alguna.
Para la codificación de los dígitos utilizados se realizara de la siguiente manera: Si el numero de cuenta termina en 0 o 1, utilizar la codificación gray, si el numero de cuenta termina en 2 o 3 utilizar el código BCD 7421. Si el numero de cuenta termina en 4 o 5 utilizar el código BCD 5421. Si el numero de cuenta termina con 6 o 7 utiliza el código Exceso 3. Finalmente, si el numero de cuenta termina en 8 o 9 utilizar el código Aiken.
NOTA: Para la solución de este problema es necesario y forzoso usar las estructuras de repetición (for ... generate y/o if ... generate).

Numero de cuenta: 317201998
Ultimos 4 digitos del numero de cuenta: 1998
Dia y mes de nacimiento (dd/mm): 07/06
año de nacimiento: 2001
Ultimo digito del numero de cuenta: 8
