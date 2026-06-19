`timescale 1ns/1ps
 module tb_zlc16;
 reg[15:0] A;
 wire [4:0] Y;

 zlc16 uut(
   .A(A),
   .Y(Y)
);
initial begin 
  $dumpfile("zlc16.vcd");
  $dumpvars(0,tb_zlc16);
  A=16'b0001011000100000;#10;
  A=16'b1111000000000000;#10;
  A=16'b0000000000000000;#10;

  $finish;
end
endmodule
