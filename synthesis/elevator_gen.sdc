###################################################################

# Created by write_sdc on Wed Mar 26 18:54:10 2025

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
create_clock [get_ports clk]  -period 100  -waveform {0 50}
set_clock_uncertainty -setup 0.7  [get_clocks clk]
set_clock_uncertainty -hold 0.5  [get_clocks clk]
set_clock_transition -min -fall 0.1 [get_clocks clk]
set_clock_transition -min -rise 0.1 [get_clocks clk]
set_clock_transition -max -fall 0.1 [get_clocks clk]
set_clock_transition -max -rise 0.1 [get_clocks clk]
set_input_delay -clock clk  -max 1  [get_ports clk]
set_input_delay -clock clk  -max 1  [get_ports {Request_Floor[3]}]
set_input_delay -clock clk  -max 1  [get_ports {Request_Floor[2]}]
set_input_delay -clock clk  -max 1  [get_ports {Request_Floor[1]}]
set_input_delay -clock clk  -max 1  [get_ports {Request_Floor[0]}]
set_input_delay -clock clk  -max 1  [get_ports {In_Current_Floor[3]}]
set_input_delay -clock clk  -max 1  [get_ports {In_Current_Floor[2]}]
set_input_delay -clock clk  -max 1  [get_ports {In_Current_Floor[1]}]
set_input_delay -clock clk  -max 1  [get_ports {In_Current_Floor[0]}]
set_input_delay -clock clk  -max 1  [get_ports Over_Weight]
set_input_delay -clock clk  -max 1  [get_ports Door_Open]
set_input_delay -clock clk  -max 1  [get_ports Floor_Sensor]
set_input_delay -clock clk  -max 1  [get_ports reset]
