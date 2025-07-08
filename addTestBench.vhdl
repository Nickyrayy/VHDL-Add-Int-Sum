library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity add_tb is
end entity;

architecture test of add_tb is
    signal a : std_logic_vector(3 downto 0) := "0000";
    signal b : std_logic_vector(3 downto 0) := "0000";
    signal sum : std_logic_vector(4 downto 0);

    component add is
        port (
            a : in std_logic_vector(3 downto 0);
            b : in std_logic_vector(3 downto 0);
            sum : out std_logic_vector(4 downto 0)
        );
    end component;

begin
    uut: add
        port map (
            a => a,
            b => b,
            sum => sum
        );

    -- Test cases
    process
    begin
        -- Test case 1
        a <= "0001";
        b <= "0001";
        wait for 10 ns;

        -- Test case 2
        a <= "0010";
        b <= "0011";
        wait for 10 ns;

        -- Test case 3
        a <= "1111";
        b <= "0001";
        wait for 10 ns;

        assert false report "Executed Test Bench" severity note;
        wait;
    end process;

end architecture;