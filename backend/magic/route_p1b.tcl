proc contact {x y} {
    box [expr $x-6] [expr $y-6] [expr $x+6] [expr $y+6]
    paint locali   ;# touch subcell's locali pin
    paint mcon     ;# via locali->m1
    paint m1
}

proc hm1 {x1 y x2} {
    box $x1 [expr $y-6] $x2 [expr $y+6]
    paint m1
}

proc vm1 {x y1 y2} {
    box [expr $x-6] $y1 [expr $x+6] $y2
    paint m1
}

proc route_lzc2 {Tx Ty} {
    set ox [expr $Tx + 207]
    set oy [expr $Ty + 187]
    set ix [expr $Tx + 313]
    set iy [expr $Ty + 119]
    contact $ox $oy
    vm1 $ox $iy $oy
    hm1 $ox $iy $ix
    contact $ix $iy
}

route_lzc2 0    0
route_lzc2 444  0
route_lzc2 888  0
route_lzc2 1332 0
route_lzc2 0    340
route_lzc2 444  340
route_lzc2 888  340
route_lzc2 1332 340
puts "Phase 1b done"
