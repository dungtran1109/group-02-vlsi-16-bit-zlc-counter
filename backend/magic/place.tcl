set OR2  536
set INV  352
set AND2 536
set MUX2 904
set ROW  640

proc place {name x y} {
    global OR2 INV AND2 MUX2
    box $x $y [expr $x+1] [expr $y+1]
    getcell sky130_fd_sc_hd__$name
    switch -exact -- $name {
        "or2_1"  { return [expr $x + $OR2]  }
        "inv_1"  { return [expr $x + $INV]  }
        "and2_1" { return [expr $x + $AND2] }
        "mux2_1" { return [expr $x + $MUX2] }
    }
}

set x 0; set y 0
for {set i 0} {$i < 4} {incr i} {
    set x [place or2_1 $x $y]
    set x [place inv_1 $x $y]
}
puts "Row 1: $x"

set x 0; set y $ROW
for {set i 0} {$i < 4} {incr i} {
    set x [place or2_1 $x $y]
    set x [place inv_1 $x $y]
}
puts "Row 2: $x"

set x 0; set y [expr 2*$ROW]
for {set i 0} {$i < 2} {incr i} {
    set x [place or2_1 $x $y]
    set x [place inv_1 $x $y]
    set x [place mux2_1 $x $y]
}
puts "Row 3: $x"

set x 0; set y [expr 3*$ROW]
for {set i 0} {$i < 2} {incr i} {
    set x [place or2_1 $x $y]
    set x [place inv_1 $x $y]
    set x [place mux2_1 $x $y]
}
puts "Row 4: $x"

set x 0; set y [expr 4*$ROW]
for {set i 0} {$i < 2} {incr i} {
    set x [place or2_1 $x $y]
    set x [place inv_1 $x $y]
    set x [place mux2_1 $x $y]
    set x [place mux2_1 $x $y]
}
puts "Row 5: $x"

set x 0; set y [expr 5*$ROW]
set x [place or2_1 $x $y]
set x [place inv_1 $x $y]
for {set i 0} {$i < 3} {incr i} {
    set x [place mux2_1 $x $y]
}
puts "Row 6: $x"

set x 0; set y [expr 6*$ROW]
set x [place inv_1 $x $y]
for {set i 0} {$i < 4} {incr i} {
    set x [place and2_1 $x $y]
}
puts "Row 7: $x"

view
puts "Done!"
