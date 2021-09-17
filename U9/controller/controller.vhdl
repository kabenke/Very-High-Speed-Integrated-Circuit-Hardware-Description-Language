-- Some portions of this code are based on code from the book "Digital Design and Computer Architecture" by Harris and Harris.
-- For educational purposes in TU Dortmund only.

library ieee;
use ieee.std_logic_1164.all;

entity controller is
  port(
    op: in std_logic_vector(5 downto 0);
    funct: in std_logic_vector(5 downto 0);
    zero: in std_logic;
    memtoreg: out std_logic;
    memwrite: out std_logic;
    pcsrc: out std_logic;
    alusrc: out std_logic;
    regdst: out std_logic;
    regwrite: out std_logic;
    jump: out std_logic;
    alucontrol: out std_logic_vector(2 downto 0)
  );
end;

architecture structure of controller is
  component maindec
    port(
      op: in std_logic_vector(5 downto 0);
      memtoreg: out std_logic;
      memwrite: out std_logic;
      branch: out std_logic;
      alusrc: out std_logic;
      regdst: out std_logic;
      regwrite: out std_logic;
      jump: out std_logic;
      aluop: out std_logic_vector(1 downto 0)
    );
  end component;

  component aludec
    port(
      funct: in std_logic_vector(5 downto 0);
      aluop: in std_logic_vector(1 downto 0);
      alucontrol: out std_logic_vector(2 downto 0)
    );
  end component;
  signal aluop: std_logic_vector(1 downto 0);
  signal branch: std_logic;
begin
  md: maindec port map(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
  ad: aludec port map(funct, aluop, alucontrol);
  pcsrc <= branch and zero;
end;
