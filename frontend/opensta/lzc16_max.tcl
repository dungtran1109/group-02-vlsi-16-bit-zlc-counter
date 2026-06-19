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
create_clock -name clk -period 1.51

# 16 input ports (bus form, matching Xschem netlist: input wire [15:0] A)
set inputs [get_ports {A[15] A[14] A[13] A[12] A[11] A[10] A[9] A[8] A[7] A[6] A[5] A[4] A[3] A[2] A[1] A[0]}]
set_input_delay -max  0.0  -clock clk $inputs
set_input_delay -min  0.0  -clock clk $inputs

# 5 output ports (bus form, matching Xschem netlist: output wire [4:0] Y)
set outputs [get_ports {Y[4] Y[3] Y[2] Y[1] Y[0]}]
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
