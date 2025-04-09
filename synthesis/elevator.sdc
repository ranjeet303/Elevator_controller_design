create_clock -name clk -period 100 -waveform {0 50} clk
set_clock_uncertainty -setup 0.7 [get_clocks clk]
set_clock_uncertainty -hold 0.5 [get_clocks clk]
set_clock_transition 0.1 [get_clocks clk]
set_input_delay -max 1.0 -clock clk [all_inputs]
set_output_delay -max 1.0 -clock clk [all_inputs]
