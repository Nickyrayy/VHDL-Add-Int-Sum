library ieee;
-- Standard library for std_logic and std_logic_vector types
use ieee.std_logic_1164.all;
-- Standard library for unsigned/signed arithmetic (e.g., '+')
use ieee.numeric_std.all;

-- Entity Declaration: Defines the inputs and outputs of the module.
entity add is
    port (
        -- 'a' is a 4-bit input signal (operand 1)
        a : in std_logic_vector(3 downto 0);
        -- 'b' is a 4-bit input signal (operand 2)
        b : in std_logic_vector(3 downto 0);
        -- 'sum' is a 5-bit output signal to hold the result.
        -- The result is 5 bits to accommodate overflow (4 + 4 = 8, which fits in 5 bits)
        sum : out std_logic_vector(4 downto 0)
    );
end entity;

-- Architecture: Defines the internal behavior of the 'add' entity.
architecture behavioral of add is
begin
    process (a, b)
    begin
        sum <= std_logic_vector(unsigned('0' & a) + unsigned(b));

        -- Breaking down the line above:

        -- 1. '0' & a:              Concatenates a '0' to the front of vector 'a',
        --                          extending it from 4 bits to 5 bits to make space for the carry.
        --
        -- 2. unsigned(...):        Type-casts the std_logic_vector inputs to the 'unsigned' type
        --                          so that arithmetic can be performed. The 'b' input is
        --                          automatically promoted to 5 bits to match the size of 'a'.
        --
        -- 4. std_logic_vector():   Casts the 5-bit unsigned result back to a
        --                          std_logic_vector so it can be assigned to the 'sum' output port.

    end process;
end architecture;