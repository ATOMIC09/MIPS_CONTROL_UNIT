-- Formatted by https://github.com/g2384/VHDLFormatter?tab=readme-ov-file

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MIPS_CONTROL_UNIT IS
    PORT (
        Instruction : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
        RegDst : OUT STD_LOGIC;
        Jump : OUT STD_LOGIC;
        Branch : OUT STD_LOGIC;
        MemtoReg : OUT STD_LOGIC;
        MemRead : OUT STD_LOGIC;
        ALUOp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        MemWrite : OUT STD_LOGIC;
        ALUSrc : OUT STD_LOGIC;
        RegWrite : OUT STD_LOGIC
    );
END MIPS_CONTROL_UNIT;

ARCHITECTURE Behavioral OF MIPS_CONTROL_UNIT IS
BEGIN
    RegDst <= NOT Instruction(1);
    Jump <= (NOT Instruction(5)) AND Instruction(1);
    Branch <= Instruction(2);
    MemtoReg <= Instruction(0);
    MemRead <= (NOT Instruction(3)) AND Instruction(0);
    ALUOp(1) <= (NOT Instruction(2)) AND (NOT Instruction(1));
    ALUOp(0) <= Instruction(2);
    MemWrite <= Instruction(3);
    ALUSrc <= Instruction(0);
    RegWrite <= ((NOT Instruction(2)) AND (NOT Instruction(1))) OR ((NOT Instruction(3)) AND Instruction(0));
END Behavioral;