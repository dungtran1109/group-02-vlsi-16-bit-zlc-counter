v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 170 -200 340 -200 {lab=#net1}
N 260 -80 340 -80 {lab=#net1}
N 260 -200 260 -80 {lab=#net1}
N 240 -160 340 -160 {lab=#net2}
N 240 -160 240 -0 {lab=#net2}
N 140 0 240 -0 {lab=#net2}
N 170 -180 220 -180 {lab=#net3}
N 220 -180 220 20 {lab=#net3}
N 220 20 340 20 {lab=#net3}
N 140 20 200 20 {lab=#net4}
N 200 20 200 60 {lab=#net4}
N 200 60 340 60 {lab=#net4}
N 460 -180 560 -180 {lab=V}
N 420 -80 560 -80 {lab=P1}
N 420 40 570 40 {lab=P0}
N 340 100 340 140 {lab=P1}
N 340 140 500 140 {lab=P1}
N 500 -80 500 140 {lab=P1}
C {lzc2.sym} 20 -170 0 0 {name=x1}
C {lzc2.sym} -10 30 0 0 {name=x2}
C {sky130_stdcells/or2_1.sym} 400 -180 0 0 {name=x3 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 380 -80 0 0 {name=x4 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/mux2_1.sym} 380 40 0 0 {name=x5 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {ipin.sym} -390 -190 0 0 {name=p1 lab=A[3:0]}
C {opin.sym} 560 -180 0 0 {name=p5 lab=V}
C {opin.sym} 560 -80 0 0 {name=p6 lab=P1}
C {opin.sym} 570 40 0 0 {name=p7 lab=P0}
C {ipin.sym} -360 -100 0 0 {name=p10 lab=VDD}
C {ipin.sym} -370 -50 0 0 {name=p11 lab=GND}
C {lab_pin.sym} -130 -160 0 0 {name=p8 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -130 -140 0 0 {name=p9 sig_type=std_logic lab=GND}
C {lab_pin.sym} -160 60 0 0 {name=p12 sig_type=std_logic lab=GND}
C {lab_pin.sym} -160 40 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -130 -200 0 0 {name=p14 sig_type=std_logic lab=A[3]}
C {lab_pin.sym} -130 -180 0 0 {name=p15 sig_type=std_logic lab=A[2]}
C {lab_pin.sym} -160 0 0 0 {name=p16 sig_type=std_logic lab=A[1]}
C {lab_pin.sym} -160 20 0 0 {name=p17 sig_type=std_logic lab=A[0]}
