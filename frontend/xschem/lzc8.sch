v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -30 -310 -0 -310 {lab=#net1}
N -0 -310 120 -310 {lab=#net1}
N 60 -220 120 -220 {lab=#net1}
N 60 -310 60 -220 {lab=#net1}
N -30 -290 20 -290 {lab=#net2}
N 20 -290 20 -150 {lab=#net2}
N 20 -150 130 -150 {lab=#net2}
N -20 -170 100 -170 {lab=#net3}
N 100 -270 100 -170 {lab=#net3}
N 100 -270 120 -270 {lab=#net3}
N -20 -150 10 -150 {lab=#net4}
N 10 -150 10 -110 {lab=#net4}
N 10 -110 130 -110 {lab=#net4}
N -30 -270 -0 -270 {lab=#net5}
N -0 -270 -0 -40 {lab=#net5}
N -0 -40 50 -40 {lab=#net5}
N -20 -130 -20 -0 {lab=#net6}
N -20 -0 50 0 {lab=#net6}
N 50 40 50 80 {lab=P2}
N 50 80 280 80 {lab=P2}
N 200 -220 320 -220 {lab=P2}
N 280 -220 280 80 {lab=P2}
N 130 -70 280 -70 {lab=P2}
N 240 -290 340 -290 {lab=V}
N 210 -130 350 -130 {lab=P1}
N 130 -20 350 -20 {lab=P0}
C {lzc4.sym} -180 -290 0 0 {name=x1}
C {lzc4.sym} -170 -150 0 0 {name=x2}
C {sky130_stdcells/or2_1.sym} 180 -290 0 0 {name=x3 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 160 -220 0 0 {name=x4 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/mux2_1.sym} 170 -130 0 0 {name=x5 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/mux2_1.sym} 90 -20 0 0 {name=x6 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {opin.sym} 340 -290 0 0 {name=p9 lab=V}
C {opin.sym} 320 -220 0 0 {name=p10 lab=P2}
C {opin.sym} 350 -130 0 0 {name=p11 lab=P1}
C {opin.sym} 350 -20 0 0 {name=p12 lab=P0}
C {ipin.sym} -540 -220 0 0 {name=p13 lab=VDD}
C {ipin.sym} -540 -180 0 0 {name=p14 lab=GND}
C {lab_pin.sym} -330 -310 0 0 {name=p15 sig_type=std_logic lab=A[7:4]}
C {lab_pin.sym} -330 -290 0 0 {name=p16 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -330 -270 0 0 {name=p17 sig_type=std_logic lab=GND}
C {lab_pin.sym} -320 -170 0 0 {name=p18 sig_type=std_logic lab=A[3:0]}
C {lab_pin.sym} -320 -150 0 0 {name=p19 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -320 -130 0 0 {name=p20 sig_type=std_logic lab=GND}
C {ipin.sym} -530 -290 0 0 {name=p1 lab=A[7:0]}
