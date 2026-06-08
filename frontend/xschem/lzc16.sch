v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -50 -300 170 -300 {lab=#net1}
N 60 -170 190 -170 {lab=#net1}
N 60 -300 60 -170 {lab=#net1}
N -50 -280 40 -280 {lab=#net2}
N 40 -280 40 -70 {lab=#net2}
N 40 -70 190 -70 {lab=#net2}
N -50 -50 150 -50 {lab=#net3}
N 150 -50 150 -30 {lab=#net3}
N 150 -30 190 -30 {lab=#net3}
N -50 -260 -10 -260 {lab=#net4}
N -10 -260 -10 70 {lab=#net4}
N -10 70 200 70 {lab=#net4}
N -50 -30 90 -30 {lab=#net5}
N 90 -30 90 110 {lab=#net5}
N 90 110 200 110 {lab=#net5}
N -50 -240 140 -240 {lab=#net6}
N 140 -240 140 210 {lab=#net6}
N 140 210 140 220 {lab=#net6}
N 140 220 200 220 {lab=#net6}
N -50 -10 60 -10 {lab=#net7}
N 60 -10 60 260 {lab=#net7}
N 60 260 200 260 {lab=#net7}
N 270 -170 480 -170 {lab=#net8}
N 270 -50 490 -50 {lab=#net9}
N 280 90 500 90 {lab=#net10}
N 280 240 490 240 {lab=#net11}
N 420 -130 480 -130 {lab=#net12}
N 430 -10 490 -10 {lab=#net12}
N 420 -10 430 -10 {lab=#net12}
N 420 280 490 280 {lab=#net12}
N 420 130 500 130 {lab=#net12}
N 190 10 190 30 {lab=#net8}
N 190 30 320 30 {lab=#net8}
N 320 -170 320 30 {lab=#net8}
N 200 150 200 180 {lab=#net8}
N 200 180 320 180 {lab=#net8}
N 320 30 320 180 {lab=#net8}
N 200 300 320 300 {lab=#net8}
N 320 180 320 300 {lab=#net8}
N 290 -280 490 -280 {lab=#net12}
N 420 -280 420 280 {lab=#net12}
N -50 -70 20 -70 {lab=#net13}
N 20 -260 20 -70 {lab=#net13}
N 20 -260 170 -260 {lab=#net13}
C {lzc8.sym} -200 -230 0 0 {name=x1}
C {lzc8.sym} -200 0 0 0 {name=x2}
C {sky130_stdcells/or2_1.sym} 230 -280 0 0 {name=x3 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 230 -170 0 0 {name=x4 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/mux2_1.sym} 240 240 0 0 {name=x5 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/mux2_1.sym} 240 90 0 0 {name=x6 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/mux2_1.sym} 230 -50 0 0 {name=x7 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/and2_1.sym} 540 -150 0 0 {name=x8 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/and2_1.sym} 550 -30 0 0 {name=x9 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/and2_1.sym} 560 110 0 0 {name=x10 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/and2_1.sym} 550 260 0 0 {name=x11 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 530 -280 0 0 {name=x12 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {ipin.sym} -350 -300 0 0 {name=p1 lab=A15}
C {ipin.sym} -350 -280 0 0 {name=p2 lab=A14}
C {ipin.sym} -350 -260 0 0 {name=p3 lab=A13}
C {ipin.sym} -350 -240 0 0 {name=p4 lab=A12}
C {ipin.sym} -350 -220 0 0 {name=p5 lab=A11}
C {ipin.sym} -350 -200 0 0 {name=p6 lab=A10}
C {ipin.sym} -350 -180 0 0 {name=p7 lab=A9}
C {ipin.sym} -350 -160 0 0 {name=p8 lab=A8}
C {ipin.sym} -350 -70 0 0 {name=p9 lab=A7}
C {ipin.sym} -350 -50 0 0 {name=p10 lab=A6}
C {ipin.sym} -350 -30 0 0 {name=p11 lab=A5}
C {ipin.sym} -350 -10 0 0 {name=p12 lab=A4}
C {ipin.sym} -350 10 0 0 {name=p13 lab=A3}
C {ipin.sym} -350 30 0 0 {name=p14 lab=A2}
C {ipin.sym} -350 50 0 0 {name=p15 lab=A1}
C {ipin.sym} -350 70 0 0 {name=p16 lab=A0}
C {opin.sym} 570 -280 0 0 {name=p17 lab=Y4}
C {opin.sym} 600 -150 0 0 {name=p18 lab=Y3}
C {opin.sym} 610 -30 0 0 {name=p19 lab=Y2}
C {opin.sym} 620 110 0 0 {name=p20 lab=Y1}
C {opin.sym} 610 260 0 0 {name=p21 lab=Y0}
