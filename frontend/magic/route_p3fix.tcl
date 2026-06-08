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

# Route: up to unique top_y, horizontal, then down to pin
proc r3 {sx sy dx dy ty} {
    contact $sx $sy
    vm2 $sx $sy $ty
    hm2 $sx $ty $dx
    vm2 $dx $ty $dy
    contact $dx $dy
}

# === Row 1 → Row 3: V signals (top_y > 799, each 30λ apart) ===
r3  207 187  115 799  850  ;# V0: or2_0.X → or2_8.A
r3  651 187   23 799  880  ;# V1: or2_1.X → or2_8.B
r3 1095 187 1011 799  910  ;# V2: or2_2.X → or2_9.A
r3 1539 187  919 799  940  ;# V3: or2_3.X → or2_9.B

# === Row 1 → Row 3: P signals (top_y > 940, each 30λ apart) ===
r3  359 119  652 799  970  ;# P0: inv_0.Y → mux_0.A0
r3  803 119  698 799 1000  ;# P1: inv_1.Y → mux_0.A1
r3 1247 119 1548 799 1030  ;# P2: inv_2.Y → mux_1.A0
r3 1691 119 1594 799 1060  ;# P3: inv_3.Y → mux_1.A1

# === Row 2 → Row 4: V signals ===
r3  207 527  115 1139 1090  ;# V4: or2_4.X → or2_10.A
r3  651 527   23 1139 1120  ;# V5: or2_5.X → or2_10.B
r3 1095 527 1011 1139 1150  ;# V6: or2_6.X → or2_11.A
r3 1539 527  919 1139 1180  ;# V7: or2_7.X → or2_11.B

# === Row 2 → Row 4: P signals ===
r3  359 459  652 1139 1210  ;# P4: inv_4.Y → mux_2.A0
r3  803 459  698 1139 1240  ;# P5: inv_5.Y → mux_2.A1
r3 1247 459 1548 1139 1270  ;# P6: inv_6.Y → mux_3.A0
r3 1691 459 1594 1139 1300  ;# P7: inv_7.Y → mux_3.A1

puts "Phase 3 fix done: 16 connections"
