# Add port labels for lzc16
# Inputs A0-A15 on left boundary (x=-19 lambda)
# Outputs Y0-Y4 on right boundary

# Y positions for each label (spread evenly across layout height)
# Layout height = 7 rows x 340 = 2380 lambda
# Distribute 16 inputs from y=0 to y=2380

set inputs {A0 A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12 A13 A14 A15}
set outputs {Y0 Y1 Y2 Y3 Y4}

set h 2380
set n_in [llength $inputs]
set n_out [llength $outputs]

# Draw input ports on left side
for {set i 0} {$i < $n_in} {incr i} {
    set name [lindex $inputs $i]
    set y [expr {int($i * $h / $n_in) + 20}]
    box -19 $y -9 [expr {$y + 20}]
    paint m1
    label $name w m1
    port class input
    port use signal
}

# Draw output ports on right side
for {set i 0} {$i < $n_out} {incr i} {
    set name [lindex $outputs $i]
    set y [expr {int($i * $h / $n_out) + 20}]
    box 2686 $y 2696 [expr {$y + 20}]
    paint m1
    label $name e m1
    port class output
    port use signal
}

puts "Port labels added: 16 inputs + 5 outputs"
