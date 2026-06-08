v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -200 -40 -90 -40 {lab=HI}
N -150 90 -80 90 {lab=HI}
N -150 -40 -150 90 {lab=HI}
N -230 -0 -90 0 {lab=LO}
N 30 -20 220 -20 {lab=V}
N 0 90 230 90 {lab=xxx}
C {sky130_stdcells/or2_1.sym} -30 -20 0 0 {name=x1 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} -40 90 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {ipin.sym} -200 -40 0 0 {name=p1 lab=HI}
C {ipin.sym} -230 0 0 0 {name=p2 lab=LO}
C {opin.sym} 220 -20 0 0 {name=p3 lab=V}
C {opin.sym} 230 90 0 0 {name=p4 lab=P}
