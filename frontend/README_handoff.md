# Sky130 LZC16 — Handoff Document
Project: 16-bit Zero Leading Counter
PDK: sky130A (sky130_fd_sc_hd)
Status: Placement DONE — Routing IN PROGRESS

## Mo truong yeu cau
- Magic VLSI 8.3+
- Sky130 PDK tai /usr/local/share/pdk/sky130A/
- iverilog, OpenSTA, Netgen, ngspice
(Da co san trong VM OSIC Debian)

## Mo layout
cd ~/Project/sky130_lzc16/magic
magic -d XR lzc16 &
# Trong tkcon: view

## Ket qua da co
- Functional sim: PASSED 5007/5007 cases
- Critical path: 1.31 ns
- Max clock: 662 MHz / 662 Mops/s
- Power @ 1MHz: 0.057 uW / @ 662MHz: 37.8 uW
- Layout: 46 cells, 26.96 x 22.40 um = 604 um2, aspect 1.20:1

## Viec con lai (bat dau tu day)
1. Power routing: ve VPWR/VGND vertical straps noi 7 hang
2. Signal routing: ~30 nets (V, P bits, sel, V_top, A inputs, Y outputs)
3. Port labels: 16 input (A15..A0) bien trai, 5 output (Y4..Y0) bien phai
4. DRC: drc check -> 0 errors
5. LVS: netgen vs xschem/lzc16.spice
6. Post-layout sim: ngspice

## Liberty file
/usr/local/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
