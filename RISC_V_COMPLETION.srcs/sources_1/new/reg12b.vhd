library ieee;
use ieee.std_logic_1164.all;

entity reg12b is
    port (
        reg_in : in std_logic_vector(11 downto 0);
        load, clock, clear : in std_logic;
        reg_out : out std_logic_vector(11 downto 0)
    );
end reg12b;

architecture description of reg12b is
    attribute extract_reset : string;
    attribute extract_enable : string;
    attribute extract_reset of reg_out: signal is "no";
    attribute extract_enable of reg_out: signal is "no";
    attribute keep_hierarchy : string;
    attribute keep_hierarchy of description : architecture is "yes";
begin
    process (clock, clear, load)
    begin
        if rising_edge(clock) then
            if (clear = '1') then
              reg_out <= "000000000000";
            elsif (load = '1') then
                reg_out <= reg_in;
            end if;
        end if;
    end process;
end description;