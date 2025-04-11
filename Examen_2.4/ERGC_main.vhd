library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sistema_seguridad is
    Port (
        CLK         : in  STD_LOGIC;
        RESET       : in  STD_LOGIC;
        SW          : in  STD_LOGIC_VECTOR(3 downto 0); -- Interruptores
        BTN         : in  STD_LOGIC; -- Botón de confirmación
        OPEN_DOOR   : out STD_LOGIC;
        ALARM       : out STD_LOGIC
    );
end sistema_seguridad;

architecture Behavioral of sistema_seguridad is

    type vector_digitos is array(0 to 3) of STD_LOGIC_VECTOR(3 downto 0);
    signal input_digits : vector_digitos;
    signal count        : integer range 0 to 4 := 0;
    signal btn_last     : STD_LOGIC := '0';

    -- Aiken a binario
    function aiken_to_bin(aiken : STD_LOGIC_VECTOR(3 downto 0)) return STD_LOGIC_VECTOR is
        variable bin : STD_LOGIC_VECTOR(3 downto 0);
    begin
        case aiken is
            when "0000" => bin := "0000"; -- 0
            when "0001" => bin := "0001"; -- 1
            when "0010" => bin := "0010"; -- 2
            when "0011" => bin := "0011"; -- 3
            when "0100" => bin := "0100"; -- 4
            when "1011" => bin := "0101"; -- 5
            when "1100" => bin := "0110"; -- 6
            when "1101" => bin := "0111"; -- 7
            when "1110" => bin := "1000"; -- 8
            when "1111" => bin := "1001"; -- 9
            when others => bin := "1111"; -- inválido
        end case;
        return bin;
    end function;

    signal bin_digits : vector_digitos;
    signal match_door  : boolean := false;
    signal match_alarm : boolean := false;

begin

    process(CLK, RESET)
    begin
        if RESET = '1' then
            count <= 0;
            OPEN_DOOR <= '0';
            ALARM <= '0';
            match_door <= false;
            match_alarm <= false;
        elsif rising_edge(CLK) then
            -- Detección de flanco para botón
            if BTN = '1' and btn_last = '0' then
                if count < 4 then
                    input_digits(count) <= SW;
                    count <= count + 1;
                end if;
            end if;
            btn_last <= BTN;

            -- Verificar código una vez ingresados los 4 dígitos
            if count = 4 then
                -- Convertir todos los dígitos a binario desde Aiken
                for i in 0 to 3 loop
                    bin_digits(i) <= aiken_to_bin(input_digits(i));
                end loop;

                -- Comparación contra códigos esperados:
                if bin_digits(0) = "0001" and -- 1
                   bin_digits(1) = "1001" and -- 9
                   bin_digits(2) = "1001" and -- 9
                   bin_digits(3) = "1000" then -- 8
                    match_door <= true;
                elsif bin_digits(0) = "0000" and -- 0
                      bin_digits(1) = "1111" and -- 7
                      bin_digits(2) = "0000" and -- 0
                      bin_digits(3) = "0110" then -- 6
                    match_alarm <= true;
                elsif bin_digits(0) = "0010" and -- 2
                      bin_digits(1) = "0000" and -- 0
                      bin_digits(2) = "0000" and -- 0
                      bin_digits(3) = "0001" then -- 1
                    match_door <= true;
                    match_alarm <= true;
                end if;

                -- Actualizar salidas
                if match_door then
                    OPEN_DOOR <= '1';
                end if;
                if match_alarm then
                    ALARM <= '1';
                end if;

                -- Esperar reinicio para volver a iniciar proceso
            end if;
        end if;
    end process;

end Behavioral;