library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Sistema_seguridad is
    port (
        -- Entradas
        interruptores : in  std_logic_vector(3 downto 0);  -- Interruptores deslizables
        boton_confirm : in  std_logic;                     -- Botón de confirmación
        reloj         : in  std_logic;                     -- Reloj del sistema
        
        -- Salidas
        puerta_abierta: out std_logic;                     -- Apertura de puerta
        alarma        : out std_logic                      -- Alarma policiaca
    );
end entity Sistema_seguridad;

architecture comportamiento of Sistema_seguridad is
    -- Constantes según los datos solicitados (codificación Aiken)
    constant ULTIMOS_4_DIGITOS : std_logic_vector(15 downto 0) := "0001100110011000"; -- 1998
    constant FECHA_NACIMIENTO  : std_logic_vector(7 downto 0)  := "01110110";         -- 07/06
    constant ANIO_NACIMIENTO   : std_logic_vector(15 downto 0) := "0010000000000001"; -- 2001
    
    -- Estados de la máquina de estados
    type estado_type is (ESPERA_DIGITO, GUARDA_DIGITO, VERIFICA_CODIGO, ABRE_PUERTA, ACTIVA_ALARMA, AMBAS_ACCIONES);
    signal estado_actual : estado_type := ESPERA_DIGITO;
    
    -- Registros para almacenar el código ingresado
    signal codigo_ingresado : std_logic_vector(15 downto 0) := (others => '0');
    signal contador_digitos : integer range 0 to 4 := 0;
    
    -- Señales para resultados de comparación
    signal coincide_ultimos4 : std_logic_vector(3 downto 0);
    signal coincide_fecha    : std_logic_vector(1 downto 0);
    signal coincide_anio     : std_logic_vector(3 downto 0);
    
begin
    -- Proceso para comparación de códigos
    proceso_comparacion: process(codigo_ingresado)
    begin
        -- Comparación 1 (1998)
        for i in 0 to 3 loop
            if codigo_ingresado(4*i+3 downto 4*i) = ULTIMOS_4_DIGITOS(4*i+3 downto 4*i) then
                coincide_ultimos4(i) <= '1';
            else
                coincide_ultimos4(i) <= '0';
            end if;
        end loop;
        
        -- Comparación 2 (07/06)
        for i in 0 to 1 loop
            if codigo_ingresado(4*i+3 downto 4*i) = FECHA_NACIMIENTO(4*i+3 downto 4*i) then
                coincide_fecha(i) <= '1';
            else
                coincide_fecha(i) <= '0';
            end if;
        end loop;
        
        -- Comparación 3 (2001)
        for i in 0 to 3 loop
            if codigo_ingresado(4*i+3 downto 4*i) = ANIO_NACIMIENTO(4*i+3 downto 4*i) then
                coincide_anio(i) <= '1';
            else
                coincide_anio(i) <= '0';
            end if;
        end loop;
    end process proceso_comparacion;
    
    -- Máquina de estados principal
    proceso_principal: process(reloj)
    begin
        if rising_edge(reloj) then
            case estado_actual is
                when ESPERA_DIGITO =>
                    puerta_abierta <= '0';
                    alarma <= '0';
                    if boton_confirm = '1' then
                        estado_actual <= GUARDA_DIGITO;
                    end if;
                    
                when GUARDA_DIGITO =>
                    -- Almacenar el dígito en formato Aiken
                    codigo_ingresado(4*contador_digitos+3 downto 4*contador_digitos) <= interruptores;
                    contador_digitos <= contador_digitos + 1;
                    
                    if contador_digitos = 3 then
                        estado_actual <= VERIFICA_CODIGO;
                    else
                        estado_actual <= ESPERA_DIGITO;
                    end if;
                    
                when VERIFICA_CODIGO =>
                    -- Verificar todas las condiciones
                    if (coincide_ultimos4 = "1111") then
                        estado_actual <= ABRE_PUERTA;
                    elsif (coincide_fecha = "11") then
                        estado_actual <= ACTIVA_ALARMA;
                    elsif (coincide_anio = "1111") then
                        estado_actual <= AMBAS_ACCIONES;
                    else
                        estado_actual <= ESPERA_DIGITO;  -- Código incorrecto, reiniciar
                        contador_digitos <= 0;
                        codigo_ingresado <= (others => '0');
                    end if;
                    
                when ABRE_PUERTA =>
                    puerta_abierta <= '1';
                    contador_digitos <= 0;
                    codigo_ingresado <= (others => '0');
                    estado_actual <= ESPERA_DIGITO;
                    
                when ACTIVA_ALARMA =>
                    alarma <= '1';
                    contador_digitos <= 0;
                    codigo_ingresado <= (others => '0');
                    estado_actual <= ESPERA_DIGITO;
                    
                when AMBAS_ACCIONES =>
                    puerta_abierta <= '1';
                    alarma <= '1';
                    contador_digitos <= 0;
                    codigo_ingresado <= (others => '0');
                    estado_actual <= ESPERA_DIGITO;
                    
            end case;
        end if;
    end process proceso_principal;
end architecture comportamiento;