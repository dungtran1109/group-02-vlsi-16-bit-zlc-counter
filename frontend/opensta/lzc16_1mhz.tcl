# -----------------------------------------------------------
# LOAD CIRCUIT & LIBRARY
# -----------------------------------------------------------
read_liberty /usr/local/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog lzc16.v
link_design lzc16

# -----------------------------------------------------------
# CONSTRAINTS
# -----------------------------------------------------------
# Virtual clock 10 ns = 100 MHz
create_clock -name clk -period 1000.0

# 16 scalar input ports
set inputs [get_ports {A15 A14 A13 A12 A11 A10 A9 A8 A7 A6 A5 A4 A3 A2 A1 A0}]
set_input_delay -max  0.0  -clock clk $inputs
set_input_delay -min  0.0  -clock clk $inputs

# 5 scalar output ports
set outputs [get_ports {Y4 Y3 Y2 Y1 Y0}]
set_output_delay -max  0.2  -clock clk $outputs
set_output_delay -min -0.02 -clock clk $outputs

# Driving cell + load
set_driving_cell -cell sky130_fd_sc_hd__inv_2 -pin Y $inputs
set_load 0.01 $outputs

# -----------------------------------------------------------
# ANALYSIS
# -----------------------------------------------------------
report_units
report_checks -path_delay max -fields {slew cap input fanout} -format full_clock_expanded
report_checks -path_delay min -fields {slew cap input fanout} -format full_clock_expanded
report_wns
report_tns
report_power
exit
