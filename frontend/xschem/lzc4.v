// sch_path: /home/me/group-02-vlsi-16-bit-zlc-counter/frontend/xschem/lzc4.sch
module lzc4
(
  output wire V,
  output wire P1,
  output wire P0,
  input wire [3:0] A,
  input wire VDD,
  input wire GND
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
