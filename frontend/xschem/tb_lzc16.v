`timescale 1ns / 1ps

module tb_lzc16;

    reg  [15:0] A;
    wire [4:0]  Y;
    integer i;

    // DUT
    lzc16 uut (
        .Y4(Y[4]), .Y3(Y[3]), .Y2(Y[2]), .Y1(Y[1]), .Y0(Y[0]),
        .A15(A[15]), .A14(A[14]), .A13(A[13]), .A12(A[12]),
        .A11(A[11]), .A10(A[10]), .A9(A[9]),   .A8(A[8]),
        .A7(A[7]),   .A6(A[6]),   .A5(A[5]),   .A4(A[4]),
        .A3(A[3]),   .A2(A[2]),   .A1(A[1]),   .A0(A[0])
    );

    initial begin
        $dumpfile("lzc16_wave.vcd");
        $dumpvars(0, tb_lzc16);

        $display("======================================");
        $display("     TEST LEADING ZERO COUNTER");
        $display("======================================");

        // Test từ 0 leading zero đến 15 leading zero
        for(i = 15; i >= 0; i = i - 1) begin
            A = 16'b1 << i;
            #10;
            $display("A = %b , Y = %d", A, Y);
        end

        // Test tất cả bằng 0
        A = 16'b0000_0000_0000_0000;
        #10;
        $display("A = %b , Y = %d", A, Y);

        $finish;
    end

endmodule
