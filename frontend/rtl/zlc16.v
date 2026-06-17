module zlc16( 
 input [15:0] A,
 output reg [4:0] Y
);
always @(*)begin 
  casex(A) 
        16'b1xxxxxxxxxxxxxxx: Y =5'd0;
        16'b01xxxxxxxxxxxxxx: Y=5'd1;
        16'b001xxxxxxxxxxxxx: Y=5'd2;
        16'b0001xxxxxxxxxxxx: Y=5'd3;
        16'b00001xxxxxxxxxxx: Y=5'd4;
        16'b000001xxxxxxxxxx: Y=5'd5;
        16'b0000001xxxxxxxxx: Y=5'd6;
        16'b00000001xxxxxxxx: Y=5'd7;
        16'b000000001xxxxxxx: Y=5'd8;
        16'b0000000001xxxxxx: Y=5'd9;
        16'b00000000001xxxxx: Y=5'd10;
        16'b000000000001xxxx: Y=5'd11;
        16'b0000000000001xxx: Y=5'd12;
        16'b00000000000001xx: Y=5'd13;
        16'b000000000000001x: Y=5'd14;
        16'b0000000000000001: Y=5'd15;
        16'b0000000000000000: Y=5'd16;
   endcase
end
endmodule

