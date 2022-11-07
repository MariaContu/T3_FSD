library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity traffic_filter is 
	port
	(
	ck, reset: in std_logic;
	din: in std_logic;
	prog: in std_logic_vector(2 downto 0);
	pattern: in std_logic_vector(7 downto 0);
	dout, alarm: out std_logic
	);
end entity; 

architecture traffic_filter of traffic_filter  is
	type StateType is (WAITING, WORKING, RISK, BLOCKED);
	signal st: StateType;
	signal cont: std_logic_vector(2 downto 0);
	signal regDin: std_logic_vector(7 downto 0);
	signal regPat: std_logic_vector(7 downto 0);
	signal comp: std_logic;
	signal valid: std_logic;
	signal match: std_logic;
	signal alarml: std_logic;
begin
	
	process(ck, reset)
	begin
		dout<=din;
		
		if reset = '1' then
			st<=WAITING;
			alarm<='0';
			valid<='0';
			match<='0';
			comp<='0';
				
		elsif ck'event and ck = '1' then
			
			regDin(0)<= din;
			regDin(7 downto 1)<= regDin(6 downto 0);
			
			

			case st is
				when WAITING =>
					if prog="001" then
						regPat<=pattern;
						valid<='1';
						
					end if;
					if prog="010" then
						st<=WORKING;
					end if;	

				when WORKING  =>
					
					if regDin=regPat then
						comp<='1';
					else
						comp<='0';
					end if;

					match<= comp and valid;
					alarml<=match;
					
						if prog="011" then
							st<=BLOCKED;
		
						elsif prog="101" then
							alarml<='0';
							valid<='0';
							st<=WAITING;
						end if;		

					if match='1' then
						cont<="000";
						st<=RISK;
					end if;		

				when RISK  =>
					if cont="011" then
						st<=WORKING;
						alarml<='0';
					else
						cont<=cont+1;	
					end if;



				when BLOCKED  =>
					alarm<='1';
					dout<='0';
					if prog="100" then
						st<=WORKING;
						elsif prog="101" then
							alarml<='0';
							valid<='0';
							st<=WAITING;
						
					end if;	

			end case;
		end if;
	end process;
end architecture;
