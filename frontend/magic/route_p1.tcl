# Phase 1: Internal lzc2 routing (or2.X -> inv.A)
# or2.X at cell-local (207, 187)
# inv.A at cell-local (45, 119), inv placed at Tx+268

proc route_lzc2 {Tx Ty} {
    # Contact at or2.X
    box [expr $Tx+197] [expr $Ty+177] [expr $Tx+217] [expr $Ty+197]
    paint mcon
    paint m1
    # Vertical from y=119 to y=187
    box [expr $Tx+197] [expr $Ty+109] [expr $Tx+217] [expr $Ty+197]
    paint m1
    # Horizontal from x=207 to inv.A at Tx+313
    box [expr $Tx+197] [expr $Ty+109] [expr $Tx+323] [expr $Ty+129]
    paint m1
    # Contact at inv.A
    box [expr $Tx+303] [expr $Ty+109] [expr $Tx+323] [expr $Ty+129]
    paint mcon
    paint m1
}

# Row 1 (y=0)
route_lzc2 0    0
route_lzc2 444  0
route_lzc2 888  0
route_lzc2 1332 0

# Row 2 (y=340)
route_lzc2 0    340
route_lzc2 444  340
route_lzc2 888  340
route_lzc2 1332 340

puts "Phase 1 done: 8 internal lzc2 connections routed"
