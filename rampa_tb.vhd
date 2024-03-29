-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\Windows\Documents\Practicas MATLAB\Rampa\rampa\rampa_tb.vhd
-- Created: 2022-05-08 12:34:16
-- 
-- Generated by MATLAB 9.2 and HDL Coder 3.10
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 0.001
-- Target subsystem base rate: 0.001
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rampa_tb
-- Source Path: 
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_textio.ALL;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY STD;
USE STD.textio.ALL;
LIBRARY work;
USE work.rampa_pkg.ALL;
USE work.rampa_tb_pkg.ALL;

ENTITY rampa_tb IS
END rampa_tb;


ARCHITECTURE rtl OF rampa_tb IS

  -- Component Declarations
  COMPONENT rampa
    PORT( clk                             :   IN    std_logic;
          in1                             :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          out_rsvd                        :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En10
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rampa
    USE ENTITY work.rampa(rtl);

  -- Signals
  SIGNAL clk                              : std_logic;
  SIGNAL reset                            : std_logic;
  SIGNAL enb                              : std_logic;
  SIGNAL out_rsvd_done                    : std_logic;  -- ufix1
  SIGNAL rdEnb                            : std_logic;
  SIGNAL out_rsvd_done_enb                : std_logic;  -- ufix1
  SIGNAL out_rsvd_addr                    : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL out_rsvd_active                  : std_logic;  -- ufix1
  SIGNAL check1_done                      : std_logic;  -- ufix1
  SIGNAL snkDonen                         : std_logic;
  SIGNAL resetn                           : std_logic;
  SIGNAL tb_enb                           : std_logic;
  SIGNAL ce_out                           : std_logic;
  SIGNAL out_rsvd_enb                     : std_logic;  -- ufix1
  SIGNAL out_rsvd_lastAddr                : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_addr   : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL Data_Type_Conversion_out1_active : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_enb    : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_addr_delay_1 : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL rawData_in1                      : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL holdData_in1                     : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL in1_offset                       : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL in1                              : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL in1_1                            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL out_rsvd                         : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL out_rsvd_signed                  : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL out_rsvd_addr_delay_1            : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL out_rsvd_expected                : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL out_rsvd_ref                     : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL out_rsvd_testFailure             : std_logic;  -- ufix1

BEGIN
  u_rampa : rampa
    PORT MAP( clk => clk,
              in1 => in1_1,  -- sfix16_En10
              out_rsvd => out_rsvd  -- sfix16_En10
              );

  out_rsvd_done_enb <= out_rsvd_done AND rdEnb;

  
  out_rsvd_active <= '1' WHEN out_rsvd_addr /= to_unsigned(16#2710#, 14) ELSE
      '0';

  enb <= rdEnb AFTER 2 ns;

  snkDonen <=  NOT check1_done;

  clk_gen: PROCESS 
  BEGIN
    clk <= '1';
    WAIT FOR 5 ns;
    clk <= '0';
    WAIT FOR 5 ns;
    IF check1_done = '1' THEN
      clk <= '1';
      WAIT FOR 5 ns;
      clk <= '0';
      WAIT FOR 5 ns;
      WAIT;
    END IF;
  END PROCESS clk_gen;

  reset_gen: PROCESS 
  BEGIN
    reset <= '1';
    WAIT FOR 20 ns;
    WAIT UNTIL clk'event AND clk = '1';
    WAIT FOR 2 ns;
    reset <= '0';
    WAIT;
  END PROCESS reset_gen;

  resetn <=  NOT reset;

  tb_enb <= resetn AND snkDonen;

  
  rdEnb <= tb_enb WHEN check1_done = '0' ELSE
      '0';

  ce_out <= enb AND (rdEnb AND tb_enb);

  out_rsvd_enb <= ce_out AND out_rsvd_active;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 10000
  c_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        out_rsvd_addr <= to_unsigned(16#0000#, 14);
      ELSIF out_rsvd_enb = '1' THEN
        IF out_rsvd_addr = to_unsigned(16#2710#, 14) THEN 
          out_rsvd_addr <= to_unsigned(16#0000#, 14);
        ELSE 
          out_rsvd_addr <= out_rsvd_addr + to_unsigned(16#0001#, 14);
        END IF;
      END IF;
    END IF;
  END PROCESS c_3_process;


  
  out_rsvd_lastAddr <= '1' WHEN out_rsvd_addr >= to_unsigned(16#2710#, 14) ELSE
      '0';

  out_rsvd_done <= out_rsvd_lastAddr AND resetn;

  -- Delay to allow last sim cycle to complete
  checkDone_1_process: PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset = '1' THEN
        check1_done <= '0';
      ELSIF out_rsvd_done_enb = '1' THEN
        check1_done <= out_rsvd_done;
      END IF;
    END IF;
  END PROCESS checkDone_1_process;

  
  Data_Type_Conversion_out1_active <= '1' WHEN Data_Type_Conversion_out1_addr /= to_unsigned(16#2710#, 14) ELSE
      '0';

  Data_Type_Conversion_out1_enb <= Data_Type_Conversion_out1_active AND (rdEnb AND tb_enb);

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 10000
  DataTypeConversion_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Data_Type_Conversion_out1_addr <= to_unsigned(16#0000#, 14);
      ELSIF Data_Type_Conversion_out1_enb = '1' THEN
        IF Data_Type_Conversion_out1_addr = to_unsigned(16#2710#, 14) THEN 
          Data_Type_Conversion_out1_addr <= to_unsigned(16#0000#, 14);
        ELSE 
          Data_Type_Conversion_out1_addr <= Data_Type_Conversion_out1_addr + to_unsigned(16#0001#, 14);
        END IF;
      END IF;
    END IF;
  END PROCESS DataTypeConversion_process;


  Data_Type_Conversion_out1_addr_delay_1 <= Data_Type_Conversion_out1_addr AFTER 1 ns;

  -- Data source for in1
  in1_fileread: PROCESS (Data_Type_Conversion_out1_addr_delay_1, tb_enb, rdEnb)
    FILE fp: TEXT open READ_MODE is "in1.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic_vector(15 DOWNTO 0);

  BEGIN
    IF tb_enb /= '1' THEN
    ELSIF rdEnb = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      HREAD(l, read_data);
    END IF;
    rawData_in1 <= signed(read_data(15 DOWNTO 0));
  END PROCESS in1_fileread;

  -- holdData reg for Data_Type_Conversion_out1
  stimuli_Data_Type_Conversion_out1_process: PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset = '1' THEN
        holdData_in1 <= (OTHERS => 'X');
      ELSE
        holdData_in1 <= rawData_in1;
      END IF;
    END IF;
  END PROCESS stimuli_Data_Type_Conversion_out1_process;

  stimuli_Data_Type_Conversion_out1_1: PROCESS (rawData_in1, rdEnb)
  BEGIN
    IF rdEnb = '0' THEN
      in1_offset <= holdData_in1;
    ELSE
      in1_offset <= rawData_in1;
    END IF;
  END PROCESS stimuli_Data_Type_Conversion_out1_1;

  in1 <= in1_offset AFTER 2 ns;

  in1_1 <= std_logic_vector(in1);

  out_rsvd_signed <= signed(out_rsvd);

  out_rsvd_addr_delay_1 <= out_rsvd_addr AFTER 1 ns;

  -- Data source for out_rsvd_expected
  out_rsvd_expected_fileread: PROCESS (out_rsvd_addr_delay_1, tb_enb, rdEnb)
    FILE fp: TEXT open READ_MODE is "out_rsvd_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic_vector(15 DOWNTO 0);

  BEGIN
    IF tb_enb /= '1' THEN
    ELSIF rdEnb = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      HREAD(l, read_data);
    END IF;
    out_rsvd_expected <= signed(read_data(15 DOWNTO 0));
  END PROCESS out_rsvd_expected_fileread;

  out_rsvd_ref <= out_rsvd_expected;

  out_rsvd_signed_checker: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      out_rsvd_testFailure <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF ce_out = '1' AND out_rsvd_signed /= out_rsvd_ref THEN
        out_rsvd_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in out_rsvd_signed: Expected " & to_hex(out_rsvd_ref) & (" Actual " & to_hex(out_rsvd_signed))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS out_rsvd_signed_checker;

  completed_msg: PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF check1_done = '1' THEN
        IF out_rsvd_testFailure = '0' THEN
          ASSERT FALSE
            REPORT "**************TEST COMPLETED (PASSED)**************"
            SEVERITY NOTE;
        ELSE
          ASSERT FALSE
            REPORT "**************TEST COMPLETED (FAILED)**************"
            SEVERITY NOTE;
        END IF;
      END IF;
    END IF;
  END PROCESS completed_msg;

END rtl;

