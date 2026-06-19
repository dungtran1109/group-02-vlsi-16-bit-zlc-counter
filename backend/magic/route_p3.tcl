# Phase 3: Inter-row V and P signals (rows 1-2 → rows 3-4) via m2

proc contact {x y} {
    box [expr $x-6] [expr $y-6] [expr $x+6] [expr $y+6]
    paint locali; paint mcon; paint m1; paint via; paint m2
}

proc vm2 {x y1 y2} {
    set a [expr {$y1<$y2?$y1:$y2}]; set b [expr {$y1<$y2?$y2:$y1}]
    box [expr $x-6] $a [expr $x+6] $b; paint m2
}

proc hm2 {x1 y x2} {
    set a [expr {$x1<$x2?$x1:$x2}]; set b [expr {$x1<$x2?$x2:$x1}]
    box $a [expr $y-6] $b [expr $y+6]; paint m2
}

proc route2 {sx sy dx dy} {
    # L-shape on m2: vertical then horizontal
    contact $sx $sy
    vm2 $sx $sy $dy
    hm2 $sx $dy $dx
    contact $dx $dy
}

# ======= V signals: or2.X → combine_or2.A/B =======

# Row 1(y=0) → Row 3(y=680): lzc4_0 and lzc4_1
# or2_8 at (0,680): A=vL(V0), B=vR(V1)
route2  207 187  115 799   ;# or2_0.X → or2_8.A
route2  651 187   23 799   ;# or2_1.X → or2_8.B
# or2_9 at (896,680): A=V2, B=V3
route2 1095 187 1011 799   ;# or2_2.X → or2_9.A
route2 1539 187  919 799   ;# or2_3.X → or2_9.B

# Row 2(y=340) → Row 4(y=1020): lzc4_2 and lzc4_3
# or2_10 at (0,1020): A=V4, B=V5
route2  207 527  115 1139  ;# or2_4.X → or2_10.A
route2  651 527   23 1139  ;# or2_5.X → or2_10.B
# or2_11 at (896,1020): A=V6, B=V7
route2 1095 527 1011 1139  ;# or2_6.X → or2_11.A
route2 1539 527  919 1139  ;# or2_7.X → or2_11.B

# ======= P signals: inv.Y → mux.A0/A1 =======
# inv.Y at (Tx+91, Ty+119)
# mux.A0 at (Tx+208, Ty+119), mux.A1 at (Tx+254, Ty+119)

# Row 1(y=0) → Row 3(y=680):
# mux_0 at (444,680): A0=P0(inv_0.Y), A1=P1(inv_1.Y)
route2  359 119  652 799   ;# inv_0.Y → mux_0.A0
route2  803 119  698 799   ;# inv_1.Y → mux_0.A1
# mux_1 at (1340,680): A0=P2(inv_2.Y), A1=P3(inv_3.Y)
route2 1247 119 1548 799   ;# inv_2.Y → mux_1.A0
route2 1691 119 1594 799   ;# inv_3.Y → mux_1.A1

# Row 2(y=340) → Row 4(y=1020):
# mux_2 at (444,1020): A0=P4(inv_4.Y), A1=P5(inv_5.Y)
route2  359 459  652 1139  ;# inv_4.Y → mux_2.A0
route2  803 459  698 1139  ;# inv_5.Y → mux_2.A1
# mux_3 at (1340,1020): A0=P6(inv_6.Y), A1=P7(inv_7.Y)
route2 1247 459 1548 1139  ;# inv_6.Y → mux_3.A0
route2 1691 459 1594 1139  ;# inv_7.Y → mux_3.A1

puts "Phase 3 done: 16 inter-row V+P signals"
