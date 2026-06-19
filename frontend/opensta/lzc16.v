// sch_path: /home/me/Project/sky130_lzc16/xschem/lzc16.sch
module lzc16
(
  output wire Y4,
  output wire Y3,
  output wire Y2,
  output wire Y1,
  output wire Y0,
  input wire A15,
  input wire A14,
  input wire A13,
  input wire A12,
  input wire A11,
  input wire A10,
  input wire A9,
  input wire A8,
  input wire A7,
  input wire A6,
  input wire A5,
  input wire A4,
  input wire A3,
  input wire A2,
  input wire A1,
  input wire A0
);
wire net10 ;
wire net11 ;
wire net12 ;
wire net13 ;
wire net1 ;
wire net2 ;
wire net3 ;
wire net4 ;
wire net5 ;
wire net6 ;
wire net7 ;
wire net8 ;
wire net9 ;

lzc8
x1 ( 
 .A7( A15 ),
 .A6( A14 ),
 .V( net1 ),
 .A5( A13 ),
 .A4( A12 ),
 .P2( net2 ),
 .A3( A11 ),
 .A2( A10 ),
 .P1( net4 ),
 .A1( A9 ),
 .A0( A8 ),
 .P0( net6 )
);


lzc8
x2 ( 
 .A7( A7 ),
 .A6( A6 ),
 .V( net13 ),
 .A5( A5 ),
 .A4( A4 ),
 .P2( net3 ),
 .A3( A3 ),
 .A2( A2 ),
 .P1( net5 ),
 .A1( A1 ),
 .A0( A0 ),
 .P0( net7 )
);


sky130_fd_sc_hd__or2_1
x3 ( 
 .A( net1 ),
 .B( net13 ),
 .X( net12 )
);


sky130_fd_sc_hd__inv_1
x4 ( 
 .A( net1 ),
 .Y( net8 )
);


sky130_fd_sc_hd__mux2_1
x5 ( 
 .A0( net6 ),
 .A1( net7 ),
 .S( net8 ),
 .X( net11 )
);


sky130_fd_sc_hd__mux2_1
x6 ( 
 .A0( net4 ),
 .A1( net5 ),
 .S( net8 ),
 .X( net10 )
);


sky130_fd_sc_hd__mux2_1
x7 ( 
 .A0( net2 ),
 .A1( net3 ),
 .S( net8 ),
 .X( net9 )
);


sky130_fd_sc_hd__and2_1
x8 ( 
 .A( net8 ),
 .B( net12 ),
 .X( Y3 )
);


sky130_fd_sc_hd__and2_1
x9 ( 
 .A( net9 ),
 .B( net12 ),
 .X( Y2 )
);


sky130_fd_sc_hd__and2_1
x10 ( 
 .A( net10 ),
 .B( net12 ),
 .X( Y1 )
);


sky130_fd_sc_hd__and2_1
x11 ( 
 .A( net11 ),
 .B( net12 ),
 .X( Y0 )
);


sky130_fd_sc_hd__inv_1
x12 ( 
 .A( net12 ),
 .Y( Y4 )
);

endmodule

// expanding   symbol:  lzc8.sym # of pins=12
// sym_path: /home/me/Project/sky130_lzc16/xschem/lzc8.sym
// sch_path: /home/me/Project/sky130_lzc16/xschem/lzc8.sch
module lzc8
(
  input wire A7,
  input wire A6,
  output wire V,
  input wire A5,
  input wire A4,
  output wire P2,
  input wire A3,
  input wire A2,
  output wire P1,
  input wire A1,
  input wire A0,
  output wire P0
);
wire net1 ;
wire net2 ;
wire net3 ;
wire net4 ;
wire net5 ;
wire net6 ;


lzc4
x1 ( 
 .A3( A7 ),
 .V( net1 ),
 .A2( A6 ),
 .P1( net2 ),
 .A1( A5 ),
 .A0( A4 ),
 .P0( net5 )
);


lzc4
x2 ( 
 .A3( A3 ),
 .V( net3 ),
 .A2( A2 ),
 .P1( net4 ),
 .A1( A1 ),
 .A0( A0 ),
 .P0( net6 )
);


sky130_fd_sc_hd__or2_1
x3 ( 
 .A( net1 ),
 .B( net3 ),
 .X( V )
);


sky130_fd_sc_hd__inv_1
x4 ( 
 .A( net1 ),
 .Y( P2 )
);


sky130_fd_sc_hd__mux2_1
x5 ( 
 .A0( net2 ),
 .A1( net4 ),
 .S( P2 ),
 .X( P1 )
);


sky130_fd_sc_hd__mux2_1
x6 ( 
 .A0( net5 ),
 .A1( net6 ),
 .S( P2 ),
 .X( P0 )
);

endmodule

// expanding   symbol:  lzc4.sym # of pins=7
// sym_path: /home/me/Project/sky130_lzc16/xschem/lzc4.sym
// sch_path: /home/me/Project/sky130_lzc16/xschem/lzc4.sch
module lzc4
(
  input wire A3,
  output wire V,
  input wire A2,
  output wire P1,
  input wire A1,
  input wire A0,
  output wire P0
);
wire net1 ;
wire net2 ;
wire net3 ;
wire net4 ;


lzc2
x1 ( 
 .HI( A3 ),
 .V( net1 ),
 .LO( A2 ),
 .P( net3 )
);


lzc2
x2 ( 
 .HI( A1 ),
 .V( net2 ),
 .LO( A0 ),
 .P( net4 )
);


sky130_fd_sc_hd__or2_1
x3 ( 
 .A( net1 ),
 .B( net2 ),
 .X( V )
);


sky130_fd_sc_hd__inv_1
x4 ( 
 .A( net1 ),
 .Y( P1 )
);


sky130_fd_sc_hd__mux2_1
x5 ( 
 .A0( net3 ),
 .A1( net4 ),
 .S( P1 ),
 .X( P0 )
);

endmodule

// expanding   symbol:  lzc2.sym # of pins=4
// sym_path: /home/me/Project/sky130_lzc16/xschem/lzc2.sym
// sch_path: /home/me/Project/sky130_lzc16/xschem/lzc2.sch
module lzc2
(
  input wire HI,
  output wire V,
  input wire LO,
  output wire P
);

sky130_fd_sc_hd__or2_1
x1 ( 
 .A( HI ),
 .B( LO ),
 .X( V )
);


sky130_fd_sc_hd__inv_1
x2 ( 
 .A( HI ),
 .Y( P )
);

endmodule
