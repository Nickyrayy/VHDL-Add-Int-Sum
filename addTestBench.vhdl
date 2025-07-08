library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity Declaration for the testbench.
-- It's empty because a testbench has no external inputs or outputs.
entity add_tb is
end entity;

architecture test of add_tb is
    -- Signal Declarations
    -- These signals will connect to the inputs and outputs of the component being tested.
    signal a : std_logic_vector(3 downto 0) := "0000";
    signal b : std_logic_vector(3 downto 0) := "0000";
    signal sum : std_logic_vector(4 downto 0);

    -- Component Declaration
    -- This defines the interface of the 'add' entity we want to test.
    -- It must match the entity declaration in 'add.vhdl'.
    component add is
        port (
            a : in std_logic_vector(3 downto 0);
            b : in std_logic_vector(3 downto 0);
            sum : out std_logic_vector(4 downto 0)
        );
    end component;

begin
    -- Component Instantiation
    -- This creates an instance of the 'add' component, called the 'Unit Under Test' (UUT).
    uut: add
        port map (
            -- Connects the testbench signals to the UUT's ports.
            a => a,
            b => b,
            sum => sum
        );
    -- Stimulus Process
    -- This process defines the sequence of inputs to test the UUT.

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

        -- Print a message to the simulator console to show the test is complete.
        assert false report "Executed Test Bench" severity note;

        -- Halt the process indefinitely. This stops the simulation from looping.
        wait;
    end process;
end architecture;