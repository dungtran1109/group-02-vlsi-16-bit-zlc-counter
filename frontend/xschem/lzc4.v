// sch_path: /home/me/Project/sky130_lzc16/xschem/lzc4.sch
module lzc4
(
  output wire V,
  output wire P1,
  output wire P0,
  input wire A3,
  input wire A2,
  input wire A1,
  input wire A0
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
