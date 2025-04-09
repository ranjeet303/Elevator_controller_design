###################################################################

# Created by write_sdc on Thu Mar 27 18:08:29 2025

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_load -pin_load 1 [get_ports {Request_Floor[3]}]
set_load -pin_load 1 [get_ports {Request_Floor[2]}]
set_load -pin_load 1 [get_ports {Request_Floor[1]}]
set_load -pin_load 1 [get_ports {Request_Floor[0]}]
set_load -pin_load 1 [get_ports {In_Current_Floor[3]}]
set_load -pin_load 1 [get_ports {In_Current_Floor[2]}]
set_load -pin_load 1 [get_ports {In_Current_Floor[1]}]
set_load -pin_load 1 [get_ports {In_Current_Floor[0]}]
set_load -pin_load 1 [get_ports Over_Weight]
set_load -pin_load 1 [get_ports Door_Open]
set_load -pin_load 1 [get_ports Floor_Sensor]
set_load -pin_load 1 [get_ports clk]
set_load -pin_load 1 [get_ports reset]
create_clock [get_ports clk]  -period 100  -waveform {0 50}
set_clock_uncertainty -setup 0.7  [get_clocks clk]
set_clock_uncertainty -hold 0.5  [get_clocks clk]
set_input_delay 0.2  [get_ports clk]
set_input_delay 0.2  [get_ports {Request_Floor[3]}]
set_input_delay 0.2  [get_ports {Request_Floor[2]}]
set_input_delay 0.2  [get_ports {Request_Floor[1]}]
set_input_delay 0.2  [get_ports {Request_Floor[0]}]
set_input_delay 0.2  [get_ports {In_Current_Floor[3]}]
set_input_delay 0.2  [get_ports {In_Current_Floor[2]}]
set_input_delay 0.2  [get_ports {In_Current_Floor[1]}]
set_input_delay 0.2  [get_ports {In_Current_Floor[0]}]
set_input_delay 0.2  [get_ports Over_Weight]
set_input_delay 0.2  [get_ports Door_Open]
set_input_delay 0.2  [get_ports Floor_Sensor]
set_input_delay 0.2  [get_ports reset]
set_output_delay 0.2  [get_ports {Out_Current_Floor[3]}]
set_output_delay 0.2  [get_ports {Out_Current_Floor[2]}]
set_output_delay 0.2  [get_ports {Out_Current_Floor[1]}]
set_output_delay 0.2  [get_ports {Out_Current_Floor[0]}]
set_output_delay 0.2  [get_ports Direction]
set_output_delay 0.2  [get_ports Complete]
set_output_delay 0.2  [get_ports Door_Alert]
set_output_delay 0.2  [get_ports Weight_Alert]
