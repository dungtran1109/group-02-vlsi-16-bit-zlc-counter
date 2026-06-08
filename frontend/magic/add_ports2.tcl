proc add_port {name x1 y1 x2 y2 side pclass} {
    box $x1 $y1 $x2 $y2
    paint m1
    label $name $side m1
    port make
    port class $pclass
    port use signal
}

set inputs {A0 A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12 A13 A14 A15}
set outputs {Y0 Y1 Y2 Y3 Y4}
set h 2380

set n [llength $inputs]
for {set i 0} {$i < $n} {incr i} {
    set name [lindex $inputs $i]
    set y [expr {int($i * $h / $n) + 20}]
    add_port $name -50 $y -30 [expr {$y+20}] w input
}

set n2 [llength $outputs]
for {set i 0} {$i < $n2} {incr i} {
    set name [lindex $outputs $i]
    set y [expr {int($i * $h / $n2) + 20}]
    add_port $name 2710 $y 2730 [expr {$y+20}] e output
}

puts "Done: 16 inputs + 5 outputs"
