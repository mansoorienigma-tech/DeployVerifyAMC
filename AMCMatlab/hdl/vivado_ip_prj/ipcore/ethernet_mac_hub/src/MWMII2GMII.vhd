
-- ----------------------------------------------
-- File Name: MWMII2GMII.vhd
-- Created:   09-Sep-2019 17:18:52
-- Copyright  2019 MathWorks, Inc.
-- ----------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;


ENTITY mwmii2gmii IS 
PORT (
        rxclk    : in std_logic;
        txclk    : in std_logic;
        reset    : in std_logic;
		mii_rxdv : in std_logic;
		mii_rxer : in std_logic;
		mii_col  : in std_logic;
		mii_crs  : in std_logic;
		mii_rxd  : in std_logic_vector(3 downto 0);
		mii_txd  : out std_logic_vector(3 downto 0);
		mii_txen : out std_logic;
		mii_txer : out std_logic;
		rxdvld   : out std_logic;
		txerror  : in std_logic;
		rxerror  : out std_logic;
		rxd      : out std_logic_vector(7 downto 0);
		col      : out std_logic;
		crs      : out std_logic;
		txen     : in std_logic;
		txd      : in std_logic_vector(7 downto 0);
		txclk_en : out std_logic;
		rxclk_en : out std_logic);
END mwmii2gmii;

ARCHITECTURE rtl of mwmii2gmii IS

signal txclk_en_tmp: std_logic;
signal rxclk_en_tmp: std_logic;
signal mii_rxd_d1: std_logic_vector(3 downto 0);
signal rxdvld_tmp: std_logic;

BEGIN

	txclk_en <= txclk_en_tmp;
	rxclk_en <= rxclk_en_tmp;

	process(rxclk)
	begin
		if rxclk'event and rxclk = '1' then
			mii_rxd_d1	<=mii_rxd;
			-- pos edge of rxdv
			if mii_rxdv = '1' and rxdvld_tmp = '0' then 
				rxclk_en_tmp <= '0';
			else
				rxclk_en_tmp <= not rxclk_en_tmp;		
		   end if;
			if rxclk_en_tmp = '0' then
				rxd(3 downto 0) <= mii_rxd_d1;
				rxd(7 downto 4) <= mii_rxd;
			end if;		
		end if;
	end process;
	
	rxdvld <= rxdvld_tmp;
	
 PROCESS (rxclk, reset)
  BEGIN -- PROCESS
   IF reset = '1' THEN
       rxdvld_tmp      <= '0';
   ELSIF rxclk'EVENT AND rxclk = '1' THEN 
       rxdvld_tmp      <= mii_rxdv;
   END IF;
 END PROCESS;

 PROCESS (rxclk, reset)
  BEGIN -- PROCESS
   IF reset = '1' THEN
			rxerror      <= '0';
   ELSIF rxclk'EVENT AND rxclk = '1' THEN 
			rxerror      <= mii_rxer;
   END IF;
 END PROCESS;

 PROCESS (rxclk, reset)
  BEGIN -- PROCESS
   IF reset = '1' THEN
		 col      <= '0';
   ELSIF rxclk'EVENT AND rxclk = '1' THEN 
       col      <= mii_col;
   END IF;
 END PROCESS;

 PROCESS (rxclk, reset)
  BEGIN -- PROCESS
   IF reset = '1' THEN
		 crs      <= '0';
   ELSIF rxclk'EVENT AND rxclk = '1' THEN 
       crs      <= mii_crs;
   END IF;
 END PROCESS;

 PROCESS (txclk, reset)
  BEGIN -- PROCESS
   IF reset = '1' THEN
		 mii_txen      <= '0';
   ELSIF txclk'EVENT AND txclk = '1' THEN 
       mii_txen      <= txen;
   END IF;
 END PROCESS;

 PROCESS (txclk, reset)
  BEGIN -- PROCESS
   IF reset = '1' THEN
		 mii_txer      <= '0';
   ELSIF txclk'EVENT AND txclk = '1' THEN 
       mii_txer      <= txerror;
   END IF;
 END PROCESS;	

	process(txclk,reset)
	begin
		if reset = '1' then
			txclk_en_tmp <= '0';
		elsif txclk'event and txclk = '1' then
			txclk_en_tmp <= not txclk_en_tmp;
			if txclk_en_tmp = '0' then
				mii_txd <= txd(3 downto 0);
			else
				mii_txd <= txd(7 downto 4);
			end if;
		end if;
	end process;
 
END;
