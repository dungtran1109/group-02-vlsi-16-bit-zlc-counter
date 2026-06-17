`timescale 1ns/1ps

module lzc16_tb;

    reg  [15:0] A;
    wire [4:0] Y;

    integer i;

    lzc16 dut (
        .A15(A[15]), .A14(A[14]), .A13(A[13]), .A12(A[12]),
        .A11(A[11]), .A10(A[10]), .A9(A[9]),   .A8(A[8]),
        .A7(A[7]),   .A6(A[6]),   .A5(A[5]),   .A4(A[4]),
        .A3(A[3]),   .A2(A[2]),   .A1(A[1]),   .A0(A[0]),
        .Y4(Y[4]),   .Y3(Y[3]),   .Y2(Y[2]),   .Y1(Y[1]), .Y0(Y[0])
    );

    initial begin
        $dumpfile("lzc16.vcd");
        $dumpvars(0, lzc16_tb);

        $display("================================");
        $display("      LZC16 FULL TEST");
        $display("================================");

        for (i = 0; i < 65536; i = i + 1) begin
            A = i;
            #1;
            $display("A = %016b   Y = %0d", A, Y);
        end

        $display("================================");
        $display("      END OF TEST");
        $display("================================");

        $finish;
    end

endmodule
