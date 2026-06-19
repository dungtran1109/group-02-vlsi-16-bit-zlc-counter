// sch_path: /home/me/group-02-vlsi-16-bit-zlc-counter/frontend/xschem/lzc16.sch
module lzc16
(
  output wire [4:0] Y,
  input wire [15:0] A,
  input wire VDD,
  input wire GND
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
 .A( A[15:8] ),
 .V( net1 ),
 .P2( net2 ),
 .VDD( VDD ),
 .GND( GND ),
 .P1( net4 ),
 .P0( net6 )
);


lzc8
x2 ( 
 .A( A[7:0] ),
 .V( net13 ),
 .P2( net3 ),
 .VDD( VDD ),
 .GND( GND ),
 .P1( net5 ),
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
 .X( Y[3] )
);


sky130_fd_sc_hd__and2_1
x9 ( 
 .A( net9 ),
 .B( net12 ),
 .X( Y[2] )
);


sky130_fd_sc_hd__and2_1
x10 ( 
 .A( net10 ),
 .B( net12 ),
 .X( Y[1] )
);


sky130_fd_sc_hd__and2_1
x11 ( 
 .A( net11 ),
 .B( net12 ),
 .X( Y[0] )
);


sky130_fd_sc_hd__inv_1
x12 ( 
 .A( net12 ),
 .Y( Y[4] )
);

endmodule

// expanding   symbol:  lzc8.sym # of pins=7
// sym_path: /home/me/group-02-vlsi-16-bit-zlc-counter/frontend/xschem/lzc8.sym
// sch_path: /home/me/group-02-vlsi-16-bit-zlc-counter/frontend/xschem/lzc8.sch
module lzc8
(
  input wire [7:0] A,
  output wire V,
  output wire P2,
  input wire VDD,
  input wire GND,
  output wire P1,
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
 .A( A[7:4] ),
 .V( net1 ),
 .VDD( VDD ),
 .P1( net2 ),
 .GND( GND ),
 .P0( net5 )
);


lzc4
x2 ( 
 .A( A[3:0] ),
 .V( net3 ),
 .VDD( VDD ),
 .P1( net4 ),
 .GND( GND ),
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

// expanding   symbol:  lzc4.sym # of pins=6
// sym_path: /home/me/group-02-vlsi-16-bit-zlc-counter/frontend/xschem/lzc4.sym
// sch_path: /home/me/group-02-vlsi-16-bit-zlc-counter/frontend/xschem/lzc4.sch
module lzc4
(
  input wire [3:0] A,
  output wire V,
  input wire VDD,
  output wire P1,
  input wire GND,
  output wire P0
);
wire net1 ;
wire net2 ;
wire net3 ;
wire net4 ;


lzc2
x1 ( 
 .HI( A[3] ),
 .V( net1 ),
 .LO( A[2] ),
 .VDD( VDD ),
 .P( net3 ),
 .GND( GND )
);


lzc2
x2 ( 
 .HI( A[1] ),
 .V( net2 ),
 .LO( A[0] ),
 .VDD( VDD ),
 .P( net4 ),
 .GND( GND )
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

// expanding   symbol:  lzc2.sym # of pins=6
// sym_path: /home/me/group-02-vlsi-16-bit-zlc-counter/frontend/xschem/lzc2.sym
// sch_path: /home/me/group-02-vlsi-16-bit-zlc-counter/frontend/xschem/lzc2.sch
module lzc2
(
  input wire HI,
  output wire V,
  input wire LO,
  input wire VDD,
  output wire P,
  input wire GND
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
