// sch_path: /home/me/Project/sky130_lzc16/xschem/lzc2.sch
module lzc2
(
  output wire V,
  output wire P,
  input wire HI,
  input wire LO
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
