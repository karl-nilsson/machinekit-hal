-------------------------------------------------------------------------------
--
-- Copyright (C) 2005 Peter C. Wallace <pcw AT mesanet DOT com>
--
-- $RCSfile$
-- $Author$
-- $Locker$
-- $Revision$
-- $State$
-- $Date$
--
-------------------------------------------------------------------------------
--
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of version 2.1 of the GNU General
-- Public License as published by the Free Software Foundation.
-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111 USA
--
-- THE AUTHORS OF THIS LIBRARY ACCEPT ABSOLUTELY NO LIABILITY FOR
-- ANY HARM OR LOSS RESULTING FROM ITS USE.  IT IS _EXTREMELY_ UNWISE
-- TO RELY ON SOFTWARE ALONE FOR SAFETY.  Any machinery capable of
-- harming persons must have provisions for completely removing power
-- from all motors, etc, before persons enter any danger area.  All
-- machinery must be designed to comply with local and national safety
-- codes, and the authors of this software can not, and do not, take
-- any responsibility for such compliance.
--
-- This code was written as part of the EMC HAL project.  For more
-- information, go to www.linuxcnc.org.
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity indexreg is
   port (
	clk: in STD_LOGIC;
	ibus: in STD_LOGIC_VECTOR (15 downto 0);
	obus: out STD_LOGIC_VECTOR (15 downto 0);
	loadindex: in STD_LOGIC;
	readindex: in STD_LOGIC;
	index: out STD_LOGIC_VECTOR (7 downto 0)
	);
end indexreg;

architecture behavioral of indexreg is


signal indexreg: STD_LOGIC_VECTOR (7 downto 0);

begin
	aindexreg: process(clk, 
	 					
							ibus,
							loadindex,
							readindex,
							indexreg
							)
							
	begin
		if clk'event and clk = '1' then
			if loadindex = '1' then
 		   	indexreg <=  ibus(7 downto 0);
			end if;	
		end if;
		if readindex = '1' then
			obus(7 downto 0) <= indexreg;
			obus(15 downto 8) <= "ZZZZZZZZ";
		else
			obus <= "ZZZZZZZZZZZZZZZZ";
		end if;
	index <= indexreg;
	end process;
end behavioral;

