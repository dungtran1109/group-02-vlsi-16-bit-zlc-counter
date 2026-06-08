# Reuse procs from p1b (must source p1b first, or redefine)
proc contact {x y} {
    box [expr $x-6] [expr $y-6] [expr $x+6] [expr $y+6]
    paint locali; paint mcon; paint m1
}
proc hm1 {x1 y x2} { box $x1 [expr $y-6] $x2 [expr $y+6]; paint m1 }
proc vm1 {x y1 y2} { box [expr $x-6] $y1 [expr $x+6] $y2; paint m1 }

proc route_or2_inv {Tx Ty} {
    set ox [expr $Tx+207]; set oy [expr $Ty+187]
    set ix [expr $Tx+313]; set iy [expr $Ty+119]
    contact $ox $oy; vm1 $ox $iy $oy; hm1 $ox $iy $ix; contact $ix $iy
}

proc route_inv_mux_s {inv_x inv_y mux_x mux_y} {
    # inv.Y at (inv_x+91, inv_y+119)
    # mux.S at (mux_x+346, mux_y+153)
    set sx [expr $inv_x + 91];  set sy [expr $inv_y + 119]
    set dx [expr $mux_x + 346]; set dy [expr $mux_y + 153]
    contact $sx $sy
    hm1 $sx $sy $dx
    vm1 $dx $sy $dy
    contact $dx $dy
}

# === Row 3 (y=680): 2 lzc4 combine ===
# or2_8(0,680)->inv_8(268,680) and or2_9(896,680)->inv_9(1164,680)
route_or2_inv 0   680
route_or2_inv 896 680

# inv_8.Y -> mux_0.S  [inv_8 at (268,680), mux_0 at (444,680)]
route_inv_mux_s 268 680 444 680

# inv_9.Y -> mux_1.S  [inv_9 at (1164,680), mux_1 at (1340,680)]
route_inv_mux_s 1164 680 1340 680

# === Row 4 (y=1020): 2 lzc4 combine ===
route_or2_inv 0   1020
route_or2_inv 896 1020

# inv_10.Y -> mux_2.S  [inv_10 at (268,1020), mux_2 at (444,1020)]
route_inv_mux_s 268 1020 444 1020

# inv_11.Y -> mux_3.S  [inv_11 at (1164,1020), mux_3 at (1340,1020)]
route_inv_mux_s 1164 1020 1340 1020

puts "Phase 2 done: 8 intra-row lzc4 connections"
